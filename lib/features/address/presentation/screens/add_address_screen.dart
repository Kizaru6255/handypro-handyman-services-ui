import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/widgets/app_primary_button.dart';
import '../../../../core/widgets/app_secondary_button.dart';
import '../../../../core/widgets/app_input_field.dart';
import '../../../../core/widgets/phone_input_field.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/services/permission_service.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/address_model.dart';
import '../widgets/address_map_picker.dart';
import '../providers/address_controller.dart';

/// Add Address Screen
class AddAddressScreen extends ConsumerStatefulWidget {
  const AddAddressScreen({super.key});

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _instructionsController = TextEditingController();

  LatLng? _selectedLocation;
  AddressType _selectedType = AddressType.home;
  bool _isDefault = false;
  bool _isLoadingAddress = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _houseNumberController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _landmarkController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  Future<void> _selectLocationOnMap() async {
    final result = await Navigator.push<LatLng>(
      context,
      MaterialPageRoute(
        builder: (context) => AddressMapPicker(
          initialPosition: _selectedLocation,
          onLocationSelected: (location) {},
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _selectedLocation = result;
      });
      await _getAddressFromCoordinates(result);
    }
  }

  Future<void> _getAddressFromCoordinates(LatLng location) async {
    setState(() {
      _isLoadingAddress = true;
    });

    final address = await LocationService.instance.getAddressFromCoordinates(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    if (address != null) {
      final parts = address.split(',');
      if (parts.length >= 2) {
        setState(() {
          _streetController.text = parts[0].trim();
          _cityController.text = parts[1].trim();
          if (parts.length >= 3) {
            _stateController.text = parts[2].trim();
          }
        });
      }
    }

    final city = await LocationService.instance.getCityFromCoordinates(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    if (city != null) {
      setState(() {
        _cityController.text = city;
      });
    }

    setState(() {
      _isLoadingAddress = false;
    });
  }

  Future<void> _useCurrentLocation() async {
    final hasPermission = await PermissionService.instance
        .requestLocationPermission(context);
    
    if (!hasPermission) return;

    setState(() {
      _isLoadingAddress = true;
    });

    final position = await LocationService.instance.getCurrentPosition();
    if (position != null) {
      final location = LatLng(position.latitude, position.longitude);
      setState(() {
        _selectedLocation = location;
      });
      await _getAddressFromCoordinates(location);
    }

    setState(() {
      _isLoadingAddress = false;
    });
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a location on map'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    try {
      final address = AddressModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        phoneNumber: _phoneController.text,
        houseNumber: _houseNumberController.text,
        street: _streetController.text,
        city: _cityController.text,
        state: _stateController.text,
        zipCode: _zipCodeController.text,
        latitude: _selectedLocation!.latitude,
        longitude: _selectedLocation!.longitude,
        type: _selectedType,
        isDefault: _isDefault,
        landmark: _landmarkController.text.isEmpty
            ? null
            : _landmarkController.text,
        instructions: _instructionsController.text.isEmpty
            ? null
            : _instructionsController.text,
      );

      await ref.read(addressesControllerProvider.notifier).addAddress(address);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Address added successfully'),
            backgroundColor: AppColors.success,
          ),
        );
        context.pop();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add address: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('address.add_address'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'address.add_address'.tr(),
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppInputField(
                label: 'address.address_line_1'.tr(),
                controller: _houseNumberController,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: AppSpacing.md),
              AppInputField(
                label: 'address.address_line_2'.tr(),
                controller: _streetController,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: AppInputField(
                      label: 'address.city'.tr(),
                      controller: _cityController,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppInputField(
                      label: 'address.state'.tr(),
                      controller: _stateController,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              AppInputField(
                label: 'address.zip_code'.tr(),
                controller: _zipCodeController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Location',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: AppSecondaryButton(
                      label: 'Set Location on Map',
                      onPressed: _selectLocationOnMap,
                      icon: const Icon(Icons.map),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: AppSecondaryButton(
                      label: 'Use Current Location',
                      onPressed: _useCurrentLocation,
                      icon: const Icon(Icons.my_location),
                    ),
                  ),
                ],
              ),
              if (_isLoadingAddress)
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: Center(child: CircularProgressIndicator()),
                ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'address.label'.tr(),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: AddressType.values.map((type) {
                  final isSelected = _selectedType == type;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(_getTypeLabel(type)),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              _selectedType = type;
                            });
                          }
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppInputField(
                label: 'Contact Name',
                controller: _nameController,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: AppSpacing.md),
              PhoneInputField(
                label: 'Contact Phone',
                controller: _phoneController,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: AppSpacing.md),
              AppInputField(
                label: 'Landmark (Optional)',
                controller: _landmarkController,
                maxLines: 1,
              ),
              const SizedBox(height: AppSpacing.md),
              AppInputField(
                label: 'Delivery Instructions (Optional)',
                controller: _instructionsController,
                maxLines: 3,
              ),
              const SizedBox(height: AppSpacing.lg),
              CheckboxListTile(
                title: Text('Set as default address'),
                value: _isDefault,
                onChanged: (value) {
                  setState(() {
                    _isDefault = value ?? false;
                  });
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              AppPrimaryButton(
                label: 'Save Address',
                onPressed: _saveAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTypeLabel(AddressType type) {
    switch (type) {
      case AddressType.home:
        return 'address.home'.tr();
      case AddressType.work:
        return 'address.work'.tr();
      case AddressType.other:
        return 'address.other'.tr();
    }
  }
}
