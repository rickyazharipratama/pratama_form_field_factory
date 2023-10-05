import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pratama_form_field_factory_platform_interface.dart';

/// An implementation of [PratamaFormFieldFactoryPlatform] that uses method channels.
class MethodChannelPratamaFormFieldFactory extends PratamaFormFieldFactoryPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pratama_form_field_factory');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
