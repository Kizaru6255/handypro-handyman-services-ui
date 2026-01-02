import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/phone_otp_screen.dart';
import '../../features/auth/presentation/screens/enhanced_otp_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/enhanced_login_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/booking/presentation/screens/bookings_list_screen.dart';
import '../../features/messages/presentation/screens/messages_list_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/service_detail/presentation/screens/service_detail_screen.dart';
import '../../features/booking/presentation/screens/booking_detail_screen.dart';
import '../../features/booking/presentation/screens/select_worker_screen.dart';
import '../../features/booking/presentation/screens/checkout_screen.dart';
import '../../features/profile/presentation/screens/settings_screen.dart';
import '../../features/profile/presentation/screens/theme_settings_screen.dart';
import '../../features/profile/presentation/screens/localization_settings_screen.dart';
import '../../features/address/presentation/screens/addresses_list_screen.dart';
import '../../features/address/presentation/screens/add_address_screen.dart';
import '../../features/address/presentation/screens/edit_address_screen.dart';
import '../../features/coupon/presentation/screens/coupons_list_screen.dart';
import '../../features/payment/presentation/screens/payment_methods_screen.dart';
import '../../features/payment/presentation/screens/payment_success_screen.dart';
import '../../features/payment/presentation/screens/payment_failed_screen.dart';
import '../../features/wallet/presentation/screens/wallet_screen.dart';
import '../../features/wallet/presentation/screens/add_money_screen.dart';
import '../../features/wallet/presentation/screens/transaction_history_screen.dart';
import '../../features/favorites/presentation/screens/favorites_screen.dart';
import '../../features/review/presentation/screens/add_review_screen.dart';
import '../../features/tracking/presentation/screens/tracking_screen.dart';
import '../../features/notification/presentation/screens/notifications_screen.dart';
import '../../features/help/presentation/screens/help_center_screen.dart';
import '../../features/review/presentation/screens/add_review_screen.dart';
import 'bottom_nav_shell.dart';

/// App router configuration
final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const EnhancedLoginScreen(),
    ),
    GoRoute(
      path: '/phone-otp',
      builder: (context, state) {
        final phoneNumber = state.extra as String? ?? '+1 (409) 487-1935';
        return EnhancedOtpScreen(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => BottomNavShell(child: child),
      routes: [
        GoRoute(
          path: '/home/main',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/home/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/home/bookings',
          builder: (context, state) => const BookingsListScreen(),
        ),
        GoRoute(
          path: '/home/messages',
          builder: (context, state) => const MessagesListScreen(),
        ),
        GoRoute(
          path: '/home/account',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/service/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ServiceDetailScreen(serviceId: id);
      },
    ),
    GoRoute(
      path: '/booking/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BookingDetailScreen(bookingId: id);
      },
    ),
    GoRoute(
      path: '/select-worker/:serviceId',
      builder: (context, state) {
        final serviceId = state.pathParameters['serviceId']!;
        return SelectWorkerScreen(serviceId: serviceId);
      },
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/settings/theme',
      builder: (context, state) => const ThemeSettingsScreen(),
    ),
    GoRoute(
      path: '/settings/language',
      builder: (context, state) => const LocalizationSettingsScreen(),
    ),
    GoRoute(
      path: '/addresses',
      builder: (context, state) => const AddressesListScreen(),
    ),
    GoRoute(
      path: '/addresses/add',
      builder: (context, state) => const AddAddressScreen(),
    ),
    GoRoute(
      path: '/addresses/edit/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return EditAddressScreen(addressId: id);
      },
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/payment/process',
      builder: (context, state) {
        // Mock payment processing
        return PaymentSuccessScreen(
          bookingId: 'BK${DateTime.now().millisecondsSinceEpoch}',
          amount: 103.55,
        );
      },
    ),
    GoRoute(
      path: '/payment/success/:bookingId',
      builder: (context, state) {
        final bookingId = state.pathParameters['bookingId']!;
        return PaymentSuccessScreen(
          bookingId: bookingId,
          amount: 103.55,
        );
      },
    ),
    GoRoute(
      path: '/payment/failed',
      builder: (context, state) {
        final error = state.uri.queryParameters['error'] ?? 'Payment failed';
        return PaymentFailedScreen(errorMessage: error);
      },
    ),
    GoRoute(
      path: '/coupons',
      builder: (context, state) => const CouponsListScreen(),
    ),
    GoRoute(
      path: '/payment-methods',
      builder: (context, state) => const PaymentMethodsScreen(),
    ),
    GoRoute(
      path: '/wallet',
      builder: (context, state) => const WalletScreen(),
    ),
    GoRoute(
      path: '/wallet/add-money',
      builder: (context, state) => const AddMoneyScreen(),
    ),
    GoRoute(
      path: '/wallet/transactions',
      builder: (context, state) => const TransactionHistoryScreen(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/review/add/:bookingId',
      builder: (context, state) {
        final bookingId = state.pathParameters['bookingId'] ?? '';
        return AddReviewScreen(bookingId: bookingId);
      },
    ),
    GoRoute(
      path: '/tracking/:bookingId',
      builder: (context, state) {
        final bookingId = state.pathParameters['bookingId'] ?? '';
        return TrackingScreen(bookingId: bookingId);
      },
    ),
    GoRoute(
      path: '/review/:bookingId',
      builder: (context, state) {
        final bookingId = state.pathParameters['bookingId'] ?? '';
        return AddReviewScreen(bookingId: bookingId);
      },
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/help',
      builder: (context, state) => const HelpCenterScreen(),
    ),
  ],
);

