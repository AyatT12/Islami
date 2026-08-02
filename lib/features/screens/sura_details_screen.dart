import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';
import 'package:islami/features/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  final SuraModel sura;

  const SuraDetailsScreen({super.key, required this.sura});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraVerses = [];

  @override
  void initState() {
    super.initState();
    readSuraFile(widget.sura.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.sura.suraEnglishName, style: AppTextStyles.bold20),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImagesRoute.detailsBack,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              Text(widget.sura.suraArabicName, style: AppTextStyles.bold24),
              const SizedBox(height: 20),
              Expanded(
                child: suraVerses.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          suraVerses.join(" "),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.bold20.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> readSuraFile(int index) async {
    try {
      String path = "assets/files/Suras/${index + 1}.txt";
      debugPrint("Loading sura from: $path");
      String suraContent = await rootBundle.loadString(path);

      List<String> lines = suraContent.trim().split("\n");

      setState(() {
        suraVerses = lines;
      });
    } catch (e) {
      debugPrint("Error loading sura file: $e");
    }
  }
}
