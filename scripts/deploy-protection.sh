#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
#                    INFRATALES PROTECTION DEPLOYMENT SCRIPT
# ═══════════════════════════════════════════════════════════════════════════
#
# Deploys all protection files (LICENSE, NOTICE, signatures) to all InfraTales
# repositories. Run from the projects directory.
#
# @author      Rahul Ladumor <rahul.ladumor@infratales.com>
# @copyright   2024-2025 InfraTales
# ═══════════════════════════════════════════════════════════════════════════

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="$SCRIPT_DIR/../templates"
PROJECTS_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║           INFRATALES PROTECTION DEPLOYMENT                                ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "Templates: $TEMPLATES_DIR"
echo "Projects:  $PROJECTS_DIR"
echo ""

# Counter
deployed=0
failed=0

# Loop through all project directories
for project_path in "$PROJECTS_DIR"/*/; do
    project_name=$(basename "$project_path")
    
    # Skip .github folder
    if [ "$project_name" = ".github" ]; then
        continue
    fi
    
    # Skip if not a git repository
    if [ ! -d "$project_path/.git" ]; then
        echo "⏭️  Skipping $project_name (not a git repo)"
        continue
    fi
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📦 Processing: $project_name"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Generate project-specific hash
    project_hash=$(echo -n "$project_name-infratales-2024" | shasum -a 256 | cut -c1-16)
    
    # 1. Copy and customize LICENSE
    echo "  📄 Adding InfraTales License..."
    sed "s/{PROJECT_NAME}/$project_name/g" "$TEMPLATES_DIR/INFRATALES-LICENSE" > "$project_path/LICENSE"
    
    # 2. Copy and customize NOTICE
    echo "  📜 Adding NOTICE file..."
    sed -e "s/{PROJECT_NAME}/$project_name/g" \
        -e "s/{PROJECT_HASH}/$project_hash/g" \
        "$TEMPLATES_DIR/NOTICE" > "$project_path/NOTICE"
    
    # 3. Add signature module based on project type
    if [ -f "$project_path/package.json" ] || [ -f "$project_path/tsconfig.json" ]; then
        echo "  🔐 Adding TypeScript signature module..."
        mkdir -p "$project_path/src/infratales"
        cp "$TEMPLATES_DIR/infratales-signature.ts" "$project_path/src/infratales/signature.ts"
    fi
    
    if [ -f "$project_path/requirements.txt" ] || [ -f "$project_path/setup.py" ] || [ -f "$project_path/pyproject.toml" ]; then
        echo "  🐍 Adding Python signature module..."
        mkdir -p "$project_path/infratales"
        cp "$TEMPLATES_DIR/infratales_signature.py" "$project_path/infratales/signature.py"
        touch "$project_path/infratales/__init__.py"
    fi
    
    # 4. Git operations
    cd "$project_path"
    git add -A
    
    if git diff --cached --quiet; then
        echo "  ℹ️  No changes to commit"
    else
        git commit -m "security: add InfraTales brand protection and licensing

- Add InfraTales Open Source License with attribution requirements
- Add NOTICE file with legal protections and ownership proof
- Add signature module with embedded watermarks
- Add verification hash: $project_hash

This commit establishes legal protection for InfraTales intellectual property.
Removal of these files violates the license terms.

Signed-off-by: Rahul Ladumor <rahul.ladumor@infratales.com>"
        
        if git push origin main 2>/dev/null || git push origin master 2>/dev/null; then
            echo "  ✅ Successfully deployed protection to $project_name"
            ((deployed++))
        else
            echo "  ❌ Failed to push $project_name"
            ((failed++))
        fi
    fi
    
    cd "$PROJECTS_DIR"
    echo ""
done

echo "═══════════════════════════════════════════════════════════════════════════"
echo "                         DEPLOYMENT COMPLETE"
echo "═══════════════════════════════════════════════════════════════════════════"
echo ""
echo "  ✅ Successfully deployed: $deployed projects"
echo "  ❌ Failed: $failed projects"
echo ""
echo "═══════════════════════════════════════════════════════════════════════════"
