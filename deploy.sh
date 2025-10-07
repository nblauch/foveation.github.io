#!/bin/bash

# Script to deploy documentation to GitHub Pages
# This script copies docs from the main repository and triggers deployment

set -e

echo "🚀 Deploying Foveation Documentation to GitHub Pages"

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_DIR="$SCRIPT_DIR"

# Check if we're in the right directory
if [ ! -f "$DOCS_DIR/conf.py" ]; then
    echo "❌ Error: conf.py not found. Are you in the docs directory?"
    exit 1
fi

# Copy documentation from main repository
echo "📁 Copying documentation from main repository..."
if [ -f "$DOCS_DIR/copy_from_repo.sh" ]; then
    bash "$DOCS_DIR/copy_from_repo.sh"
    echo "✅ Documentation copied successfully"
else
    echo "⚠️  Warning: copy_from_repo.sh not found. Using current docs."
fi

# Check if we're in a git repository
if [ ! -d "$DOCS_DIR/.git" ]; then
    echo "❌ Error: Not in a git repository. Please initialize git first."
    exit 1
fi

# Check git status
echo "📊 Checking git status..."
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 Changes detected. Committing and pushing..."
    
    # Add all changes
    git add .
    
    # Commit with timestamp
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "Update documentation - $TIMESTAMP"
    
    # Push to trigger GitHub Pages deployment
    echo "🚀 Pushing to GitHub to trigger deployment..."
    git push origin main || git push origin master
    
    echo "✅ Documentation deployment triggered!"
    echo "🌐 Your documentation will be available at:"
    echo "   https://your-username.github.io/foveation_docs/"
    echo ""
    echo "⏳ Deployment usually takes 2-5 minutes to complete."
    echo "📊 Check the Actions tab in your GitHub repository for deployment status."
    
else
    echo "ℹ️  No changes detected. Nothing to deploy."
fi

echo ""
echo "🎉 Deployment process complete!"
