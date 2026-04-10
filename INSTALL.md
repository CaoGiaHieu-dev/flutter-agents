# 🚀 Agent Skills Installation Guide

This repository contains a collection of specialized **Agent Skills** designed to enhance the capabilities of **Gemini CLI**, **Google Antigravity**, and modern AI-powered IDEs (Cursor, VS Code, JetBrains).

## 📂 Repository Structure
```text
.agents/
├── skills/
│   ├── flutter-expert/       # Elite Flutter & Dart 3 Architect
│   ├── android-kotlin-pro/   # Expert Android & Kotlin Developer
│   ├── clean-architecture/   # SOLID & Clean Architecture Consultant
│   └── ... (more skills)
├── INSTALL.md                # This guide
└── setup.sh                  # One-click installation script
```

---

## 🛠️ 1. Gemini CLI & Google Antigravity
Both tools use a unified skill standard. You can install them globally or link them for development.

### Option A: Global Installation (Fastest)
Install all skills from this repository directly using the CLI:
```bash
gemini skills install https://github.com/<your-username>/<your-repo-name>.git
```

### Option B: Local Linking (For Development)
If you've cloned this repository locally and want to use the skills across all projects:
```bash
# Link the skills directory to your global skills tier
gemini skills link ./skills
```

### Manual Paths
If you prefer manual setup, symlink or copy the `skills/` sub-directories to:
- **Gemini CLI:** `~/.gemini/skills/`
- **Antigravity:** `~/.gemini/antigravity/skills/`

---

## 💻 2. Cursor IDE (Recommended)
Cursor uses `.cursor/rules` (or `.cursorrules` in older versions) to define project-specific AI behavior.

### Linking to your project
To use these skills in a specific project, link them to the `.cursor/rules` folder:
```bash
mkdir -p .cursor/rules
# Link a specific skill (e.g., flutter-expert)
ln -s /path/to/this/repo/skills/flutter-expert/SKILL.md .cursor/rules/flutter-expert.mdc
```
*Note: Cursor Rules work best with `.mdc` or `.md` extensions.*

---

## 🎨 3. VS Code & JetBrains
While these IDEs don't have a native "Skill" system yet, you can integrate them using:

### VS Code (with "Prompts" or "Copilot")
1. **Copilot Custom Instructions:** Copy the content of a `SKILL.md` into your `.github/copilot-instructions.md`.
2. **Project Rules:** Use the "Project Rules" extension or simply keep the `SKILL.md` open in a tab to provide context.

### JetBrains (AI Assistant)
1. Open **AI Assistant** settings.
2. Go to **Prompt Library**.
3. Create a new prompt (e.g., "Flutter Expert") and paste the content of the relevant `SKILL.md`.

---

## ⚡ 4. Automatic Setup
We provide a `setup.sh` script to automate linking for macOS/Linux and `setup.bat` for Windows.

```bash
# Clone the repository
git clone https://github.com/<your-username>/<your-repo-name>.git .agents
cd .agents

# Run the setup
bash setup.sh
```

---

## 📝 How to use a Skill
Once installed, you can activate skills in your prompts:
- **Gemini CLI:** `Use @flutter-expert to refactor this widget.`
- **Antigravity:** The agent will automatically detect and activate relevant skills from `~/.gemini/antigravity/skills/`.
- **Cursor:** Mention `@flutter-expert.mdc` in the Chat or Composer.
