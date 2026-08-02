import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';
import 'package:islami/features/models/sura_model.dart';
import 'package:islami/features/screens/sura_details_screen.dart';

class SuraList extends StatelessWidget {
  final SuraModel sura;
  const SuraList({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 55,
            child: Image.asset(AppImagesRoute.suraNumberFrame),
          ),
          Text('${sura.index + 1}', style: AppTextStyles.regular12),
        ],
      ),
      title: Text(sura.suraEnglishName, style: AppTextStyles.bold16),
      subtitle: Text(
        '${sura.numOfVerses} Verses',
        style: AppTextStyles.regular14.copyWith(color: AppColors.gray),
      ),
      trailing: Text(sura.suraArabicName, style: AppTextStyles.bold18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuraDetailsScreen(sura: sura),
          ),
        );
      },
    );
  }
}
