# Using SwiftUI Previews in Xcode

Your views now have preview macros added! Here's how to use them:

## How to View Previews

1. **Open your Swift files in Xcode:**
   - `DifficultySelectionView.swift`
   - `ProblemView.swift`

2. **Enable the Canvas:**
   - In Xcode, go to **Editor** > **Canvas** (or press `⌥⌘↩` - Option + Command + Return)
   - The preview canvas will appear on the right side of your editor

3. **View the Previews:**
   - You'll see live previews of your views
   - The preview updates automatically as you edit your code

## Available Previews

### DifficultySelectionView.swift
- **Preview:** Shows the main difficulty selection screen with Easy, Medium, and Hard buttons

### ProblemView.swift
- **Preview "Problem View - Active":** Shows an active problem view (Easy difficulty)
- **Preview "Problem View - Medium":** Shows a problem view with Medium difficulty
- **Preview "Problem View - Hard":** Shows a problem view with Hard difficulty

## Preview Features

- **Live Updates:** As you edit your code, the preview updates automatically
- **Interactive:** You can interact with buttons and UI elements in the preview
- **Multiple Devices:** Click the device selector to preview on different iPhone/iPad sizes
- **Multiple Previews:** If a file has multiple `#Preview` blocks, you'll see tabs for each one

## Tips

1. **If previews don't show problems:**
   - Make sure JSON files are added to your Xcode project target
   - Check that "Add to targets: MathWordProblems" is checked for JSON files
   - The preview will still show the layout even if JSON files aren't loaded

2. **To refresh a preview:**
   - Click the refresh button (circular arrow) in the preview canvas
   - Or press `⌥⌘P` (Option + Command + P)

3. **To hide/show the canvas:**
   - **Editor** > **Canvas** (toggle)
   - Or press `⌥⌘↩` (Option + Command + Return)

4. **Preview on different devices:**
   - Click the device name in the preview (e.g., "iPhone 15 Pro")
   - Select a different device from the dropdown
   - Try iPhone SE, iPhone 15 Pro Max, iPad, etc.

## Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Show/Hide Canvas | `⌥⌘↩` (Option + Command + Return) |
| Refresh Preview | `⌥⌘P` (Option + Command + P) |
| Resume Preview | `⌥⌘P` (Option + Command + P) |

## Troubleshooting

**Preview shows "No problems available":**
- This is normal if JSON files aren't loaded yet
- The preview still shows the layout, which is useful for design
- Once you add JSON files to the Xcode project target, problems will load

**Preview won't compile:**
- Make sure all Swift files are added to the target
- Check for any syntax errors in your code
- Clean build folder: **Product** > **Clean Build Folder** (`⌘⇧K`)

**Canvas is blank:**
- Click "Resume" in the preview canvas
- Or press `⌥⌘P` to refresh
- Check the Xcode issues panel for errors

---

**Happy Previewing! 🎨**

The preview feature is great for:
- Quickly seeing how your UI looks
- Testing different screen sizes
- Iterating on design without running the full app
- Debugging layout issues

