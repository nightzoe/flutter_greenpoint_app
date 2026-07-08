# GreenPoint - Flutter Starter Project

## โครงสร้างโฟลเดอร์

```
greenpoint_app/
├── pubspec.yaml
└── lib/
    ├── main.dart                        # Entry point, MaterialApp + Theme
    ├── theme/
    │   └── app_theme.dart               # สี Eco-Green และ ThemeData (Material 3)
    ├── models/
    │   └── store_model.dart             # โมเดล Store, StoreCategory และ Mock Data
    ├── pages/
    │   ├── home_page.dart               # หน้าคุม Bottom Navigation Bar (4 เมนู)
    │   ├── partner_store_page.dart      # หน้า Partner Store Page ตาม UI ที่ระบุ
    │   └── placeholder_pages.dart       # หน้า Home / Scan / Profile (Coming Soon)
    └── widgets/
        ├── category_tab.dart            # CategoryTabBar + StoreViewToggle
        ├── featured_store_card.dart     # การ์ดร้านไฮไลท์ (พื้นหลังเขียวอ่อน)
        └── store_card.dart              # การ์ดร้านค้าทั่วไปแบบ List
```

## วิธีติดตั้งและรันบน AntGvity IDE / Android Studio

1. คัดลอกโฟลเดอร์ `greenpoint_app` ทั้งหมดไปวางในพื้นที่โปรเจกต์ของคุณ
2. เปิด terminal ที่ root ของโปรเจกต์ แล้วรัน:
   ```
   flutter pub get
   ```
3. เชื่อมต่ออุปกรณ์/emulator แล้วรัน:
   ```
   flutter run
   ```
4. เปิดโปรเจกต์นี้ใน Android Studio ได้โดยตรง (Open an existing project → เลือกโฟลเดอร์ `greenpoint_app`) เพราะโครงสร้างเป็น Flutter project มาตรฐาน

## หมายเหตุสำคัญ

- **รูปภาพ**: ทุกจุดที่ต้องใช้รูปสินค้า/โปรไฟล์ร้าน ตอนนี้ใช้ `Placeholder` widget หรือ `Icons` มาตรฐานแทนไปก่อน เพื่อไม่ให้เกิด error "Unable to load asset" ตอนรันครั้งแรก
  - เมื่อมีรูปจริงแล้ว ให้สร้างโฟลเดอร์ `assets/images/` ใส่ path ใน `pubspec.yaml` (มี comment เตรียมไว้ให้แล้ว) แล้วเปลี่ยน `imageAsset: null` ใน `store_model.dart` ให้เป็น path รูปจริง เช่น `'assets/images/lays.png'`
- **ข้อมูลร้านค้า**: อยู่ใน `models/store_model.dart` คลาส `MockStoreData` เป็นข้อมูลจำลองตามที่ระบุ (ร้าน "11", "G1", "Light up cafe x Nimman") พร้อมต่อยอดเป็นการดึงจาก API/Firestore ได้โดยแค่เปลี่ยนแหล่งข้อมูลตรงนี้
- **State Management**: ปัจจุบันใช้ `setState` แบบง่ายใน `home_page.dart` (สลับแท็บ) และ `partner_store_page.dart` (สลับหมวดหมู่/มุมมอง) โครงสร้างแยกไฟล์ไว้ชัดเจนแล้ว พร้อมแปลงเป็น Provider/Riverpod/Bloc ได้ในภายหลังโดยไม่ต้องรื้อ UI
- **Bottom Navigation**: ควบคุมด้วย `IndexedStack` ใน `home_page.dart` เพื่อรักษาสถานะของแต่ละแท็บไว้เมื่อสลับไปมา เริ่มต้นเปิดที่แท็บ "ร้านค้าพาร์ทเนอร์" ตามที่ระบุว่าเป็นหน้าที่กำลังเปิดอยู่
- **แผนที่ (Map)**: ตอนนี้เป็น placeholder เฉยๆ เมื่อพร้อมเชื่อมต่อ Google Maps จริง ให้เพิ่ม package `google_maps_flutter` แล้วแทนที่ `_buildMapPlaceholder()` ใน `partner_store_page.dart`
