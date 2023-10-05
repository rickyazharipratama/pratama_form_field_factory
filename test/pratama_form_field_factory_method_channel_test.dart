import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelPratamaFormFieldFactory platform = MethodChannelPratamaFormFieldFactory();
  const MethodChannel channel = MethodChannel('pratama_form_field_factory');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
