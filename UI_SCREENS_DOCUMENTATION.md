# HandyPro - UI Screens Documentation

This document lists all the UI screens implemented in the HandyPro User App.

---

## 📱 Authentication Flow

### 1. Splash Screen
**Path:** `lib/features/auth/presentation/screens/splash_screen.dart`  
**Route:** `/splash`

**Features:**
- App logo display
- App name and version
- Auto-navigation to onboarding after 2 seconds
- Clean, minimal design

**UI Elements:**
- Centered logo (circular container with icon)
- App name: "HandyPro"
- Version number display

---

### 2. Onboarding Screen
**Path:** `lib/features/auth/presentation/screens/onboarding_screen.dart`  
**Route:** `/onboarding`

**Features:**
- 3-page onboarding flow
- Page indicators (dots)
- Skip button
- Swipeable pages
- "Get Started" button

**UI Elements:**
- Large image/illustration area
- Title text (localized)
- Description text (localized)
- Page indicators (3 dots)
- Skip button (top right)
- Get Started button (bottom)

**Pages:**
1. "Let's make awesome changes to your home"
2. "Find the best service providers"
3. "Book and track your services"

---

### 3. Login / Sign Up Screen
**Path:** `lib/features/auth/presentation/screens/login_screen.dart`  
**Route:** `/login`

**Features:**
- Email/Phone login toggle
- Form validation
- Password visibility toggle
- Terms & Conditions link
- Sign In / Sign Up toggle

**UI Elements:**
- Title: "Create Your Account"
- Full Name input field
- Phone Number input field (with flag icon)
- Email input field
- Password input field (with visibility toggle)
- Sign Up button
- Terms & Conditions text with links
- "Already have an account? Sign In" link

---

### 4. Phone OTP Screen
**Path:** `lib/features/auth/presentation/screens/phone_otp_screen.dart`  
**Route:** `/phone-otp`

**Features:**
- 6-digit OTP input fields
- Auto-focus next field
- Verify button with loading state
- Resend OTP option
- Error handling with SnackBar

**UI Elements:**
- Title: "Enter OTP"
- Phone number display
- 6 individual OTP input fields (48x48 each)
- Verify button (with loading spinner)
- Resend OTP button

---

## 🏠 Main App Screens (Bottom Navigation)

### 5. Home Screen
**Path:** `lib/features/home/presentation/screens/home_screen.dart`  
**Route:** `/home/main`

**Features:**
- User greeting with avatar
- Location display
- Search bar
- Special offers banner
- Service categories (circular icons)
- Home services list
- Pull-to-refresh

**UI Elements:**
- **Header Section:**
  - User avatar (circular)
  - Greeting: "Hi, [Name] 👋"
  - Location: "Brooklyn, New York" with location icon
  - Notification bell icon

- **Search Bar:**
  - "How we can help you today?" placeholder
  - Search icon
  - Rounded corners, subtle shadow

- **Special Offers Section:**
  - Title: "Special Offers" with "See All" link
  - Large banner card with:
    - Discount percentage (e.g., "25% OFF")
    - Description text
    - Worker image
    - "Get Discount" button

- **Service Category Section:**
  - Title: "Service Category" with "See All" link
  - Horizontal scrollable list of circular category chips:
    - Cleaning
    - Cooking
    - Shipping
    - Repairing

- **Home Service Section:**
  - Title: "Home Service" with "See All" link
  - Filter chips: "All Service", "Cleaning", "Repairing", "Painting"
  - Vertical list of service cards

---

### 6. Search Screen
**Path:** `lib/features/search/presentation/screens/search_screen.dart`  
**Route:** `/home/search`

**Features:**
- Search input with filter icon
- Recent searches (chips with delete)
- Recently viewed services
- Category filter chips
- Search results list
- Empty state handling

**UI Elements:**
- **Search Bar:**
  - Search input field
  - Filter icon button

- **Recent Search Section:**
  - Title: "Recent Search" with "Clear All" button
  - Chips showing recent searches (with X to delete)

- **Recently Viewed Section:**
  - Title: "Recently Viewed"
  - List of service cards

- **Search Results Section:**
  - Category filter chips: "All Service", "Cleaning", "Repairing", "Painting"
  - "Service Found (X)" title
  - List of matching service cards
  - Empty state: "No results found"

---

### 7. Bookings List Screen
**Path:** `lib/features/booking/presentation/screens/bookings_list_screen.dart`  
**Route:** `/home/bookings`

**Features:**
- Tab bar for filtering: All, Upcoming, Completed, Canceled
- Booking cards with status badges
- Pull-to-refresh
- Empty state handling

**UI Elements:**
- **Header:**
  - Title: "My Booking"
  - Search icon
  - Calendar icon

- **Tab Bar:**
  - All Service
  - Upcoming
  - Completed
  - Canceled

