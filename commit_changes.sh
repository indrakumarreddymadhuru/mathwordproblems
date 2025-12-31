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
git commit -m "Fix scrolling in WrongQuestionsView and remove popup - use NavigationLink

Fixes:
- Fixed scrolling in WrongQuestionsView by using LazyVStack inside ScrollView
- Changed wrong questions from popup (.sheet) to NavigationLink for push navigation
- Added scroll indicators and proper frame constraints for smooth scrolling
- Wrapped MyProgressView in NavigationView when presented as sheet

Changes:
- WrongQuestionsView: Added LazyVStack, explicit ScrollView(.vertical), frame constraints
- ProgressView: Changed Button to NavigationLink for wrong questions
- DifficultySelectionView: Wrapped MyProgressView in NavigationView for NavigationLink support"

echo ""
echo "=== Pushing to remote ==="
git push origin main

echo ""
echo "=== Latest commit ==="
git log --oneline -1

echo ""
echo "=== Done ==="

