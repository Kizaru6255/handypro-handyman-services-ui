import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

/// Permission service for handling app permissions
class PermissionService {
  PermissionService._();

  static final PermissionService _instance = PermissionService._();
  static PermissionService get instance => _instance;

  /// Request location permission with dialog
  Future<bool> requestLocationPermission(BuildContext context) async {
    final status = await Permission.location.request();
    
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      _showPermissionDeniedDialog(context, 'Location');
      return false;
    }
    
    return false;
  }

  /// Request camera permission
  Future<bool> requestCameraPermission(BuildContext context) async {
    final status = await Permission.camera.request();
    
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      _showPermissionDeniedDialog(context, 'Camera');
      return false;
    }
    
    return false;
  }

  /// Request notification permission
  Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  /// Show permission denied dialog
  void _showPermissionDeniedDialog(BuildContext context, String permission) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$permission Permission Required'),
        content: Text(
          'Please enable $permission permission in app settings to continue.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  /// Check if permission is granted
  Future<bool> isPermissionGranted(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }
}


