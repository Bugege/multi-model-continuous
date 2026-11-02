---
name: multi-model-continuous
description: >-
  仅在用户明确启用其多模型开发标准、持续构建模式，或明确要求使用此协作方式时，执行经过授权的多模型软件工作流；该流程包含真实子代理调度、可复用提示词包、隔离实施与审查、自动修复与测试，以及在获准阶段之间持续推进。
metadata:
  short-description: 带有证据记录的持续多模型开发
---

# V1.3 execution rules

1. Scope and trigger

Activate only when the user enables their multi-model development standard, continuous construction mode, or explicitly asks for this model collaboration. Do not activate for ordinary conversation or unrelated work.

Route old V1.0/V1.1/V1.2 activation phrases to these current execution rules, without expanding the project, file, permission, or approval scope. If the user explicitly requests a historical version, follow that request and state the material differences.

Do not build a separate cross-system collaboration or orchestration product. Use the approved project files and a lightweight execution manifest/log as the shared source of truth.

2. Environment detection and strategy routing

Detect the actual environment in which the coding work is being performed before selecting models. Do not infer the environment from the project name or from a model mentioned in a prompt.

A. GPT / ChatGPT environment — Strategy 1: Advanced multi-model strategy

Use this strategy when the active coding environment is GPT / ChatGPT.

Project coordination and technical decisions: the active ChatGPT conversation.

Architecture, task-contract and prompt-pack improvement: GPT-6 Astra at the highest supported reasoning depth (Max when available).

Module implementation: 6.1 Luna and DeepSeek 4.1 Flash, selected by task fit and verified availability; use the highest supported reasoning depth for each.

Independent code review: 6.1 Sol at medium reasoning depth.

Additional models may be used only when they are part of the user's approved Plus strategy and are actually available in the current environment.

Do not route GPT / ChatGPT work to another agent environment merely because that environment is also configured elsewhere.

B. Other agent environment — Strategy 2: Other-agent strategy

Use this strategy when the active coding environment is another agent environment.

Use the model-resource channel approved for that agent environment.

Do not use the GPT / ChatGPT Plus strategy's model assignments or silently route work to another subscription or billing channel.

Before dispatch, inspect the model inventory exposed by the current agent environment and verify which models are actually available through its approved resource channel.

Assign verified available models by role:

Primary implementation: the best verified model for routine coding, bug fixes and module implementation.

Specialist implementation: a verified coding/reasoning model for complex changes and refactoring.

Parallel implementation and test support: other verified models for isolated modules, tests, scripts and documentation.

Independent review: a verified model different from the implementation model; use a second reviewer for high-risk changes when available.

Prompt and task refinement: a verified model suited to instruction following and task decomposition.

Preferred model names from an earlier proposed roster (DeepSeek V4.1 Flash, Kimi K2.7 Code, GLM-5.3-Flash, MiMo-V2.6-Flash, DeepSeek V4 Pro, Kimi K3.1 Pro, GPT 6 Luna) are candidates only. They are not guaranteed entitlements, exact provider identifiers, or proof of current availability. Never invent aliases or claim a model was used unless the environment inventory and dispatch evidence confirm it.

Prefer high-throughput/value models for routine work and reserve stronger models for difficult implementation or review. Check the actual per-model limits and current usage before heavy batches when that information is exposed. Never invent quota amounts or usage.

Do not silently use paid API keys, another subscription, or an unapproved billing channel as fallback. If the model or quota needed for a task is unavailable, record the blocker and continue only with independent work that remains within the approved resource boundary.

C. Environment cannot be identified

Do not guess or blend the two strategies.

Inspect available tool/runtime evidence. If still uncertain, mark strategy selection BLOCKED and ask one concise question about the active coding environment before dispatching model-dependent work.

Record the detected environment, evidence, selected strategy and resource channel in the execution manifest.

3. Real dispatch and model identity

Delegate through an actually available native sub-agent, connector, or equivalent tool. Capture the returned agent ID, status and evidence. Role text or a simulated reply is not delegation.

On the first execution of this skill for a batch, call the real dispatch tool before treating the dispatch-dependent workflow as started, and save its returned agent ID, status and evidence in the ledger. If no dispatch tool is available, mark that workflow BLOCKED; do not role-play a dispatch. Continue only independent local work that remains safe and authorized, and report the exact tool gap.

A role is not a model. An entry session may coordinate when the user authorized this workflow, but an independent review must run in a new session/agent and the author must not review its own work.

Inspect the current model inventory and supported reasoning depth. Record the real model identifier and actual depth for every call. Use gpt-6-luna for the Luna worker only when it is actually available; do not invent model aliases or claim an unavailable model was called.

