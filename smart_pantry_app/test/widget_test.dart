import 'package:flutter_test/flutter_test.dart';

import 'package:smart_pantry_app/main.dart';

void main() {
  testWidgets('App starts without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Good Morning, Alex'), findsOneWidget);
  });
}
