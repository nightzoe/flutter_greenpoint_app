import 'package:flutter/material.dart';
import '../models/store_model.dart';
import '../theme/app_theme.dart';

/// การ์ดร้านที่คุณสนับสนุนมากที่สุด (Featured Card)
/// พื้นหลังสีเขียวอ่อน, มีรูปสินค้าด้านขวา, แถบแต้มสะสม และปุ่ม "ดูรายละเอียด"
class FeaturedStoreCard extends StatefulWidget {
  final Store store;
  final VoidCallback? onViewDetails;

  const FeaturedStoreCard({
    super.key,
    required this.store,
    this.onViewDetails,
  });

  @override
  State<FeaturedStoreCard> createState() => _FeaturedStoreCardState();
}

class _FeaturedStoreCardState extends State<FeaturedStoreCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final store = widget.store;
    final progress =
        store.totalItems == 0 ? 0.0 : store.currentPoints / store.totalItems;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGreenBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ฝั่งซ้าย: ข้อมูลร้าน
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      store.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (store.isVerified) ...[
                      const SizedBox(width: 6),
                      const Icon(Icons.verified,
                          color: AppColors.primaryGreen, size: 18),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.starYellow, size: 16),
                    const SizedBox(width: 4),
                    Text('${store.rating}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(width: 8),
                    const Text('|', style: TextStyle(color: AppColors.textSecondary)),
                    const SizedBox(width: 8),
                    Text(store.category,
                        style: const TextStyle(color: AppColors.textSecondary)),
                    const SizedBox(width: 8),
                    const Text('|', style: TextStyle(color: AppColors.textSecondary)),
                    const SizedBox(width: 8),
                    Text('${store.distanceKm} km',
                        style: const TextStyle(color: AppColors.textSecondary)),
                  ],
                ),
                const SizedBox(height: 12),
                // แถบแสดงแต้มสะสม
                Text(
                  '${store.currentPoints} GP จาก ${store.totalItems} รายการ',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.white,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primaryGreen,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: widget.onViewDetails,
                  child: const Text('ดูรายละเอียด'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // ฝั่งขวา: รูปสินค้า + ปุ่มหัวใจ
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: store.imageAsset != null
                    ? Image.asset(
                        store.imageAsset!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.white,
                        child: const Placeholder(
                          color: AppColors.primaryGreen,
                          strokeWidth: 1,
                        ),
                      ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () {
                    setState(() => _isFavorite = !_isFavorite);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 18,
                      color: _isFavorite
                          ? AppColors.notificationRed
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
