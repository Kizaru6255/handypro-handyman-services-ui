# HandyPro Phase-2 Upgrade Plan

## 🎯 Overview
This document outlines the comprehensive Phase-2 upgrade plan to transform HandyPro into a premium, production-ready app matching top-tier marketplace apps.

---

## ✅ Completed (Phase-2 Start)

### Core UI Components
- ✅ `AppPrimaryButton` - Premium primary button with shadows and animations
- ✅ `AppSecondaryButton` - Outlined secondary button
- ✅ `AppInputField` - Modern input with focus states and validation
- ✅ `AppEmptyState` - Empty state component with icons
- ✅ `AppErrorState` - Error state with retry functionality
- ✅ `AppShimmer` - Shimmer loading placeholders

---

## 🚧 In Progress

### 1. Authentication Flow Enhancement
**Priority: CRITICAL**

**Tasks:**
- [ ] Enhanced Sign Up screen with country picker
- [ ] Phone number validation with country codes
- [ ] OTP auto-fill implementation
- [ ] OTP timer countdown
- [ ] Resend OTP functionality
- [ ] Forgot Password flow (email/phone)
- [ ] Session persistence with SharedPreferences
- [ ] Auto-login on app restart
- [ ] Logout functionality
- [ ] Auth guard for protected routes

**Files to Update:**
- `lib/features/auth/presentation/screens/login_screen.dart`
- `lib/features/auth/presentation/screens/phone_otp_screen.dart`
- `lib/features/auth/presentation/screens/forgot_password_screen.dart` (NEW)
- `lib/features/auth/data/auth_repository.dart`
- `lib/core/routing/app_router.dart` (add auth guard)

---

### 2. Address Module (Complete Implementation)
**Priority: CRITICAL**

**Tasks:**
- [ ] Address list screen with modern cards
- [ ] Add address screen with form validation
- [ ] Edit address screen
- [ ] Delete address with confirmation
- [ ] Set default address functionality
- [ ] Map picker integration (flutter_map)
- [ ] Geocoding service (lat/lng to address)
- [ ] Reverse geocoding (address to lat/lng)
- [ ] GPS permission handling
- [ ] Current location button
- [ ] Address tagging (Home, Work, Other)
- [ ] Form validation (name, phone, house, street, city, pin)

**Files to Create/Update:**
- `lib/features/address/data/models/address_model.dart`
- `lib/features/address/data/address_api.dart`
- `lib/features/address/data/address_repository.dart`
- `lib/features/address/presentation/screens/addresses_list_screen.dart`
- `lib/features/address/presentation/screens/add_address_screen.dart`
- `lib/features/address/presentation/screens/edit_address_screen.dart` (NEW)
- `lib/features/address/presentation/widgets/address_map_picker.dart` (NEW)
- `lib/core/services/location_service.dart` (NEW)
- `lib/core/services/permission_service.dart` (NEW)

---

### 3. Location Services
**Priority: HIGH**

**Tasks:**
- [ ] GPS permission request flow
- [ ] Permission denied dialog with guidance
- [ ] Current location detection
- [ ] City detection from coordinates
- [ ] Home screen city display
- [ ] Background location permission (for tracking)

**Files to Create:**
- `lib/core/services/location_service.dart`
- `lib/core/services/permission_service.dart`
- `lib/core/widgets/permission_dialog.dart` (NEW)

---

### 4. Search & Filters Enhancement
**Priority: HIGH**

**Tasks:**
- [ ] Filter bottom sheet modal
- [ ] Price range slider
- [ ] Rating filter (min rating)
- [ ] Distance filter
- [ ] Category multi-select
- [ ] Apply/Clear filters
- [ ] Recent searches improved UI
- [ ] Shimmer loading for results
- [ ] Debounced search input

**Files to Update:**
- `lib/features/search/presentation/screens/search_screen.dart`
- `lib/features/search/presentation/widgets/search_filter_sheet.dart` (NEW)
- `lib/features/search/presentation/widgets/price_range_slider.dart` (NEW)

---

### 5. Service Detail Enhancement
**Priority: HIGH**

**Tasks:**
- [ ] Image gallery with swipe
- [ ] Amenities/inclusions list
- [ ] FAQ section (expandable)
- [ ] Provider ratings list
- [ ] Related services section
- [ ] Share functionality

