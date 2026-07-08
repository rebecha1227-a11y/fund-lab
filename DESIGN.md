---
version: alpha
name: Fund-Lab × Wise
description: Fund-Lab 看板设计系统 —— 基于 Wise 全球汇款品牌的北欧金融科技语言本地化：鼠尾草灰画布、石灰绿主行动色、近黑墨字、24px 圆角卡片。面向基金小白的个人投资学习与决策陪练，气质是「冷静、清晰、可信赖」，不是炒股软件的紧张感。

colors:
  primary: "#9fe870"
  on-primary: "#0e0f0c"
  primary-active: "#cdffad"
  primary-neutral: "#c5edab"
  primary-pale: "#e2f6d5"
  ink: "#0e0f0c"
  ink-deep: "#163300"
  body: "#454745"
  mute: "#868685"
  canvas: "#ffffff"
  canvas-soft: "#e8ebe6"
  hairline: "#d4d9d0"
  positive: "#2ead4b"
  positive-deep: "#054d28"
  positive-pale: "#e2f6d5"
  warning: "#ffd11a"
  warning-deep: "#b86700"
  negative: "#d03238"
  negative-deep: "#a72027"
  negative-pale: "#fde8e8"

typography:
  display:
    fontFamily: Manrope, system-ui, -apple-system, sans-serif
    fontSize: 22px
    fontWeight: 800
    lineHeight: 1.2
  section:
    fontFamily: Manrope, system-ui, sans-serif
    fontSize: 14px
    fontWeight: 700
    lineHeight: 1.3
  body:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.5
  caption:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 11px
    fontWeight: 400
    lineHeight: 1.4
  button:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 13px
    fontWeight: 600
    lineHeight: 1.2

rounded:
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  pill: 9999px

spacing:
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  2xl: 32px

components:
  app-shell:
    backgroundColor: "{colors.canvas-soft}"
    maxWidth: 1180px
  topbar:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    padding: "{spacing.md} {spacing.xl}"
  tab-active:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    rounded: "{rounded.xl}"
  card:
    backgroundColor: "{colors.canvas}"
    rounded: "{rounded.xl}"
    padding: "{spacing.xl}"
  card-header:
    backgroundColor: "{colors.canvas-soft}"
    textColor: "{colors.ink}"
    typography: "{typography.section}"
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    rounded: "{rounded.xl}"
  button-secondary:
    backgroundColor: "{colors.canvas-soft}"
    textColor: "{colors.ink}"
    rounded: "{rounded.xl}"
  button-ghost:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    borderColor: "{colors.ink}"
    rounded: "{rounded.xl}"
  text-input:
    backgroundColor: "{colors.canvas}"
    borderColor: "{colors.ink}"
    rounded: "{rounded.md}"
  hub-hero:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.primary}"
    rounded: "{rounded.xl}"
  profit-gain:
    backgroundColor: "{colors.negative-pale}"
    textColor: "{colors.negative}"
  profit-loss:
    backgroundColor: "{colors.positive-pale}"
    textColor: "{colors.positive-deep}"
---

## Overview

Fund-Lab 看板采用 **Wise 北欧金融科技** 视觉语言：鼠尾草灰页面底（`#e8ebe6`）、白色圆角卡片、石灰绿主按钮（`#9fe870`）、近黑墨字（`#0e0f0c`）。整体像一本安静的理财笔记本，而不是紧张的交易终端。

**设计原则（静儿专用）**
1. **先读懂再操作** — 层次清晰，标签用口语，不靠花哨装饰
2. **绿 = 行动** — 石灰绿只用于主按钮、当前 Tab、关键正向提示；涨跌用红/绿语义色，不混用品牌绿
3. **圆角即友好** — 卡片与按钮统一 24px 圆角；输入框 12px
4. **表面即层级** — 鼠尾草底 + 白卡片 = 层级，少阴影、少描边
5. **数据可读** — 收益涨红跌绿（A 股习惯），数字加粗，说明文字用 `--mute`

## 颜色

| 角色 | Token | 值 | 用途 |
|------|-------|-----|------|
| 主行动 | primary | #9fe870 | 主按钮、激活 Tab |
| 墨 | ink | #0e0f0c | 标题、正文 |
| 次文 | body | #454745 | 说明、标签 |
| 弱文 | mute | #868685 | 辅助、占位 |
| 页面底 | canvas-soft | #e8ebe6 | body 背景 |
| 卡片 | canvas | #ffffff | 卡片、输入框 |
| 涨/亏 | negative / positive | #d03238 / #2ead4b | 收益色（A 股） |

## 圆角

- 卡片、主按钮：`24px`（`--radius-xl`）
- 输入框、小芯片：`12px`（`--radius-md`）
- 心情/标签芯片：`8px`（`--radius-sm`）

## 组件映射（看板）

| 区域 | 组件 |
|------|------|
| 顶栏 | topbar — 白底墨字 |
| Tab 导航 | tab-active — 石灰绿胶囊 |
| KPI 卡片 | card on canvas-soft |
| 知识中枢 Hero | hub-hero — 墨底绿字（Wise dark band） |
| 术语翻转卡 | card + radius-md |
| 纪律卡 | card-feature-green / sage 变体 |

## Do / Don't

**Do**
- 用 `--canvas-soft` 铺底，`--canvas` 做卡片
- 主 CTA 一律 `--primary` 绿底黑字
- 卡片 `border-radius: 24px`，`overflow: hidden` 保持圆角完整

**Don't**
- 不用任天堂式金属渐变、斜面、uppercase 导航
- 不用紫色/蓝色渐变 Hero
- 不用 `border-left: 3px` 彩条做选中态（改用浅绿底 + inset ring）
- 不把品牌绿当「涨」的颜色

---

> 源模板：`wise/DESIGN.md`（getdesign）。本项目在 `dashboard.html` 的 `:root` 中实现 token。
