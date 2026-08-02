import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';
import 'package:islami/features/models/hadith_model.dart';

class HadithTabContent extends StatefulWidget {
  const HadithTabContent({super.key});

  @override
  State<HadithTabContent> createState() => _HadithTabContentState();
}

class _HadithTabContentState extends State<HadithTabContent> {
  List<HadithModel> hadithList = [];

  @override
  void initState() {
    super.initState();
    loadHadithFiles();
  }

  Future<void> loadHadithFiles() async {
    for (int i = 1; i <= 50; i++) {
      String content =
          await rootBundle.loadString("assets/files/Hadith/h$i.txt");
      List<String> lines = content.trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      String hadithBody = lines.join('\n');
      hadithList.add(HadithModel(title: title, content: hadithBody));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(AppImagesRoute.appBarLogo, height: 120)),
        const SizedBox(height: 10),
        Expanded(
          child: hadithList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : PageView.builder(
                  itemCount: hadithList.length,
                  controller: PageController(viewportFraction: 0.8),
                  itemBuilder: (context, index) {
                    return _buildHadithCard(hadithList[index]);
                  },
                ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildHadithCard(HadithModel hadith) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(AppImagesRoute.hadithCardBack),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            hadith.title,
            style: AppTextStyles.bold24.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                hadith.content,
                style: AppTextStyles.bold16.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
