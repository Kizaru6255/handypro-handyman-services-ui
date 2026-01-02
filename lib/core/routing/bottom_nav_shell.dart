import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_bottom_nav_bar.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/booking/presentation/screens/bookings_list_screen.dart';
import '../../features/messages/presentation/screens/messages_list_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

/// Shell route widget for bottom navigation with swipe support
class BottomNavShell extends StatefulWidget {
  const BottomNavShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<BottomNavShell> createState() => _BottomNavShellState();
}

class _BottomNavShellState extends State<BottomNavShell> {
  late PageController _pageController;
  int _currentIndex = 0;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Initialize with default index, will be updated in didChangeDependencies
    _currentIndex = 0;
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home/main')) return 0;
    if (location.startsWith('/home/search')) return 1;
    if (location.startsWith('/home/bookings')) return 2;
    if (location.startsWith('/home/messages')) return 3;
    if (location.startsWith('/home/account')) return 4;
    return 0;
  }

  void _onPageChanged(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      // Navigate to the corresponding route
      switch (index) {
        case 0:
          context.go('/home/main');
          break;
        case 1:
          context.go('/home/search');
          break;
        case 2:
          context.go('/home/bookings');
          break;
        case 3:
          context.go('/home/messages');
          break;
        case 4:
          context.go('/home/account');
          break;
      }
    }
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final location = GoRouterState.of(context).uri.path;
      // Only update if we're on a main tab route
      if (location.startsWith('/home/')) {
        final newIndex = _getCurrentIndex(context);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              _currentIndex = newIndex;
            });
            if (_pageController.hasClients && _pageController.page?.round() != newIndex) {
              _pageController.jumpToPage(newIndex);
            }
          }
        });
        _isInitialized = true;
      }
    } else {
      // Update index when route changes after initialization
      final location = GoRouterState.of(context).uri.path;
      if (location.startsWith('/home/')) {
        final newIndex = _getCurrentIndex(context);
        if (newIndex != _currentIndex && _pageController.hasClients) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _currentIndex = newIndex;
              });
              if (_pageController.page?.round() != newIndex) {
                _pageController.jumpToPage(newIndex);
              }
            }
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // List of all tab screens
    final pages = const [
      HomeScreen(),
      SearchScreen(),
      BookingsListScreen(),
      MessagesListScreen(),
      ProfileScreen(),
    ];

    // Check if we're on a nested route (like /service/:id)
    final location = GoRouterState.of(context).uri.path;
    final isNestedRoute = !location.startsWith('/home/');

    return Scaffold(
      body: isNestedRoute
          ? widget.child // Show the nested route (like service detail)
          : PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: const BouncingScrollPhysics(),
              children: pages,
            ),
      bottomNavigationBar: isNestedRoute
          ? null // Hide bottom nav on nested routes
          : AppBottomNavBar(
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
            ),
    );
  }
}
