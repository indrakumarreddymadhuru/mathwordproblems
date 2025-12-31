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
git commit -m "Fix scrolling in WrongQuestionsView - restructure to use ScrollView as main container

Fixes:
- Restructured WrongQuestionsView to make ScrollView the main container instead of inside ZStack
- Moved gradient background to .background() modifier to avoid layout conflicts
- Removed ZStack that was interfering with scroll calculations
- ScrollView now properly calculates scrollable content area

Changes:
- WrongQuestionsView: ScrollView is now top-level, gradient applied via .background()
- This ensures proper scrolling behavior when content exceeds screen height"

echo ""
echo "=== Pushing to remote ==="
git push origin main

echo ""
echo "=== Latest commit ==="
git log --oneline -1

echo ""
echo "=== Done ==="

