# Xcode Preview Troubleshooting Guide

If you're unable to preview your app in Xcode, follow these steps:

## Step 1: Enable the Canvas

1. **Open your Swift file** (e.g., `DifficultySelectionView.swift` or `ProblemView.swift`)
2. **Enable Canvas:**
   - Go to **Editor** > **Canvas** in the menu bar
   - OR press `⌥⌘↩` (Option + Command + Return)
   - The canvas should appear on the right side of your editor

## Step 2: Check for Build Errors

1. **Build the project first:**
   - Press `⌘ + B` (Command + B) to build
   - Check the **Issue Navigator** (⚠️ icon on left sidebar) for errors
   - Fix any compilation errors before trying previews

2. **Common build issues:**
   - Missing files in target membership
   - JSON files not added to bundle
   - Syntax errors in Swift files

## Step 3: Resume the Preview

If the canvas shows "Paused" or is blank:

1. **Click "Resume"** button in the preview canvas
2. **OR press** `⌥⌘P` (Option + Command + P) to resume
3. **Wait a few seconds** for the preview to compile and render

## Step 4: Clean Build Folder

If previews still don't work:

1. **Clean Build Folder:**
   - Go to **Product** > **Clean Build Folder**
   - OR press `⌘⇧K` (Command + Shift + K)

2. **Delete Derived Data:**
   - Go to **Xcode** > **Settings** (or **Preferences**)
   - Click **Locations** tab
   - Click the arrow next to **Derived Data** path
   - Delete the folder for your project
   - Restart Xcode

## Step 5: Verify File Target Membership

Make sure all files are added to your target:

1. **Select a Swift file** in Project Navigator
2. **Open File Inspector** (right sidebar, or `⌥⌘1`)
3. **Under "Target Membership"**, make sure **MathWordProblems** is checked ✅
4. **Do this for all Swift files:**
   - `DifficultySelectionView.swift`
   - `ProblemView.swift`
   - `GameViewModel.swift`
   - `Models.swift`
   - `JSONLoader.swift`
   - `MathWordProblemsApp.swift`

5. **For JSON files:**
   - Select each JSON file in `Resources/` folder
   - Make sure **MathWordProblems** target is checked ✅

## Step 6: Check Xcode Version

Previews require:
- **Xcode 15.0+** (for `#Preview` macro)
- **macOS 13.0+** (Ventura or later)

**To check your Xcode version:**
- **Xcode** > **About Xcode**

**If you have an older version:**
- Update Xcode from Mac App Store
- Or use the older `PreviewProvider` syntax (see below)

## Step 7: Try Manual Preview Refresh

1. **Close the canvas** (Editor > Canvas)
2. **Save all files** (`⌘S`)
3. **Reopen the canvas** (`⌥⌘↩`)
4. **Click Resume** if needed

## Step 8: Check Preview-Specific Issues

### Issue: "Cannot preview in this file"
**Solution:** Make sure you're viewing a SwiftUI View file, not a non-View Swift file.

### Issue: Preview shows "Paused"
**Solution:** 
- Click "Resume" button
- Check for build errors
- Make sure the file compiles successfully

### Issue: Preview shows error about missing types
**Solution:**
- Make sure `Models.swift` is in the target
- Make sure `Difficulty` and `Problem` types are accessible

### Issue: Preview doesn't update when you edit code
**Solution:**
- Make sure "Automatically Refresh Canvas" is enabled
- Or manually refresh with `⌥⌘P`

## Step 9: Alternative - Use PreviewProvider (Older Xcode)

If you're using Xcode 14 or earlier, replace `#Preview` with:

```swift
struct ProblemView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProblem = Problem(
            problem: "Sarah has 15 apples...",
            answers: [6, 7, 8, 9],
            correct: 2,
            explanation: "Explanation here",
            emoji: "🍎"
        )
        let previewViewModel = PreviewGameViewModel(difficulty: .easy, problem: sampleProblem)
        return ProblemView(viewModel: previewViewModel)
    }
}
```

## Step 10: Test with Simple Preview

Try this minimal preview to test if previews work at all:

```swift
#Preview {
    Text("Hello, Preview!")
        .padding()
        .background(Color.blue)
}
```

If this doesn't work, the issue is with Xcode setup, not your code.

## Quick Checklist

- [ ] Canvas is enabled (`⌥⌘↩`)
- [ ] Project builds without errors (`⌘B`)
- [ ] All files are in target membership
- [ ] Preview is resumed (not paused)
- [ ] Xcode version is 15.0+
- [ ] Clean build folder done
- [ ] Derived data cleared

## Still Not Working?

1. **Restart Xcode completely**
2. **Restart your Mac** (sometimes helps with preview issues)
3. **Check Xcode Console** (View > Debug Area > Activate Console) for error messages
4. **Try previewing a different file** (e.g., `DifficultySelectionView.swift`)

## Expected Behavior

When previews work correctly, you should see:
- ✅ Live preview of your UI on the right side
- ✅ Multiple preview tabs (if you have multiple `#Preview` blocks)
- ✅ Device selector to change iPhone/iPad sizes
- ✅ Interactive buttons (you can click them in preview)
- ✅ Automatic updates when you edit code

## Getting Help

If none of these steps work:
1. Check the **Xcode Console** for specific error messages
2. Look at the **Issue Navigator** for build errors
3. Try creating a new simple SwiftUI view to test if previews work at all
4. Check Apple's Xcode release notes for known preview issues

---

**Remember:** Previews are a development tool. Your app will still run normally even if previews don't work. You can always test by running the app (`⌘R`) instead of using previews.

