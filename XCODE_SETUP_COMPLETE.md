# Complete Xcode Setup Guide - Step by Step

This guide will help you create a working Xcode project from scratch.

## Prerequisites

- ✅ Mac with macOS
- ✅ Xcode installed (download from Mac App Store)
- ✅ This repository cloned locally

---

## Step-by-Step: Create Xcode Project

### Step 1: Open Xcode

1. Launch **Xcode** from Applications or Spotlight

### Step 2: Create New Project

1. In Xcode welcome screen, click **"Create a new Xcode project"**
   - OR go to **File** > **New** > **Project**

2. **Select Template:**
   - Choose **iOS** at the top
   - Select **App**
   - Click **Next**

3. **Configure Project:**
   - **Product Name:** `MathWordProblems`
   - **Team:** Select your team (or "None" for simulator testing)
   - **Organization Identifier:** `com.yourname` (e.g., `com.indrakumarreddymadhuru`)
   - **Bundle Identifier:** Will auto-fill as `com.yourname.MathWordProblems`
   - **Interface:** `SwiftUI` ⚠️ **IMPORTANT: Must be SwiftUI**
   - **Language:** `Swift` ⚠️ **IMPORTANT: Must be Swift**
   - **Storage:** Choose **None** (we use JSON files)
   - **Include Tests:** Optional (you can uncheck)
   - Click **Next**

4. **Save Location:**
   - Navigate to your cloned repository folder: `/Users/indrareddy/MathWordProblems/`
   - **IMPORTANT:** Save it INSIDE the repository folder
   - Uncheck **"Create Git repository"** (we already have one)
   - Click **Create**

### Step 3: Remove Default Files

1. In Project Navigator (left sidebar), you'll see:
   - `MathWordProblems` folder (blue icon)
   - `MathWordProblemsApp.swift` (default)
   - `ContentView.swift` (default)
   - `Assets.xcassets`
   - `Preview Content`

2. **Delete default files:**
   - Right-click `ContentView.swift` → **Delete** → **Move to Trash**
   - Right-click the default `MathWordProblemsApp.swift` → **Delete** → **Move to Trash**

### Step 4: Add All Swift Source Files

1. **Right-click** on the `MathWordProblems` folder (blue icon) in Project Navigator
2. Select **"Add Files to MathWordProblems..."**
3. Navigate to: `MathWordProblems/MathWordProblems/` folder
4. **Select ALL these Swift files:**
   - ✅ `MathWordProblemsApp.swift`
   - ✅ `DifficultySelectionView.swift`
   - ✅ `ProblemView.swift`
   - ✅ `GameViewModel.swift`
   - ✅ `Models.swift`
   - ✅ `JSONLoader.swift`
   - ✅ `ProgressTracker.swift`
   - ✅ `ProgressView.swift`

