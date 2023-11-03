import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'otpless_flutter_method_channel.dart';

abstract class OtplessFlutterPlatform extends PlatformInterface {

  OtplessFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static OtplessFlutterPlatform _instance = MethodChannelOtplessFlutter();



  /// Defaults to [MethodChannelOtplessFlutter].
  static OtplessFlutterPlatform get instance => _instance;
  

  static set instance(OtplessFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
