# App Store Deployment Guide for Math Word Problems

This guide provides step-by-step instructions to deploy your Math Word Problems app to the Apple App Store.

## Prerequisites Checklist

Before you begin, ensure you have:

- [ ] **Apple Developer Account** ($99/year)
  - Sign up at [developer.apple.com](https://developer.apple.com)
  - Wait for account activation (usually instant, can take up to 48 hours)
  
- [ ] **Xcode** (latest version recommended)
  - Download from Mac App Store or [developer.apple.com/xcode](https://developer.apple.com/xcode)
  
- [ ] **Mac computer** (required for iOS development)
  
- [ ] **App Store Connect access**
  - Same Apple ID as your Developer account
  - Access at [appstoreconnect.apple.com](https://appstoreconnect.apple.com)

---

## Phase 1: Prepare Your Project in Xcode

### Step 1.1: Open Your Project

1. Open Xcode
2. Open your project:
   - If using XcodeGen: Run `xcodegen generate` then open `MathWordProblems.xcodeproj`
   - If you have an existing `.xcodeproj` file, open it directly

### Step 1.2: Configure Bundle Identifier

**Current Bundle ID:** `com.yourcompany.MathWordProblems` (needs to be unique)

1. In Xcode, click the **blue project icon** in the navigator (left sidebar)
2. Select the **MathWordProblems** target
3. Go to the **General** tab
4. Under **Identity**, change **Bundle Identifier** to something unique:
   - Format: `com.yourname.MathWordProblems` or `com.yourcompany.MathWordProblems`
   - Example: `com.johndoe.MathWordProblems`
   - **Important:** This must be unique and will be registered in App Store Connect

### Step 1.3: Configure Code Signing

1. Still in the **General** tab, scroll to **Signing & Capabilities**
2. Check **"Automatically manage signing"**
3. Select your **Team** from the dropdown
   - If you don't see your team, click "Add Account..." and sign in
4. Xcode will automatically:
   - Create a provisioning profile
   - Configure signing certificates
   - Handle app capabilities

### Step 1.4: Update Version and Build Numbers

1. In the **General** tab, under **Identity**:
   - **Version:** `1.0` (this is the user-facing version)
   - **Build:** `1` (increment this for each submission)
2. These should match your `Info.plist` values

### Step 1.5: Set Deployment Target

1. In **General** tab, under **Deployment Info**:
   - **iOS:** `15.0` (already set in your project.yml)
   - This determines the minimum iOS version your app supports

### Step 1.6: Configure App Display Name

1. Go to the **Info** tab
2. Under **Custom iOS Target Properties**, find **Bundle display name**
3. Set it to: `Math Word Problems` (or your preferred name)
   - This is what users see on their home screen

### Step 1.7: Add App Icon (Required)

**You need to add an app icon before submission:**

1. Create app icon images:
   - **Required sizes:** 1024x1024 pixels (for App Store)
   - **Device sizes:** Various (Xcode can generate these from 1024x1024)
   - Format: PNG, no transparency
   - Design guidelines: [Apple HIG - App Icons](https://developer.apple.com/design/human-interface-guidelines/app-icons)

2. In Xcode:
   - Select your project in navigator
   - Select the **MathWordProblems** target
   - Go to **General** tab
   - Under **App Icons and Launch Screen**, click **"App Icon"**
   - Drag your 1024x1024 icon into the appropriate slot
   - Or use **Assets.xcassets** > **AppIcon** to add individual sizes

**Quick Option:** Use an online tool like [AppIcon.co](https://www.appicon.co) to generate all required sizes from one image.

### Step 1.8: Test Your App Thoroughly

Before archiving, test on:

- [ ] iPhone simulator (different sizes)
- [ ] iPad simulator
- [ ] Physical iPhone device (if available)
- [ ] Physical iPad device (if available)

**Test Checklist:**
- [ ] All three difficulty levels work
- [ ] JSON files load correctly
- [ ] Navigation flows properly
- [ ] No crashes or errors
- [ ] App works in both portrait and landscape
- [ ] App looks good on different screen sizes

---

## Phase 2: Create App in App Store Connect

### Step 2.1: Log in to App Store Connect

1. Go to [appstoreconnect.apple.com](https://appstoreconnect.apple.com)
2. Sign in with your **Apple Developer account** credentials

### Step 2.2: Create New App

1. Click the **"+"** button (top left) or **"My Apps"** > **"+"** > **"New App"**
2. Fill in the form:

   **Platform:** iOS
   
   **Name:** Math Word Problems
   - Must be unique (if taken, try variations like "Math Word Problems - Practice" or "Math Word Problems Pro")
   - Can be changed later, but it's better to get it right
   
   **Primary Language:** English (or your preferred language)
   
   **Bundle ID:** 
   - Select the bundle ID you configured in Xcode
   - If it doesn't exist, you'll need to create it first:
     - Go to [developer.apple.com/account/resources/identifiers/list](https://developer.apple.com/account/resources/identifiers/list)
     - Click "+" to create new App ID
     - Enter your bundle identifier
     - Register it
   
   **SKU:** 
   - A unique identifier (e.g., `math-word-problems-001`)
   - This is for your internal tracking, not visible to users
   - Format: alphanumeric, no spaces
   
   **User Access:** Full Access (default)

3. Click **"Create"**

### Step 2.3: Complete App Information

Navigate through the tabs and fill in:

**1. App Information Tab:**
- **Category:** 
  - Primary: Education
  - Secondary: (optional) Games > Educational
- **Privacy Policy URL:** 
  - **Required** for many regions
  - Create a simple privacy policy page (can be on GitHub Pages, your website, etc.)
  - Example content: "This app does not collect, store, or share any personal data."
  - Or use a privacy policy generator

**2. Pricing and Availability:**
- **Price:** Free (recommended for first release)
- **Availability:** Select countries/regions (or "All countries or regions")
- **Discounts:** (Optional) Set up educational discounts if applicable

**3. App Privacy:**
- Click **"Get Started"** or **"Manage"**
- Answer the privacy questions:
  - **Does your app collect data?** → No (for this app)
  - **Does your app use third-party analytics?** → No
  - **Does your app track users?** → No
  - Continue through all questions
- Since this app doesn't collect data, most answers will be "No"
- Click **"Save"** when done

---

## Phase 3: Archive and Upload Your App

### Step 3.1: Clean Build Folder

1. In Xcode, go to **Product** > **Clean Build Folder** (or press `Shift + Cmd + K`)
2. This ensures a fresh build

### Step 3.2: Select Generic iOS Device

1. In the device selector (top toolbar), select **"Any iOS Device (arm64)"**
   - Or select a connected physical device
   - **Do NOT** select a simulator (archives won't work from simulator)

### Step 3.3: Create Archive

1. Go to **Product** > **Archive**
2. Wait for the build to complete (may take several minutes)
3. The **Organizer** window will open automatically
   - If it doesn't, go to **Window** > **Organizer**

### Step 3.4: Validate Archive (Recommended)

1. In the Organizer window, select your archive
2. Click **"Validate App"**
3. Follow the prompts:
   - Select your team
   - Choose "Automatically manage signing" (if not already)
   - Click **"Validate"**
4. Fix any errors that appear
   - Common issues: missing app icon, incorrect bundle ID, etc.

### Step 3.5: Distribute to App Store Connect

1. In the Organizer, select your archive
2. Click **"Distribute App"**
3. Select **"App Store Connect"**
4. Click **"Next"**
5. Choose **"Upload"** (not "Export")
6. Click **"Next"**
7. Select **"Automatically manage signing"**
8. Click **"Next"**
9. Review the summary
10. Click **"Upload"**
11. Wait for upload to complete (may take 10-30 minutes depending on size)
12. You'll see a success message when done

**Note:** The build will appear in App Store Connect in 10-60 minutes. You'll receive an email when it's ready.

---

## Phase 4: Prepare App Store Listing

### Step 4.1: Take Screenshots (Required)

**Required screenshot sizes:**

- **iPhone 6.7" Display** (iPhone 14 Pro Max, 15 Pro Max):
  - 1290 x 2796 pixels (portrait)
  - 2796 x 1290 pixels (landscape)
  
- **iPhone 6.5" Display** (iPhone 11 Pro Max, XS Max):
  - 1242 x 2688 pixels (portrait)
  - 2688 x 1242 pixels (landscape)
  
- **iPhone 5.5" Display** (iPhone 8 Plus):
  - 1242 x 2208 pixels (portrait)
  - 2208 x 1242 pixels (landscape)
  
- **iPad Pro (12.9-inch)**:
  - 2048 x 2732 pixels (portrait)
  - 2732 x 2048 pixels (landscape)

**How to take screenshots:**
1. Run your app in the iOS Simulator
2. Use **File** > **New Screen Recording** or press `Cmd + S` to take a screenshot
3. Or use the device screenshot feature (Power + Volume Up on physical devices)
4. Edit screenshots if needed (crop, add text, etc.)
5. Save in the required sizes

**Minimum requirements:**
- At least 1 screenshot for the largest device size you support
- Recommended: 3-5 screenshots showing different features
- First screenshot is the most important (shown in search results)

### Step 4.2: Write App Description

Go to **App Store** tab in App Store Connect > **App Information** > **Description**

**Example description:**

```
Practice math word problems and improve your problem-solving skills!

Math Word Problems is an educational app designed to help students and learners master word problem solving through interactive practice sessions.

Features:
• Three difficulty levels: Easy, Medium, and Hard
• 20 unique problems per difficulty level (60 total problems)
• Instant feedback with detailed explanations
• Track your progress as you solve problems
• Beautiful, modern interface designed for all ages
• Works on both iPhone and iPad
• No ads, no in-app purchases - just pure learning

Perfect for:
• Students practicing for tests
• Parents helping their children learn
• Anyone wanting to improve math skills
• Teachers looking for practice materials

Start with Easy problems and work your way up to Hard challenges. Each problem includes a clear explanation to help you understand the solution.

Download now and start improving your math skills today!
```

**Tips:**
- First 3 lines are crucial (shown in search results)
- Use bullet points for readability
- Keep it under 4000 characters
- Highlight key features
- Include keywords naturally

### Step 4.3: Add Keywords

In **App Information** > **Keywords**:

- Maximum 100 characters
- Separate with commas
- Example: `math,word problems,education,practice,learning,arithmetic,students`

**Tips:**
- Use relevant search terms
- Don't repeat words from your app name
- Research competitor apps for ideas

### Step 4.4: Add Support URL

**Required field:**

- **Support URL:** A website where users can get help
- Options:
  - Your personal website
  - GitHub repository (create a simple support page)
  - Email link: `mailto:your-email@example.com`
  - Simple landing page (GitHub Pages, Netlify, etc.)

**Example support page content:**
```html
<!DOCTYPE html>
<html>
<head>
    <title>Math Word Problems - Support</title>
</head>
<body>
    <h1>Math Word Problems - Support</h1>
    <p>For support, please email: your-email@example.com</p>
    <p>For bug reports or feature requests, visit our GitHub repository.</p>
</body>
</html>
```

### Step 4.5: Add Marketing URL (Optional)

- Optional but recommended
- Can be same as support URL or a dedicated landing page

### Step 4.6: Add App Preview Video (Optional)

- Optional but can increase conversions
- 15-30 second video showing your app in action
- Upload to App Store Connect

### Step 4.7: Set Age Rating

1. Go to **App Information** > **Age Rating**
2. Click **"Edit"**
3. Answer the questionnaire:
   - For this educational app, likely **4+** or **9+**
   - No violence, no mature content
4. Click **"Save"**

---

## Phase 5: Submit for Review

### Step 5.1: Select Build

1. In App Store Connect, go to your app
2. Go to the **App Store** tab (or **TestFlight** if testing first)
3. Under **Build**, click **"+ Version or Platform"** or **"+"** next to Build
4. Select the build you uploaded (should appear after processing)
5. If you don't see your build:
   - Wait a bit longer (can take up to an hour)
   - Check email for processing notifications
   - Verify upload was successful in Xcode Organizer

### Step 5.2: Complete Version Information

Fill in the **"What's New in This Version"** section:

**Example:**
```
Initial release of Math Word Problems!

Features:
• Three difficulty levels with 20 problems each
• Interactive problem-solving interface
• Detailed explanations for each solution
• Beautiful, modern SwiftUI design
• Support for iPhone and iPad
```

### Step 5.3: Add Review Information (Optional)

1. Scroll to **"App Review Information"**
2. **Demo Account:** Not needed for this app (no login required)
3. **Notes:** (Optional) Add any notes for reviewers:
   ```
   This is an educational app with no user accounts or data collection.
   All problems are loaded from local JSON files.
   ```

### Step 5.4: Answer Export Compliance

1. Scroll to **"Export Compliance"**
2. Answer the questions:
   - **Does your app use encryption?** → Usually "No" for simple apps
   - If unsure, answer based on your app's functionality
3. Most educational apps don't require export compliance documentation

### Step 5.5: Submit for Review

1. Review all information one more time
2. Ensure all required fields (marked with *) are filled
3. Click **"Submit for Review"** (top right)
4. Confirm submission
5. Your app status will change to **"Waiting for Review"**

---

## Phase 6: Review Process

### What Happens Next

1. **Processing** (1-24 hours)
   - Apple processes your submission
   - Status: "Waiting for Review"

2. **In Review** (24-48 hours typically)
   - Apple reviews your app
   - Status: "In Review"
   - You'll receive an email when review starts

3. **Possible Outcomes:**

   **✅ Approved:**
   - Status: "Ready for Sale" or "Pending Developer Release"
   - App appears in App Store within 24 hours
   - You'll receive an email notification

   **❌ Rejected:**
   - Status: "Rejected"
   - You'll receive an email with rejection reasons
   - Common reasons:
     - Missing privacy policy
     - App crashes
     - Doesn't match description
     - Violates guidelines
   - Fix issues and resubmit

### Monitor Status

- Check App Store Connect regularly
- Check your email for notifications
- Review typically takes 24-48 hours, can take up to 7 days

---

## Phase 7: Post-Approval

### Step 7.1: Release Your App

1. Once approved, you can:
   - **Automatic Release:** App goes live immediately
   - **Manual Release:** You control when it goes live
     - Go to App Store Connect
     - Click "Release This Version" when ready

### Step 7.2: Monitor Your App

- **App Store Connect Dashboard:**
  - View downloads
  - Monitor reviews and ratings
  - Respond to user reviews

- **Analytics:**
  - View user engagement
  - Track crashes (if enabled)
  - Monitor performance

### Step 7.3: Update Your App

When you want to release an update:

1. **In Xcode:**
   - Increment **Version** (e.g., 1.0 → 1.1)
   - Increment **Build** number (e.g., 1 → 2)
   - Make your changes
   - Archive and upload again

2. **In App Store Connect:**
   - Create new version
   - Select new build
   - Update "What's New"
   - Submit for review

---

## Optional: TestFlight Beta Testing

**Recommended before full release!**

### Step 1: Upload to TestFlight

1. After archiving, in Organizer:
   - Click **"Distribute App"**
   - Select **"App Store Connect"**
   - Choose **"Upload"**
   - Follow the same process as above

### Step 2: Set Up TestFlight

1. In App Store Connect, go to **TestFlight** tab
2. Wait for build processing (10-60 minutes)
3. Add **Internal Testers:**
   - Up to 100 testers
   - Must be added to your App Store Connect team
   - They'll receive email invites

4. Set up **External Testing** (optional):
   - Requires App Review (faster than full release)
   - Can have unlimited testers
   - Good for public beta

### Step 3: Test and Gather Feedback

- Test on various devices
- Gather feedback from testers
- Fix any issues
- Then proceed with full App Store submission

---

## Common Issues and Solutions

### Issue: "Bundle ID not found"
**Solution:** Create the App ID in Apple Developer portal first, then try again.

### Issue: "Missing app icon"
**Solution:** Add a 1024x1024 app icon in Xcode.

### Issue: "Invalid provisioning profile"
**Solution:** 
- Clean build folder
- Delete derived data
- Re-select team in Signing settings

### Issue: "Upload failed"
**Solution:**
- Check internet connection
- Verify you're signed in to correct Apple ID
- Try again (network issues are common)

### Issue: "App rejected - Missing privacy policy"
**Solution:** Add a privacy policy URL in App Information.

### Issue: "App rejected - Crashes on launch"
**Solution:**
- Test thoroughly before submission
- Check JSON files are included in bundle
- Verify all resources are properly added to target

---

## Checklist Summary

Before submitting, ensure:

- [ ] Bundle identifier is unique and registered
- [ ] Code signing is configured correctly
- [ ] App icon is added (1024x1024)
- [ ] App tested on multiple devices/simulators
- [ ] Version and build numbers are set
- [ ] App created in App Store Connect
- [ ] Privacy policy URL added
- [ ] App privacy questionnaire completed
- [ ] Screenshots taken and uploaded
- [ ] App description written
- [ ] Keywords added
- [ ] Support URL provided
- [ ] Build uploaded successfully
- [ ] Build selected in version
- [ ] All required fields completed
- [ ] App submitted for review

---

## Resources

- [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [App Store Connect Help](https://help.apple.com/app-store-connect/)
- [TestFlight Documentation](https://developer.apple.com/testflight/)
- [App Store Connect](https://appstoreconnect.apple.com)
- [Apple Developer Portal](https://developer.apple.com/account)

---

## Estimated Timeline

- **Project preparation:** 1-2 hours
- **App Store Connect setup:** 30-60 minutes
- **Archive and upload:** 30-60 minutes
- **Listing preparation:** 1-2 hours (screenshots, description)
- **Review process:** 24-48 hours (can be up to 7 days)
- **Total:** 2-3 days from start to approval (assuming no rejections)

---

**Good luck with your App Store submission! 🚀**

If you encounter any issues, refer to Apple's documentation or the troubleshooting section above.

