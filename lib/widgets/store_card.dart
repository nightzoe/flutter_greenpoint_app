import 'package:flutter/material.dart';
import '../models/store_model.dart';
import '../theme/app_theme.dart';

/// การ์ดร้านค้าทั่วไปที่ร่วมโครงการ GreenPoint แสดงเป็น List View
/// ประกอบด้วยรูปโปรไฟล์, ชื่อร้าน, คะแนน/รีวิว, แท็กคุณสมบัติ, แต้มสะสม และปุ่มดูรายละเอียด
class StoreCard extends StatelessWidget {
  final Store store;
  final VoidCallback? onViewDetails;

  const StoreCard({
    super.key,
    required this.store,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // รูปโปรไฟล์ร้าน (placeholder ไปก่อนถ้าไม่มีรูปจริง)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: store.imageAsset != null
                ? Image.asset(
                    store.imageAsset!,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 64,
                    height: 64,
                    color: AppColors.lightGreenBg,
                    child: const Icon(
                      Icons.storefront_outlined,
                      color: AppColors.primaryGreen,
                    ),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.starYellow, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${store.rating} (${store.reviewCount} รีวิว)',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (store.tags.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: store.tags
                        .map((tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.lightGreenBg,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                tag,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.primaryGreen,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${store.currentPoints} GP',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    TextButton(
                      onPressed: onViewDetails,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryGreen,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('ดูรายละเอียด'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
