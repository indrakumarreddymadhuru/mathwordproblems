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
git commit -m "Add Assets.xcassets structure for app icons and fix build error

Fixes:
- Fixed build error: Closure captures 'workItem' before it is declared
- Removed work item comparison check that was causing compilation error
- Simplified auto-advance work item validation

Additions:
- Created Assets.xcassets structure with AppIcon.appiconset
- Added Contents.json files for asset catalog
- Added README.md with instructions for adding app icons
- Updated project.yml to include Assets.xcassets in resources

Changes:
- GameViewModel: Removed workItem reference in closure to fix build error
- GameViewModel: Simplified work item validation (state checks are sufficient)
- project.yml: Added Assets.xcassets to resources section

The Assets.xcassets structure is now ready for app icon addition. Users can drag a 1024x1024 PNG image to the AppIcon set in Xcode."

echo ""
echo "=== Pushing to remote ==="
git push origin main

echo ""
echo "=== Latest commit ==="
git log --oneline -1

echo ""
echo "=== Done ==="

