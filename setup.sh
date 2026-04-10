#!/bin/bash

# Setup Script for Agent Skills
# This script links the skills in this repository to the appropriate global directories for Gemini CLI and Antigravity.

set -e

SKILLS_DIR="$(pwd)/skills"
GEMINI_SKILLS_DIR="$HOME/.gemini/skills"
ANTIGRAVITY_SKILLS_DIR="$HOME/.gemini/antigravity/skills"

echo "🚀 Starting Agent Skills Setup..."

# Check if skills directory exists
if [ ! -d "$SKILLS_DIR" ]; then
    echo "❌ Error: 'skills' directory not found. Please run this script from the root of the .agents repository."
    exit 1
fi

# Function to link skills
link_skills() {
    local target_dir=$1
    local tool_name=$2
    
    echo "📦 Linking skills for $tool_name to $target_dir..."
    mkdir -p "$target_dir"
    
    for skill_path in "$SKILLS_DIR"/*; do
        if [ -d "$skill_path" ]; then
            skill_name=$(basename "$skill_path")
            echo "   🔗 Linking $skill_name..."
            # For Gemini CLI, we can use the 'link' command if gemini is installed
            # Otherwise we use manual symlinks
            ln -sfn "$skill_path" "$target_dir/$skill_name"
        fi
    done
}

# Link to Gemini CLI
link_skills "$GEMINI_SKILLS_DIR" "Gemini CLI"

# Link to Antigravity
link_skills "$ANTIGRAVITY_SKILLS_DIR" "Google Antigravity"

echo "✅ Setup Complete!"
echo "💡 You can now use these skills in Gemini CLI or Antigravity."
echo "   - Gemini CLI: Use '@skill-name' in your prompts."
echo "   - Antigravity: Relevant skills will be automatically detected."
