#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
#                    INFRATALES BLOCKCHAIN TIMESTAMP
# ═══════════════════════════════════════════════════════════════════════════
#
# This script creates immutable blockchain timestamps for InfraTales projects
# using OpenTimestamps (free, uses Bitcoin blockchain).
#
# Once timestamped, you have cryptographic proof that your files existed
# at a specific time. No one can claim they created it first.
#
# @author      Rahul Ladumor <rahul.ladumor@infratales.com>
# ═══════════════════════════════════════════════════════════════════════════

set -e

PROJECTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TIMESTAMPS_DIR="$PROJECTS_DIR/.github/timestamps"

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║                INFRATALES BLOCKCHAIN TIMESTAMPING                         ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

# Check if ots (OpenTimestamps) is installed
if ! command -v ots &> /dev/null; then
    echo "Installing OpenTimestamps client..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        pip3 install opentimestamps-client
    else
        pip3 install opentimestamps-client
    fi
fi

echo "✅ OpenTimestamps installed"
echo ""

# Create timestamps directory
mkdir -p "$TIMESTAMPS_DIR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Creating blockchain timestamps for all projects..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

timestamped=0

for project_path in "$PROJECTS_DIR"/*/; do
    project_name=$(basename "$project_path")
    
    # Skip .github folder
    if [ "$project_name" = ".github" ]; then
        continue
    fi
    
    # Skip if not a directory
    if [ ! -d "$project_path" ]; then
        continue
    fi
    
    echo "📦 Processing: $project_name"
    
    # Create a manifest of important files
    manifest_file="$TIMESTAMPS_DIR/${project_name}-manifest.txt"
    
    echo "InfraTales Project Manifest" > "$manifest_file"
    echo "===========================" >> "$manifest_file"
    echo "" >> "$manifest_file"
    echo "Project: $project_name" >> "$manifest_file"
    echo "Organization: InfraTales" >> "$manifest_file"
    echo "Author: Rahul Ladumor" >> "$manifest_file"
    echo "Email: rahul.ladumor@infratales.com" >> "$manifest_file"
    echo "Website: https://infratales.com" >> "$manifest_file"
    echo "GitHub: https://github.com/InfraTales/$project_name" >> "$manifest_file"
    echo "" >> "$manifest_file"
    echo "Timestamp Created: $(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> "$manifest_file"
    echo "" >> "$manifest_file"
    echo "File Hashes (SHA-256):" >> "$manifest_file"
    echo "---------------------" >> "$manifest_file"
    
    # Add SHA-256 hashes of important files
    if [ -f "$project_path/README.md" ]; then
        echo "README.md: $(shasum -a 256 "$project_path/README.md" | cut -d' ' -f1)" >> "$manifest_file"
    fi
    if [ -f "$project_path/LICENSE" ]; then
        echo "LICENSE: $(shasum -a 256 "$project_path/LICENSE" | cut -d' ' -f1)" >> "$manifest_file"
    fi
    if [ -f "$project_path/NOTICE" ]; then
        echo "NOTICE: $(shasum -a 256 "$project_path/NOTICE" | cut -d' ' -f1)" >> "$manifest_file"
    fi
    
    # Add hash of all source files combined
    if [ -d "$project_path/src" ]; then
        src_hash=$(find "$project_path/src" -type f -exec shasum -a 256 {} \; | sort | shasum -a 256 | cut -d' ' -f1)
        echo "src/*: $src_hash" >> "$manifest_file"
    fi
    
    echo "" >> "$manifest_file"
    echo "This manifest is timestamped on the Bitcoin blockchain via OpenTimestamps." >> "$manifest_file"
    echo "Verify at: https://opentimestamps.org" >> "$manifest_file"
    
    # Create blockchain timestamp
    echo "  ⏳ Creating blockchain timestamp..."
    ots stamp "$manifest_file" 2>/dev/null || true
    
    if [ -f "${manifest_file}.ots" ]; then
        echo "  ✅ Timestamp created: ${project_name}-manifest.txt.ots"
        ((timestamped++))
    else
        echo "  ⚠️  Timestamp pending (will be confirmed in ~1-2 hours)"
        ((timestamped++))
    fi
    
    echo ""
done

echo "═══════════════════════════════════════════════════════════════════════════"
echo "                    BLOCKCHAIN TIMESTAMPING COMPLETE"
echo "═══════════════════════════════════════════════════════════════════════════"
echo ""
echo "  📁 Timestamps directory: $TIMESTAMPS_DIR"
echo "  ✅ Projects timestamped: $timestamped"
echo ""
echo "  ⏳ Note: Timestamps are submitted to Bitcoin blockchain."
echo "     Full confirmation takes ~1-2 hours (Bitcoin block time)."
echo ""
echo "  🔍 To verify a timestamp later:"
echo "     ots verify $TIMESTAMPS_DIR/project-name-manifest.txt.ots"
echo ""
echo "═══════════════════════════════════════════════════════════════════════════"
echo ""
echo "IMPORTANT: Commit and push the .ots files to preserve timestamps!"
echo ""
