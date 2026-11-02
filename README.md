# multi-model-continuous

多模型持续开发标准 · **V1.3**

一份给 AI 编码代理使用的技能（skill）文件。它规定：什么时候启用多模型协作、先探测真实环境再选策略、用真实的子代理派发、实施与独立审查隔离、审查失败自动修复、以及每一步都要留下可验证的证据。

适用于任何支持 `skills` 目录的 agent 工具（DeepSeek Harness、Codex、Claude Code 等）。

## 文件

| 文件 | 作用 |
|---|---|
| `SKILL.md` | 规则本体，V1.3 权威版本 |
| `install.ps1` | 一键安装到本机各个 agent（自动跳过未安装的工具，自动备份旧版） |
| `README.md` | 本文件 |

## 兼容的安装位置

| 工具 | 技能目录 |
|---|---|
| DeepSeek Harness (DSH) | `%USERPROFILE%\.dsh\skills\multi-model-continuous\` |
| Codex | `%USERPROFILE%\.codex\skills\multi-model-continuous\` |
| Claude Code | `%USERPROFILE%\.claude\skills\multi-model-continuous\` |

## 安装

方式一：直接克隆到某个 agent 的技能目录

```powershell
git clone <本仓库地址> "$env:USERPROFILE\.dsh\skills\multi-model-continuous"
```

方式二：下载 zip 解压到上表对应目录。

方式三：在本仓库目录执行一键安装

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1 -Target all
```

可选 `-Target`：`dsh` / `codex` / `claude` / `all`（默认 `all`）。

已存在的旧版会先备份成 `SKILL.md.bak-yyyyMMdd-HHmmss`，不会无声覆盖。

## 触发方式

默认**不启用**，不影响日常对话。需要时明确说一句即可，例如：

- 「启用多模型开发标准」
- 「进入持续构建模式」
- 「用多模型协作做这件事」

V1.0 / V1.1 / V1.2 的旧激活说法会被自动路由到 V1.3，不会扩大文件或权限范围。

## V1.3 相对 V1.2 的变化

1. **环境探测**：先用工具和运行时证据判断真实环境，禁止从项目名、或提示词里提到的模型名去推断。
2. **策略分流**：A 类 GPT/ChatGPT、B 类其他 agent 环境、C 类识别不出 → 标记阻塞，只问一个问题。
3. **资源通道**：只用该环境已批准的模型通道，禁止悄悄换成别的订阅或计费渠道。
4. **模型身份**：模型清单要实测，模型名和推理深度按实际记录，不许编；费用查不到就写 `unknown`。
5. **跨会话**：环境变了要重新探测，不能把上一次的模型分配和计费假设直接沿用。

## 注意

本仓库只包含规则文本，不含任何 API Key、账号、额度或项目私有信息。