**Files to Update:**
- `lib/features/service_detail/presentation/screens/service_detail_screen.dart`
- `lib/features/service_detail/presentation/widgets/service_image_gallery.dart` (NEW)
- `lib/features/service_detail/presentation/widgets/service_amenities.dart` (NEW)
- `lib/features/service_detail/presentation/widgets/service_faq.dart` (NEW)

---

### 6. Worker Selection Enhancement
**Priority: MEDIUM**

**Tasks:**
- [ ] Sorting options (Best Rated, Nearby, Cheapest)
- [ ] Worker statistics display
- [ ] Jobs completed count
- [ ] Experience years
- [ ] Premium worker card design
- [ ] Worker profile preview

**Files to Update:**
- `lib/features/booking/presentation/screens/select_worker_screen.dart`
- `lib/features/booking/presentation/widgets/worker_card.dart` (NEW)
- `lib/features/booking/presentation/widgets/worker_sort_sheet.dart` (NEW)

---

### 7. Checkout & Payment Flow
**Priority: CRITICAL**

**Tasks:**
- [ ] Apply coupon bottom sheet
- [ ] Price breakdown display:
  - Base price
  - Service fee
  - Taxes
  - Discount
  - Total payable
- [ ] Payment method selection
- [ ] Card payment UI
- [ ] UPI payment UI (mock)
- [ ] Wallet payment option
- [ ] Payment loading state
- [ ] Payment success screen
- [ ] Payment failed screen
- [ ] Mock Razorpay/Stripe integration

**Files to Create/Update:**
- `lib/features/payment/presentation/screens/checkout_screen.dart` (ENHANCE)
- `lib/features/payment/presentation/screens/payment_methods_screen.dart` (ENHANCE)
- `lib/features/payment/presentation/screens/payment_success_screen.dart` (NEW)
- `lib/features/payment/presentation/screens/payment_failed_screen.dart` (NEW)
- `lib/features/coupon/presentation/widgets/apply_coupon_sheet.dart` (NEW)
- `lib/features/payment/presentation/widgets/price_breakdown.dart` (NEW)

---

### 8. Booking Flow Completion
**Priority: CRITICAL**

**Tasks:**
- [ ] Date picker integration
- [ ] Time slot selection
- [ ] Booking summary detail
- [ ] Cancel booking bottom sheet
- [ ] Cancel reason selection
- [ ] Review submission flow
- [ ] Enhanced booking detail:
  - Service info
  - Worker info
  - Real timeline
  - Payment details
  - Refund policy
- [ ] Status color-coded chips

**Files to Update:**
- `lib/features/booking/presentation/screens/checkout_screen.dart`
- `lib/features/booking/presentation/screens/booking_detail_screen.dart`
- `lib/features/booking/presentation/widgets/date_time_picker.dart` (NEW)
- `lib/features/booking/presentation/widgets/cancel_booking_sheet.dart` (NEW)
- `lib/features/review/presentation/screens/add_review_screen.dart` (ENHANCE)

---

### 9. Live Booking Tracking
**Priority: MEDIUM**

**Tasks:**
- [ ] Real-time status updates
- [ ] Worker profile display
- [ ] Mock worker location
- [ ] Status timeline with animations
- [ ] Map view of worker location
- [ ] Background location permission

**Files to Update:**
- `lib/features/tracking/presentation/screens/tracking_screen.dart`
- `lib/features/tracking/presentation/widgets/tracking_timeline.dart` (NEW)
- `lib/features/tracking/presentation/widgets/worker_location_map.dart` (NEW)

---

### 10. Notifications Module
**Priority: MEDIUM**

**Tasks:**
- [ ] Local notification service
- [ ] Notification list screen
- [ ] FCM placeholders
- [ ] Notification icon badge
- [ ] Notification settings

**Files to Create:**
- `lib/core/services/notification_service.dart` (NEW)
- `lib/features/notification/presentation/screens/notifications_screen.dart` (ENHANCE)
- `lib/features/notification/presentation/widgets/notification_item.dart` (NEW)

---

### 11. Favorites Module
**Priority: LOW**