- **Booking Cards:**
  - Service image (circular, 80x80)
  - Status badge (color-coded: blue for upcoming, green for completed, red for canceled)
  - Service title
  - Location with icon
  - Service details (package type, person count)
  - Date
  - Price (right-aligned)

---

### 8. Messages List Screen
**Path:** `lib/features/messages/presentation/screens/messages_list_screen.dart`  
**Route:** `/home/messages`

**Features:**
- Empty state (placeholder for future implementation)

**UI Elements:**
- Title: "Messages"
- Empty state message: "No messages yet"

---

### 9. Profile / Account Screen
**Path:** `lib/features/profile/presentation/screens/profile_screen.dart`  
**Route:** `/home/account`

**Features:**
- User profile display
- Settings menu items
- Logout option

**UI Elements:**
- **Profile Header:**
  - Large circular avatar
  - User name
  - Email address

- **Menu Items:**
  - Edit Profile
  - My Addresses
  - Payment Methods
  - Wallet
  - Favorites
  - Notifications
  - Help & Support
  - Settings
  - Logout (red text)

---

## 🔍 Service & Booking Details

### 10. Service Detail Screen
**Path:** `lib/features/service_detail/presentation/screens/service_detail_screen.dart`  
**Route:** `/service/:id`

**Features:**
- Large hero image
- Service information
- Rating and reviews
- Description
- Package selection tabs (Basic/Standard/Premium)
- Fixed bottom CTA button

**UI Elements:**
- **Hero Image:**
  - Full-width image (300px height)
  - Favorite icon (top right)
  - SliverAppBar with pinning

- **Service Info:**
  - "Top Rated" badge (if applicable)
  - Service title
  - Location with icon
  - Star rating with review count

- **Description Section:**
  - "Description" title
  - Full service description text

- **Package Selection:**
  - Tab bar: Basic, Standard, Premium
  - Package details card (gray background)
  - Description of selected package

- **Bottom CTA:**
  - Fixed button: "Select Basic ($100)" (dynamic based on selection)
  - Full-width, blue background

---

### 11. Select Worker Screen
**Path:** `lib/features/booking/presentation/screens/select_worker_screen.dart`  
**Route:** `/select-worker/:serviceId`

**Features:**
- Service header info
- Action buttons (Website, Call, Location, Share)
- Worker list with availability status
- Selection functionality
- Bottom summary with checkout button

**UI Elements:**
- **Service Header:**
  - "Top Rated" badge
  - Service title
  - Location
  - Rating display
  - Action buttons row (4 icons)

- **Worker List:**
  - "Professional (7)" title
  - Worker cards with:
    - Profile image (circular)
    - Worker name
    - Availability status ("Available" or "Booked")
    - Select/Selected button

- **Bottom Summary:**
  - "Service: Basic"
  - "Selected Worker: 1 Person"
  - Checkout button (full-width)

---

### 12. Booking Detail Screen
**Path:** `lib/features/booking/presentation/screens/booking_detail_screen.dart`  
**Route:** `/booking/:id`

**Features:**
- Large service image
- Service information
- Order progress timeline
- e-Receipt button

**UI Elements:**
- **Hero Image:**
  - Full-width image (250px height)

- **Service Info:**
  - Service title
  - Location with icon
  - Star rating with review count

- **Order Progress:**
  - "Order Progress" title
  - Timeline with steps:
    - Service Ordered (with checkmark)
    - Work Started (with checkmark)
    - Work Completed (with checkmark)
  - Each step shows:
    - Time
    - Description

- **Bottom Button:**
  - "e-Receipt" button

---

### 13. Checkout Screen
**Path:** `lib/features/booking/presentation/screens/checkout_screen.dart`  
**Route:** `/checkout`

**Features:**
- Booking summary (placeholder)
- Payment button

**UI Elements:**
- Title: "Booking Summary"
- "Pay Now" button

---

## ⚙️ Settings & Profile

### 14. Settings Screen
**Path:** `lib/features/profile/presentation/screens/settings_screen.dart`  
**Route:** `/settings`

**Features:**
- Theme settings link
- Language settings link

**UI Elements:**
- Title: "Settings"
- Theme menu item (with palette icon)
- Language menu item (with language icon)

---

### 15. Theme Settings Screen
**Path:** `lib/features/profile/presentation/screens/theme_settings_screen.dart`  
**Route:** `/settings/theme`

**Features:**
- Radio buttons for theme selection
- Real-time theme switching

**UI Elements:**
- Title: "Theme"
- Radio options:
  - Light
  - Dark
  - System

---

### 16. Localization Settings Screen
**Path:** `lib/features/profile/presentation/screens/localization_settings_screen.dart`  
**Route:** `/settings/language`

**Features:**
- Language selection
- Real-time language switching

