# Fix Info.plist Error in Xcode

## The Error
```
Resource 'Resources/Info.plist' in target 'AppModule' is forbidden;
Info.plist is not supported as a top-level resource file in the resources bundle
```

## The Problem
`Info.plist` has been incorrectly added to the "Copy Bundle Resources" build phase. `Info.plist` should NOT be in the Resources folder or in the Copy Bundle Resources phase.

## Solution: Remove Info.plist from Resources Build Phase

### Step 1: Open Build Phases
1. In Xcode, click the **blue project icon** (MathWordProblems) in the Project Navigator (left sidebar)
2. Select the **MathWordProblems** target
3. Click the **Build Phases** tab at the top

### Step 2: Remove Info.plist from Copy Bundle Resources
1. Expand **"Copy Bundle Resources"** section
2. Look for **`Info.plist`** in the list
3. **Select `Info.plist`** and press the **Delete** key (or click the **"-"** button)
4. Confirm removal if prompted

### Step 3: Verify Info.plist File Setting
1. Still in the target settings, click the **Build Settings** tab
2. Search for **"Info.plist File"** in the search bar
3. Make sure it shows: **`MathWordProblems/Info.plist`**
   - If it's wrong, click on it and set the correct path
   - Or leave it blank if using modern SwiftUI (iOS 14+)

### Step 4: Clean and Rebuild
1. Go to **Product** > **Clean Build Folder** (or press `⌘⇧K`)
2. Build again: **Product** > **Build** (or press `⌘B`)

## Alternative: For Modern SwiftUI Apps (iOS 14+)

If you're targeting iOS 14+, you might not need `Info.plist` at all. You can:

1. **Delete Info.plist from the project** (optional)
2. **Configure everything in Xcode target settings:**
   - General tab: Set Display Name, Version, Bundle ID
   - Info tab: Add any required keys

## Quick Fix Checklist

- [ ] Open Build Phases
- [ ] Remove Info.plist from "Copy Bundle Resources"
- [ ] Verify "Info.plist File" setting in Build Settings
- [ ] Clean Build Folder (`⌘⇧K`)
- [ ] Build again (`⌘B`)
- [ ] Try preview again

---

**After fixing, your preview should work!** 🎉

