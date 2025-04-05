#!/bin/bash

# Setup script for security monitoring project

echo "Setting up security monitoring project..."

# Install pre-commit hook
echo "Installing pre-commit hook..."
cp scripts/pre-commit .git/hooks/
chmod +x .git/hooks/pre-commit
echo "Pre-commit hook installed."

echo "Setup complete!"