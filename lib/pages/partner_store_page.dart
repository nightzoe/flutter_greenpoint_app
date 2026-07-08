import 'package:flutter/material.dart';
import '../models/store_model.dart';
import '../theme/app_theme.dart';
import '../widgets/category_tab.dart';
import '../widgets/featured_store_card.dart';
import '../widgets/store_card.dart';

/// หน้าจอหลัก "Partner Store Page"
/// - Header: search bar + filter + กระดิ่งแจ้งเตือน
/// - Category Tabs
/// - Sub-tabs: รายชื่อร้าน / แผนที่
/// - Featured Card
/// - List ร้านค้าทั่วไป
class PartnerStorePage extends StatefulWidget {
  const PartnerStorePage({super.key});

  @override
  State<PartnerStorePage> createState() => _PartnerStorePageState();
}

class _PartnerStorePageState extends State<PartnerStorePage> {
  int _selectedCategoryIndex = 0;
  bool _isListView = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onViewDetails(String storeName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('ดูรายละเอียดร้าน: $storeName')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // ----- Header -----
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: AppColors.textSecondary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              hintText: 'ค้นหาร้านค้า',
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: AppColors.primaryGreen),
                    onPressed: () {},
                    tooltip: 'ตัวกรอง',
                  ),
                ),
                const SizedBox(width: 8),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.notifications_none,
                            color: AppColors.textPrimary),
                        onPressed: () {},
                        tooltip: 'การแจ้งเตือน',
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.notificationRed,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ----- Category Tabs -----
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CategoryTabBar(
              selectedIndex: _selectedCategoryIndex,
              onCategorySelected: (index) {
                setState(() => _selectedCategoryIndex = index);
              },
            ),
          ),

          const SizedBox(height: 16),

          // ----- Sub-Tabs: รายชื่อร้าน / แผนที่ -----
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StoreViewToggle(
              isListView: _isListView,
              onToggle: (value) => setState(() => _isListView = value),
            ),
          ),

          const SizedBox(height: 16),

          // ----- เนื้อหาหลัก -----
          Expanded(
            child: _isListView
                ? ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      // Featured Card
                      FeaturedStoreCard(
                        store: MockStoreData.featuredStore,
                        onViewDetails: () =>
                            _onViewDetails(MockStoreData.featuredStore.name),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'ร้านค้าที่ร่วมโครงการ GreenPoint',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // รายการร้านค้าทั่วไป
                      ...MockStoreData.generalStores.map(
                        (store) => StoreCard(
                          store: store,
                          onViewDetails: () => _onViewDetails(store.name),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                : _buildMapPlaceholder(),
          ),
        ],
      ),
    );
  }

  /// มุมมองแผนที่ - ใช้ Placeholder ไปก่อน (ต่อยอดด้วย google_maps_flutter ภายหลังได้)
  Widget _buildMapPlaceholder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.map_outlined, size: 48, color: AppColors.textSecondary),
              SizedBox(height: 8),
              Text(
                'มุมมองแผนที่ (Map View)\nรอเชื่อมต่อ Google Maps API',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
