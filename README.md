# 素晴日 Mini 2.0 · Subahibi Mini

《素晴日》主题的 Q 版 Codex Desktop 原生 Mini / Pets 宠物。深灰黑色长发搭配蓝色渐变发尾，保留向日葵与白色小花发饰、黑白深蓝哥特裙装，以及随动作摆动的白色兔子挂件。

包含 **9 组动画、57 个有效帧**，用于待机、移动、任务执行、等待和审阅等状态。

当前为 **2.0（2026-11-06 重绘版）**，统一了角色外观与静态动作的画风，并修正了跳跃时人物整体缩小的问题。2.0 使用独立宠物 ID，与原版并存安装，选择时分别显示「素晴日 Mini」和「素晴日 Mini 2.0」。

| 待机 | 向右跑动 | 审阅 |
| :---: | :---: | :---: |
| ![待机](previews/idle.gif) | ![向右跑动](previews/running-right.gif) | ![审阅](previews/review.gif) |

[下载 2.0 宠物包](dist/subahibi-mini-pet.zip) · [下载原版 1.0](dist/subahibi-mini-1.0.zip) · [九组动画总览](assets/animation-overview.gif) · [查看全部帧](assets/contact-sheet.png)

## 安装

需要支持自定义 Mini / Pets 的 Codex Desktop 版本。

### macOS：安装脚本

在终端运行：

```bash
git clone https://github.com/wenyusheng1/subahibi-mini.git
cd subahibi-mini
bash install.sh
```

默认安装 **2.0**，保留原版。需要同时安装原版时，再运行 `bash install.sh 1.0`。

也可以点击仓库右上角 **Code → Download ZIP**，解压整个仓库后，在解压目录运行 `bash install.sh`。

脚本会校验两份宠物文件的 SHA-256，再复制到 `${CODEX_HOME:-$HOME/.codex}/pets/subahibi-mini-v2/`。如果已有同名宠物，会先备份到 Codex 数据目录下的 `pet-backups/`，并显示备份位置。

### 手动安装

下载上方的宠物包并解压，将其中 `subahibi-mini-v2` 文件夹复制到 Codex 数据目录的 `pets` 文件夹。默认目录：

| 系统 | 安装目录 |
| --- | --- |
| macOS | `~/.codex/pets/subahibi-mini-v2/` |
| Windows | `%USERPROFILE%\.codex\pets\subahibi-mini-v2\` |

如果设置了 `CODEX_HOME`，将宠物安装到该目录下的 `pets/subahibi-mini-v2/`。更新已有同名宠物时，请先备份旧目录。

最终结构必须是：

```text
Codex 数据目录/
└── pets/
    └── subahibi-mini-v2/
        ├── pet.json
        └── spritesheet.webp
```

`pet.json` 与 `spritesheet.webp` 必须直接放在同一层，避免多套一层 `subahibi-mini-v2` 文件夹。

macOS 也可在本仓库目录中手动复制：

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/pets/subahibi-mini-v2"
cp pet.json spritesheet.webp "${CODEX_HOME:-$HOME/.codex}/pets/subahibi-mini-v2/"
```

Windows 可在本仓库目录打开 PowerShell 后执行：

```powershell
$CodexDataDir = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE ".codex" }
$PetDir = Join-Path $CodexDataDir "pets\subahibi-mini-v2"
New-Item -ItemType Directory -Force -Path $PetDir | Out-Null
Copy-Item -LiteralPath .\pet.json, .\spritesheet.webp -Destination $PetDir -Force
```

### 在 Codex 中启用

1. 打开 Codex Desktop 的 **设置 → Pets / 宠物**。
2. 点击 **Refresh / 刷新**，选择 **「素晴日 Mini 2.0」**。
3. 输入 `/pet`，或从命令菜单选择 **Show pet / 显示宠物**。如果列表没有更新，可完整退出并重新打开客户端。

设置入口可能随客户端版本变化。资源尺寸、透明度、动画内容及文件安装已经检查，macOS 本机已确认 2.0 前端显示；Windows 的复制步骤尚未做实机验证。

