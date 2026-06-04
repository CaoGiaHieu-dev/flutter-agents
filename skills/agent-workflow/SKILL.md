---
name: agent-workflow
description: Standard operational workflow and communication protocol for Multi-Agent coordination.
---
# 🔄 Multi-Agent Collaboration Workflow Protocol (Sovereign v9.0)

This protocol defines the strict workflow, execution milestones, and handover
requirements for all collaborative multi-agent tasks in this repository.

---

## 🏗️ 1. THE 6-STEP COLLABORATION PIPELINE
When tackling any complex feature request, refactor, or audit, agents MUST
collaborate strictly through the following steps:

```text
[User Request] 
      │
      ▼
1. Research & Pop Quiz (EM: @system-integrator + @project-analyzer)
      │
      ▼
2. Strategy & ROI (EM proposes plan, obtains user approval)
      │
      ▼
3. Execution (Specialist: @flutter-expert, @python-fastapi-backend, etc.)
      │
      ▼
4. QA Audit & Profiling (QA: @qa-code-review checks code and regressions)
      │
      ▼
5. Docs-Code Sync (@docs-architect updates markdown, C4 diagrams, ADRs)
      │
      ▼
6. Self-Evolution (EM records winning logic and suggests skill updates)
```

### Step 1: Research & Pop Quiz
- **Tool:** `@project-analyzer` scans the codebase DNA, mapping AST relationships.
- **Pop Quiz:** `@system-integrator` runs a self-interrogation: *"Why is this change necessary? Are there implicit assumptions?"* If unsure, STOP and ask.

### Step 2: Strategy & ROI Proposal
- **Plan:** EM creates a detailed design/implementation plan with cost-benefit analysis.
- **Approval:** Stop and obtain user's explicit OK.

### Step 3: Execution & Bridge Design
- **Execution:** Specialist agent writes code.
- **Bridge:** If working on legacy systems, keep legacy interfaces and wrap clean logic privately. Do not trigger cascade refactoring (Scout Rule).

### Step 4: QA & Regression Audit
- **Telemetry:** `@qa-code-review` runs testing, checks for performance bottlenecks using real profiling, and performs a Zero-Trust regression check on legacy areas.

### Step 5: Docs-Code Sync
- **Docs:** `@docs-architect` performs a sync, updating ADRs, Mermaid charts, and map files if API changes exceed 30%.

### Step 6: Self-Evolution (Feedback Loop)
- **Memory:** EM updates `AGENT_MEMORY.md` with winning logic. If a pattern repeats $>3$ times, EM proposes a **Skill Patch** to update the relevant `SKILL.md`.

---

## 📎 2. SOVEREIGN HANDOVER PROTOCOL
To transfer context between different agents smoothly without context noise, agents MUST export a 5-line markdown block at the end of their turn:

```markdown
### 📎 SOVEREIGN HANDOVER
- **Status:** [Current Task Status]
- **Relational Map:** [Source Symbol -> Target Symbol Linkage]
- **Hotspots:** [High-churn / Risk files identified]
- **Pop Quiz Result:** [Verified assumptions / Open doubts]
- **Next Actor:** [@persona to take over]
```

---

## ⚖️ 3. CONFLICT RESOLUTION & ESCALATION
- **Resolution:** `USER DIRECTIVE` always overrides `LOCAL PROJECT DNA`, which in turn overrides `GLOBAL BEST PRACTICES`.
- **Escalation Rules:**
    1. If a change risks breaking $>2$ unrelated modules, immediately STOP.
    2. Offer the user 3 paths: **(A) Refactor** (high-risk), **(B) Pragmatic Patch** (medium-risk), or **(C) Legacy Clone** (low-risk).
    3. Respect prior user denials for similar changes.

---

## 🛡️ GLOBAL COMPLIANCE
- Refer to `@common-rules` for standard guidelines, including the 80-column rule, local DNA supremacy, and legacy code preservation mandates.