If a requested model/tool is missing, use another model only if it is available within the selected strategy and resource channel. Otherwise mark the task BLOCKED and report the exact gap.

4. Start and state

Read the approved project scope, architecture, existing execution state, repository rules and available paths/tools. Use readable local evidence to resolve basic environment or version questions instead of asking the user.

Create or update a lightweight execution manifest in the approved project/work area. Record:

detected environment and selected strategy;

approved resource channel;

scope and architecture version;

module and file ownership;

branch/worktree;

prompt-pack version;

test and review gates;

stop conditions and approval boundaries;

current stage and unresolved risks.

Keep a call ledger. Each call records requested model and depth, actual model and depth, returned agent ID, role, selected strategy/resource channel, status, purpose, timestamps when available, output/evidence locations, and actual cost/usage when verifiable. If cost or model usage cannot be verified, write unknown; never invent it.

Preserve existing permission, billing, external-write, important-merge and formal-release boundaries. Do not ask again for an action already authorized. Do not add approval gates to ordinary reversible or read-only work.

Keep the project's DEVELOPMENT_LOG.md (or the project's existing equivalent) current. The project files are the shared handoff mechanism; do not create a separate collaboration database or service.

5. Prompt-pack policy

In GPT / ChatGPT environment, if there is no audited and applicable Prompt Pack for the approved architecture and task family, make one actual GPT-6 Astra delegation at the highest supported depth (Max when available). It must produce a versioned formal prompt pack and batch task contract; freeze those artifacts for reuse.

In another agent environment, create or refine the task prompt pack using a verified model available through that environment's approved resource channel. Do not call GPT-6 Astra or another Plus resource as part of this strategy unless the user explicitly authorizes a resource-strategy change.

For ordinary tasks, instantiate variables such as module, files, interfaces, tests and acceptance criteria without changing the pack's substance. Do not spend another prompt-improvement call for a normal test failure or routine wording improvement.

Revisit the prompt pack only for a major approved design/interface change, evidence of a prompt defect that the frozen pack cannot express, or an explicit user request. Record the trigger and new version; proposed architecture or scope changes still require the existing human approval boundary.

6. Continuous execution loop

Assign each worker an explicit file/module owner and isolated branch or worktree when applicable. Never let two agents modify the same file at the same time; route public interfaces and shared configuration to their named owner.

The authorized worker implements and tests its batch using only the selected strategy's approved resource channel. Give the independent reviewer the original requirement, frozen prompt pack, interface contract, diff, test commands/results and relevant constraints. The reviewer reports; it does not edit the worker's files.

In GPT / ChatGPT environment, use 6.1 Sol at medium reasoning depth for independent review when available.

In another agent environment, use a different verified model for independent review. For high-risk changes, use a second independent reviewer when available.

On review failure, send the issue back to the original worker and re-review. An in-scope P1 blocks integration and delivery, but its label alone does not stop the job: repair it automatically within the approved boundary. A P0 triggers containment and a report.

After two consecutive unsuccessful repairs of the same issue, the controller diagnoses the cause; it may change the implementation approach and continue when the new approach remains in scope. Ask the user only for a real authorization, environment or safety blocker, or for a boundary that the existing approval does not cover.

After a stage completes, inspect the manifest for the next executable item. If that item is already authorized, start it automatically and do not end the session. A stage listed only as a plan is not authorization: record it as pending and request one scope decision, rather than treating the completed stage as the final delivery. A review agent finishing does not mean the coordinating session is finished.

Do not send messages to other chats, publish, make an important merge, change approved architecture/public interfaces, switch paid resources, or perform destructive/external mutations without the authorization required by the existing project boundary. Keep working on unaffected local tasks while a dependency is blocked.

7. Evidence, logs and truthfulness

Save lightweight state, prompt-pack versions, worker/reviewer outputs, test evidence, repair history and integration notes where the approved project permits. Do not put secrets or credentials in these records.

Each completed task must update the project development log with: date/time when available, environment, strategy, actual model, task ID, changed files, summary, test commands/results, review result, unresolved issues and next handoff.

When a tool, target model, platform, quota or external capability is unavailable or unverifiable, say so in the state and final report and list the human decision or access needed. Never claim a dispatch, independent review, cost, model usage or external connection that did not produce evidence.

If the environment changes between sessions, detect it again and route the next work batch to the corresponding strategy. Continue from the same project files and task state; do not silently carry model assignments or billing assumptions across environments.

The project files, not conversational recollection or a separate coordination service, are the durable source of truth.
