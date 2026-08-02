import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';
import 'package:islami/features/models/sura_model.dart';
import 'package:islami/features/screens/sura_details_screen.dart';

class MostRecent extends StatelessWidget {
  final SuraModel sura;
  const MostRecent({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuraDetailsScreen(sura: sura),
          ),
        );
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sura.suraEnglishName,
                  style: AppTextStyles.bold18.copyWith(color: Colors.black),
                ),
                Text(
                  sura.suraArabicName,
                  style: AppTextStyles.bold18.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  '${sura.numOfVerses} Verses',
                  style: AppTextStyles.bold14.copyWith(color: Colors.black),
                ),
              ],
            ),
            Image.asset(AppImagesRoute.mostRecentImage),
          ],
        ),
      ),
    );
  }
}
