# Assets.xcassets

This folder contains app assets including app icons.

## App Icon

To add your app icon:

1. **Create a 1024x1024 PNG image** (no transparency, square)
   - This is the App Store icon size
   - Design guidelines: [Apple HIG - App Icons](https://developer.apple.com/design/human-interface-guidelines/app-icons)

2. **Option A: Use Xcode (Recommended)**
   - Open your project in Xcode
   - Select `Assets.xcassets` in the navigator
   - Click on `AppIcon`
   - Drag your 1024x1024 image to the "App Store" slot (1024x1024)
   - Xcode will automatically generate all other sizes

3. **Option B: Use Online Tool**
   - Go to [AppIcon.co](https://www.appicon.co) or similar tool
   - Upload your 1024x1024 image
   - Download the generated icon set
   - Replace the images in `AppIcon.appiconset/` folder

4. **Option C: Manual (Advanced)**
   - Generate all required sizes from your 1024x1024 image
   - Place them in `AppIcon.appiconset/` folder
   - Update `Contents.json` to reference each image file

## Required Icon Sizes

- **App Store:** 1024x1024 (required for submission)
- **iPhone:** Various sizes (20pt, 29pt, 40pt, 60pt at 2x and 3x)
- **iPad:** Various sizes (20pt, 29pt, 40pt, 76pt, 83.5pt at 1x and 2x)

## Quick Start

1. Create or find a 1024x1024 PNG image for your app icon
2. Open the project in Xcode
3. Select `Assets.xcassets` → `AppIcon`
4. Drag your 1024x1024 image to the App Store slot
5. Xcode will handle the rest!

## Notes

- Icons must be PNG format
- No transparency allowed
- Square images only
- App Store icon (1024x1024) is REQUIRED for App Store submission

