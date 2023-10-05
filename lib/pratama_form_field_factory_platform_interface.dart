import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pratama_form_field_factory_method_channel.dart';

abstract class PratamaFormFieldFactoryPlatform extends PlatformInterface {
  /// Constructs a PratamaFormFieldFactoryPlatform.
  PratamaFormFieldFactoryPlatform() : super(token: _token);

  static final Object _token = Object();

  static PratamaFormFieldFactoryPlatform _instance = MethodChannelPratamaFormFieldFactory();

  /// The default instance of [PratamaFormFieldFactoryPlatform] to use.
  ///
  /// Defaults to [MethodChannelPratamaFormFieldFactory].
  static PratamaFormFieldFactoryPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PratamaFormFieldFactoryPlatform] when
  /// they register themselves.
  static set instance(PratamaFormFieldFactoryPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
