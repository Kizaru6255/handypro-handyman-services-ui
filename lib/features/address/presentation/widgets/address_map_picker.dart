import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/services/permission_service.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_secondary_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Map picker widget for selecting address location
class AddressMapPicker extends StatefulWidget {
  const AddressMapPicker({
    super.key,
    this.initialPosition,
    required this.onLocationSelected,
  });

  final LatLng? initialPosition;
  final ValueChanged<LatLng> onLocationSelected;

  @override
  State<AddressMapPicker> createState() => _AddressMapPickerState();
}

class _AddressMapPickerState extends State<AddressMapPicker> {
  final MapController _mapController = MapController();
  LatLng? _selectedPosition;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedPosition = widget.initialPosition;
    _loadCurrentLocation();
  }

  Future<void> _loadCurrentLocation() async {
    if (widget.initialPosition != null) {
      _selectedPosition = widget.initialPosition;
      _mapController.move(widget.initialPosition!, 15.0);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final hasPermission = await PermissionService.instance
        .requestLocationPermission(context);
    
    if (hasPermission) {
      final position = await LocationService.instance.getCurrentPosition();
      if (position != null) {
        setState(() {
          _selectedPosition = LatLng(position.latitude, position.longitude);
          _isLoading = false;
        });
        _mapController.move(_selectedPosition!, 15.0);
        widget.onLocationSelected(_selectedPosition!);
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onMapTap(TapPosition tapPosition, LatLng point) {
    setState(() {
      _selectedPosition = point;
    });
    widget.onLocationSelected(point);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _selectedPosition ?? const LatLng(40.7128, -74.0060),
            initialZoom: 15.0,
            onTap: _onMapTap,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.handypro.app',
            ),
            MarkerLayer(
              markers: _selectedPosition != null
                  ? [
                      Marker(
                        point: _selectedPosition!,
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_on,
                          color: AppColors.error,
                          size: 40,
                        ),
                      ),
                    ]
                  : [],
            ),
          ],
        ),
        Positioned(
          top: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: _loadCurrentLocation,
            child: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.my_location),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.primaryBlue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _selectedPosition != null
                              ? 'Lat: ${_selectedPosition!.latitude.toStringAsFixed(6)}, Lng: ${_selectedPosition!.longitude.toStringAsFixed(6)}'
                              : 'Tap on map to select location',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppPrimaryButton(
                    label: 'Use This Location',
                    onPressed: _selectedPosition != null
                        ? () {
                            Navigator.pop(context, _selectedPosition);
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


