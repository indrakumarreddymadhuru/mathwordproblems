#!/bin/bash

# Script to verify Xcode project setup

echo "🔍 Verifying Math Word Problems Project Setup..."
echo ""

PROJECT_DIR="MathWordProblems"
SOURCE_DIR="$PROJECT_DIR/MathWordProblems"
RESOURCES_DIR="$SOURCE_DIR/Resources"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ Error: $SOURCE_DIR directory not found!"
    exit 1
fi

echo "✅ Source directory found: $SOURCE_DIR"
echo ""

# Check for required Swift files
echo "📄 Checking Swift source files..."
REQUIRED_SWIFT_FILES=(
    "MathWordProblemsApp.swift"
    "DifficultySelectionView.swift"
    "ProblemView.swift"
    "GameViewModel.swift"
    "Models.swift"
    "JSONLoader.swift"
    "ProgressTracker.swift"
    "ProgressView.swift"
)

MISSING_FILES=0
for file in "${REQUIRED_SWIFT_FILES[@]}"; do
    if [ -f "$SOURCE_DIR/$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file - MISSING!"
        MISSING_FILES=$((MISSING_FILES + 1))
    fi
done

echo ""

# Check for JSON files
echo "📦 Checking JSON resource files..."
REQUIRED_JSON_FILES=(
    "easyProblems.json"
    "mediumProblems.json"
    "hardProblems.json"
)

for file in "${REQUIRED_JSON_FILES[@]}"; do
    if [ -f "$RESOURCES_DIR/$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file - MISSING!"
        MISSING_FILES=$((MISSING_FILES + 1))
    fi
done

echo ""

# Check for Xcode project
if [ -d "MathWordProblems.xcodeproj" ]; then
    echo "✅ Xcode project found: MathWordProblems.xcodeproj"
    echo ""
    echo "🎉 Project is ready! Open MathWordProblems.xcodeproj in Xcode"
else
    echo "⚠️  Xcode project not found (.xcodeproj file)"
    echo ""
    echo "📖 To create Xcode project:"
    echo "   1. Follow instructions in XCODE_SETUP_COMPLETE.md"
    echo "   2. Or install XcodeGen: brew install xcodegen"
    echo "   3. Then run: xcodegen generate"
fi

echo ""

if [ $MISSING_FILES -eq 0 ]; then
    echo "✅ All required files are present!"
    exit 0
else
    echo "❌ Missing $MISSING_FILES required file(s)"
    exit 1
fi

