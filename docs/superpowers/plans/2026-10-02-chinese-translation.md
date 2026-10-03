# soleil-vapeur 中文翻译实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在 `zh` 分支上把 soleil-vapeur 文档库的 10 个文本文件翻译成简体中文，法文 PDF 保持不变且链接全部可用。

**Architecture:** 同路径原地替换。`zh` 分支上每个文档路径存放中文内容，因路径不变，现有的相对链接（指向法文 PDF）继续有效。翻译前用一个结构校验门禁把每个中文文件与 `main` 上的法文原版逐项比对，确保链接、标题、图片、数字字面量全部守恒。

**Tech Stack:** Git（分支/commit/push）、PowerShell 5.1（校验脚本）、Markdown + HTML

## Global Constraints

- 分支：`zh`（已从 `main` @ `c5be8b4` 切出，spec commit `d72e3fa`）
- 目标远端：`origin` = `https://github.com/leangjia/soleil-vapeur`
- 翻译语言：简体中文，**忠实全文翻译**，不摘要、不合并小节、不删减
- **数字、单位、公式、尺寸、公差、加工参数、代码标识符逐字保持原样**
- 专业术语格式：`中文 (French)`，每节首次出现时标注
- 法文原版始终从 `main` 分支读取（`git show main:<path>`）作为参照；
  翻译结果**覆盖写入工作区同名文件**，而非新建 `.zh-CN` 文件
- 门禁命令：`powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1`
  （`ExecutionPolicy Bypass` 仅对本次进程生效，不修改系统设置）
- 提交信息使用法语，与仓库既有历史风格一致（参见 `c5be8b4`、`de3bef0`）
- `main` 分支除第 6 组任务外不做任何改动

## 基线数据（来自 main 的法文原版，门禁必须守恒）

| 文件 | 链接 | 标题 | 图片 | 数字 |
| --- | --- | --- | --- | --- |
| `README.md` | 59 | 10 | 7 | 273 |
| `bacasable.md` | 4 | 1 | 0 | 17 |
| `2-sommaires-et-pdf/2-Chap-I-Plaque.md` | 31 | 23 | 28 | 346 |
| `5-sommaires-et-pdf/caloducs.md` | 0 | 69 | 0 | 867 |
| `1-VIII-Plans-Informatiques.html` | 8 | 0 | 0 | 61 |
| `1-sommaires-et-pdf/1-VIII-Plans-Informatiques.html` | 3 | 0 | 0 | 19 |
| `2-sommaires-et-pdf/2-VI-VIII-Autres-Utilisations.html` | 9 | 0 | 0 | 63 |
| `3-sommaires-et-pdf/3-IV-construction-machine.html` | 10 | 0 | 0 | 76 |
| `4-sommaires-et-pdf/4-Intro-Memento.html` | 8 | 0 | 0 | 69 |
| `5-sommaires-et-pdf/Horizons.html` | 4 | 0 | 0 | 23 |

注意：全部 10 个文件的 markdown 表格行数均为 **0** —— 原文档不使用 markdown 表格，`caloducs.md`
的尺寸表是空格对齐的纯文本。因此表格行数检查实际不生效，**数字字面量守恒（867）才是
`caloducs.md` 的主要防线**。

---

### Task 1: 结构校验门禁脚本

**Files:**
- Create: `tools/check-structure.ps1`

**Interfaces:**
- Consumes: 无
- Produces: 门禁脚本。调用方式 `powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1 [-Only <逗号分隔路径>]`。无参数时自动扫描 `main` 上全部 `.md/.html/.htm`（排除 `doc-asso.htm`、`test-markdown-github-codimd.md`）。全部通过退出码 0，任一失败退出码 1 并逐条列出差异。

- [ ] **Step 1: 确认脚本已存在且逻辑正确**

脚本已在本计划编写阶段创建并双向验证。确认它存在：

