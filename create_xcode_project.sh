#!/bin/bash

# Script to create Xcode project for Math Word Problems app
# Run this script to set up the Xcode project

PROJECT_NAME="MathWordProblems"
WORKSPACE_DIR="$(pwd)"

echo "📱 Creating Xcode project for $PROJECT_NAME..."

# Create Xcode project using command line
xcodebuild -project "$PROJECT_NAME.xcodeproj" -list 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Creating new Xcode project..."
    
    # Use xcodegen if available, otherwise provide manual instructions
    if command -v xcodegen &> /dev/null; then
        echo "Using xcodegen to create project..."
    else
        echo "⚠️  xcodegen not found. Creating project manually..."
        echo ""
        echo "Please follow these steps:"
        echo "1. Open Xcode"
        echo "2. Select 'Create a new Xcode project'"
        echo "3. Choose 'iOS' > 'App'"
        echo "4. Set Product Name: MathWordProblems"
        echo "5. Set Interface: SwiftUI"
        echo "6. Set Language: Swift"
        echo "7. Save the project in this directory"
        echo "8. Delete the default ContentView.swift file"
        echo "9. Add all Swift files from MathWordProblems/ directory"
        echo "10. Add all JSON files from MathWordProblems/Resources/ directory"
        echo ""
    fi
fi

echo "✅ Project setup instructions complete!"
echo ""
echo "Next steps:"
echo "1. Open the project in Xcode"
echo "2. Make sure all Swift files are added to the target"
echo "3. Make sure all JSON files are added to the bundle"
echo "4. Set your Bundle Identifier (e.g., com.yourname.MathWordProblems)"
echo "5. Configure signing & capabilities for App Store deployment"

