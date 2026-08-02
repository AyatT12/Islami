import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/features/models/tab_info.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final List<TabInfo> _tabs = [
    TabInfo(
      iconPath: AppImagesRoute.quranIcon,
      backgroundImage: AppImagesRoute.mainBack,
      label: "Quran",
      content: Container(),
    ),
    TabInfo(
      iconPath: AppImagesRoute.hadithIcon,
      backgroundImage: AppImagesRoute.mainBack,
      label: "Hadith",
      content: Container(),
    ),
    TabInfo(
      iconPath: AppImagesRoute.sebihaIcon,
      backgroundImage: AppImagesRoute.mainBack,
      label: "Sebiha",
      content: Container(),
    ),
    TabInfo(
      iconPath: AppImagesRoute.radioIcon,
      backgroundImage: AppImagesRoute.mainBack,
      label: "Radio",
      content: Container(),
    ),
    TabInfo(
      iconPath: AppImagesRoute.timeIcon,
      backgroundImage: AppImagesRoute.mainBack,
      label: "Time",
      content: Container(),
    ),
  ];

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
          TextStyle(color: AppColors.white),
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
    );
  }
}
