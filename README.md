# 素晴日 Mini · Subahibi Mini

《素晴日》主题的 Q 版 Codex Desktop 原生 Mini / Pets 宠物。深灰黑色长发搭配蓝色渐变发尾，保留向日葵与白色小花发饰、黑白深蓝哥特裙装，以及随动作摆动的白色兔子挂件。

包含 **9 组动画、57 个有效帧**，用于待机、移动、任务执行、等待和审阅等状态。

| 待机 | 向右跑动 | 审阅 |
| :---: | :---: | :---: |
| ![待机](previews/idle.gif) | ![向右跑动](previews/running-right.gif) | ![审阅](previews/review.gif) |

[下载宠物包](dist/subahibi-mini-pet.zip) · [查看全部动作](assets/contact-sheet.png)

## 安装

需要支持自定义 Mini / Pets 的 Codex Desktop 版本。

### macOS：安装脚本

在终端运行：

```bash
git clone https://github.com/wenyusheng1/subahibi-mini.git
cd subahibi-mini
bash install.sh
```

也可以点击仓库右上角 **Code → Download ZIP**，解压整个仓库后，在解压目录运行 `bash install.sh`。

脚本会校验两份宠物文件的 SHA-256，再复制到 `${CODEX_HOME:-$HOME/.codex}/pets/subahibi-mini/`。如果已有同名宠物，会先备份到 Codex 数据目录下的 `pet-backups/`，并显示备份位置。

### 手动安装

下载上方的宠物包并解压，将其中 `subahibi-mini` 文件夹复制到 Codex 数据目录的 `pets` 文件夹。默认目录：

| 系统 | 安装目录 |
| --- | --- |
| macOS | `~/.codex/pets/subahibi-mini/` |
| Windows | `%USERPROFILE%\.codex\pets\subahibi-mini\` |

如果设置了 `CODEX_HOME`，将宠物安装到该目录下的 `pets/subahibi-mini/`。更新已有同名宠物时，请先备份旧目录。

最终结构必须是：

```text
Codex 数据目录/
└── pets/
    └── subahibi-mini/
        ├── pet.json
        └── spritesheet.webp
```

`pet.json` 与 `spritesheet.webp` 必须直接放在同一层，避免多套一层 `subahibi-mini` 文件夹。

macOS 也可在本仓库目录中手动复制：

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/pets/subahibi-mini"
cp pet.json spritesheet.webp "${CODEX_HOME:-$HOME/.codex}/pets/subahibi-mini/"
```

Windows 可在本仓库目录打开 PowerShell 后执行：

```powershell
$CodexDataDir = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE ".codex" }
$PetDir = Join-Path $CodexDataDir "pets\subahibi-mini"
New-Item -ItemType Directory -Force -Path $PetDir | Out-Null
Copy-Item -LiteralPath .\pet.json, .\spritesheet.webp -Destination $PetDir -Force
```

### 在 Codex 中启用

1. 打开 Codex Desktop 的 **设置 → Pets / 宠物**。
2. 选择 **「素晴日 Mini」**，打开宠物显示。
3. 如果没有出现，完整退出并重新打开客户端，再检查列表。

设置入口可能随客户端版本变化。资源尺寸、透明度、动画内容及文件安装已经检查；客户端内的选择与实际显示尚未实测，Windows 的复制步骤也未做实机验证。

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
| `running` | 6 | 站定托腮思考、目光变化与点头 | [查看](previews/running.gif) |
| `review` | 6 | 专注阅读、翻页、歪头和合书 | [查看](previews/review.gif) |

左右移动分别绘制，发饰与兔子保持在角色原本的身体侧。跳跃行保留腾空空间，整体占幅略小；`running` 表示执行任务时的思考状态。

## 文件与规格

```text
subahibi-mini/
├── README.md
├── install.sh
├── pet.json
├── spritesheet.webp
├── SHA256SUMS
├── dist/subahibi-mini-pet.zip
├── assets/
│   ├── idle-first-frame.png
│   └── contact-sheet.png
└── previews/                    # 九组动画预览
```

- 宠物 ID：`subahibi-mini`
- 显示名称：`素晴日 Mini`
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

移除前在 Codex 中关闭或切换宠物，再删除 Codex 数据目录下的 `pets/subahibi-mini/` 文件夹。其他宠物不受影响。

## 常见问题

**列表里找不到宠物？**

确认客户端支持自定义宠物、安装路径与当前 `CODEX_HOME` 一致，并检查两份文件是否直接位于 `pets/subahibi-mini/`。然后完整退出并重新打开客户端。

**为什么动画预览背景是棋盘格？**

棋盘格表示透明区域，仅出现在总览图片中；GIF 预览和实际图集都带透明背景。

**是否需要把预览图片一起安装？**

只需安装 `pet.json` 与 `spritesheet.webp`。`previews/`、`assets/` 和下载包用于浏览或分发。
