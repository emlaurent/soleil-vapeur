param(
    [string]$Only = '',
    # French baseline reference. MUST be a fixed commit, never a moving branch:
    # `main` gained the Chinese-translation pointer (README.md), which shifts the
    # link/number baselines and makes `zh` fail spuriously.
    [string]$Baseline = 'c5be8b4'
)

$ErrorActionPreference = 'Stop'
$utf8 = [System.Text.Encoding]::UTF8

$exclude = @('doc-asso.htm', 'test-markdown-github-codimd.md')

$all = @(git ls-tree -r --name-only $Baseline | Where-Object {
    ($_ -match '\.(md|html|htm)$') -and ($exclude -notcontains $_)
})

$Paths = if ([string]::IsNullOrWhiteSpace($Only)) { $all } else { $Only -split ',' }

function Read-MainFile {
    param([string]$RelPath)
    $tmp = [System.IO.Path]::GetTempFileName()
    try {
        cmd /c "git show ${Baseline}:$RelPath > `"$tmp`"" 2>$null | Out-Null
        if (-not (Test-Path -LiteralPath $tmp)) { return $null }
        $bytes = [System.IO.File]::ReadAllBytes($tmp)
        if ($bytes.Length -eq 0) { return $null }
        return [System.IO.File]::ReadAllText($tmp, $utf8)
    } finally {
        Remove-Item -LiteralPath $tmp -Force -ErrorAction SilentlyContinue
    }
}

function Read-WorkFile {
    param([string]$RelPath)
    $full = Join-Path (Get-Location).Path $RelPath
    if (-not (Test-Path -LiteralPath $full)) { return $null }
    return [System.IO.File]::ReadAllText($full, $utf8)
}

function Get-LinkTargets {
    param([string]$Text)
    $set = New-Object 'System.Collections.Generic.SortedSet[string]'
    foreach ($m in [regex]::Matches($Text, '(?:href|src)\s*=\s*["'']([^"'']+)["'']')) {
        [void]$set.Add($m.Groups[1].Value)
    }
    foreach ($m in [regex]::Matches($Text, '\]\(\s*<?([^)\s>]+)>?[^)]*\)')) {
        [void]$set.Add($m.Groups[1].Value)
    }
    return $set
}

function Get-HeadingCounts {
    param([string]$Text)
    $counts = @{}
    foreach ($m in [regex]::Matches($Text, '(?m)^(#{1,6})\s+\S')) {
        $lvl = $m.Groups[1].Value.Length
        if ($counts.ContainsKey($lvl)) { $counts[$lvl]++ } else { $counts[$lvl] = 1 }
    }
    return $counts
}

function Get-TableRows {
    param([string]$Text)
    $n = 0
    foreach ($line in ($Text -split "`r?`n")) {
        if ($line -match '\|' -and $line.Trim() -ne '') { $n++ }
    }
    return $n
}

function Get-NumberCount {
    param([string]$Text)
    return ([regex]::Matches($Text, '\d+(?:[.,]\d+)?')).Count
}

function Get-FenceCount {
    param([string]$Text)
    return ([regex]::Matches($Text, '(?m)^```')).Count
}

function Get-ImageCount {
    param([string]$Text)
    return ([regex]::Matches($Text, '!\[[^\]]*\]\(')).Count
}

$fail = 0

foreach ($p in $Paths) {
    $fr = Read-MainFile $p
    $zh = Read-WorkFile $p

    if ($null -eq $fr) { Write-Host "SKIP  $p (absent on main)"; continue }
    if ($null -eq $zh) { Write-Host "FAIL  $p (missing in working tree)"; $fail++; continue }

    $problems = @()

    $frLinks = Get-LinkTargets $fr
    $zhLinks = Get-LinkTargets $zh
    $lost = @($frLinks | Where-Object { -not $zhLinks.Contains($_) })
    if ($lost.Count -gt 0) { $problems += "lost link targets: $($lost -join ', ')" }
    $gained = @($zhLinks | Where-Object { -not $frLinks.Contains($_) })
    if ($gained.Count -gt 0) { $problems += "added link targets: $($gained -join ', ')" }

    $frHead = Get-HeadingCounts $fr
    $zhHead = Get-HeadingCounts $zh
    foreach ($lvl in @($frHead.Keys + $zhHead.Keys | Sort-Object -Unique)) {
        $a = 0; $b = 0
        if ($frHead.ContainsKey($lvl)) { $a = $frHead[$lvl] }
        if ($zhHead.ContainsKey($lvl)) { $b = $zhHead[$lvl] }
        if ($a -ne $b) { $problems += "heading h$lvl count $a -> $b" }
    }

    $frImg = Get-ImageCount $fr
    $zhImg = Get-ImageCount $zh
    if ($frImg -ne $zhImg) { $problems += "image refs $frImg -> $zhImg" }

    $frTbl = Get-TableRows $fr
    $zhTbl = Get-TableRows $zh
    if ($frTbl -ne $zhTbl) { $problems += "table rows $frTbl -> $zhTbl" }

    $frFence = Get-FenceCount $fr
    $zhFence = Get-FenceCount $zh
    if ($frFence -ne $zhFence) { $problems += "code fences $frFence -> $zhFence" }

    $frNum = Get-NumberCount $fr
    $zhNum = Get-NumberCount $zh
    if ($frNum -ne $zhNum) { $problems += "numeric literals $frNum -> $zhNum" }

    if ($problems.Count -eq 0) {
        Write-Host ("PASS  {0}  (links {1}, headings {2}, imgs {3}, tables {4}, nums {5})" -f `
            $p, $frLinks.Count, ($frHead.Values | Measure-Object -Sum).Sum, $frImg, $frTbl, $frNum) -ForegroundColor Green
    } else {
        $fail++
        Write-Host "FAIL  $p" -ForegroundColor Red
        foreach ($pr in $problems) { Write-Host "        - $pr" -ForegroundColor Red }
    }
}

Write-Host ""
if ($fail -gt 0) {
    Write-Host "GATE FAILED: $fail file(s)" -ForegroundColor Red
    exit 1
} else {
    Write-Host "GATE PASSED" -ForegroundColor Green
    exit 0
}