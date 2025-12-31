#!/usr/bin/env python3
import subprocess
import os
import sys

os.chdir('/Users/indrareddy/MathWordProblems')

print("Current directory:", os.getcwd())
print("\n=== Git Status ===")
result = subprocess.run(['git', 'status'], capture_output=True, text=True)
print(result.stdout)
if result.stderr:
    print("STDERR:", result.stderr)

print("\n=== Adding files ===")
result = subprocess.run(['git', 'add', '-A'], capture_output=True, text=True)
print("Exit code:", result.returncode)
if result.stdout:
    print("STDOUT:", result.stdout)
if result.stderr:
    print("STDERR:", result.stderr)

print("\n=== Files staged ===")
result = subprocess.run(['git', 'diff', '--cached', '--name-only'], capture_output=True, text=True)
print(result.stdout)

print("\n=== Committing ===")
commit_msg = """Fix wrong answers: Show JSON explanation, fix score updates, make wrong questions scrollable

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
- Added scroll indicators to all ScrollViews"""

result = subprocess.run(['git', 'commit', '-m', commit_msg], capture_output=True, text=True)
print("Exit code:", result.returncode)
if result.stdout:
    print("STDOUT:", result.stdout)
if result.stderr:
    print("STDERR:", result.stderr)

print("\n=== Latest commit ===")
result = subprocess.run(['git', 'log', '--oneline', '-1'], capture_output=True, text=True)
print(result.stdout)

print("\n=== Pushing to remote ===")
result = subprocess.run(['git', 'push', 'origin', 'main'], capture_output=True, text=True)
print("Exit code:", result.returncode)
if result.stdout:
    print("STDOUT:", result.stdout)
if result.stderr:
    print("STDERR:", result.stderr)

print("\n=== Done ===")

