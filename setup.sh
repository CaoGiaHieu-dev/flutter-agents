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

install_external_skills() {
    local repo_url=$1
    local name=$2
    local temp_dir
    temp_dir=$(mktemp -d 2>/dev/null || mktemp -d -t 'skills')
    
    echo "📦 Installing external $name skills..."
    if git clone --depth 1 "$repo_url" "$temp_dir" &> /dev/null; then
        for skill_path in "$temp_dir/skills"/*; do
            if [ -d "$skill_path" ]; then
                skill_name=$(basename "$skill_path")
                echo "   🔗 Installing $skill_name..."
                
                for dest in "$GEMINI_SKILLS_DIR" "$ANTIGRAVITY_SKILLS_DIR" "$GEMINI_CONFIG_SKILLS_DIR" "$ANTIGRAVITY_IDE_SKILLS_DIR"; do
                    if [ -d "$dest" ]; then
                        rm -rf "$dest/$skill_name"
                        cp -R "$skill_path" "$dest/$skill_name"
                    fi
                done
            fi
        done
        rm -rf "$temp_dir"
    else
        echo "⚠️ Warning: Failed to clone $name skills from $repo_url. Skipping."
    fi
}

install_external_skills "https://github.com/dart-lang/skills.git" "Dart"
install_external_skills "https://github.com/flutter/skills.git" "Flutter"

echo ""
echo "✅ Setup Complete!"
echo "💡 You can now use these skills in Gemini CLI or Antigravity."