**Tasks:**
- [ ] Mark/unmark favorite services
- [ ] Favorites list screen
- [ ] Modern UI with cards
- [ ] Empty state

**Files to Update:**
- `lib/features/favorites/presentation/screens/favorites_screen.dart`
- `lib/features/favorites/presentation/providers/favorites_controller.dart` (NEW)

---

### 12. Wallet Module
**Priority: MEDIUM**

**Tasks:**
- [ ] Wallet overview screen
- [ ] Transaction history
- [ ] Add money screen (mock)
- [ ] Withdraw screen (mock)
- [ ] Wallet balance display across app

**Files to Update:**
- `lib/features/wallet/presentation/screens/wallet_screen.dart`
- `lib/features/wallet/presentation/screens/add_money_screen.dart` (NEW)
- `lib/features/wallet/presentation/screens/transaction_history_screen.dart` (NEW)

---

### 13. Help & Support
**Priority: LOW**

**Tasks:**
- [ ] Help center list
- [ ] FAQ screen (expandable)
- [ ] Contact Support screen
- [ ] Chat with Support (stub)

**Files to Update:**
- `lib/features/help/presentation/screens/help_center_screen.dart`
- `lib/features/help/presentation/screens/faq_screen.dart` (NEW)
- `lib/features/help/presentation/screens/contact_support_screen.dart` (NEW)

---

### 14. Empty & Error States
**Priority: HIGH**

**Tasks:**
- [ ] Add empty states to all lists
- [ ] Add error states with retry
- [ ] Custom illustrations/icons
- [ ] Consistent styling

**Status:** ✅ Components created, need to integrate across screens

---

### 15. Dark Mode Polish
**Priority: HIGH**

**Tasks:**
- [ ] Fix card shadows in dark mode
- [ ] Fix text colors
- [ ] Fix chip colors
- [ ] Fix banner backgrounds
- [ ] Test all screens in dark mode

---

### 16. Animations & Transitions
**Priority: MEDIUM**

**Tasks:**
- [ ] Hero animations for images
- [ ] Fade transitions between screens
- [ ] Micro-interactions on buttons
- [ ] Page transitions
- [ ] List item animations

**Files to Create:**
- `lib/core/animations/page_transitions.dart` (NEW)

---

### 17. Performance Optimization
**Priority: HIGH**

**Tasks:**
- [ ] Shimmer loading (✅ Component created)
- [ ] Lazy loading for lists
- [ ] Debounced search
- [ ] Cached network images (already using)
- [ ] Riverpod state optimization with .select()

---

## 📋 Implementation Order

### Phase 2.1 - Critical Features (Week 1)
1. ✅ Premium UI Components
2. Authentication Flow Enhancement
3. Address Module (Complete)
4. Location Services

### Phase 2.2 - Core Features (Week 2)
5. Search & Filters
6. Service Detail Enhancement
7. Checkout & Payment Flow
8. Booking Flow Completion

### Phase 2.3 - Additional Features (Week 3)
9. Live Tracking
10. Notifications
11. Favorites
12. Wallet Module

### Phase 2.4 - Polish & Optimization (Week 4)
13. Help & Support
14. Empty/Error States Integration
15. Dark Mode Polish
16. Animations
17. Performance Optimization

---

## 🎨 Design Standards

### Colors
- Primary: `#2196F3` (Soft Blue)
- Success: `#4CAF50`
- Error: `#F44336`
- Warning: `#FF9800`

### Spacing
- 8pt grid system
- Standard: 4, 8, 16, 24, 32, 48

### Border Radius
- Small: 8px
- Medium: 12px
- Large: 16px
- Extra Large: 24px

### Shadows
- Card: `BoxShadow(color: black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 2))`
- Button: `BoxShadow(color: primary.withOpacity(0.3), blurRadius: 12, offset: Offset(0, 4))`

### Typography
- Headlines: Inter, Bold, 24-32px
- Body: Inter, Regular, 14-16px
- Caption: Inter, Regular, 12px

---

## 📝 Notes

- All components must be theme-aware
- All text must be localized
- All screens must have empty/error states
- All forms must have validation
- All API calls must have loading/error handling
- All navigation must be type-safe with go_router

---

**Last Updated:** December 2024  
**Status:** Phase 2.1 In Progress