```bash
Test-Path -LiteralPath "tools\check-structure.ps1"
```

预期：`True`

- [ ] **Step 2: 对未翻译的工作区跑门禁，应全部 PASS**

工作区此时仍是法文原版，中文版与 `main` 法文版内容相同，故全部 PASS。

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1
```

预期：`GATE PASSED`，10 个文件全 PASS，且各项数字与上方「基线数据」表逐一吻合。

- [ ] **Step 3: 验证门禁能检出破坏（负向测试）**

临时把 `README.md` 中一个图片链接改坏，确认门禁 FAIL，然后还原。

```bash
Copy-Item README.md "$env:TEMP\README.bak" -Force
(Get-Content README.md -Raw -Encoding UTF8) -replace 'photos/photo1.jpg','photos/BROKEN.jpg' | Set-Content README.md -Encoding UTF8 -NoNewline
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1 -Only README.md
```

预期输出（退出码 1）：
```
FAIL  README.md
        - lost link targets: photos/photo1.jpg
        - added link targets: photos/BROKEN.jpg
        - numeric literals 273 -> 272

GATE FAILED: 1 file(s)
```

- [ ] **Step 4: 还原并确认字节级一致**

```bash
Copy-Item "$env:TEMP\README.bak" README.md -Force
Remove-Item "$env:TEMP\README.bak" -Force
git status --short README.md
```

预期：`git status` 无输出（说明还原是字节级一致的，git 看不到任何改动）。

- [ ] **Step 5: 提交脚本**

```bash
git add tools/check-structure.ps1
git diff --cached --stat
git commit -m "Outil de verification de structure pour la traduction (branche zh)"
```

---

### Task 2: 翻译 README.md 与 bacasable.md

**Files:**
- Modify: `README.md`（386 行 → 中文）
- Modify: `bacasable.md`（9 行 → 中文）

**Interfaces:**
- Consumes: Task 1 的门禁脚本
- Produces: 中文版 `README.md`（含术语对照表与 CC-BY-SA 署名）、中文版 `bacasable.md`

- [ ] **Step 1: 读取法文原文**

```bash
git show main:README.md
git show main:bacasable.md
```

- [ ] **Step 2: 翻译 README.md**

覆盖写入 `README.md`。要求：

- 首节加入一行指向 `zh` 之外的说明不需要（那是 `main` 的事），但要**新增术语对照表**，置于
  「Documentation」章节之前。
- 保留全部 10 个标题、7 处图片、59 个链接目标、273 个数字字面量，一处不少。
- 保留指向不存在文件的链接（`1-II-conception.pdf`、`documentation-totale.pdf` 等）与
  「尚未编写」章节标注 —— 原样保留，不擅自删除。
- 修正法文笔误按原意：`adsoption` → 吸附（非「吸收」）、`ocurence` → 出现。
- 项目名 `soleil-vapeur` 不译。
- 保留 CC-BY-SA 署名与许可徽章。

术语对照表用以下内容（已核实各词在原文出现）。**必须用无竖线的列表形式，不得用 markdown
表格** —— 法文版表格行数为 0，若中文版新增表格行会导致门禁表格行数不相等而 FAIL：

**并且小节标题必须用加粗，不能用 `###`** —— `README.md` 的标题数基线是 10，用 `###` 会变成 11
导致门禁 FAIL。实施时用 `**术语对照表**`。

```markdown
**术语对照表**

- capteur solaire thermique à conduite manuelle — 手动跟踪式太阳能集热器
- concentrateur parabolique composé (CPC) — 复合抛物面聚光器 (CPC)
- caloduc — 热管
- adsorption（原文误作 adsoption）— 吸附
- zéolite — 沸石
- plaque chauffante à vapeur — 蒸汽加热板
- malle pédagogique — 教学套件
- ombre portée — 投影
- cuisson — 烹煮
- stérilisation médicale — 医疗灭菌
- caisson isolant — 保温箱
- étamage à chaud — 热镀锡
- taraudage — 攻丝
- perçage — 钻孔
- usinage sur tour — 车床加工
- joint torique — O 形圈
- puissance utile — 有效功率
- memento technologique — 技术手册
```

