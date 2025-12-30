# How to Open Math Word Problems in Xcode

This guide will help you clone the repository from GitHub and open it in Xcode.

## Prerequisites

- ✅ Mac with macOS installed
- ✅ Xcode installed (download from [Mac App Store](https://apps.apple.com/app/xcode/id497799835) or [developer.apple.com/xcode](https://developer.apple.com/xcode))
- ✅ Git installed (comes with Xcode, or install from [git-scm.com](https://git-scm.com))

---

## Method 1: Clone and Open in Xcode (Recommended)

### Step 1: Clone the Repository

Open **Terminal** on your Mac and run:

```bash
cd ~/Desktop  # or any location you prefer
git clone git@github.com:indrakumarreddymadhuru/mathwordproblems.git
cd mathwordproblems
```

**Alternative (if SSH doesn't work):**
```bash
git clone https://github.com/indrakumarreddymadhuru/mathwordproblems.git
cd mathwordproblems
```

### Step 2: Open in Xcode

**Option A: From Terminal**
```bash
open MathWordProblems.xcodeproj
```

**Option B: From Finder**
1. Navigate to the `mathwordproblems` folder
2. Double-click `MathWordProblems.xcodeproj` (if it exists)
3. Or open Xcode and go to **File** > **Open** and select the project folder

**Option C: Create Xcode Project (if .xcodeproj doesn't exist)**

If you don't see an `.xcodeproj` file, you need to create one:

1. **Open Xcode**
2. **File** > **New** > **Project**
3. Choose **iOS** > **App**
4. Configure:
   - **Product Name:** `MathWordProblems`
   - **Team:** Select your team (or "None" for now)
   - **Organization Identifier:** `com.yourname` (or `com.yourcompany`)
   - **Interface:** `SwiftUI`
   - **Language:** `Swift`
   - **Storage:** None
5. **Save location:** Choose the `mathwordproblems` folder (or save elsewhere and move files)
6. Click **Create**

### Step 3: Add Files to Xcode Project

If you created a new project, you need to add the source files:

1. **Delete default files:**
   - Delete `ContentView.swift` (if it exists)
   - Delete the default `MathWordProblemsApp.swift` content

2. **Add Swift files:**
   - Right-click on the `MathWordProblems` folder in Project Navigator
   - Select **"Add Files to MathWordProblems..."**
   - Navigate to `MathWordProblems/MathWordProblems/` folder
   - Select all `.swift` files:
     - `MathWordProblemsApp.swift`
     - `DifficultySelectionView.swift`
     - `ProblemView.swift`
     - `GameViewModel.swift`
     - `Models.swift`
     - `JSONLoader.swift`
     - `ProgressTracker.swift`
     - `ProgressView.swift`
   - ✅ Check **"Copy items if needed"**
   - ✅ Check **"Add to targets: MathWordProblems"**
   - Click **Add**

3. **Add JSON resource files:**
   - Right-click on the `MathWordProblems` folder
   - Select **"Add Files to MathWordProblems..."**
   - Navigate to `MathWordProblems/MathWordProblems/Resources/`
   - Select all three JSON files:
     - `easyProblems.json`
     - `mediumProblems.json`
     - `hardProblems.json`
   - ✅ Check **"Copy items if needed"**
   - ✅ Check **"Add to targets: MathWordProblems"** (IMPORTANT!)
   - Click **Add**

---

## Method 2: Using XcodeGen (If project.yml exists)

If the repository has a `project.yml` file, you can use XcodeGen:

### Step 1: Install XcodeGen

```bash
brew install xcodegen
```

### Step 2: Generate Xcode Project

```bash
cd mathwordproblems
xcodegen generate
```

### Step 3: Open Project

```bash
open MathWordProblems.xcodeproj
```

---

## Method 3: Open in Xcode from GitHub (Easiest)

1. **Go to the repository:**
   - Visit: https://github.com/indrakumarreddymadhuru/mathwordproblems

2. **Click the green "Code" button**
   - Select **"Open with Xcode"** (if available)
   - Or download ZIP and extract

3. **If downloading ZIP:**
   - Click **"Code"** > **"Download ZIP"**
   - Extract the ZIP file
   - Follow Method 1, Step 2 to create/open project

---

## After Opening in Xcode

### Step 1: Verify Project Structure

Your Project Navigator should show:
```
MathWordProblems
├── MathWordProblems
│   ├── MathWordProblemsApp.swift
│   ├── DifficultySelectionView.swift
│   ├── ProblemView.swift
│   ├── GameViewModel.swift
│   ├── Models.swift
│   ├── JSONLoader.swift
│   ├── ProgressTracker.swift
│   ├── ProgressView.swift
│   └── Resources/
│       ├── easyProblems.json
│       ├── mediumProblems.json
│       └── hardProblems.json
```

### Step 2: Configure Signing (Optional for Testing)

1. Click the **blue project icon** in Project Navigator
2. Select **MathWordProblems** target
3. Go to **Signing & Capabilities** tab
4. Check **"Automatically manage signing"**
5. Select your **Team** (or leave as "None" for simulator only)

### Step 3: Select a Simulator

1. At the top of Xcode, click the device selector
2. Choose an iPhone simulator (e.g., **iPhone 15** or **iPhone 15 Pro**)

### Step 4: Build and Run

1. Press **⌘ + B** to build
2. Check for any errors in the Issue Navigator (⚠️ icon)
3. Press **⌘ + R** to run
4. The app should launch in the simulator!

---

## Troubleshooting

### Issue: "Cannot find 'Difficulty' in scope"
**Solution:** Make sure `Models.swift` is added to the target:
- Select `Models.swift` in Project Navigator
- Open File Inspector (right sidebar, or ⌥⌘1)
- Under **Target Membership**, check **MathWordProblems** ✅

### Issue: JSON files not loading
**Solution:** Verify JSON files are in the bundle:
- Select each JSON file
- In File Inspector, check **Target Membership** > **MathWordProblems** ✅
- Clean build: **Product** > **Clean Build Folder** (⌘⇧K)

### Issue: "No such module 'SwiftUI'"
**Solution:** 
- Make sure you're using Xcode 14.0 or later
- Check iOS Deployment Target is 15.0 or higher

### Issue: Preview doesn't work
**Solution:**
- Enable Canvas: **Editor** > **Canvas** (⌥⌘↩)
- Resume preview: Click "Resume" or press ⌥⌘P
- See `PREVIEW_GUIDE.md` for detailed help

### Issue: Build errors
**Solution:**
1. Clean build folder: **Product** > **Clean Build Folder** (⌘⇧K)
2. Delete derived data:
   - **Xcode** > **Settings** > **Locations**
   - Click arrow next to Derived Data
   - Delete the folder for your project
3. Restart Xcode
4. Build again

---

## Quick Start Commands

```bash
# Clone repository
git clone https://github.com/indrakumarreddymadhuru/mathwordproblems.git
cd mathwordproblems

# If using XcodeGen
xcodegen generate
open MathWordProblems.xcodeproj

# Or just open Xcode and create new project, then add files
```

---

## Project Structure

```
mathwordproblems/
├── MathWordProblems/
│   ├── MathWordProblems/          # Source files
│   │   ├── *.swift                # All Swift source files
│   │   └── Resources/              # JSON problem files
│   ├── project.yml                # XcodeGen config (if present)
│   └── README.md                   # Project documentation
├── Documentation files...
└── .gitignore
```

---

## Next Steps

Once the project is open and running:

1. ✅ Test the app in simulator
2. ✅ Try all difficulty levels
3. ✅ Check progress tracking
4. ✅ View progress screen
5. ✅ Test navigation between problems
6. ✅ See `APP_STORE_DEPLOYMENT.md` for deployment steps

---

**Need Help?**

- Check `PREVIEW_GUIDE.md` for preview help
- Check `TESTING_IN_XCODE.md` for testing help
- Check `APP_STORE_DEPLOYMENT.md` for deployment help
- Check `FIX_INFO_PLIST_ERROR.md` if you see Info.plist errors

---

**Repository:** https://github.com/indrakumarreddymadhuru/mathwordproblems

**Happy Coding! 🚀**

