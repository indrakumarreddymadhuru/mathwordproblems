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
git commit -m "Fix wrong answer auto-advance issue and onChange deprecation warning

Fixes:
- Fixed wrong answers showing briefly then auto-advancing to next question
- Fixed iOS 17+ onChange deprecation warning by using zero-parameter closure syntax
- Added aggressive cancellation of auto-advance work items to prevent race conditions
- Added multiple safety checks and delayed verification to prevent false auto-advance

Changes:
- GameViewModel: Cancel auto-advance work items FIRST before any state changes
- GameViewModel: Added multiple guard checks in work item to prevent false triggers
- GameViewModel: Added delayed safety check (0.1s) to catch race conditions
- GameViewModel: Improved state management to ensure isCorrectAnswer is false for wrong answers
- ProblemView: Updated onChange modifiers to use iOS 17+ zero-parameter closure syntax
- ProblemView: Enhanced logging in onChange handlers for better debugging

This ensures wrong answers stay visible with explanation until user clicks Next button."

echo ""
echo "=== Pushing to remote ==="
git push origin main

echo ""
echo "=== Latest commit ==="
git log --oneline -1

echo ""
echo "=== Done ==="

