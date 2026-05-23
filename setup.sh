#!/bin/bash

# Setup Script for Agent Skills (macOS/Linux Version)
# Đảm bảo đường dẫn tuyệt đối và dọn dẹp link cũ trước khi tạo mới.

set -e

# Lấy đường dẫn tuyệt đối của thư mục chứa script này
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILLS_DIR="$SCRIPT_DIR/skills"

GEMINI_SKILLS_DIR="$HOME/.gemini/skills"
ANTIGRAVITY_SKILLS_DIR="$HOME/.gemini/antigravity/skills"
GEMINI_CONFIG_SKILLS_DIR="$HOME/.gemini/config/skills"
ANTIGRAVITY_IDE_SKILLS_DIR="$HOME/.gemini/antigravity-ide/skills"

echo "🚀 Starting Agent Skills Setup..."

# Kiểm tra thư mục skills
if [ ! -d "$SKILLS_DIR" ]; then
    echo "❌ Error: 'skills' directory not found at $SKILLS_DIR"
    exit 1
fi

# Hàm tạo liên kết
link_skills() {
    local target_root=$1
    local tool_name=$2
    
    echo "📦 Linking skills for $tool_name to $target_root..."
    mkdir -p "$target_root"
    
    for skill_path in "$SKILLS_DIR"/*; do
        if [ -d "$skill_path" ]; then
            skill_name=$(basename "$skill_path")
            target_link="$target_root/$skill_name"
            
            echo "   🔗 Linking $skill_name..."
            
            # Xóa link/thư mục cũ nếu tồn tại
            rm -rf "$target_link"
            
            # Tạo symbolic link mới
            ln -s "$skill_path" "$target_link"
        fi
    done
}

# Thực hiện cho Gemini CLI (Legacy)
link_skills "$GEMINI_SKILLS_DIR" "Gemini CLI"

# Thực hiện cho Antigravity (Legacy)
link_skills "$ANTIGRAVITY_SKILLS_DIR" "Google Antigravity"

# Thực hiện cho Gemini/Antigravity CLI (v2.0+)
link_skills "$GEMINI_CONFIG_SKILLS_DIR" "Gemini/Antigravity CLI (v2.0+)"

# Thực hiện cho Antigravity IDE (v2.0+)
link_skills "$ANTIGRAVITY_IDE_SKILLS_DIR" "Antigravity IDE (v2.0+)"

echo ""
echo "📦 Installing external Dart & Flutter skills..."
if command -v gemini &> /dev/null; then
    echo "Installing Dart skills via Gemini CLI..."
    gemini skills install https://github.com/dart-lang/skills.git
    echo "Installing Flutter skills via Gemini CLI..."
    gemini skills install https://github.com/flutter/skills.git
elif command -v antigravity &> /dev/null; then
    echo "Installing Dart skills via Antigravity CLI..."
    antigravity skills install https://github.com/dart-lang/skills.git
    echo "Installing Flutter skills via Antigravity CLI..."
    antigravity skills install https://github.com/flutter/skills.git
else
    echo "⚠️ Warning: Neither Gemini CLI nor Antigravity CLI was found in PATH."
    echo "Skipping automatic installation of external Dart/Flutter skills."
fi

echo ""
echo "✅ Setup Complete!"
echo "💡 You can now use these skills in Gemini CLI or Antigravity."
