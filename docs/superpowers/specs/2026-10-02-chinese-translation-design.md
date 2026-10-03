# soleil-vapeur 中文翻译 — 设计文档

日期：2026-10-02
状态：已批准
分支：`zh`（自 `main` @ `c5be8b4` 切出）

## 背景

`soleil-vapeur` 是法国一个独立的太阳能热能项目文档库，记录了一套 1990 年代至 2017 年间
在法国和美国由小型独立研究团队完成的聚光太阳能系统设计与实验工作。内容包括：

- 手动跟踪式太阳能集热器（cylindro-parabolic mirror + CPC 复合抛物面聚光器 + 蒸汽锅炉）
- 蒸汽加热板（用于食品烹煮与医疗灭菌）
- 沸石吸附式制冰机
- 技术手册（memento）与「其他方向」专论

仓库共 190 个受版本控制的文件：49 个 PDF（约 1000 页法文，34.9 MB）、7 个 HTML、5 个 Markdown。
许可证为 CC-BY-SA 4.0，作者已确认希望知识尽可能广泛传播。

## 目标

为法文文档库提供一个完整、忠实的简体中文版本，使中文读者能够阅读全部文本内容，
并且仍能顺畅跳转引用仅存法文版的 PDF。

## 非目标

- **不翻译 PDF。** 49 个 PDF 保持法文原样，中文页面按原有相对路径链接过去。
- **不改动法文内容。** `main` 分支上的法文文档除首页顶部增加一条翻译提示外不做任何修改。
- **不重写、不摘要、不删减。** 每个小节、每张表、每条脚注都要保留。
- **不做机器翻译后润色。** 直接人工（模型）翻译，技术术语一次性处理到位。

## 范围

纳入翻译的文件（共 10 个：6 个 HTML + 4 个 Markdown）：

| 文件 | 说明 |
| --- | --- |
| `README.md` | 项目总览、目录、背景（约 386 行） |
| `bacasable.md` | 现状说明短文 |
| `1-VIII-Plans-Informatiques.html` | 仓库根目录下的计算机图纸目录（与子目录同名文件内容不同，两者均受版本控制，均需翻译） |
| `1-sommaires-et-pdf/1-VIII-Plans-Informatiques.html` | 计算机图纸目录（子目录版本） |
| `2-sommaires-et-pdf/2-Chap-I-Plaque.md` | 第 I 章 蒸汽加热板（约 441 行，含 27 处图片引用） |
| `2-sommaires-et-pdf/2-VI-VIII-Autres-Utilisations.html` | 其他用途与工艺 |
| `3-sommaires-et-pdf/3-IV-construction-machine.html` | 制冰机制造 |
| `4-sommaires-et-pdf/4-Intro-Memento.html` | 技术手册导言 |
| `5-sommaires-et-pdf/caloducs.md` | 多级热管太阳能灶（约 2118 行，11 节） |
| `5-sommaires-et-pdf/Horizons.html` | 其他方向 |

不翻译：`doc-asso.htm`（法文历史页面，仅被 `README.md` 与 `bacasable.md` 引用为存档链接）、
`test-markdown-github-codimd.md`（CodiMD 渲染测试）。

## 分支与文件布局

采用**同路径原地替换**：

- `zh` 分支上，`README.md` 与 6 个 HTML 文件在原路径下存放中文内容。
- 所有 PDF、`photos/`、`CNAME` 原样保留，`git checkout -b zh` 自动携带。
- 因为路径不变，现有的相对链接（指向法文 PDF）全部继续有效。

不使用 `.zh-CN` 后缀，也不建立 `/zh/` 子目录——一个文档只保留一个文件，避免链接审计负担。

## 翻译规范

1. **简体中文，忠实全文翻译。** 不摘要、不合并小节。
2. **数字、单位、公式、尺寸表、公差值、加工参数、代码标识符**逐字保持原样。
3. **专业术语采用双语**：首次出现时写作 `中文 (French)`，使读者能在法文 PDF 中检索。
   `README.md` 顶部新增术语对照表。
4. **原文笔误按原意翻译。** 法文原文含 `adsoption`（应为 *adsorption*）、`ocurence` 等笔误；
   一律按正确含义译出（吸附，而非吸收），不复制笔误。
5. **项目名 `soleil-vapeur` 不译**，保留原名。

### 术语对照表

| 法文 | 中文 | 备注 |
| --- | --- | --- |
| soleil-vapeur | 太阳能蒸汽（soleil-vapeur） | 项目名，不译 |
| capteur solaire thermique à conduite manuelle | 手动跟踪式太阳能集热器 | |
| CPC (concentrateur parabolique composé) | 复合抛物面聚光器 (CPC) | 保留缩写 |
| caloduc | 热管 | 原文 147 处 |
| adsorption | 吸附 | 原文含 `adsoption` 笔误 4 处，一律按 adsorption 译；非「吸收」 |
| zéolite | 沸石 | |
| plaque chauffante à vapeur | 蒸汽加热板 | 原文 58 处 |
| malle pédagogique | 教学套件 | |
| ombre portée | 投影 | |
| cuisson | 烹煮 | 原文 79 处 |
| stérilisation médicale | 医疗灭菌 | |
| caisson isolant | 保温箱 | |
| étamage / étamage à chaud | 镀锡 / 热镀锡 | |
| taraudage | 攻丝 | 原文 13 处 |
| perçage | 钻孔 | |
| usinage sur tour | 车床加工 | |
| joint torique | O 形圈 | 原文 18 处 |
| puissance utile | 有效功率 | |
| rendement | 效率 | 视上下文可译「产率」 |
| memento technologique | 技术手册 | 原文 12 处 |

## 提交分组

每个分组在提交前必须通过结构校验。

| # | 分支 | 内容 |
| --- | --- | --- |
| 1 | `zh` | `README.md` + `bacasable.md` |
| 2 | `zh` | 6 个 HTML 文件 |
| 3 | `zh` | `2-sommaires-et-pdf/2-Chap-I-Plaque.md` |
| 4 | `zh` | `5-sommaires-et-pdf/caloducs.md` |
| 5 | `main` | `README.md` 顶部中文翻译提示，链接到 `zh` 分支 |

`main` 只包含第 5 组这一处改动。`CNAME` 在 `zh` 上保留（无害，实际只有一个分支能对外提供 Pages 服务）。

## 结构校验闸门

每个中文文件提交前与法文原文逐项比对，任一不符即修正后再暂存：

- `href` / `src` 目标集合完全一致
- 各层级标题数量一致
- 图片引用数量一致
- 表格行数一致
- 围栏代码块数量一致
- 数字字面量数量一致

这是保证中文页面仍能正确链接到法文 PDF 的机制。

## 推送

推送 `zh` 与 `main` 到 `origin`（`leangjia/soleil-vapeur`）。

已知环境限制：2026-10-02 实测本机无法连接 `github.com:443`（`api.github.com` 正常），
git 推送会超时。若届时网络仍不可用，则保留本地提交不动，交付本地分支状态与推送命令。

若 GitHub 以分支保护拒绝直推 `main`，改走 PR，不使用强制推送。

## 验收标准

1. 10 个文件全部为中文，`caloducs.md` 11 节齐全，`2-Chap-I-Plaque.md` 27 处图片引用齐全。
2. 全部 10 个文件通过结构校验闸门。
3. 法文 PDF 链接在中文页面中全部可解析。
4. `README.md` 含术语对照表与 CC-BY-SA 署名。
5. `main` 除翻译提示外无其他改动。
6. 推送状态明确：已推送，或受阻并附命令与原因。