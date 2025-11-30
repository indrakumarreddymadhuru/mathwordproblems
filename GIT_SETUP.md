# Git Repository Setup Guide

## ✅ Repository Initialized

Your git repository has been successfully created and initialized!

**Repository Location:** `/Users/indrareddy/MathWordProblems/`

**Initial Commit:** Created with all project files (16 files, 1401 lines)

## Current Status

- ✅ Git repository initialized
- ✅ All files added to repository
- ✅ Initial commit created
- ✅ Branch: `main`

## View Repository Status

```bash
cd /Users/indrareddy/MathWordProblems
git status
```

## View Commit History

```bash
git log --oneline
```

## Connect to Remote Repository (GitHub/GitLab/etc.)

### Option 1: Create New GitHub Repository

1. **Create Repository on GitHub:**
   - Go to [github.com](https://github.com)
   - Click the "+" icon → "New repository"
   - Name: `MathWordProblems` (or your preferred name)
   - Description: "iOS app for practicing math word problems"
   - Choose Public or Private
   - **DO NOT** initialize with README, .gitignore, or license (we already have these)
   - Click "Create repository"

2. **Connect Local Repository to GitHub:**
   ```bash
   cd /Users/indrareddy/MathWordProblems
   git remote add origin https://github.com/YOUR_USERNAME/MathWordProblems.git
   git branch -M main
   git push -u origin main
   ```
   
   Replace `YOUR_USERNAME` with your GitHub username.

### Option 2: Using SSH (Recommended)

If you have SSH keys set up with GitHub:

```bash
cd /Users/indrareddy/MathWordProblems
git remote add origin git@github.com:YOUR_USERNAME/MathWordProblems.git
git branch -M main
git push -u origin main
```

### Option 3: Create Repository via GitHub CLI

If you have GitHub CLI installed:

```bash
cd /Users/indrareddy/MathWordProblems
gh repo create MathWordProblems --public --source=. --remote=origin --push
```

## Useful Git Commands

### View Changes
```bash
git status          # See what files have changed
git diff            # See detailed changes
git log --oneline   # View commit history
```

### Make Changes and Commit
```bash
git add .                           # Stage all changes
git add specific_file.swift         # Stage specific file
git commit -m "Your commit message" # Commit changes
git push                            # Push to remote
```

### Branch Management
```bash
git branch                          # List branches
git branch feature-name             # Create new branch
git checkout feature-name           # Switch to branch
git checkout -b feature-name        # Create and switch to branch
git merge feature-name              # Merge branch into current
```

### Update from Remote
```bash
git fetch origin    # Fetch changes from remote
git pull            # Fetch and merge changes
```

## Best Practices

1. **Commit Often:** Make small, logical commits
2. **Write Good Commit Messages:** Be descriptive about what changed
3. **Use Branches:** Create branches for features or fixes
4. **Don't Commit:**
   - Xcode user data (`xcuserdata/`)
   - Build artifacts (`build/`, `DerivedData/`)
   - Personal configuration files

5. **Before Committing:**
   - Test your changes
   - Review what you're committing (`git status`, `git diff`)
   - Write a clear commit message

## Recommended .gitignore

The project already includes a comprehensive `.gitignore` file that excludes:
- Xcode user data
- Build artifacts
- Derived data
- macOS system files
- Xcode project files (if using XcodeGen)

## Next Steps

1. **Connect to Remote:** Follow steps above to connect to GitHub/GitLab
2. **Add Remote:** Set up remote repository URL
3. **Push:** Upload your code to the remote repository
4. **Collaborate:** Share repository URL with team members (if applicable)

## Troubleshooting

### If you need to change remote URL:
```bash
git remote set-url origin NEW_URL
```

### If you need to remove remote:
```bash
git remote remove origin
```

### If you forgot to add a file:
```bash
git add forgotten_file.swift
git commit --amend --no-edit  # Add to last commit without changing message
```

### If you need to undo last commit (but keep changes):
```bash
git reset --soft HEAD~1
```

---

**Repository is ready! 🎉**

