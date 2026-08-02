import 'package:islami/features/models/quran_resourses.dart';

class SuraModel {
  String suraEnglishName;
  String suraArabicName;
  String numOfVerses;
  int index;

  SuraModel({
    required this.suraEnglishName,
    required this.suraArabicName,
    required this.numOfVerses,
    required this.index,
  });

  static List<SuraModel> suraList = List.generate(
    114,
    (index) => SuraModel(
      suraEnglishName: QuranResources.englishQuranSura[index],
      suraArabicName: QuranResources.arabicQuranSura[index],
      numOfVerses: QuranResources.ayaNumber[index],
      index: index,
    ),
  );
}