## 两个版本并存

| 版本 | 宠物 ID / 安装文件夹 | 前端名称 | 下载 |
| --- | --- | --- | --- |
| 原版 1.0 | `subahibi-mini` | 素晴日 Mini | [原版包](dist/subahibi-mini-1.0.zip) |
| 2.0 | `subahibi-mini-v2` | 素晴日 Mini 2.0 | [2.0 包](dist/subahibi-mini-pet.zip) |

原版文件完整保留在 `versions/1.0/`，2.0 安装和更新不会覆盖原版目录。

## 动画状态

| 状态 | 帧数 | 动作 | 预览 |
| --- | ---: | --- | --- |
| `idle` | 6 | 站立、呼吸、眨眼和发丝轻摆 | [查看](previews/idle.gif) |
| `running-right` | 8 | 向右小跑，头发、外套和兔子随步态摆动 | [查看](previews/running-right.gif) |
| `running-left` | 8 | 向左小跑，保留非对称饰品的位置 | [查看](previews/running-left.gif) |
| `waving` | 4 | 轻轻抬手挥动、微笑并放下 | [查看](previews/waving.gif) |
| `jumping` | 5 | 下蹲、起跳、腾空、下降和落地 | [查看](previews/jumping.gif) |
| `failed` | 8 | 失落、抬烟、吸烟与吐烟 | [查看](previews/failed.gif) |
| `waiting` | 6 | 打开书籍，歪头抬眼等待回应，再收书 | [查看](previews/waiting.gif) |
| `running` | 6 | 站定思考、抬手触下巴，再缓缓放下 | [查看](previews/running.gif) |
| `review` | 6 | 专注阅读、翻页、歪头和合书 | [查看](previews/review.gif) |

左右移动分别绘制，发饰与兔子保持在角色原本的身体侧。各状态沿用统一的角色尺度；跳跃通过下蹲、蹬地、腾空与落地改变姿势和高度，不单独缩小人物。`running` 表示执行任务时的思考状态。

## 文件与规格

```text
subahibi-mini/
├── README.md
├── install.sh
├── pet.json
├── spritesheet.webp
├── SHA256SUMS
├── dist/
│   ├── subahibi-mini-pet.zip      # 2.0
│   └── subahibi-mini-1.0.zip      # 原版
├── versions/1.0/                 # 原版文件与校验值
├── assets/
│   ├── idle-first-frame.png
│   ├── animation-overview.gif
│   └── contact-sheet.png
└── previews/                    # 九组动画预览
```

- 宠物 ID：`subahibi-mini-v2`
- 显示名称：`素晴日 Mini 2.0`
- 图集：`1536 × 1872`，8 列 × 9 行，单格 `192 × 208`
- 格式：无损 RGBA WebP，透明背景
- 有效帧：57；未使用单元格：15，均完全透明
- 安装所需文件：`pet.json`、`spritesheet.webp`

`assets/contact-sheet.png` 的棋盘格与文字仅用于预览，实际宠物图集没有这些内容。

在 macOS 上可单独校验文件：

```bash
shasum -a 256 -c SHA256SUMS
```

## 更新与移除

更新时重新下载本仓库或运行 `git pull`，然后再次执行 `bash install.sh`；脚本会保留原目录的备份。

移除前在 Codex 中关闭或切换宠物，再删除 Codex 数据目录下的 `pets/subahibi-mini-v2/` 文件夹。原版 `pets/subahibi-mini/` 与其他宠物不受影响。

## 常见问题

**列表里找不到宠物？**

确认客户端支持自定义宠物、安装路径与当前 `CODEX_HOME` 一致，并检查两份文件是否直接位于 `pets/subahibi-mini-v2/`。然后完整退出并重新打开客户端。

**为什么动画预览背景是棋盘格？**

棋盘格表示透明区域，仅出现在总览图片中；GIF 预览和实际图集都带透明背景。

**是否需要把预览图片一起安装？**

只需安装 `pet.json` 与 `spritesheet.webp`。`previews/`、`assets/` 和下载包用于浏览或分发。
