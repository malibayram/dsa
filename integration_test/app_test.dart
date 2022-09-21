import 'package:dsa/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'test description',
    // config: PatrolTestConfig(),
    (PatrolTester $) async {
      await $.pumpWidgetAndSettle(const MyApp());
      await $('Bubble Sort').tap();
      await $('Sorted').waitUntilVisible(timeout: const Duration(minutes: 5));
      await $('Reset').tap();
      await $('Selection Sort').tap();
      await $('Sorted').waitUntilVisible(timeout: const Duration(minutes: 5));
      await $('Reset').tap();
      await $('Insertion Sort').tap();
      await $('Sorted').waitUntilVisible(timeout: const Duration(minutes: 5));
      await $('Reset').tap();
      // more test code
    },
  );
}
