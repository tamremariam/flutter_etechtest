import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  /// Requests permission for the specified [permission].
  /// Returns `true` if the permission is granted.
  static Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    return status.isGranted;
  }

  /// Requests permission to access contacts.
  static Future<bool> requestContactsPermission() async {
    return requestPermission(Permission.contacts);
  }

  /// Requests permission to access the photo library.
  static Future<bool> requestPhotosPermission() async {
    return requestPermission(Permission.photos);
  }

  /// Requests permission to access location.
  static Future<bool> requestLocationPermission() async {
    return requestPermission(Permission.location);
  }

  /// Requests permission to access the camera.
  static Future<bool> requestCameraPermission() async {
    return requestPermission(Permission.camera);
  }
}
