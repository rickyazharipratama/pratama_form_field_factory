import 'package:flutter_test/flutter_test.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory_platform_interface.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPratamaFormFieldFactoryPlatform
    with MockPlatformInterfaceMixin
    implements PratamaFormFieldFactoryPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PratamaFormFieldFactoryPlatform initialPlatform = PratamaFormFieldFactoryPlatform.instance;

  test('$MethodChannelPratamaFormFieldFactory is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPratamaFormFieldFactory>());
  });

  // test('getPlatformVersion', () async {
  //   PratamaFormFieldFactory pratamaFormFieldFactoryPlugin = PratamaFormFieldFactory();
  //   MockPratamaFormFieldFactoryPlatform fakePlatform = MockPratamaFormFieldFactoryPlatform();
  //   PratamaFormFieldFactoryPlatform.instance = fakePlatform;

  //   expect(await pratamaFormFieldFactoryPlugin.getPlatformVersion(), '42');
  // });
}
