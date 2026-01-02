import 'package:dio/dio.dart';
import 'models/booking_model.dart';

/// Booking API
class BookingApi {
  BookingApi(this._dio);

  final Dio _dio;

  Future<List<BookingModel>> getBookings({
    String? status,
  }) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      BookingModel(
        id: '1',
        serviceId: '1',
        serviceTitle: 'House Cleaning Service',
        serviceImageUrl: 'https://via.placeholder.com/400x300',
        workerId: '1',
        workerName: 'Ethan Walker',
        workerImageUrl: 'https://via.placeholder.com/100',
        location: 'San Francisco, CA',
        date: DateTime(2024, 5, 20),
        status: BookingStatus.pending,
        packageType: 'Basic',
        price: 100,
        fee: 3.55,
        total: 103.55,
      ),
      BookingModel(
        id: '2',
        serviceId: '2',
        serviceTitle: 'HVAC Maintenance Service',
        serviceImageUrl: 'https://via.placeholder.com/400x300',
        workerId: '2',
        workerName: 'Benjamin Cruz',
        workerImageUrl: 'https://via.placeholder.com/100',
        location: 'San Francisco, CA',
        date: DateTime(2024, 5, 20),
        status: BookingStatus.completed,
        packageType: 'Basic',
        price: 100,
        fee: 3.55,
        total: 103.55,
      ),
    ];
  }

  Future<BookingModel> getBookingDetail(String bookingId) async {
    // Mock implementation
    await Future.delayed(const Duration(milliseconds: 500));
    return BookingModel(
      id: bookingId,
      serviceId: '1',
      serviceTitle: 'House Cleaning Service',
      serviceImageUrl: 'https://via.placeholder.com/800x400',
      workerId: '1',
      workerName: 'Atnan Walker',
      workerImageUrl: 'https://via.placeholder.com/100',
      location: 'New York, California',
      date: DateTime(2024, 12, 22),
      status: BookingStatus.completed,
      packageType: 'Basic Package',
      price: 450,
      fee: 1.55,
      total: 45.55,
    );
  }
}

