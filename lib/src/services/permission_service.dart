import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

mixin class PermissionsService {
  Future<void> settingsAppOpener() async {
    await openAppSettings();
  }

  Future<bool> manageExternalStoragePermission() async {
    if (Platform.isIOS) return true;
    bool permission = await Permission.manageExternalStorage.request().isGranted;
    if (!permission) {
      await openAppSettings();
      permission = await Permission.manageExternalStorage.request().isGranted;
    }
    return permission;
  }

  Future<bool> storagePermission({bool checkOnceAgain = false}) async {
    bool permission = false;
    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt > 32) {
        permission = await Permission.photos.request().isGranted;
      }
    } else {
      permission = await Permission.storage.request().isGranted;
    }

    if (!permission && !checkOnceAgain) {
      await openAppSettings();
      permission = await storagePermission(checkOnceAgain: true);
    }

    return permission;
  }
}
