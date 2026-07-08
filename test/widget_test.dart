// Basic widget test สำหรับแอป GreenPoint
// ตรวจสอบว่าแอปเปิดขึ้นมาแล้วเจอ Bottom Navigation Bar และหน้า Partner Store

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:greenpoint_app/main.dart';

void main() {
  testWidgets('GreenPoint app renders bottom navigation and partner store page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GreenPointApp());

    // ตรวจสอบว่ามี Bottom Navigation Bar อยู่จริง
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // ตรวจสอบว่าเปิดมาที่แท็บ "ร้านค้าพาร์ทเนอร์" (มีปุ่ม "ดูรายละเอียด" ของ Featured Card)
    expect(find.text('ดูรายละเอียด'), findsWidgets);
  });
}
