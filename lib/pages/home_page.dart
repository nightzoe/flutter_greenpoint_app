import 'package:flutter/material.dart';
import 'partner_store_page.dart';
import 'placeholder_pages.dart';

/// Widget หลักที่คุม Bottom Navigation Bar 4 เมนู: Home, Partner Store, Scan, Profile
/// ใช้ setState แบบง่าย พร้อมต่อยอดเป็น Provider/Bloc ได้ในอนาคต
/// (เช่น เปลี่ยน _selectedIndex ให้มาจาก ChangeNotifier แทน)
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // เริ่มต้นที่แท็บ "Partner Store" (index 1) ตามที่ระบุว่าเป็นหน้าที่กำลังเปิดอยู่
  int _selectedIndex = 1;

  static const List<Widget> _pages = [
    PlaceholderTabPage(title: 'หน้าแรก', icon: Icons.home_outlined),
    PartnerStorePage(),
    PlaceholderTabPage(title: 'สแกน QR', icon: Icons.qr_code_scanner),
    PlaceholderTabPage(title: 'โปรไฟล์', icon: Icons.person_outline),
  ];

  void _onNavTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ใช้ IndexedStack เพื่อรักษา state ของแต่ละหน้าไว้เมื่อสลับแท็บ
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            activeIcon: Icon(Icons.storefront),
            label: 'ร้านค้าพาร์ทเนอร์',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'สแกน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}
