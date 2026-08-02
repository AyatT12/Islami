import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_images.dart';
import 'package:islami/core/utils/app_text_styles.dart';
import 'package:islami/features/models/sura_model.dart';
import 'package:islami/features/tabs/quran_tab/most_recent_listview.dart';
import 'package:islami/features/tabs/quran_tab/search_field_widget.dart';
import 'package:islami/features/tabs/quran_tab/sura_list_widget.dart';

class QuranTabContent extends StatefulWidget {
  const QuranTabContent({super.key});

  @override
  State<QuranTabContent> createState() => _QuranTabContentState();
}

class _QuranTabContentState extends State<QuranTabContent> {
  final List<SuraModel> suras = SuraModel.suraList;
  List<SuraModel> filteredSuras = SuraModel.suraList;
  final TextEditingController _searchController = TextEditingController();

  void filterSuras(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSuras = suras;
        return;
      }

      final String searchQuery = query.trim().toLowerCase();

      filteredSuras = suras.where((sura) {
        final bool englishMatch = sura.suraEnglishName.toLowerCase().contains(
          searchQuery,
        );

        final bool arabicMatch = sura.suraArabicName.contains(query.trim());

        return englishMatch || arabicMatch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(AppImagesRoute.appBarLogo, height: 120)),
          const SizedBox(height: 10),
          SearchField(onSearch: filterSuras, controller: _searchController),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                Text('Most Recently', style: AppTextStyles.bold18),
                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final sura = suras[index];
                      return MostRecent(sura: sura);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text('Suras List', style: AppTextStyles.bold18),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredSuras.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.white24,
                    indent: 40,
                    endIndent: 40,
                  ),
                  itemBuilder: (context, index) {
                    final sura = filteredSuras[index];
                    return SuraList(sura: sura);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