该列表 18 行、不含竖线、不含数字字面量，因此不影响门禁的任何一项计数。

- [ ] **Step 3: 翻译 bacasable.md**

覆盖写入 `bacasable.md`，保留 1 个标题、4 个链接、17 个数字。图片为外链 Wikimedia Commons，
保持 `<a href>` / `<img src>` 属性值不变，只翻译可见文字与 `alt` 之外的内容。

- [ ] **Step 4: 跑门禁**

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1
```

预期：`README.md` 与 `bacasable.md` PASS，其余 8 个文件因尚未翻译仍 PASS（内容与 main 相同）。

- [ ] **Step 5: 提交**

```bash
git add README.md bacasable.md
git diff --cached --stat
git commit -m "Traduction chinoise de README.md et bacasable.md"
```

---

### Task 3: 翻译 6 个 HTML 文件

**Files:**
- Modify: `1-VIII-Plans-Informatiques.html`
- Modify: `1-sommaires-et-pdf/1-VIII-Plans-Informatiques.html`
- Modify: `2-sommaires-et-pdf/2-VI-VIII-Autres-Utilisations.html`
- Modify: `3-sommaires-et-pdf/3-IV-construction-machine.html`
- Modify: `4-sommaires-et-pdf/4-Intro-Memento.html`
- Modify: `5-sommaires-et-pdf/Horizons.html`

**Interfaces:**
- Consumes: Task 1 的门禁脚本
- Produces: 6 个中文版 HTML 文件

- [ ] **Step 1: 逐个读取法文原文**

```bash
git show main:1-VIII-Plans-Informatiques.html
git show main:1-sommaires-et-pdf/1-VIII-Plans-Informatiques.html
git show main:2-sommaires-et-pdf/2-VI-VIII-Autres-Utilisations.html
git show main:3-sommaires-et-pdf/3-IV-construction-machine.html
git show main:4-sommaires-et-pdf/4-Intro-Memento.html
git show main:5-sommaires-et-pdf/Horizons.html
```

注意根目录的 `1-VIII-Plans-Informatiques.html` 与 `1-sommaires-et-pdf/` 下的同名文件**内容不同**，
两者都要翻译，不要复制粘贴。

- [ ] **Step 2: 逐个翻译并覆盖写入**

每个文件：只翻译 `<title>`、`alt`、`title` 等属性值之外的**可见文本**；
`<a href>`、`<img src>`、`<link href>` 的属性值**逐字保持不变**；
`<meta charset="utf-8">` 保持不变。

- [ ] **Step 3: 跑门禁**

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1
```

预期：全部 10 个文件 PASS。链接数应为
`8 / 3 / 9 / 10 / 8 / 4`，数字应为 `61 / 19 / 63 / 76 / 69 / 23`。

- [ ] **Step 4: 提交**

```bash
git add 1-VIII-Plans-Informatiques.html 1-sommaires-et-pdf/1-VIII-Plans-Informatiques.html 2-sommaires-et-pdf/2-VI-VIII-Autres-Utilisations.html 3-sommaires-et-pdf/3-IV-construction-machine.html 4-sommaires-et-pdf/4-Intro-Memento.html 5-sommaires-et-pdf/Horizons.html
git diff --cached --stat
git commit -m "Traduction chinoise des pages HTML"
```

---

### Task 4: 翻译 2-Chap-I-Plaque.md

**Files:**
- Modify: `2-sommaires-et-pdf/2-Chap-I-Plaque.md`（441 行 → 中文）

**Interfaces:**
- Consumes: Task 1 的门禁脚本
- Produces: 中文版蒸汽加热板章节

- [ ] **Step 1: 读取法文原文**

