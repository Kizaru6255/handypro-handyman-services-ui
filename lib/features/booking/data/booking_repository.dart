import 'booking_api.dart';
import 'models/booking_model.dart';

/// Booking repository
class BookingRepository {
  BookingRepository(this._api);

  final BookingApi _api;

  Future<List<BookingModel>> getBookings({String? status}) =>
      _api.getBookings(status: status);

  Future<BookingModel> getBookingDetail(String bookingId) =>
      _api.getBookingDetail(bookingId);
}


