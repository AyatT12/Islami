import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';
import 'package:islami/features/models/onboarding_data.dart';
import 'package:islami/features/screens/main_layout.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.secondaryColor,
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: Image.asset(
                AppImagesRoute.appBarLogo,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = onboardingPages[index];

                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(page.image, height: 280),

                        const SizedBox(height: 40),

                        Text(page.title, style: AppTextStyles.bold24),

                        const SizedBox(height: 20),

                        Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bold20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primaryColor
                        : AppColors.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  if (currentPage == 0)
                    const Spacer()
                  else
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryColor,
                        foregroundColor: AppColors.primaryColor,
                        elevation: 0,
                      ),
                      onPressed: () {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: const Text("Back"),
                    ),

                  const Spacer(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      foregroundColor: AppColors.primaryColor,
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (currentPage != onboardingPages.length - 1) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainLayout(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      currentPage == onboardingPages.length - 1
                          ? "Finish"
                          : "Next",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