```bash
git show main:2-sommaires-et-pdf/2-Chap-I-Plaque.md
```

- [ ] **Step 2: 翻译并覆盖写入**

必须守恒：23 个标题、28 处图片引用、31 个链接目标、346 个数字字面量。

结构对照（法文标题层级须逐条对应）：

| 法文 | 中文 |
| --- | --- |
| Chapitre I LA PLAQUE CHAUFFANTE A VAPEUR | 第一章 蒸汽加热板 |
| SECTION I -PRESENTATION DE LA PLAQUE | 第 I 节 蒸汽加热板简介 |
| SECTION II - ETUDE DE LA PLAQUE | 第 II 节 蒸汽加热板研究 |
| II.1 APPROVISIONNEMENT, DEBIT ET MARQUAGE | II.1 备料、流量与板材划线 |
| II.2 USINAGE SUR TOUR | II.2 车床加工 |
| II.3 PERCEMENTS ET TARAUDAGE DES PLAQUES | II.3 板材钻孔与攻丝 |
| II.4 LA GRAVURE DU CIRCUIT DE VAPEUR | II.4 蒸汽回路的雕刻 |
| II.5 L'ASSEMBLAGE | II.5 装配 |
| II.6 LES ENTREE ET SORTIE DE VAPEUR | II.6 蒸汽进出口 |
| II.7 LE CHOIX DU JOINT TORIQUE | II.7 O 形圈的选择 |
| II.8 PERFECTIONNEMENTS ENVISAGEABLES | II.8 可考虑的改进 |
| II.9 COTES POUR UNE PLAQUE | II.9 板材尺寸 |
| SECTION III - FABRICATION DE LA PLAQUE | 第 III 节 蒸汽加热板的制造 |
| SECTION IV UTILISATION ET PERFORMANCES | 第 IV 节 使用与性能 |
| SECTION V UNE PLAQUE A VAPEUR LOW COST | 第 V 节 低成本蒸汽板 |

注意「低」相关术语：`approvisionnement` 译「备料」而非「采购」，`débit` 译「流量」，
`gravure` 在本语境是机加工的「雕刻」，`marquage` 是板材上的「划线」。

- [ ] **Step 3: 跑门禁**

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1 -Only 2-sommaires-et-pdf/2-Chap-I-Plaque.md
```

预期：`PASS  2-sommaires-et-pdf/2-Chap-I-Plaque.md  (links 31, headings 23, imgs 28, tables 0, nums 346)`

- [ ] **Step 4: 提交**

```bash
git add 2-sommaires-et-pdf/2-Chap-I-Plaque.md
git commit -m "Traduction chinoise du chapitre I - la plaque chauffante a vapeur"
```

---

### Task 5: 翻译 caloducs.md

**Files:**
- Modify: `5-sommaires-et-pdf/caloducs.md`（2118 行 → 中文）

**Interfaces:**
- Consumes: Task 1 的门禁脚本
- Produces: 中文版多级热管太阳能灶文档

必须守恒：**69 个标题**、**867 个数字字面量**、0 链接、0 图片。

本文件是全仓最大文本（约 70% 文字量），**必须分批写入**，但**门禁只在全部批次完成后跑一次**
（部分写入状态下标题数必然不符，中间态 FAIL 属预期）。

- [ ] **Step 1: 分批读取法文原文**

按 SECTION 分批，每批约 300–400 行。

**必须以 UTF-8 读文件，不要用 `git show | Select-Object` 管道** —— PowerShell 管道会按控制台
代码页重新编码，法文重音字符（é, è, à, ç）会被破坏。先导出到临时文件再按 UTF-8 读取：

```powershell
$src = "$env:TEMP\caloducs-fr.md"
cmd /c "git show main:5-sommaires-et-pdf/caloducs.md > `"$src`""
$lines = [System.IO.File]::ReadAllLines($src, [System.Text.Encoding]::UTF8)
"total lines: $($lines.Count)"
```

