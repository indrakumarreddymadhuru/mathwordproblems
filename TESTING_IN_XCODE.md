# Testing Math Word Problems in Xcode

This guide will help you set up and test your app in Xcode on your Mac.

## Prerequisites

- ✅ Mac with macOS installed
- ✅ Xcode installed (download from Mac App Store or [developer.apple.com/xcode](https://developer.apple.com/xcode))
- ✅ This project folder

---

## Step 1: Open Xcode

1. Launch **Xcode** from your Applications folder or Spotlight
2. If this is your first time opening Xcode, you may need to:
   - Accept the license agreement
   - Install additional components (this may take a few minutes)

---

## Step 2: Create New Xcode Project

1. In Xcode, you'll see the welcome screen
2. Click **"Create a new Xcode project"** (or go to **File** > **New** > **Project**)

3. **Select Template:**
   - Choose **iOS** at the top
   - Select **App**
   - Click **Next**

4. **Configure Project:**
   - **Product Name:** `MathWordProblems`
   - **Team:** Select your team (or "None" for now - you can add it later)
   - **Organization Identifier:** `com.yourname` (or `com.yourcompany`)
     - This will create Bundle ID: `com.yourname.MathWordProblems`
   - **Interface:** `SwiftUI`
   - **Language:** `Swift`
   - **Storage:** Choose "None" (we're using JSON files)
   - **Include Tests:** Optional (you can uncheck if you want)
   - Click **Next**

5. **Save Location:**
   - Navigate to: `/Users/indrareddy/MathWordProblems/`
   - **IMPORTANT:** Make sure you're saving in the parent directory (not inside MathWordProblems folder)
   - Uncheck **"Create Git repository"** if you already have one
   - Click **Create**

---

## Step 3: Remove Default Files

1. In the Project Navigator (left sidebar), you'll see:
   - `MathWordProblems` folder
   - `MathWordProblemsApp.swift` (default)
   - `ContentView.swift` (default)
   - `Assets.xcassets`
   - `Preview Content`

2. **Delete the default files:**
   - Right-click on `ContentView.swift` → **Delete** → **Move to Trash**
   - Right-click on the default `MathWordProblemsApp.swift` → **Delete** → **Move to Trash**

---

## Step 4: Add Your Swift Files

1. **Add all Swift files:**
   - In Xcode, right-click on the `MathWordProblems` folder (blue icon) in the Project Navigator
   - Select **"Add Files to MathWordProblems..."**
   - Navigate to: `/Users/indrareddy/MathWordProblems/MathWordProblems/`
   - Select these files:
     - `MathWordProblemsApp.swift`
     - `DifficultySelectionView.swift`
     - `ProblemView.swift`
     - `GameViewModel.swift`
     - `Models.swift`
     - `JSONLoader.swift`
   - **IMPORTANT:** Check these options:
     - ✅ **"Copy items if needed"** (if files aren't already in the project directory)
     - ✅ **"Create groups"** (not "Create folder references")
     - ✅ **"Add to targets: MathWordProblems"** (should be checked)
   - Click **Add**

---

## Step 5: Add JSON Resource Files

1. **Add JSON files:**
   - Right-click on the `MathWordProblems` folder in Project Navigator
   - Select **"Add Files to MathWordProblems..."**
   - Navigate to: `/Users/indrareddy/MathWordProblems/MathWordProblems/Resources/`
   - Select all three JSON files:
     - `easyProblems.json`
     - `mediumProblems.json`
     - `hardProblems.json`
   - **IMPORTANT:** Check these options:
     - ✅ **"Copy items if needed"**
     - ✅ **"Create groups"**
     - ✅ **"Add to targets: MathWordProblems"** (MUST be checked - this is critical!)
   - Click **Add**

2. **Verify JSON files are in the bundle:**
   - Select one of the JSON files in the Project Navigator
   - In the File Inspector (right sidebar), under **Target Membership**
   - Make sure **MathWordProblems** is checked ✅

---

## Step 6: Verify Project Structure

Your Project Navigator should now look like this:

```
MathWordProblems
├── MathWordProblems
│   ├── MathWordProblemsApp.swift
│   ├── DifficultySelectionView.swift
│   ├── ProblemView.swift
│   ├── GameViewModel.swift
│   ├── Models.swift
│   ├── JSONLoader.swift
│   ├── easyProblems.json
│   ├── mediumProblems.json
│   └── hardProblems.json
├── Assets.xcassets
└── Preview Content
```

---

## Step 7: Configure Project Settings

1. **Select the Project:**
   - Click on the **blue project icon** (MathWordProblems) at the top of the Project Navigator

2. **General Tab:**
   - **Display Name:** `Math Word Problems` (what users see on home screen)
   - **Bundle Identifier:** Should be `com.yourname.MathWordProblems` (or what you set)
   - **Version:** `1.0`
   - **Build:** `1`
   - **Deployment Target:** `15.0` (or higher)

3. **Signing & Capabilities Tab:**
   - For testing, you can leave signing as-is
   - If you want to test on a physical device later, you'll need to:
     - Check **"Automatically manage signing"**
     - Select your **Team**

---

## Step 8: Build and Run

1. **Select a Simulator:**
   - At the top of Xcode, click the device selector (next to the Play button)
   - Choose an iPhone simulator (e.g., **iPhone 15** or **iPhone 15 Pro**)
   - Or choose an iPad simulator if you want to test iPad

2. **Build the Project:**
   - Press **⌘ + B** (Command + B) or go to **Product** > **Build**
   - Wait for the build to complete
   - Check for any errors in the Issue Navigator (⚠️ icon on left sidebar)

3. **Run the App:**
   - Press **⌘ + R** (Command + R) or click the **Play** button (▶️)
   - The simulator will launch and your app should open

---

## Step 9: Test the App

Once the app is running:

1. **Test Difficulty Selection:**
   - You should see three buttons: Easy, Medium, Hard
   - Tap each one to verify they work

2. **Test Problem Solving:**
   - Select a difficulty level
   - Try solving a problem
   - Verify the answer submission works
   - Check if explanations appear

3. **Test Navigation:**
   - Try going back from problem view
   - Test different difficulty levels
   - Verify score tracking

4. **Test on Different Devices:**
   - Change the simulator (iPhone SE, iPhone 15 Pro Max, iPad, etc.)
   - Run again to test different screen sizes

---

## Troubleshooting

### Issue: "Cannot find 'DifficultySelectionView' in scope"
**Solution:** Make sure all Swift files are added to the target:
- Select each Swift file
- In File Inspector (right sidebar), check **Target Membership** > **MathWordProblems** ✅

### Issue: JSON files not loading / App crashes
**Solution:** Verify JSON files are in the bundle:
- Select each JSON file
- In File Inspector, under **Target Membership**, make sure **MathWordProblems** is checked ✅
- Clean build folder: **Product** > **Clean Build Folder** (⌘ + Shift + K)
- Build again

### Issue: Build errors about missing files
**Solution:**
- Make sure you added all files from Step 4 and Step 5
- Check that "Copy items if needed" was selected when adding files
- Verify file paths are correct

### Issue: Simulator won't launch
**Solution:**
- Make sure Xcode is fully updated
- Try a different simulator
- Restart Xcode

### Issue: "Signing for MathWordProblems requires a development team"
**Solution:**
- For simulator testing, you can leave signing as "None"
- For physical device testing, you'll need to:
  - Add your Apple ID in Xcode Preferences > Accounts
  - Select your team in Signing & Capabilities

---

## Testing on Physical Device (Optional)

If you want to test on a real iPhone/iPad:

1. **Connect your device:**
   - Connect your iPhone/iPad to your Mac via USB
   - Unlock your device
   - Trust the computer if prompted

2. **Configure Signing:**
   - In Xcode, select your project
   - Go to **Signing & Capabilities** tab
   - Check **"Automatically manage signing"**
   - Select your **Team** (add Apple ID in Xcode Preferences if needed)

3. **Select Device:**
   - In the device selector, choose your connected device
   - You may need to trust the developer certificate on your device:
     - On device: Settings > General > VPN & Device Management
     - Trust the developer certificate

4. **Run:**
   - Press **⌘ + R** to build and run
   - The app will install and launch on your device

---

## Next Steps

Once testing is successful:

1. ✅ App runs without crashes
2. ✅ All difficulty levels work
3. ✅ Problems load correctly
4. ✅ Navigation works smoothly
5. ✅ App looks good on different screen sizes

Then you're ready for:
- **App Store deployment** (see `APP_STORE_DEPLOYMENT.md`)
- **TestFlight beta testing**
- **Further development and features**

---

## Quick Reference

| Action | Keyboard Shortcut |
|--------|------------------|
| Build | ⌘ + B |
| Run | ⌘ + R |
| Stop | ⌘ + . |
| Clean Build Folder | ⌘ + Shift + K |
| Show/Hide Navigator | ⌘ + 0 |
| Show/Hide Inspector | ⌘ + Option + 0 |

---

**Happy Testing! 🚀**

If you encounter any issues, check the troubleshooting section above or refer to the main README.md file.

