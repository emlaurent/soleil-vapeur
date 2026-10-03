# soleil-vapeur 文档

**食物烹煮、医疗灭菌**  
**通过吸附制冰**  
**使用蒸汽式太阳能热装置 "soleil-vapeur"**  
**100 至 164°C / 0 至 6 bar / 0.5 至 10 kW**

## 背景与现状

1990 年代至 2017 年间，法国和美国的几位独立研究者与工程师围绕聚光太阳能系统开展了设计与实验工作。
[这些工作的成果已在 2012 至 2017 年间被详细记录](doc-asso.htm)。此后工作组不再活动，文档（以及网站）也不再维护。

**为避免这份近 1000 页的丰富文档所付出的巨大努力付诸东流**，[Emmanuel](https://emlaurent.github.io/ingenierie_en_sobriete/) 接手了全部文档并重新更新了网站。这份文档在本页面底部（或通过左侧链接）可以访问，值得进一步更新（修正指向供应商的链接、分页，……）。某些部分尚未编写，在积累了足够的实验时间之后值得补齐文档工作。[网站的旧版本](http://jean.boubour.pagesperso-orange.fr/) 仍然可以访问。
 
从技术上说，**文档已转移到一个 github 账户**，最初的首页得以保留（见下文），只是做了版式重排并补上了这段背景说明。文档为 PDF 文件，外加若干 html 格式的页面。作为试验，[一个 pdf 文件已被转换为 markdown 文件](2-sommaires-et-pdf/2-Chap-I-Plaque.md)（先提取图像和文字，再重新排版）。其用意是测试把 github 用于跟踪修改、并让多位贡献者协同更新。
如果您有意参与更新这份文档，或想用 github 管理其更新，请联系 [Emmanuel](https://emlaurent.github.io/ingenierie_en_sobriete/)。

部分文档采用 Creative Commons 许可，但与文档作者的交流确认了他的意愿：让全部这些知识都可被获取。**因此本站的所有内容以及所有可下载的 pdf 文档均采用 Creative Commons CC-by-SA 许可。** 

[![](https://mirrors.creativecommons.org/presskit/buttons/80x15/png/by-sa.png)](https://creativecommons.org/licenses/by-sa/4.0/)

## 设计工作导论
本项目的意图是汇集与一座中型太阳能热装置的设计、建造与使用
相关的科学与技术知识，该装置用于烹煮 (cuisson)、食物与医疗灭菌
(stérilisation médicale)，以及通过吸附 (adsorption) 制冰，并以水蒸气
作为传热流体，温度为 100 至 165° C，即表压 0 至 6 bar，可供用户
使用的功率范围约为 0,5 至 10 kW，或在需要时更高。

![](photos/photo1.jpg) 

这座太阳能装置包括：

* **一套利用手动跟踪式太阳能集热器 (capteur solaire thermique à conduite manuelle) *产生蒸汽* 的装置**，由以下部分组成：
  * 一面东西向布置的柱面抛物镜
  * 一个复合抛物面聚光器 (concentrateur parabolique composé, CPC)，
  * 一台锅炉，即安装在聚光器底部的一根管子，
  * 一副管状骨架，
  * 一套手动对准装置。
* **若干*蒸汽使用*装置**，其中尤其
包括一块蒸汽加热板 (plaque chauffante à vapeur)**，其工作原理与
电加热板相同，使用者把自己的食物烹煮容器或医疗灭菌容器放在上面。
其他装置（浸没式蛇形管、置于烹煮容器外部的蛇形管等）也有描述。

这座聚光太阳能装置可以在日照直射条件良好（不含漫射辐射）、
而传统能源资源有限的地区发挥作用。该装置设计质朴，完全手动操作，
不依赖任何自动化装置、伺服控制，也不需要电气连接。

因此本文不涉及 100°C 以下低温太阳能热能领域（生活热水、
居住建筑供暖），也不涉及高温热能领域（太阳能热电站）。同样也不涉及
锅式烹煮器 (cuiseurs-boites) 与抛物面烹煮器 (cuiseurs-paraboles)
领域，这些在别处已有大量论述。

使用传热流体——比如蒸汽——可以把分散在空间中的太阳能热流
汇集到一个使用点上，并获得可观的功率。「soleil-vapeur」集热器
并非为个人或家庭使用而设计，它面向专业使用或集体使用，用于那些
热能已经越来越多地被计量计费的地方。

![](photos/photo4.jpg) 

它是热能供应问题的一个解决方案要素，可以作为主能源或辅助能源，
例如集体餐饮领域，或小型农食加工企业（屠宰场、乳品厂、罐头厂、
面粉厂、啤酒厂……）、制皂厂、各类蒸馏厂（香水、精油）、
麻风果 (jatropha curca) 型生物柴油生产等等....

其标志性用途——也就是蒸汽医疗灭菌——本身就足以证明该集热器的
价值。关于这一主题，可以参阅发表在 The American Journal of
Tropical Medicine and Hygiene 上的文章
["Validation of the Efficacy of a Solar-Thermal
Powered Autoclave System for Off-Grid Medical Instrument Wet
Sterilization"](http://www.ajtmh.org/content/87/4/602.abstract)
。

需要更高温度的油炸和烘烤烹煮，目前并不是 soleil-vapeur 工作的
优先事项，但已获得的经验已经足以参数化出一种能够烤面包的集热器。

关于这座太阳能装置的工作主要在 soleil-vapeur.org 的社团框架内
开展，该社团最初汇集了法国布雷斯特地区的几位布列塔尼人。起初既
无义务也无进度安排，但有毫不松懈的执念。事后看来，人们意识到
进展的节奏取决于在当时的问题上恰好遇到有经验的人（一位或几位），
以及能否获得资金（主要是私人资金）。于是出现了一连串的高峰时刻
（1995 年首次喷出蒸汽、1996 年集热器光学装置的专利，……，
2010 年的蒸汽加热板与 2011 年的医疗灭菌，在休斯顿的赖斯大学……）
和一些低谷。至今这段传奇尚未迎来结局，仍有几章有待书写，
尤其是关于制冰的部分。

------------

我们专门设计并制造了一台**通过吸附制冰的机器**（使用沸石 zéolite），
它以集热器产生的蒸汽运行。鉴于已取得的结果非常令人鼓舞，
第二台制冰机目前（2013）正按相同的规格建造之中。第一台机器
具有实验原型的外观，尚未作为论文发表。如果第二台机器证实了
第一台机器的结果，可以考虑在 2014 年初前后发表。

![](photos/photo25.jpg) 

------------

下面介绍建造一座镜面面积 2m² 的小型装置所需的全部要素。由于
热工领域的尺度效应相当可观，根据我们的经验，这是使用传热流体的
太阳能集热器可能达到的最小尺寸。然而它的有效功率 (puissance utile)
与燃气灶或灶具上中等尺寸电热板的功率相当，每天可持续六小时。
这足以完成每天三次、每次 4 kg 蔬菜的烹煮（水煮、蒸煮或炖煮）。

它的功率尤其足以驱动一台蒸汽医疗灭菌器，例如 All American 1915X
或 1925X 型，毛容量分别为 14 升和 25 升。

![](photos/photo23.jpg) 

但是，除了医疗灭菌之外，这台 2 m² 的小集热器主要具有教学用途。
由于人们缺少蒸汽方面的知识，再加上太阳能带来的非常规约束，
建造太阳能热装置多少带有入门修炼的意味。除非处在特别有利的情况，
否则不建议一开始就从 12 或 20 m² 的大集热器做起。最好先从
2 m² 的小集热器开始，让太阳能和使用者互相适应。小集热器是在考虑
更大机器（而且由于尺度效应在能量上更划算）之前的一个良好起点。
在小集热器中，无论是建造者还是使用者，都能找到更大机器的全部
要素，只是尺寸适合人手。所提出系统的价值在于日后尺寸不再受限
（可以并联 10 kW 的集热器），但从小处开始是必不可少的。
对一个初出茅庐的业余建造者，你该怎么评价呢——他竟然想先造
一艘十五米的帆船，而事先连在浅滩边的小舢板上试过手都没有做过？
如果在各个层面（建造者、使用者……）都没有对一台 2 m² 小集热器的
掌控，那么就不要梦想更大的集热器；不过至少失败是有限的，而且这台
小集热器还会在别处找到医疗灭菌的用途。

------------------

要建造这里所提出的集热器，所需的技术水平相当于「认真的业余者」，
这里「业余」取「喜欢」之意，而非「不精通者、玩票者」之意。
精确地画线、切割和钻孔 (perçage) 并不需要超出常人的技术。

可以把集热器的建造与 19 世纪欧洲乡村中马拉四轮马车的建造作比较：
某些部件来自工厂，例如带两个锥形车轴颈的车轴来自锻造厂，
车轮的轮毂，半成品的供应，钢筋等等……马车本身、轮子和挽具
则由当地的马具匠、铁匠、木匠制作。同样，对于集热器，
某些部件来自工厂：抛物线型材、管材与板材的供应、沸水器的制作……，
但集热器本身的建造应尽可能贴近其使用者来完成。

![](photos/photo14.jpg) 

第一条首要原则：要严谨。太阳的力量（但也是它的弱点）在于
「它总是多少能用一点」。不能满足于「一点」，必须追求更高。

第二条首要原则：不要做任何修改。集热器的设计中有许多参数
相互关联，我们在此并不声称已经完全理解并描述出它们脆弱的平衡。
因此在第一阶段，建造者应严格遵守所提供的全部说明。

下面所提出的集热器值得许多改进。但无论对集热器、飞机还是帆船来说，
都有一大堆初学者无法同时全面掌握的参数。只要忽略其中一个，飞机的
重心或帆船的偏心就可能被移动到使其无法操纵的程度，而且很可能
永远没有人能找到出错的原因。

以下是摘自给小型休闲飞机业余建造者的建议 (pouguide.org)：
"……完全照抄，不要做任何改动。不要自作主张。把你的创新留到以后，
等你飞满 10 小时之后再做。到那时你会以非常不同的角度看待你的
发明……" 又或者：「……不要寻求创新，去享受有经验的前辈所积累
的经验。下一个再说。这样你就避免了这类事业中如此频繁的失败」。

-------------------------

为了平缓地着手制造集热器，也可以使用教学套件 (malle pédagogique)，
它提供了建造集热器模型（不可运行）、制作镜子实物尺寸的样品，
以及制作复合抛物面聚光器 (CPC) 实物尺寸样品所需的全部说明
（见第 1 部分第 VII 章）。

-------------------

在进入正题之前，我们先做一个小计算，各人可以自行得出想要的结论。

设温带地区有一公顷林地，管理得当。它每年产出 2200 至 3600 kg 干木材，
其热值为每 kg 15 至 16 MegaJoule。因此每年在一公顷上
至少可回收 2 200 * 15 = 33 000 MJ，最多可回收
3 600 * 16 = 57 600 MJ。这里取每平方米林地每年 4 MJ 的
木材能量值。一旦以 0,6 的效率送入锅炉，便得到
**每平方米每年 2,4 MegaJoule 蒸汽。**
由于是温带地区的林地，认为它每年每平方米接受约 5 000 MJ 的
太阳辐射通量。.

因此木材 / 太阳能的效率约为 4 / 5 000 = 0,08 %，
而蒸汽的效率约为 0,05%

另外，设一台「soleil-vapeur」型集热器，每年在
900 Watt/m² 的太阳辐射下运行 1000 小时，效率为 0.5。
每平方米集热器可得 1000 小时* 900 Watt * 3600 秒 * 0,5  = <
 **每平方米每年 1 620 MegaJoule 蒸汽。**
（ Joule 是机械能、热能、电能的单位。
1 Watt = 1 Joule/秒; 1 MegaJoule = 1 000 000 J）

用 1 m² 林地可获得的「蒸汽能量」与用
1 m² 太阳能集热器可获得的「蒸汽能量」之比为 2.4/1620，即 1/675。
不去纠结推理中的细节（我们没有计入樵夫的劳动，
也没有计入集热器的建造成本等等等等），
这里只把它当作一个形象说法：森林与集热器之间相差
「小数点前两个零」。也可以看出生物质相对太阳辐射的可利用效率
在万分之一与千分之一之间波动。用麻风果 (Jatropha  Curcas)
油重新计算，数量级依然绝望地相同（每公顷 800 至 1800 升，
37 MegaJoule/kg ？）。换用葵花籽油继续计算，也毫无改善
（1 200 Kg，38 MegaJoule/kg ？）。

然而自从人类掌握用火以来，用木柴、木炭或燃气做饭远比用太阳能
集热器容易，但这恰恰是因为大自然已经耐心地、
事先地免费捕获、转化、聚集并储存了太阳能。除怀着对樵夫和
井下矿工应有的敬意之外，人类如今只需取用，就像人们来到一个
装满果酱的大柜子前免费取用，而地上散落着打破的、
只吃了一半的罐子（人们甚至开始看到柜子的底了）。
当轮到人类自己去捕获和聚集太阳辐射、
自己动手做果酱时，人们才开始看到
能源真正的技术与经济成本。

![](photos/photo2.jpg) 

-------------------

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

---

## Documentation 文档目录
文档分为若干部分（parties）和若干章（chapitres）。分页方式
各章不同。每一章开头都有一份详细的目录。

所有 pdf 文档的页脚都标注日期。

屏幕左侧的目录同时充当站点导航。
* 第 1 部分 太阳能集热器与蒸汽的产生
* 第 2 部分 食物烹煮与医疗灭菌
* 第 3 部分 通过吸附制冰
* 第 4 部分 技术手册 (memento technologique)
* 第 5 部分 走向其他天地
* 第 6 部分 手动跟踪式 "Fresnel" 烹煮器

[**全部文档合并为一个文件**](documentation-totale.pdf) 

### 第 1 部分：集热器与蒸汽的产生

* <a href="1-sommaires-et-pdf/1-I-dossier-calculs.pdf">1-Chap.I- 计算书 </a> 
* <a href="1-sommaires-et-pdf/1-II-conception.pdf">1-Chap.II- 集热器设计 </a> 
* <a href="1-sommaires-et-pdf/1-III-etude-capteur.pdf">1-Chap.III- 集热器研究 </a> 
* <a href="1-sommaires-et-pdf/1-IV-Etude-Circuit.pdf">1-Chap.IV- 蒸汽发生回路研究 </a> 
* <a href="1-sommaires-et-pdf/1-V-Construction.pdf">1-Chap.V- 集热器的建造 </a> 
* <a href="1-sommaires-et-pdf/1-VI-Installation-etc.pdf">1-Chap.VI- 安装、操作、性能、维护 </a> 
* <a href="1-sommaires-et-pdf/1-VII-Malle-Pedagogique.pdf">1-Chap.VII- 教学套件 </a> 
* <a href="1-sommaires-et-pdf/1-VIII-Plans-Informatiques.html">1-Chap.VIII- 图纸 </a> 
* <a href="1-sommaires-et-pdf/1-IX-ombre-portee.pdf">1-Chap.IX- 杆的投影 (ombre portée) </a> 
* <a href="1-sommaires-et-pdf/1-X-positions-capteur.pdf">1-Chap.X- 集热器的位置 </a> 

### 第 2 部分：蒸汽的使用

* 2-Chap.I- 蒸汽加热板 
  * <a href="2-sommaires-et-pdf/2-Chap-I-Plaque.md">PDF 版</a>
  * [Markdown 版](2-sommaires-et-pdf/2-Chap-I-Plaque.md) 在线查看
* <a href="2-sommaires-et-pdf/2-Chap-II-Caisson.pdf">2-Chap.II- 保温箱 (caisson isolant) </a>
* <a href="2-sommaires-et-pdf/2-Chap-III-Sterilisation.pdf">2-Chap.III- 医疗灭菌 </a> 
* <a href="2-sommaires-et-pdf/2-Chap-IV-Cuisson.pdf">2-Chap.IV- 食物烹煮 </a>
* <a href="2-sommaires-et-pdf/2-Chap-V-Performances-etc.pdf">2-Chap.V- 性能与其他概念 </a>
* <a href="2-sommaires-et-pdf/2-VI-VIII-Autres-Utilisations.html">2-Chap.VI-VIII 其他用途与工艺</a>

### 第 3 部分：通过吸附制冰

* <a href="3-sommaires-et-pdf/3-I-presentation-machine.pdf">3-Chap.I- 制冰机总体介绍 </a> 
* <a href="3-sommaires-et-pdf/3-II-documentation-disponible.pdf">3-Chap.II- 现有文档 </a> 
* <a href="3-sommaires-et-pdf/3-III-etude-machine.pdf">3-Chap.I- 制冰机研究 </a> 
* <a href="3-sommaires-et-pdf/3-IV-construction-machine.html">3-Chap.IV- 制冰机的建造 </a>
* 3-Chap.V- 工作原理与性能
* 3-Chap.VI- 基本选择与讨论
* 3-Chap.VII- 技术文档与供应商

### 第 4 部分：技术手册 (memento technologique)

* <a href="4-sommaires-et-pdf/4-Intro-Memento.html">手册导论</a>
* <a href="4-sommaires-et-pdf/4-I-Vapeur-et-pertes.pdf">4-Chap.I- 蒸汽 </a> 
* <a href="4-sommaires-et-pdf/4-II-Unites-anglo-saxonnes.pdf">4-Chap.II- 英美制单位 </a> 
* <a href="4-sommaires-et-pdf/4-III-Tubes-Toles-etc.pdf">4-Chap.III- 管材、板材等 </a> 
* <a href="4-sommaires-et-pdf/4-IV-Boulons.pdf">4-Chap.IV- 螺栓、螺钉、铆钉 </a> 
* <a href="4-sommaires-et-pdf/4-V-Plomberie.pdf">4-Chap.V- 管路与螺纹（攻丝 taraudage） </a> 
* <a href="4-sommaires-et-pdf/4-VI-Brasage.pdf">4-Chap.VI- 钎焊 </a> 

### 第 5 部分：走向其他天地

* <a href="5-sommaires-et-pdf/Horizons.html"> 走向其他天地</a> 
* <a href="5-sommaires-et-pdf/bibliographie.pdf"> 参考书目 </a> 
* <a href="5-sommaires-et-pdf/Carnot.pdf"> 卡诺效率 </a> 
* <a href="5-sommaires-et-pdf/anthropologie.pdf"> 烹煮与人类学 </a> 
* <a href="5-sommaires-et-pdf/cuisson%20solaire%20-%20quelques%20aspects%20techniques.pdf"> 太阳能烹煮：若干技术要点 </a> 
* <a href="5-sommaires-et-pdf/effet%20echelle%20et%20ses%20ravages.pdf"> 尺度效应及其危害 </a> 
* <a href="5-sommaires-et-pdf/cuisson%20solaire%20-%20quelques%20aspects%20thermiques.pdf"> 太阳能烹煮：若干热学要点 </a> 
* <a href="5-sommaires-et-pdf/cuisson%20solaire%20-%20quelques%20aspects%20humains.pdf"> 太阳能烹煮：若干人文要点 </a> 
* 太阳能烹煮器局部概览
* <a href="5-sommaires-et-pdf/caloducs.pdf">采用热管 (caloduc) 的太阳能烹煮器</a> 
* <a href="5-sommaires-et-pdf/proposition%20de%20chauffage%20solaire%20a%20caloducs%20pour%20hautes%20latitudes.pdf"> 提案：高纬度地区热管太阳能供暖 </a> 
* <a href="5-sommaires-et-pdf/proposition%20machine%20a%20glace-gaz%20echappement.pdf"> 提案：制冰机与尾气 </a> 
* <a href="5-sommaires-et-pdf/pommes%20de%20terre%20et%20refrigeration.pdf"> 提案：马铃薯与制冷 </a> 
* 光伏烹煮器
* 对称式集热器的 CPC 设计
* 带 CPC 的对称式集热器：Culbuto
* 尾声 

### 第 6 部分：手动跟踪式 "Fresnel" 烹煮器

* [6-Chap.I-总体概览](6-sommaires-et-pdf/Chap-I-Vue-d-ensemble.pdf)
* **烹煮器的设计与研究**
  * [6-Chap.II-用 Fresnel 集热器跟踪太阳](6-sommaires-et-pdf/Chap-II-Le-suivi-du-soleil-par-un-capteur-Fresnel.pdf)
  * [6-Chap.III-镜面的各个角度](6-sommaires-et-pdf/Chap-III-Les-miroirs-sous-tous-leurs-angles.pdf)
  * [6-Chap.IV-镜面曲率半径的确定](6-sommaires-et-pdf/Chap-IV-Determination-du-rayon-de-courbure-des-miroirs.pdf)
  * [6-Chap.V-第二层级的 CPC 以及两个层级的耦合](6-sommaires-et-pdf/Chap-V-Le-CPC-du-second-etage-et-le-couplage-des-deux-etages.pdf)
  * [6-Chap.VII 第一层级横梁的研究](6-sommaires-et-pdf/Chap-VII-Etude-des-poutres-du-premier-etage.pdf)
  * [6-Chap.VIII- 第一层级镜面的研究](6-sommaires-et-pdf/Chap-VIII-Etude-des-miroirs-du-premier-etage.pdf)
  * 6-Chap.IX-操纵杠杆与调节盒
  * 6-Chap.X-评述
  * 6-Chap.XI-理论要素与制造尺寸汇总

* **烹煮器的建造**
  * 6-Chap.X-横梁
  * 6-Chap.XI-第一层级的镜面
  * 6-Chap.XII-CPC
  * 6-Chap.XIII-烹煮器的骨架
  * 6-Chap.XIV-手动跟踪太阳的装置
  * 6-Chap.XV-蒸汽回路
  * 6-Chap.XVI-烹煮器的安装
  * 6-Chap.XVI-烹煮器的操作