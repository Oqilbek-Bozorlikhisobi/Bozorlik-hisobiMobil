import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static PackageInfo? _packageInfo;

  /// Initialize once (e.g., in main before runApp)
  static Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  /// Returns app version like "1.0.0"
  static String get version => _packageInfo?.version ?? 'Unknown';

  /// Returns build number like "1"
  static String get buildNumber => _packageInfo?.buildNumber ?? '0';

  /// Returns version with build e.g. "1.0.0+1"
  static String get fullVersion =>
      "${_packageInfo?.version ?? 'Unknown'}+${_packageInfo?.buildNumber ?? '0'}";
}
