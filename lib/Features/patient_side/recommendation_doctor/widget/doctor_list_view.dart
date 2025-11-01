import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:health_care_app/Features/patient_side/home_screen/model/recomendation_doctor.dart';
import 'package:health_care_app/core/constants/colors.dart';
import 'package:health_care_app/core/constants/sizes.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({
    super.key,
    required this.items,
    this.onTap, // اختياري
  });

  final List<RecomendationDoctorModel> items;
  final void Function(RecomendationDoctorModel doctor)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final d = items[i];
        final hasHospital = d.hospital.trim().isNotEmpty;
        final ratingStr = d.rating.toStringAsFixed(1);
        final imageUrl = d.imageUrl.trim();

        Widget avatar;
        if (imageUrl.isEmpty) {
          // صورة افتراضية بسيطة لو الرابط فاضي
          avatar = Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.backgroundGrey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.person, size: 40, color: Colors.grey),
          );
        } else {
          avatar = ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (_, __) => const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (_, __, ___) =>
                  const Icon(Icons.broken_image_rounded, color: Colors.red),
            ),
          );
        }

        return InkWell(
          onTap: onTap == null ? null : () => onTap!(d),
          borderRadius: BorderRadius.circular(12),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  avatar,
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // الاسم
                        Text(
                          d.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.bodyLarge.copyWith(
                            color: AppColors.textColorBlack,
                          ),
                        ),
                        const SizedBox(height: 5),

                        // التخصص + المستشفى (لو موجودة)
                        Text(
                          hasHospital
                              ? '${d.specialization} • ${d.hospital}'
                              : d.specialization,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                        const SizedBox(height: 6),

                        // التقييم + عدد الريفيوز
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(ratingStr),
                            const SizedBox(width: 6),
                            Text(
                              '(${d.reviews} reviews)',
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
