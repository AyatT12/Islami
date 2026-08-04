import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';
import 'package:islami/features/models/sebiha_model.dart';

class SebihaTabContent extends StatefulWidget {
  const SebihaTabContent({super.key});

  @override
  State<SebihaTabContent> createState() => _SebihaTabContentState();
}

class _SebihaTabContentState extends State<SebihaTabContent>
    with SingleTickerProviderStateMixin {
  final List<Zekr> azkar = [
    Zekr(text: "سُبْحَانَ اللَّهِ", count: 0),
    Zekr(text: "الْحَمْدُ لِلَّهِ", count: 0),
    Zekr(text: "لَا إِلَٰهَ إِلَّا اللَّهُ", count: 0),
    Zekr(text: "اللَّهُ أَكْبَرُ", count: 0),
  ];

  int currentIndex = 0;
  final int maxCount = 30;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void incrementCount() {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    setState(() {
      azkar[currentIndex].count++;

      if (azkar[currentIndex].count >= maxCount) {
        if (currentIndex < azkar.length - 1) {
          currentIndex++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      children: [
        Center(
          child: Image.asset(AppImagesRoute.appBarLogo, height: 120),
        ),
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          style: AppTextStyles.bold32.copyWith(color: AppColors.white),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: incrementCount,
              child: AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  );
                },
                child: Image.asset(
                  AppImagesRoute.sebiha,
                ),
              ),
            ),
            Positioned(
              top: 300,
              child: Text(
                "${azkar[currentIndex].count} / $maxCount",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              azkar[currentIndex].text,
              style: AppTextStyles.bold32.copyWith(
                color: AppColors.white,
                fontSize: 30,
              ),
            ),
          ],
        )
      ],
    );
  }
}
