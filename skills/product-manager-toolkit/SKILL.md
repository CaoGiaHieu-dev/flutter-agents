---
name: product-manager-toolkit
description: >-
  Product management and requirements engineering. Provides
  actionable PRD templates, user story formats, RICE
  prioritization, and acceptance criteria standards.
---
# Product Manager — Requirements & Strategy Protocol

This skill structures product requirements so they are
precise, testable, and directly executable by developers.

---

## 1. PRD TEMPLATE (Agentic Format)

Use this template when creating or refining requirements:

```markdown
# PRD: <Feature Name>
Date: <YYYY-MM-DD> | Author: <name> | Status: Draft

## Problem Statement
What user problem does this solve? Why now?

## Success Metrics (North Star)
- Primary KPI: <measurable outcome>
- Secondary: <supporting metrics>

## User Stories
- As a <role>, I want <action>, so that <benefit>.
- As a <role>, I want <action>, so that <benefit>.

## Acceptance Criteria (Gherkin)
Given <precondition>
When <action>
Then <expected result>

## Scope
### In Scope
- <feature 1>
- <feature 2>

### Out of Scope
- <explicitly excluded items>

## Technical Constraints
- Must work with existing <system/API/pattern>.
- Must respect current <architecture/stack>.

## Failure Modes
- What happens when <system fails>?
- What happens when <invalid input>?
- Recovery strategy: <fallback behavior>.

## Open Questions
- <unresolved decisions>
```

## 2. PRIORITIZATION (RICE)

Score features using RICE before committing resources:

| Factor       | Scale      | Question                    |
|--------------|------------|-----------------------------|
| **Reach**    | Users/quarter | How many users affected?  |
| **Impact**   | 0.25-3     | How much value per user?    |
| **Confidence** | 0-100%  | How certain are we?         |
| **Effort**   | Person-months | How much work?            |

**Score = (Reach × Impact × Confidence) / Effort**

Use this to decide between competing features or to justify
"Pragmatic Patch" vs "Clean Refactor" when tech debt conflicts
with velocity.

## 3. ACCEPTANCE CRITERIA STANDARDS

- **Intent over UI:** Write Gherkin focusing on user intent
  ("When the user requests...") not UI mechanics.
- **Testable:** Every criterion must be verifiable by an
  automated test or clear manual step.
- **Edge cases:** Include negative paths and error scenarios.
- **No ambiguity:** Avoid words like "should", "might",
  "appropriate". Use "MUST", "MUST NOT", "exactly".

## 4. REQUIREMENT-CODE ALIGNMENT

- **Traceability:** Each user story maps to specific files
  and test cases.
- **Scope discipline:** Flag "scope creep" immediately if
  implementation exceeds the original PRD intent.
- **Local compliance:** Requirements MUST respect existing
  architectural constraints and legacy code realities.
