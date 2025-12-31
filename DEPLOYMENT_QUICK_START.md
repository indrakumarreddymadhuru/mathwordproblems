# App Store Deployment - Quick Start Guide

## ⚡ Quick Checklist (Before You Start)

### Prerequisites
- [ ] **Apple Developer Account** ($99/year) - [Sign up here](https://developer.apple.com)
- [ ] **Xcode** installed and updated
- [ ] **App Store Connect** access (same Apple ID as Developer account)

---

## 🚀 Step-by-Step Deployment

### Step 1: Update Bundle Identifier (REQUIRED)

**Current:** `com.yourcompany.MathWordProblems` (needs to be unique)

1. Open `project.yml`
2. Change line 3: `bundleIdPrefix: com.yourcompany` to your unique identifier
   - Example: `bundleIdPrefix: com.yourname`
3. Change line 40: `PRODUCT_BUNDLE_IDENTIFIER: com.yourcompany.MathWordProblems`
   - Example: `PRODUCT_BUNDLE_IDENTIFIER: com.yourname.MathWordProblems`
4. Regenerate Xcode project:
   ```bash
   cd /Users/indrareddy/MathWordProblems
   xcodegen generate
   ```

### Step 2: Open in Xcode

```bash
cd /Users/indrareddy/MathWordProblems
open MathWordProblems/MathWordProblems.xcodeproj
```

### Step 3: Configure Signing

1. In Xcode, click the **blue project icon** (left sidebar)
2. Select **MathWordProblems** target
3. Go to **Signing & Capabilities** tab
4. Check **"Automatically manage signing"**
5. Select your **Team** (your Apple Developer account)

### Step 4: Add App Icon (REQUIRED)

**You MUST add an app icon before submission!**

1. Create a 1024x1024 PNG image (no transparency)
2. In Xcode:
   - Select project → Target → **General** tab
   - Under **App Icons and Launch Screen**
   - Drag your icon or use Assets.xcassets

**Quick Option:** Use [AppIcon.co](https://www.appicon.co) to generate all sizes from one image.

### Step 5: Test Thoroughly

- [ ] Test on iPhone simulator
- [ ] Test on iPad simulator  
- [ ] Test all difficulty levels
- [ ] Verify JSON files load correctly
- [ ] Test navigation flows
- [ ] Check for crashes

### Step 6: Create Archive

1. In Xcode device selector (top), choose **"Any iOS Device (arm64)"**
2. Go to **Product** > **Archive**
3. Wait for build to complete
4. **Organizer** window opens automatically

### Step 7: Upload to App Store Connect

1. In Organizer, select your archive
2. Click **"Distribute App"**
3. Choose **"App Store Connect"** → **"Upload"**
4. Follow prompts (select team, automatic signing)
5. Click **"Upload"**
6. Wait 10-30 minutes for processing

### Step 8: Create App in App Store Connect

1. Go to [appstoreconnect.apple.com](https://appstoreconnect.apple.com)
2. Click **"+"** → **"New App"**
3. Fill in:
   - **Platform:** iOS
   - **Name:** Math Word Problems (or unique variation)
   - **Primary Language:** English
   - **Bundle ID:** Select the one you configured
   - **SKU:** `math-word-problems-001` (unique identifier)
4. Click **"Create"**

### Step 9: Complete App Information

**Required Fields:**

1. **App Information:**
   - Category: **Education**
   - Privacy Policy URL: **Required!** 
     - Create a simple page (GitHub Pages, your website, etc.)
     - Example: "This app does not collect, store, or share any personal data."

2. **App Privacy:**
   - Answer questions (mostly "No" for this app)
   - No data collection, no tracking

3. **Pricing:**
   - Set to **Free** (recommended)

### Step 10: Prepare App Store Listing

**Required:**
- [ ] **Screenshots** (at least 1 for largest device size)
  - Take in iOS Simulator: **File** > **New Screen Recording** or `Cmd + S`
  - Required sizes: See full guide in `APP_STORE_DEPLOYMENT.md`
  
- [ ] **App Description** (up to 4000 characters)
  - See example in `APP_STORE_DEPLOYMENT.md`
  
- [ ] **Keywords** (up to 100 characters)
  - Example: `math,word problems,education,practice,learning`

- [ ] **Support URL** (required)
  - Can be GitHub repo, your website, or email link

### Step 11: Submit for Review

1. In App Store Connect, go to your app
2. Go to **App Store** tab
3. Click **"+ Version or Platform"**
4. Select your uploaded build
5. Fill in **"What's New in This Version"**
6. Complete all required fields
7. Click **"Submit for Review"**

---

## ⏱️ Timeline

- **Setup & Upload:** 2-3 hours
- **Review Process:** 24-48 hours (can take up to 7 days)
- **Total:** 2-3 days from start to approval

---

## 📋 Pre-Submission Checklist

Before clicking "Submit for Review", verify:

- [ ] Bundle identifier is unique and registered
- [ ] Code signing configured correctly
- [ ] App icon added (1024x1024)
- [ ] App tested on multiple devices
- [ ] Version: 1.0, Build: 1
- [ ] App created in App Store Connect
- [ ] Privacy policy URL added
- [ ] App privacy questionnaire completed
- [ ] At least 1 screenshot uploaded
- [ ] App description written
- [ ] Keywords added
- [ ] Support URL provided
- [ ] Build uploaded and selected
- [ ] All required fields completed

---

## 🆘 Need Help?

- **Full detailed guide:** See `APP_STORE_DEPLOYMENT.md`
- **Apple Resources:**
  - [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
  - [App Store Connect Help](https://help.apple.com/app-store-connect/)

---

## 💡 Pro Tips

1. **TestFlight First:** Consider using TestFlight for beta testing before full release
2. **Privacy Policy:** Even simple apps need a privacy policy URL
3. **Screenshots:** First screenshot is most important (shown in search)
4. **Description:** First 3 lines are crucial (shown in search results)
5. **Keywords:** Don't repeat words from app name

---

**Good luck! 🚀**