预期：`total lines: 2118`

随后按批次取行（把 `$a` 换成批次起点）：

```powershell
$a = 0; $b = 400; $lines[$a..$b]
$a = 400; $b = 800; $lines[$a..$b]
$a = 800; $b = 1200; $lines[$a..$b]
$a = 1200; $b = 1600; $lines[$a..$b]
$a = 1600; $b = 2000; $lines[$a..$b]
$a = 2000; $b = 2117; $lines[$a..$b]
```

- [ ] **Step 2: 翻译第 I 批（文件头 + SECTION I），用 write 覆盖写入**

```bash
# 写入后确认已有内容
(Get-Content 5-sommaires-et-pdf/caloducs.md).Count
```

- [ ] **Step 3: 逐批追加后续批次，用 edit 在文件末尾追加**

每批追加后确认行数在增长：

```bash
(Get-Content 5-sommaires-et-pdf/caloducs.md).Count
```

批次划分按 SECTION 边界：

| 批次 | 内容 |
| --- | --- |
| 1 | 文件头、标题、SECTION I — CALODUC, CAPTEUR, CUISEUR |
| 2 | SECTION II — LES CAPTEURS À CALODUCS |
| 3 | SECTION III — LE SUPPORT DU CUISEUR |
| 4 | SECTION IV — LA PLAQUE DE CUISSON |
| 5 | SECTION V — LE CAISSON ISOLÉ、SECTION VI — LA PLOMBERIE |
| 6 | SECTION VII — L'INSTALLATION DU CUISEUR |
| 7 | SECTION VIII — FONCTIONNEMENT ET UTILISATION |
| 8 | SECTION IX — PERFORMANCES ET CONTRÔLE |
| 9 | SECTION X — AMÉLIORATIONS、XI — ASPECTS NON TECHNIQUES |

**关键约束**：本文件的尺寸表是空格对齐的纯文本（不是 markdown 表格）。翻译中文时
每行中文宽度不同，**必须保持每行数字的相对顺序与分组不变**，绝不可增删数字。
867 这个数字字面量总数是硬约束。

章节标题对照：

| 法文 | 中文 |
| --- | --- |
| CAPTEUR SOLAIRE THERMIQUE À VAPEUR | 太阳能蒸汽集热器 |
| À CALODUCS ÉTAGÉS | 多级热管式 |
| SECTION I — CALODUC, CAPTEUR, CUISEUR | 第 I 节 热管、集热器与灶具 |
| SECTION II — LES CAPTEURS À CALODUCS | 第 II 节 热管式集热器 |
| SECTION III — LE SUPPORT DU CUISEUR | 第 III 节 灶具支架 |
| SECTION IV — LA PLAQUE DE CUISSON | 第 IV 节 加热板 |
| SECTION V — LE CAISSON ISOLÉ | 第 V 节 保温箱 |
| SECTION VI — LA PLOMBERIE | 第 VI 节 管道 |
| SECTION VII — L'INSTALLATION DU CUISEUR | 第 VII 节 灶具安装 |
| SECTION VIII — FONCTIONNEMENT ET UTILISATION | 第 VIII 节 运行与使用 |
| SECTION IX — PERFORMANCES ET CONTRÔLE DES PERFORMANCES | 第 IX 节 性能与性能检测 |
| SECTION X — AMÉLIORATIONS ENVISAGEABLES | 第 X 节 可考虑的改进 |
| SECTION XI — QUELQUES ASPECTS NON TECHNIQUES | 第 XI 节 若干非技术性话题 |

`étagés` 译「多级」，`caloduc` 全程译「热管」，`cuiseur` 译「灶具」。

