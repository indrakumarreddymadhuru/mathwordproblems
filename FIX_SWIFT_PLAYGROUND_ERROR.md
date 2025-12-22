# Fix Info.plist Error in Swift Playground

## The Error
```
Resource 'Resources/Info.plist' in target 'AppModule' is forbidden;
Info.plist is not supported as a top-level resource file in the resources bundle
```

## The Problem
In Swift Playground, `Info.plist` is incorrectly placed in the **Resources** folder. `Info.plist` should NOT be in Resources.

## Solution: Remove Info.plist from Resources

### Option 1: Delete Info.plist (Recommended for Swift Playground)

Swift Playground apps often don't need `Info.plist` at all. You can safely delete it:

1. In Swift Playground, find `Info.plist` in the **Resources** section (left sidebar)
2. **Right-click** on `Info.plist`
3. Select **Delete** or press **Delete** key
4. Confirm deletion

### Option 2: Move Info.plist to Code Folder (If Needed)

If you need `Info.plist` for specific settings:

1. **Drag `Info.plist`** from the **Resources** section
2. **Drop it** in the **Code** section (with your Swift files)
3. Make sure it's NOT in Resources anymore

## Steps to Fix in Swift Playground

1. **Open your Swift Playground project**
2. **Look at the left sidebar** - you'll see:
   - **Code** section (with Swift files)
   - **Resources** section (with JSON files)
3. **Find `Info.plist`** - it's currently in **Resources** ❌
4. **Remove it:**
   - Right-click → Delete
   - OR drag it out of Resources
5. **Try running again** - the error should be gone!

## Why This Happens

Swift Playground treats files in the **Resources** folder as bundle resources that get copied into the app bundle. `Info.plist` is a special configuration file that should NOT be treated as a resource.

## After Fixing

Your project structure should look like:

```
My App
├── Code
│   ├── MathWordProblemsApp.swift
│   ├── DifficultySelectionView.swift
│   ├── ProblemView.swift
│   ├── GameViewModel.swift
│   ├── Models.swift
│   ├── JSONLoader.swift
│   └── (Info.plist can be here if needed, but usually not needed)
│
└── Resources
    ├── easyProblems.json ✅
    ├── mediumProblems.json ✅
    └── hardProblems.json ✅
    └── (Info.plist should NOT be here) ❌
```

## Quick Fix

**Just delete `Info.plist` from Resources** - Swift Playground apps work fine without it for basic functionality!

---

**After removing Info.plist from Resources, your app should run!** 🎉

