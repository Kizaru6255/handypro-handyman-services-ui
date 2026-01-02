import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/booking_api.dart';
import '../../data/booking_repository.dart';
import '../../data/models/booking_model.dart';
import '../../../../core/services/dio_client.dart';

/// Booking API provider
final bookingApiProvider = Provider<BookingApi>((ref) {
  final dio = ref.watch(dioClientProvider).dio;
  return BookingApi(dio);
});

/// Booking repository provider
final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  final api = ref.watch(bookingApiProvider);
  return BookingRepository(api);
});

/// Bookings controller
class BookingsController extends StateNotifier<AsyncValue<List<BookingModel>>> {
  BookingsController(this._repository)
      : super(const AsyncValue.loading()) {
    loadBookings();
  }

  final BookingRepository _repository;

  Future<void> loadBookings({String? status}) async {
    state = const AsyncValue.loading();
    try {
      final bookings = await _repository.getBookings(status: status);
      state = AsyncValue.data(bookings);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() => loadBookings();
}

/// Bookings controller provider
final bookingsControllerProvider =
    StateNotifierProvider<BookingsController, AsyncValue<List<BookingModel>>>(
  (ref) {
    final repository = ref.watch(bookingRepositoryProvider);
    return BookingsController(repository);
  },
);