- [ ] **Step 4: 全部批次完成后跑门禁**

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1
```

预期：`PASS  5-sommaires-et-pdf/caloducs.md  (links 0, headings 69, imgs 0, tables 0, nums 867)`
且全部 10 个文件均 PASS。

若 `nums` 不是 867，逐节比对找出丢失的数字并补回，**不得**用调整门禁阈值的方式绕过。

- [ ] **Step 5: 提交**

```bash
git add 5-sommaires-et-pdf/caloducs.md
git diff --cached --stat
git commit -m "Traduction chinoise du cuiseur solaire a caloducs etages"
```

---

### Task 6: main 分支加中文翻译提示

**Files:**
- Modify: `README.md`（**在 `main` 分支上**，仅顶部增加几行）

**Interfaces:**
- Consumes: Task 2–5 已推送/已提交的 `zh` 分支
- Produces: 法文读者可发现中文版的入口

- [ ] **Step 1: 切回 main 并确认工作区干净**

```bash
git checkout main
git status --short
```

预期：无输出。

- [ ] **Step 2: 在 README.md 标题下方插入中文提示**

在 `# Documentation de soleil-vapeur` 之后插入：

```markdown
> **中文版本 / Version chinoise** — 本文档库已有完整的简体中文翻译，位于
> [`zh` 分支](https://github.com/leangjia/soleil-vapeur/tree/zh)。
> 49 个 PDF 仅有法文版，中文页面按原路径链接引用。
> **Version chinoise** : une traduction chinoise complète de cette documentation
> est disponible sur la [branche `zh`](https://github.com/leangjia/soleil-vapeur/tree/zh).
> Les 49 PDF ne existent qu'en français ; les pages chinoises y renvoient par les mêmes liens.
```

- [ ] **Step 3: 确认这是 main 上唯一的改动**

```bash
git status --short
git diff
```

预期：只有 `README.md` 一个文件，且 diff 仅包含新增的这段提示。

- [ ] **Step 4: 提交**

```bash
git add README.md
git commit -m "Ajout d'un renvoi vers la traduction chinoise (branche zh)"
```

---

### Task 7: 推送 zh 与 main

**Files:**
- 无文件改动（远端写操作）

**Interfaces:**
- Consumes: Task 2–6 的本地提交
- Produces: 远端 `origin/zh` 与 `origin/main` 更新

- [ ] **Step 1: 推送前记录状态**

```bash
git log --oneline -8
git remote -v
```

预期 remote 为 `https://github.com/leangjia/soleil-vapeur`。

- [ ] **Step 2: 推送 zh 分支**

**必须先 `checkout zh`** —— 在 `main` 上执行 `git push -u origin zh` 会把 `main` 的 upstream
错误地设为 `origin/zh`。

```bash
git checkout zh
git push -u origin zh
```

**已知阻塞**：2026-10-02 实测本机无法连接 `github.com:443`（`api.github.com` 正常返回 200），
此命令会超时失败。若失败：不要重试超过 2 次，不要改用强制推送，把失败信息报给用户，
并交付本地分支状态与推送命令，由用户在网络可达的环境执行。

- [ ] **Step 3: 推送 main**

```bash
git checkout main
git push origin main
```

若 GitHub 以分支保护拒绝直推，改走 PR：
`gh pr create --base main --head <branch> --title "..."`，**不使用 `--force`**。

- [ ] **Step 4: 验证远端状态**

```bash
git fetch origin
git branch -vv
```

预期：`zh` 与 `main` 的 ahead/behind 差值归零。若因网络不可达无法验证，
明确记录「未验证」，不要把本地成功当作远端成功。

---

## 验收清单

- [ ] `powershell -NoProfile -ExecutionPolicy Bypass -File .\tools\check-structure.ps1` 输出 `GATE PASSED`
- [ ] 10 个文件全部为中文，基线数据表各项守恒
- [ ] 法文 PDF 链接在中文页面中全部可解析（由门禁的链接目标守恒保证）
- [ ] `main` 除 Task 6 的提示外无其他改动
- [ ] 推送状态明确：已推送，或受阻并附命令与原因