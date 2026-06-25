#!/usr/bin/env bash
set -euo pipefail

# Setup Script for Agent Skills (v2.0)
# Installs skills with full subdirectory support (references/, scripts/, examples/)
# Cleans old links/dirs before creating new ones.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${SCRIPT_DIR}/skills"
GEMINI_CONFIG_SKILLS_DIR="${HOME}/.gemini/config/skills"
ANTIGRAVITY_IDE_SKILLS_DIR="${HOME}/.gemini/antigravity-ide/skills"

echo "============================================"
echo " Agent Skills Setup (v2.0)"
echo "============================================"
echo ""

# Validate source directory
if [ ! -d "${SKILLS_DIR}" ]; then
    echo "[ERROR] 'skills' directory not found at ${SKILLS_DIR}"
    exit 1
fi

# Create target directories
mkdir -p "${GEMINI_CONFIG_SKILLS_DIR}"
mkdir -p "${ANTIGRAVITY_IDE_SKILLS_DIR}"

link_skill() {
    local src="$1"
    local target_dir="$2"
    local skill_name
    skill_name="$(basename "${src}")"
    local target="${target_dir}/${skill_name}"

    # Remove existing link/dir
    if [ -L "${target}" ] || [ -d "${target}" ]; then
        rm -rf "${target}"
    fi

    # Create symlink (includes all subdirs: references/, scripts/, etc.)
    ln -sf "${src}" "${target}" 2>/dev/null || {
        # Fallback to copy if symlink fails
        cp -r "${src}" "${target}"
        echo "      [WARN] Symlink failed, copied instead"
    }
}

echo "[1/3] Linking local skills (with references)..."
echo ""

for skill_dir in "${SKILLS_DIR}"/*/; do
    [ -d "${skill_dir}" ] || continue
    skill_name="$(basename "${skill_dir}")"
    echo "   - ${skill_name}"

    link_skill "${skill_dir}" "${GEMINI_CONFIG_SKILLS_DIR}"
    link_skill "${skill_dir}" "${ANTIGRAVITY_IDE_SKILLS_DIR}"
done

echo ""
echo "[2/3] Installing external Dart skills..."

TEMP_DART="$(mktemp -d)"
if git clone --depth 1 https://github.com/dart-lang/skills.git "${TEMP_DART}" 2>/dev/null; then
    for skill_dir in "${TEMP_DART}"/skills/*/; do
        [ -d "${skill_dir}" ] || continue
        skill_name="$(basename "${skill_dir}")"
        echo "   - ${skill_name}"

        # Copy (not symlink) since source is temp
        target1="${GEMINI_CONFIG_SKILLS_DIR}/${skill_name}"
        [ -d "${target1}" ] && rm -rf "${target1}"
        cp -r "${skill_dir}" "${target1}"

        target2="${ANTIGRAVITY_IDE_SKILLS_DIR}/${skill_name}"
        [ -d "${target2}" ] && rm -rf "${target2}"
        cp -r "${skill_dir}" "${target2}"
    done
    rm -rf "${TEMP_DART}"
    echo "   [OK] Dart skills installed."
else
    echo "   [WARN] Failed to clone dart-lang/skills."
    rm -rf "${TEMP_DART}"
fi

echo ""
echo "[3/3] Installing external Flutter skills..."

TEMP_FLUTTER="$(mktemp -d)"
if git clone --depth 1 https://github.com/flutter/skills.git "${TEMP_FLUTTER}" 2>/dev/null; then
    for skill_dir in "${TEMP_FLUTTER}"/skills/*/; do
        [ -d "${skill_dir}" ] || continue
        skill_name="$(basename "${skill_dir}")"
        echo "   - ${skill_name}"

        target1="${GEMINI_CONFIG_SKILLS_DIR}/${skill_name}"
        [ -d "${target1}" ] && rm -rf "${target1}"
        cp -r "${skill_dir}" "${target1}"

        target2="${ANTIGRAVITY_IDE_SKILLS_DIR}/${skill_name}"
        [ -d "${target2}" ] && rm -rf "${target2}"
        cp -r "${skill_dir}" "${target2}"
    done
    rm -rf "${TEMP_FLUTTER}"
    echo "   [OK] Flutter skills installed."
else
    echo "   [WARN] Failed to clone flutter/skills."
    rm -rf "${TEMP_FLUTTER}"
fi

echo ""
echo "============================================"
echo " Setup Complete!"
echo " Skills linked to:"
echo "   - ${GEMINI_CONFIG_SKILLS_DIR}"
echo "   - ${ANTIGRAVITY_IDE_SKILLS_DIR}"
echo " Note: Symlinks include references/,"
echo "       scripts/, and all subdirectories."
echo "============================================"