**UI Elements:**
- Title: "Language"
- Radio options:
  - English
  - हिंदी (Hindi)

---

## 📍 Additional Feature Screens (Stubs)

### 17. Addresses List Screen
**Path:** `lib/features/address/presentation/screens/addresses_list_screen.dart`  
**Route:** `/addresses`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Addresses"
- Empty state message
- "Add Address" button

---

### 18. Add Address Screen
**Path:** `lib/features/address/presentation/screens/add_address_screen.dart`  
**Route:** `/addresses/add`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Add Address"
- Placeholder content

---

### 19. Coupons List Screen
**Path:** `lib/features/coupon/presentation/screens/coupons_list_screen.dart`  
**Route:** `/coupons`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Coupons"
- Placeholder content

---

### 20. Payment Methods Screen
**Path:** `lib/features/payment/presentation/screens/payment_methods_screen.dart`  
**Route:** `/payment-methods`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Payment Methods"
- Placeholder content

---

### 21. Wallet Screen
**Path:** `lib/features/wallet/presentation/screens/wallet_screen.dart`  
**Route:** `/wallet`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Wallet"
- Placeholder content

---

### 22. Favorites Screen
**Path:** `lib/features/favorites/presentation/screens/favorites_screen.dart`  
**Route:** `/favorites`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Favorites"
- Empty state: "No favorites yet"

---

### 23. Add Review Screen
**Path:** `lib/features/review/presentation/screens/add_review_screen.dart`  
**Route:** `/review/add/:serviceId`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Add Review"
- Placeholder content

---

### 24. Tracking Screen
**Path:** `lib/features/tracking/presentation/screens/tracking_screen.dart`  
**Route:** `/tracking/:bookingId`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Track Booking"
- Placeholder content

---

### 25. Notifications Screen
**Path:** `lib/features/notification/presentation/screens/notifications_screen.dart`  
**Route:** `/notifications`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Notifications"
- Empty state: "No notifications"

---

### 26. Help Center Screen
**Path:** `lib/features/help/presentation/screens/help_center_screen.dart`  
**Route:** `/help`

**Status:** Stub implementation  
**UI Elements:**
- Title: "Help & Support"
- Placeholder content

---

## 🎨 Design System

### Color Scheme
- **Primary Blue:** `#2196F3`
- **Success Green:** `#4CAF50`
- **Error Red:** `#F44336`
- **Warning Orange:** `#FF9800`

### Typography
- **Headlines:** Inter font, various weights
- **Body:** Inter font, regular weight
- **Buttons:** Inter font, semi-bold

### Spacing
- Uses 8pt grid system
- Standard spacing: 4, 8, 16, 24, 32, 48

### Components
- **Cards:** Rounded corners (12px), elevation 2
- **Buttons:** Rounded corners (12px), full-width option
- **Input Fields:** Rounded corners (12px), filled background
- **Badges:** Pill-shaped, rounded corners

---

## 📱 Navigation Structure

```
Splash → Onboarding → Login → OTP → Home (Bottom Nav)
                                              ├── Home
                                              ├── Search
                                              ├── Bookings
                                              ├── Messages
                                              └── Account
```

**Bottom Navigation Tabs:**
1. Home (🏠)
2. Search (🔍)
3. Bookings (📅)
4. Messages (💬)
5. Account (👤)

---

## ✨ Key Features Implemented

### ✅ Fully Implemented Screens
- Splash Screen
- Onboarding (3 pages)
- Login/Sign Up
- Phone OTP Verification
- Home Screen (with all sections)
- Search Screen (with filters)
- Bookings List (with tabs)
- Service Detail (with package selection)
- Select Worker
- Booking Detail (with progress timeline)
- Profile Screen
- Settings Screens (Theme & Language)

### 🚧 Stub Screens (Placeholders)
- Messages List
- Chat Screen
- Addresses Management
- Coupons
- Payment Methods
- Wallet
- Favorites
- Reviews
- Tracking
- Notifications
- Help Center

---

## 🎯 UI/UX Highlights

1. **Swipe Navigation:** Users can swipe between bottom nav tabs
2. **Pull-to-Refresh:** Available on Home and Bookings screens
3. **Loading States:** Buttons show loading spinners during async operations
4. **Error Handling:** SnackBar messages for errors
5. **Empty States:** Proper empty state messages for lists
6. **Dark Mode:** Full support for light and dark themes
7. **Localization:** English and Hindi language support
8. **Responsive Design:** Works on various screen sizes

---

## 📝 Notes

- All screens follow Material Design 3 guidelines
- Consistent spacing and typography throughout
- Reusable widgets in `core/widgets/` directory
- All text is localized (supports English and Hindi)
- Theme-aware colors and styling
- Smooth animations and transitions

---

**Last Updated:** December 2024  
**Version:** 1.0.0


