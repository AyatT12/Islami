import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';
import 'package:islami/features/models/tab_info.dart';
import 'package:islami/features/tabs/hadith_tab/hadith_tab_content.dart';
import 'package:islami/features/tabs/quran_tab/quran_tab_content.dart';
import 'package:islami/features/tabs/sebiha_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  late final List<TabInfo> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      TabInfo(
        iconPath: AppImagesRoute.quranIcon,
        backgroundImage: AppImagesRoute.mainBack,
        label: "Quran",
        content: const QuranTabContent(),
      ),
      TabInfo(
        iconPath: AppImagesRoute.hadithIcon,
        backgroundImage: AppImagesRoute.hadithBackground,
        label: "Hadith",
        content: const HadithTabContent(),
      ),
      TabInfo(
        iconPath: AppImagesRoute.sebihaIcon,
        backgroundImage: AppImagesRoute.sebihaBack,
        label: "Sebiha",
        content: const SebihaTabContent(),
      ),
      TabInfo(
        iconPath: AppImagesRoute.radioIcon,
        backgroundImage: AppImagesRoute.mainBack,
        label: "Radio",
        content: Center(child: Text("Radio", style: AppTextStyles.bold24)),
      ),
      TabInfo(
        iconPath: AppImagesRoute.timeIcon,
        backgroundImage: AppImagesRoute.mainBack,
        label: "Time",
        content: Center(child: Text("Time", style: AppTextStyles.bold24)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
        backgroundColor: AppColors.primaryColor,
        indicatorColor: AppColors.darkBrown.withValues(alpha: .6),
        labelTextStyle: WidgetStatePropertyAll(
          AppTextStyles.bold14.copyWith(color: AppColors.white),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: List.generate(
          _tabs.length,
          (index) => NavigationDestination(
            icon: ImageIcon(AssetImage(_tabs[index].iconPath)),
            label: _tabs[index].label,
            selectedIcon: ImageIcon(
              AssetImage(_tabs[index].iconPath),
              color: AppColors.white,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_tabs[currentPage].backgroundImage),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(child: _tabs[currentPage].content),
      ),
    );
  }
}
