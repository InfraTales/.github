#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════
#                    INFRATALES GPG SIGNING SETUP
# ═══════════════════════════════════════════════════════════════════════════
#
# This script helps you set up GPG signing for InfraTales repositories.
# GPG signing proves that commits and releases are authentically from you.
#
# @author      Rahul Ladumor <rahul.ladumor@infratales.com>
# ═══════════════════════════════════════════════════════════════════════════

echo "╔═══════════════════════════════════════════════════════════════════════════╗"
echo "║                    INFRATALES GPG SIGNING SETUP                           ║"
echo "╚═══════════════════════════════════════════════════════════════════════════╝"
echo ""

# Check if GPG is installed
if ! command -v gpg &> /dev/null; then
    echo "❌ GPG is not installed. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install gnupg
    else
        sudo apt-get install gnupg
    fi
fi

echo "✅ GPG is installed: $(gpg --version | head -1)"
echo ""

# Check for existing keys
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Checking for existing GPG keys..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

existing_keys=$(gpg --list-secret-keys --keyid-format=long 2>/dev/null | grep -c "sec")

if [ "$existing_keys" -gt 0 ]; then
    echo "Found existing GPG keys:"
    gpg --list-secret-keys --keyid-format=long
    echo ""
    echo "Do you want to use an existing key or create a new one?"
    echo "1) Use existing key"
    echo "2) Create new key for InfraTales"
    read -p "Choice [1/2]: " choice
else
    choice="2"
fi

if [ "$choice" = "2" ]; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Creating new GPG key for InfraTales..."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "Please enter the following information:"
    echo ""
    
    # Generate key with specific parameters
    cat > /tmp/gpg-key-config <<EOF
%echo Generating InfraTales GPG key
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: Rahul Ladumor
Name-Comment: InfraTales
Name-Email: rahul.ladumor@infratales.com
Expire-Date: 0
%commit
%echo Done
EOF

    echo "Generating 4096-bit RSA key..."
    echo "You will be prompted to set a passphrase."
    echo ""
    
    gpg --batch --generate-key /tmp/gpg-key-config
    rm /tmp/gpg-key-config
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Your GPG keys:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
gpg --list-secret-keys --keyid-format=long

# Get the key ID
KEY_ID=$(gpg --list-secret-keys --keyid-format=long | grep sec | head -1 | awk '{print $2}' | cut -d'/' -f2)

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Configuring Git to use GPG signing..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

git config --global user.signingkey "$KEY_ID"
git config --global commit.gpgsign true
git config --global tag.gpgsign true

echo "✅ Git configured to sign all commits and tags"
echo ""

# Export public key
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Exporting public key..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

gpg --armor --export "$KEY_ID" > ~/infratales-gpg-public-key.asc

echo "✅ Public key exported to: ~/infratales-gpg-public-key.asc"
echo ""

# Show key for GitHub
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "PUBLIC KEY (Add this to GitHub):"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
gpg --armor --export "$KEY_ID"

echo ""
echo "═══════════════════════════════════════════════════════════════════════════"
echo "                         NEXT STEPS"
echo "═══════════════════════════════════════════════════════════════════════════"
echo ""
echo "1. Copy the public key above"
echo ""
echo "2. Add to GitHub:"
echo "   → Go to: https://github.com/settings/keys"
echo "   → Click 'New GPG key'"
echo "   → Paste the public key"
echo "   → Click 'Add GPG key'"
echo ""
echo "3. Add to your InfraTales profile README:"
echo "   → Key ID: $KEY_ID"
echo "   → Fingerprint: $(gpg --fingerprint "$KEY_ID" | grep -A1 "pub" | tail -1 | tr -d ' ')"
echo ""
echo "4. All future commits will show 'Verified' badge on GitHub!"
echo ""
echo "═══════════════════════════════════════════════════════════════════════════"
