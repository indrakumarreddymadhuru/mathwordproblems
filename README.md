# Math Word Problems iOS App

A SwiftUI-based iOS application for practicing math word problems with three difficulty levels: Easy, Medium, and Hard. Each difficulty contains 20 unique problems loaded from JSON files.

## Features

- ✨ Three difficulty levels (Easy, Medium, Hard)
- 📚 20 problems per difficulty level (60 total problems)
- 🎯 Interactive quiz-style interface
- 📊 Score tracking during sessions
- 💡 Explanations for each problem
- 🎨 Modern SwiftUI design

## Project Structure

```
MathWordProblems/
├── MathWordProblems/
│   ├── MathWordProblemsApp.swift          # App entry point
│   ├── DifficultySelectionView.swift      # Home screen
│   ├── ProblemView.swift                  # Game screen
│   ├── GameViewModel.swift                # Game logic
│   ├── Models.swift                       # Data models
│   ├── JSONLoader.swift                   # JSON file loader
│   ├── Info.plist                         # App configuration
│   └── Resources/
│       ├── easyProblems.json              # 20 easy problems
│       ├── mediumProblems.json            # 20 medium problems
│       └── hardProblems.json              # 20 hard problems
├── project.yml                            # XcodeGen configuration (optional)
├── create_xcode_project.sh                # Setup script
└── README.md                              # This file
```

## Setup Instructions

### Option 1: Create Xcode Project Manually (Recommended)

1. **Open Xcode**
   - Launch Xcode on your Mac

2. **Create New Project**
   - Select "Create a new Xcode project"
   - Choose **iOS** > **App**
   - Click "Next"

3. **Configure Project**
   - **Product Name:** `MathWordProblems`
   - **Team:** Select your development team
   - **Organization Identifier:** e.g., `com.yourname` or `com.yourcompany`
   - **Interface:** `SwiftUI`
   - **Language:** `Swift`
   - **Storage:** Choose based on your needs
   - Click "Next"

4. **Save Project**
   - Choose a location to save your project
   - Click "Create"

5. **Add Files to Project**
   - Delete the default `ContentView.swift` file
   - In Xcode, right-click on the `MathWordProblems` folder
   - Select "Add Files to MathWordProblems..."
   - Navigate to this project directory
   - Select all `.swift` files from the `MathWordProblems/` folder
   - Make sure "Copy items if needed" is checked
   - Make sure "Create groups" is selected
   - Click "Add"

6. **Add JSON Resources**
   - Right-click on the project in Xcode
   - Select "Add Files to MathWordProblems..."
   - Navigate to `MathWordProblems/Resources/`
   - Select all three JSON files (`easyProblems.json`, `mediumProblems.json`, `hardProblems.json`)
   - **IMPORTANT:** Check "Copy items if needed"
   - Make sure "Add to targets: MathWordProblems" is checked
   - Click "Add"

7. **Update App Entry Point**
   - Delete the default `MathWordProblemsApp.swift` content (if it exists)
   - Use the provided `MathWordProblemsApp.swift` file

### Option 2: Using XcodeGen (Advanced)

If you have XcodeGen installed:

```bash
# Install XcodeGen (if not already installed)
brew install xcodegen

# Generate Xcode project
cd MathWordProblems
xcodegen generate
```

Then open the generated `MathWordProblems.xcodeproj` in Xcode.

## Running the App

1. **Select a Simulator or Device**
   - Choose an iPhone or iPad simulator from the device menu in Xcode

2. **Build and Run**
   - Press `Cmd + R` or click the "Play" button
   - The app will launch on your selected device/simulator

## Deployment to App Store

### Prerequisites

