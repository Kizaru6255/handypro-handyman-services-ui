import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/services/permission_service.dart';

/// Location provider for current city
class LocationProvider extends StateNotifier<AsyncValue<String?>> {
  LocationProvider() : super(const AsyncValue.loading()) {
    _loadCity();
  }

  Future<void> _loadCity() async {
    state = const AsyncValue.loading();
    try {
      // For now, skip permission check in provider
      // Permission should be requested in UI
      final hasPermission = true;
      
      if (!hasPermission) {
        state = const AsyncValue.data('New York'); // Default
        return;
      }

      final position = await LocationService.instance.getCurrentPosition();
      if (position != null) {
        final city = await LocationService.instance.getCityFromCoordinates(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        state = AsyncValue.data(city ?? 'New York');
      } else {
        state = const AsyncValue.data('New York');
      }
    } catch (e) {
      state = const AsyncValue.data('New York');
    }
  }

  Future<void> refresh() => _loadCity();
}

/// Location provider
final locationProvider =
    StateNotifierProvider<LocationProvider, AsyncValue<String?>>(
  (ref) => LocationProvider(),
);

