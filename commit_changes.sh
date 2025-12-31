#!/bin/bash

cd /Users/indrareddy/MathWordProblems

echo "=== Git Status ==="
git status

echo ""
echo "=== Adding files ==="
git add -A

echo ""
echo "=== Files to commit ==="
git status --short

echo ""
echo "=== Committing ==="
git commit -m "Fix explanation and Next button not showing for wrong answers

Fixes:
- Added .id() modifiers to force SwiftUI to update when showFeedback, isCorrectAnswer, or explanationText changes
- Enhanced debug logging to track when feedback section and Next button render
- Added .onChange() observers to monitor state changes in ProblemView
- Improved explanation ScrollView with explicit vertical scrolling and indicators

Changes:
- ProblemView: Added .id() modifiers to feedback section and Next button to force re-rendering
- ProblemView: Added comprehensive debug logging for troubleshooting
- ProblemView: Added .onChange() observers for showFeedback, isCorrectAnswer, and explanationText
- ProblemView: Improved explanation ScrollView structure with proper vertical scrolling

This should fix the issue where explanation text and Next button were not visible after selecting a wrong answer."

echo ""
echo "=== Pushing to remote ==="
git push origin main

echo ""
echo "=== Latest commit ==="
git log --oneline -1

echo ""
echo "=== Done ==="