1. **Apple Developer Account**
   - You need an active Apple Developer Program membership ($99/year)
   - Sign up at [developer.apple.com](https://developer.apple.com)

2. **App Store Connect**
   - Access to App Store Connect (same Apple ID as Developer account)

### Step 1: Configure App Settings in Xcode

1. **Select Project in Navigator**
   - Click on the project name (blue icon) in the left sidebar

2. **Set Bundle Identifier**
   - Select the target "MathWordProblems"
   - Go to "Signing & Capabilities" tab
   - Change Bundle Identifier to something unique like: `com.yourcompany.MathWordProblems`
   - This must be unique and match your App Store Connect app

3. **Configure Signing**
   - Select "Automatically manage signing"
   - Choose your Team from the dropdown
   - Xcode will automatically create provisioning profiles

4. **Set Deployment Target**
   - Go to "General" tab
   - Set "iOS Deployment Target" to `15.0` or higher
   - This determines the minimum iOS version supported

5. **Set Version and Build Number**
   - Go to "General" tab
   - Set "Version" to `1.0`
   - Set "Build" to `1`

### Step 2: Prepare App for Submission

1. **Update Display Name**
   - Go to "Info" tab
   - Set "Display Name" to "Math Word Problems" (or your preferred name)

2. **Configure App Icon (Optional)**
   - Add an app icon to your project
   - Required sizes: See Apple's Human Interface Guidelines

3. **Add Launch Screen (Optional)**
   - The default SwiftUI launch screen will be used
   - Or customize in `Info.plist` or add a launch screen asset

4. **Test Thoroughly**
   - Test on multiple devices and iOS versions
   - Test all difficulty levels
   - Verify JSON files load correctly
   - Check all navigation flows

### Step 3: Archive the App

1. **Select Generic iOS Device**
   - In the device menu, select "Any iOS Device (arm64)"

2. **Create Archive**
   - Go to **Product** > **Archive**
   - Wait for the build to complete
   - The Organizer window will open automatically

3. **Validate Archive**
   - In the Organizer window, select your archive
   - Click "Validate App"
   - Follow the prompts and fix any issues

### Step 4: Create App in App Store Connect

1. **Log in to App Store Connect**
   - Go to [appstoreconnect.apple.com](https://appstoreconnect.apple.com)
   - Sign in with your Apple Developer account

2. **Create New App**
   - Click the "+" button and select "New App"
   - Fill in:
     - **Platform:** iOS
     - **Name:** Math Word Problems (must be unique)
     - **Primary Language:** English (or your choice)
     - **Bundle ID:** Select the one you configured in Xcode
     - **SKU:** A unique identifier (e.g., `math-word-problems-001`)
     - **User Access:** Full Access (for now)

3. **Fill in App Information**
   - **App Information:**
     - Category: Education (recommended)
     - Privacy Policy URL (required for many regions)
   - **Pricing and Availability:**
     - Set price (Free is recommended for first release)
     - Select countries/regions
   - **App Privacy:**
     - Complete privacy questionnaire
     - This app doesn't collect user data, so most answers will be "No"

### Step 5: Prepare App Store Listing

1. **Screenshots (Required)**
   - Take screenshots on different device sizes:
     - iPhone 6.7" (iPhone 14 Pro Max)
     - iPhone 6.5" (iPhone 11 Pro Max)
     - iPhone 5.5" (iPhone 8 Plus)
     - iPad Pro (12.9-inch)
   - Required sizes vary by region

2. **App Description**
   - Write a compelling description (up to 4000 characters)
   - Example:
     ```
     Practice math word problems and improve your problem-solving skills!
     
     Features:
     • Three difficulty levels: Easy, Medium, Hard
     • 20 unique problems per difficulty
     • Instant feedback and explanations
     • Track your progress
     • Perfect for students and learners
     
     Math Word Problems helps you master word problem solving through 
     interactive practice sessions.
     ```

3. **Keywords**
   - Add relevant keywords (up to 100 characters)
   - Example: `math,word problems,education,practice,learning`

4. **Support URL**
   - Provide a website or email support
   - Can be your website or a contact email

### Step 6: Submit for Review

1. **Upload Build**
   - In App Store Connect, go to your app
   - Go to "TestFlight" or "App Store" tab
   - Click "+" next to "Build"
   - Select the build you uploaded from Xcode

2. **Complete App Store Information**
   - Fill in all required fields (marked with *)
   - Upload screenshots
   - Add description and keywords

3. **Add Review Information**
   - Provide a demo account if needed (not required for this app)
   - Add notes for reviewers (optional)

4. **Submit for Review**
   - Click "Submit for Review"
   - Answer any export compliance questions
   - The app will go into "Waiting for Review" status

### Step 7: Wait for Review

- **Review Time:** Typically 24-48 hours, can take up to 7 days
- **Status Updates:** Check App Store Connect regularly
- **If Rejected:** Fix issues and resubmit

## Testing on TestFlight (Optional but Recommended)

1. **Build and Upload to TestFlight**
   - After archiving, click "Distribute App"
   - Select "App Store Connect"
   - Follow prompts to upload

2. **Invite Testers**
   - Go to TestFlight tab in App Store Connect
   - Add internal testers (up to 100)
   - Or set up external beta testing

3. **Test Before Release**
   - Test thoroughly on TestFlight
   - Gather feedback
   - Fix any issues

## Post-Launch

1. **Monitor Reviews**
   - Respond to user reviews
   - Address common issues

2. **Update the App**
   - When ready to update:
     - Increment version number (e.g., 1.1)
     - Increment build number
     - Archive and submit again

## Troubleshooting

### JSON Files Not Loading
- Verify JSON files are added to the target bundle
- Check file names match exactly: `easyProblems.json`, etc.
- Verify JSON syntax is valid

### Build Errors
- Clean build folder: Product > Clean Build Folder (Shift+Cmd+K)
- Delete derived data: Xcode > Preferences > Locations > Derived Data

### Signing Issues
- Ensure your Apple Developer account is active
- Check bundle identifier is unique
- Verify provisioning profiles are valid

## Requirements

- **iOS:** 15.0 or later
- **Xcode:** 14.0 or later
- **Swift:** 5.0 or later
- **Devices:** iPhone and iPad

## Support

For issues or questions:
- Check Apple's [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- Review [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)

## License

This project is provided as-is for educational purposes. Customize as needed for your App Store submission.

---

**Good luck with your App Store submission! 🚀**

