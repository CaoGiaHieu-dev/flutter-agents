---
name: project-analyzer
description: >-
  Project context and structural analyst. Maps codebase DNA,
  detects conventions, identifies hotspots and dead code using
  concrete tools (grep, LSP, file system scanning).
---
# Project Analyzer — Codebase Intelligence Protocol

This skill provides systematic codebase analysis and context
mapping. Use it to understand a project before making changes.

---

## 1. PROJECT DNA SCAN

Perform these concrete steps to map a project's DNA:

### Step 1: Directory Structure
```
Tool: list_dir on project root and lib/
Goal: Map feature organization, layer separation, naming.
```

### Step 2: Dependency & Stack Detection
```
Tool: view_file on pubspec.yaml / build.gradle / package.json
Goal: Identify frameworks, state management, DI, packages.
```

### Step 3: Code Style Detection
```
Tool: view_file on 2-3 representative source files
Goal: Identify indentation, naming conventions, patterns.
      Check: camelCase vs snake_case, 2 vs 4 spaces,
      file organization patterns.
```

### Step 4: Convention Detection
```
Tool: grep_search for common patterns
Queries:
  - "import.*bloc" → BLoC usage
  - "ChangeNotifier" → Provider usage
  - "extends GetxController" → GetX usage
  - "part '.*g.dart'" → code generation usage
  - "Either<" → functional error handling
```

## 2. HOTSPOT DETECTION

Identify high-risk files that need extra care:

```
Tool: grep_search with MatchPerLine=true
Queries:
  - "TODO|FIXME|HACK" → Known issues
  - "// ARCH-DEBT" → Tracked tech debt
  - "ignore:" → Suppressed warnings
```

Large files (> 200 LOC) are automatic hotspots — check
using line counts from `view_file`.

## 3. IMPACT ANALYSIS

When a change is proposed, map what it affects:

1. **Direct impact:** Files importing the changed symbol.
   ```
   Tool: grep_search for import/usage of the symbol
   ```
2. **Indirect impact:** Files depending on direct dependents.
3. **Cross-layer impact:** If changing a domain entity, check
   corresponding DTOs, repository implementations, and UI.

## 4. DEAD CODE DETECTION

```
Tool: grep_search for class/function names
Goal: Find symbols defined but never imported elsewhere.
```

For Dart projects, use MCP `analyze_files` which reports
unused imports and unreachable code.

## 5. ANALYSIS REPORT

After analysis, produce a structured summary:

```markdown
## Project Analysis: <project_name>
- **Stack:** Flutter 3.x, Provider, GoRouter
- **Architecture:** Feature-first, 3-layer
- **Code style:** 2-space indent, camelCase, const-first
- **Hotspots:** <list of high-churn or risky files>
- **Dead code:** <list of unused symbols>
- **Conventions:** <unwritten rules detected>
- **Recommendations:** <concrete improvement suggestions>
```