5. **IMPORTANT - Check these options:**
   - ✅ **"Copy items if needed"** (if files aren't in project directory)
   - ✅ **"Create groups"** (NOT "Create folder references")
   - ✅ **"Add to targets: MathWordProblems"** (MUST be checked!)

6. Click **Add**

### Step 5: Add JSON Resource Files

1. **Right-click** on the `MathWordProblems` folder in Project Navigator
2. Select **"Add Files to MathWordProblems..."**
3. Navigate to: `MathWordProblems/MathWordProblems/Resources/` folder
4. **Select ALL three JSON files:**
   - ✅ `easyProblems.json`
   - ✅ `mediumProblems.json`
   - ✅ `hardProblems.json`

5. **IMPORTANT - Check these options:**
   - ✅ **"Copy items if needed"**
   - ✅ **"Create groups"**
   - ✅ **"Add to targets: MathWordProblems"** ⚠️ **CRITICAL - Must be checked!**

6. Click **Add**

### Step 6: Verify File Structure

Your Project Navigator should look like this:

```
MathWordProblems (project)
├── MathWordProblems (target)
│   ├── MathWordProblemsApp.swift ✅
│   ├── DifficultySelectionView.swift ✅
│   ├── ProblemView.swift ✅
│   ├── GameViewModel.swift ✅
│   ├── Models.swift ✅
│   ├── JSONLoader.swift ✅
│   ├── ProgressTracker.swift ✅
│   ├── ProgressView.swift ✅
│   ├── easyProblems.json ✅
│   ├── mediumProblems.json ✅
│   ├── hardProblems.json ✅
│   ├── Assets.xcassets
│   └── Preview Content
```

### Step 7: Configure Project Settings

1. **Click the blue project icon** (MathWordProblems) at the top of Project Navigator

2. **Select "MathWordProblems" target** (under TARGETS, not PROJECT)

3. **General Tab:**
   - **Display Name:** `Math Word Problems`
   - **Bundle Identifier:** `com.yourname.MathWordProblems` (change if needed)
   - **Version:** `1.0`
   - **Build:** `1`
   - **Deployment Target:** `15.0` (or higher)

4. **Signing & Capabilities Tab:**
   - Check **"Automatically manage signing"**
   - Select your **Team** (or leave as "None" for simulator only)

5. **Build Settings Tab:**
   - Search for **"Swift Language Version"**
   - Set to **Swift 5** (or latest)

### Step 8: Verify Target Membership

**For EACH Swift file:**
1. Select the file in Project Navigator
2. Open **File Inspector** (right sidebar, or press `⌥⌘1`)
3. Under **Target Membership**, verify **MathWordProblems** is checked ✅

**For EACH JSON file:**
1. Select the JSON file
2. Open **File Inspector**
3. Under **Target Membership**, verify **MathWordProblems** is checked ✅
4. Under **File Type**, it should say **"Default - JSON"**

### Step 9: Build the Project

1. **Select a Simulator:**
   - At the top of Xcode, click the device selector
   - Choose **iPhone 15** or **iPhone 15 Pro**

2. **Build:**
   - Press **⌘ + B** (Command + B)
   - Wait for build to complete
   - Check **Issue Navigator** (⚠️ icon) for any errors

3. **Fix any errors:**
   - If you see "Cannot find 'Difficulty' in scope": Check that `Models.swift` is in target
   - If you see JSON loading errors: Verify JSON files are in target membership

### Step 10: Run the App

1. Press **⌘ + R** (Command + R)
2. The simulator will launch
3. Your app should open! 🎉

---

## Troubleshooting

### Error: "Cannot find 'Difficulty' in scope"
**Solution:**
- Select `Models.swift` in Project Navigator
- File Inspector (⌥⌘1) → Target Membership → Check MathWordProblems ✅

### Error: JSON files not loading / "Could not find easyProblems.json"
**Solution:**
- Select each JSON file
- File Inspector → Target Membership → Check MathWordProblems ✅
- Clean build: **Product** > **Clean Build Folder** (⌘⇧K)
- Build again

### Error: "No such module 'SwiftUI'"
**Solution:**
- Make sure you selected **SwiftUI** interface when creating project
- Check iOS Deployment Target is 15.0 or higher

### Error: Preview doesn't work
**Solution:**
- Enable Canvas: **Editor** > **Canvas** (⌥⌘↩)
- See `PREVIEW_GUIDE.md` for help

### Build fails with multiple errors
**Solution:**
1. Clean: **Product** > **Clean Build Folder** (⌘⇧K)
2. Delete Derived Data:
   - **Xcode** > **Settings** > **Locations**
   - Click arrow next to Derived Data
   - Delete folder for your project
3. Restart Xcode
4. Build again

---

## Quick Verification Checklist

Before running, verify:

- [ ] All 8 Swift files are in Project Navigator
- [ ] All 3 JSON files are in Project Navigator
- [ ] All files show "MathWordProblems" in Target Membership
- [ ] Bundle Identifier is set
- [ ] Deployment Target is 15.0+
- [ ] Swift Language Version is set
- [ ] Project builds without errors (⌘B)
- [ ] Simulator is selected

---

## Project Structure (What You Should See)

```
MathWordProblems.xcodeproj
└── MathWordProblems/
    ├── MathWordProblemsApp.swift          # App entry point
    ├── DifficultySelectionView.swift      # Home screen
    ├── ProblemView.swift                  # Problem solving view
    ├── GameViewModel.swift                # Game logic
    ├── Models.swift                       # Data models
    ├── JSONLoader.swift                   # JSON loader
    ├── ProgressTracker.swift              # Progress tracking
    ├── ProgressView.swift                 # Progress screen
    ├── easyProblems.json                  # Easy problems
    ├── mediumProblems.json                # Medium problems
    ├── hardProblems.json                  # Hard problems
    ├── Assets.xcassets                    # App assets
    └── Info.plist                         # App info (auto-generated)
```

---

## After Successful Setup

Once the app runs:

1. ✅ Test all difficulty levels (Easy, Medium, Hard)
2. ✅ Check progress tracking works
3. ✅ View "My Progress" screen
4. ✅ Test navigation between problems
5. ✅ Verify JSON problems load correctly

---

## Need More Help?

- **Preview Issues:** See `PREVIEW_GUIDE.md`
- **Testing Help:** See `TESTING_IN_XCODE.md`
- **Deployment:** See `APP_STORE_DEPLOYMENT.md`
- **Git Setup:** See `GIT_SETUP.md`

---

**Your project is now ready to run in Xcode! 🚀**

