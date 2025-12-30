#!/bin/bash

# Script to create Xcode project for Math Word Problems
# This will generate a proper .xcodeproj file

set -e

PROJECT_NAME="MathWordProblems"
PROJECT_DIR="$(pwd)"
SOURCE_DIR="$PROJECT_DIR/MathWordProblems"
RESOURCES_DIR="$SOURCE_DIR/Resources"

echo "📱 Creating Xcode project for $PROJECT_NAME..."

# Check if XcodeGen is available
if command -v xcodegen &> /dev/null; then
    echo "✅ Using XcodeGen to generate project..."
    xcodegen generate
    echo "✅ Project generated successfully!"
    echo ""
    echo "Next steps:"
    echo "1. Open $PROJECT_NAME.xcodeproj in Xcode"
    echo "2. Build and run (⌘R)"
    exit 0
fi

# If XcodeGen is not available, provide instructions
echo "⚠️  XcodeGen not found. Installing..."
echo ""

# Check if Homebrew is available
if command -v brew &> /dev/null; then
    echo "Installing XcodeGen via Homebrew..."
    brew install xcodegen
    if [ $? -eq 0 ]; then
        echo "✅ XcodeGen installed successfully!"
        echo "Generating project..."
        xcodegen generate
        echo "✅ Project generated successfully!"
        echo ""
        echo "Next steps:"
        echo "1. Open $PROJECT_NAME.xcodeproj in Xcode"
        echo "2. Build and run (⌘R)"
        exit 0
    fi
fi

# Manual setup instructions
echo "❌ Could not install XcodeGen automatically."
echo ""
echo "Please choose one of these options:"
echo ""
echo "OPTION 1: Install XcodeGen manually"
echo "  1. Install Homebrew: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
echo "  2. Install XcodeGen: brew install xcodegen"
echo "  3. Run this script again: ./CREATE_XCODE_PROJECT.sh"
echo ""
echo "OPTION 2: Create Xcode project manually"
echo "  1. Open Xcode"
echo "  2. File > New > Project"
echo "  3. Choose iOS > App"
echo "  4. Product Name: MathWordProblems"
echo "  5. Interface: SwiftUI, Language: Swift"
echo "  6. Save in this directory"
echo "  7. Add all Swift files from MathWordProblems/ folder"
echo "  8. Add JSON files from MathWordProblems/Resources/ folder"
echo "  9. Make sure 'Add to targets' is checked for all files"
echo ""
echo "See OPEN_IN_XCODE.md for detailed instructions."
