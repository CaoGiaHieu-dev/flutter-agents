---
name: docs-architect
description: Expert technical writer and documentation architect. Enforces strict comment standards (DartDoc, KDoc, Swift Markdown, Google C++, Python Docstrings) to generate production-ready API documentation.
risk: safe
tags: ["documentation", "comments", "clean-code", "dartdoc", "kdoc"]
---
# Code Documentation Expert Protocol

## When to use this skill
- When requested to document a class, function, or module.
- During code refactoring to improve maintainability and readability.
- When preparing an API or package for public release.

## General Philosophy (Strict Rules)
1. **Explain WHY, not WHAT:** Code tells you *how*, comments should tell you *why*. Never write redundant comments that just repeat the code syntax.
2. **Public APIs MUST be documented:** Any exported class, function, or variable must have a proper doc comment.

## Language-Specific Standards

### 1. Flutter / Dart 3 (DartDoc)
- **Syntax:** ALWAYS use /// for documentation comments, never // or /* */.
- **References:** Enclose in-scope identifiers (variable names, class names, methods) inside square brackets like [variableName] or [Future.value] to create clickable links in generated docs.
- **Structure:** The first line must be a concise, one-sentence summary. Leave a blank /// line before writing detailed descriptions.

### 2. iOS / Swift 6 (QuickHelp Markdown)
- **Syntax:** Documentation comments in Swift use Markdown-flavored markup syntax. Use /// above definitions.
- **Extensions:** You MUST use the Apple CommonMark extensions for functions:
  - - Parameters: followed by - name: description for arguments.
  - - Returns: to document the output.
  - - Throws: to describe what errors might be thrown and under what conditions.

### 3. Android / Kotlin (KDoc)
- **Syntax:** Use traditional block comments starting with /** and ending with */.
- **Tags:** Use standard KDoc tags such as @param for arguments, @return for the return type, and @throws for exceptions.

### 4. C++ (Google C++ Style Guide)
- **Standard:** Follow the Google C++ Style Guide strictly.
- **File/Class Comments:** Every file and class should have a block comment describing its purpose and usage.
- **Function Comments:** Describe the inputs, outputs, and side effects. Emphasize thread-safety, memory ownership (who is responsible for deleting pointers), and performance caveats.

### 5. Python
- **Syntax:** Use PEP 257 Google-style Docstrings (triple double-quotes """... """).
- **Sections:** Include Args:, Returns:, and Raises: sections clearly formatted for automated parsers like Sphinx.
