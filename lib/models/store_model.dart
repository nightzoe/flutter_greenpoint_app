import 'package:flutter/material.dart';

/// หมวดหมู่ร้านค้า ใช้กับ Category Tabs ด้านบนของหน้า Partner Store
class StoreCategory {
  final String label;
  final IconData icon;

  const StoreCategory({required this.label, required this.icon});

  static const List<StoreCategory> categories = [
    StoreCategory(label: 'ทั้งหมด', icon: Icons.apps),
    StoreCategory(label: 'คาเฟ่', icon: Icons.local_cafe_outlined),
    StoreCategory(label: 'ร้านอาหาร', icon: Icons.restaurant_outlined),
    StoreCategory(label: 'ช้อปปิ้ง', icon: Icons.shopping_bag_outlined),
  ];
}

/// โมเดลข้อมูลร้านค้าหนึ่งร้าน ใช้ทั้งกับ Featured Card และ List ทั่วไป
class Store {
  final String name;
  final bool isVerified;
  final double rating;
  final int reviewCount;
  final String category;
  final double distanceKm;
  final int currentPoints;
  final int totalItems; // จำนวนรายการที่ต้องสะสมครบ (เช่น "0 GP จาก 8 รายการ")
  final List<String> tags;
  final String? imageAsset; // null = ใช้ Placeholder ไปก่อน
  final bool isFeatured;

  const Store({
    required this.name,
    this.isVerified = false,
    required this.rating,
    this.reviewCount = 0,
    required this.category,
    required this.distanceKm,
    this.currentPoints = 0,
    this.totalItems = 0,
    this.tags = const [],
    this.imageAsset,
    this.isFeatured = false,
  });
}

/// ข้อมูลตัวอย่าง (Mock Data) ตาม UI ที่ระบุไว้ - ใช้แทนการเรียก API จริงไปก่อน
class MockStoreData {
  static const Store featuredStore = Store(
    name: '11',
    isVerified: true,
    rating: 4.8,
    category: 'คาเฟ่',
    distanceKm: 116.4,
    currentPoints: 0,
    totalItems: 8,
    isFeatured: true,
  );

  static const List<Store> generalStores = [
    Store(
      name: 'G1',
      rating: 4.3,
      reviewCount: 99,
      category: 'คาเฟ่',
      distanceKm: 3.2,
      currentPoints: 0,
      tags: ['รักษ์โลก', 'Eco-Friendly', 'แก้วพกพา'],
    ),
    Store(
      name: 'Light up cafe x Nimman',
      rating: 4.2,
      reviewCount: 22,
      category: 'คาเฟ่',
      distanceKm: 5.6,
      currentPoints: 0,
      tags: ['Eco-Friendly'],
    ),
  ];
}
