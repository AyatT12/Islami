import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';

class RadioTabContent extends StatefulWidget {
  const RadioTabContent({super.key});

  @override
  State<RadioTabContent> createState() => _RadioTabContentState();
}

class _RadioTabContentState extends State<RadioTabContent> {
  bool isRadioSelected = true;

  int? playingIndex;

  final List<String> radioList = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-Trabulsi",
    "Radio Addokali Mohammad Al-Alim",
  ];

  final List<String> recitersList = [
    "Ibrahim Al-Akdar",
    "Al-Qaria Yassen",
    "Ahmed Al-Trabulsi",
    "Addokali Mohammad Al-Alim",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(AppImagesRoute.appBarLogo, height: 120),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkBrown.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isRadioSelected = true;
                      playingIndex = null;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isRadioSelected
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Radio",
                          style: AppTextStyles.bold16.copyWith(
                            color: isRadioSelected
                                ? AppColors.secondaryColor
                                : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isRadioSelected = false;
                      playingIndex = null;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: !isRadioSelected
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Reciters",
                          style: AppTextStyles.bold16.copyWith(
                            color: !isRadioSelected
                                ? AppColors.secondaryColor
                                : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: isRadioSelected ? radioList.length : recitersList.length,
            itemBuilder: (context, index) {
              final String name =
                  isRadioSelected ? radioList[index] : recitersList[index];
              return _buildRadioCard(name, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRadioCard(String name, int index) {
    final bool isPlaying = playingIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            isPlaying
                ? AppImagesRoute.radioCardActive
                : AppImagesRoute.radioCard,
          ),
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            name,
            style:
                AppTextStyles.bold20.copyWith(color: AppColors.secondaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 48),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (playingIndex == index) {
                      playingIndex = null;
                    } else {
                      playingIndex = index;
                    }
                  });
                },
                icon: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: 48,
                ),
                color: AppColors.secondaryColor,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.volume_up, size: 32),
                color: AppColors.secondaryColor,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
