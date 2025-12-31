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
git commit -m "Fix wrong answers: Show JSON explanation, fix score updates, make wrong questions scrollable

Fixes:
- Wrong answers now properly show explanation from JSON
- Score now updates correctly in real-time for each answer  
- Wrong questions screen is now fully scrollable with LazyVStack
- Each wrong question card's explanation is scrollable

Improvements:
- Enhanced explanation display with scrollable areas
- Score display uses .id() modifier and .onChange() observers
- Added comprehensive logging to verify explanation from JSON
- Made wrong questions list use LazyVStack for better performance
- Added scroll indicators to all ScrollViews"

echo ""
echo "=== Pushing to remote ==="
git push origin main

echo ""
echo "=== Latest commit ==="
git log --oneline -1

echo ""
echo "=== Done ==="

