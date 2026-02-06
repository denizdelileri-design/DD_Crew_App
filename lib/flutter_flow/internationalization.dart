import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['tr', 'en', 'de', 'ru', 'el'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? trText = '',
    String? enText = '',
    String? deText = '',
    String? ruText = '',
    String? elText = '',
  }) =>
      [trText, enText, deText, ruText, elText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '1pl1ie9h': {
      'tr': 'ILAN_VER',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'zpq8c0ca': {
      'tr': 'FILTRELE',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'aehv3n8y': {
      'tr': 'Page Title',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '9glvslkl': {
      'tr': 'Home',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
  },
  // Tekne_ilan
  {
    'k8lmdn82': {
      'tr': 'Upload Boat Photos',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '7s36nsa7': {
      'tr': 'Drag and drop or click to select images',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'jp1wm94k': {
      'tr': 'Basic Information',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '0v4xs5wn': {
      'tr': 'Ilan Basligi',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '8fxrd1rn': {
      'tr': 'Enter your boat\'s name',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '5pca1y7t': {
      'tr': 'Marka&Model',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'fbfg4syo': {
      'tr': 'e.g., Beneteau Oceanis 46.1',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'm3ydogt0': {
      'tr': 'Select Boat Type',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'fqzenpe5': {
      'tr': 'Sailing Yacht',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'k24tqyoj': {
      'tr': 'Motor Yacht',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '8mx7kgqt': {
      'tr': 'Catamaran',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'xwk4wut0': {
      'tr': 'Speedboat',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'l8adsvui': {
      'tr': 'Technical Specifications',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'mmm0myr5': {
      'tr': 'Year',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'izqo1ire': {
      'tr': '2020',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'kas81yie': {
      'tr': 'Length (m)',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'h8wu8vwt': {
      'tr': '12.5',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'yq5wvrfl': {
      'tr': 'Engine Hours',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '8wmvad8s': {
      'tr': '250',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'codtna3d': {
      'tr': 'Location & Price',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'z52xl86w': {
      'tr': 'EUR',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'dnxcwgvz': {
      'tr': 'EUR €',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'iudm5pob': {
      'tr': 'USD \$',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'qjrijaek': {
      'tr': 'GBP £',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'wft11irz': {
      'tr': 'Price',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'fxkhou9z': {
      'tr': '150,000',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'snilll5f': {
      'tr': 'Current Marina/Location',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '86p1up5e': {
      'tr': 'Marina Port Vell, Barcelona',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'cqox2kse': {
      'tr': 'Aciklama',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'ihxouwd0': {
      'tr': 'Detailed Description',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'mej4xa4b': {
      'tr':
          'Describe your boat\'s condition, features, and any additional information...',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'camfqkmk': {
      'tr': 'Features & Equipment',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'mvj0v7bf': {
      'tr': 'Generator',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'zc1rndyk': {
      'tr': 'Air Conditioning',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'y68vg7ft': {
      'tr': 'Solar Panel',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '83f7xuad': {
      'tr': 'Autopilot',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'u3zlt0ha': {
      'tr': 'GPS Navigation',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'qp5j53jd': {
      'tr': 'Radar',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'jas29uoy': {
      'tr': 'Bow Thruster',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '7mhrrk48': {
      'tr': 'Windlass',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'sek74w1o': {
      'tr': 'Yukle',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'nakinpw0': {
      'tr': 'Add Boat Listing',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
  },
  // Filtrele
  {
    'rgug0qz7': {
      'tr': 'Filter Boats',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'qawsqwzp': {
      'tr': 'Clear All',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '6kfz76sy': {
      'tr': 'Price Range',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'dmnnnkdz': {
      'tr': '\$50,000',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'tr67w1xp': {
      'tr': '\$2,500,000',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'l8xi5wgf': {
      'tr': 'Boat Type',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'd0jom2ch': {
      'tr': 'All',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'ljo2ssq4': {
      'tr': 'Sailing',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'ywtqqz55': {
      'tr': 'Motor Yacht',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'sxjtsri7': {
      'tr': 'Catamaran',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '6yoc9mxl': {
      'tr': 'Gulet',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '100maijg': {
      'tr': 'All',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '34roq6g6': {
      'tr': 'Length (m)',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'kj781pus': {
      'tr': '8m',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'g8bt5qgv': {
      'tr': '80m',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'ou5yfxjs': {
      'tr': 'Production Year',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'b4zcptpm': {
      'tr': '1990',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '2oj76wzk': {
      'tr': '2024',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'dtl3f9g9': {
      'tr': 'Location',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'tslfdhq9': {
      'tr': 'Select Marina or City',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'rbv2vzcc': {
      'tr': 'Search location...',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'r42cepjw': {
      'tr': 'Current Location',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '5svecpo3': {
      'tr': 'Monaco',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'nbkygum4': {
      'tr': 'Saint-Tropez',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '1rw0ioy5': {
      'tr': 'Cannes',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'tf2amkph': {
      'tr': 'Antibes',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'o6oduk3t': {
      'tr': 'Nice',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'pwo2kons': {
      'tr': 'Engine Hours',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'qlkiqnfp': {
      'tr': '0-500h',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'vcnn7y15': {
      'tr': '500-1500h',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'ygi09qv8': {
      'tr': '1500h+',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '5xxg9y6n': {
      'tr': 'Any',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '0qipr9yv': {
      'tr': 'Any',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'ns6n53uo': {
      'tr': 'Must-Have Equipment',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'b8nmachu': {
      'tr': 'Generator',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'ljrt12gl': {
      'tr': 'Air Conditioning',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'a9xaitvm': {
      'tr': 'Solar Panels',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'lujodhc1': {
      'tr': 'WiFi',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'pks3bb3d': {
      'tr': 'Clear All',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '3xlhfx1t': {
      'tr': 'Show 247 Results',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
  },
  // Miscellaneous
  {
    'hjsk0brn': {
      'tr': 'TextField',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'wnuayrnc': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'cwl42wf6': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'qbxp9b99': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'sjsfxzmy': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'ijdqwl2i': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'tav54lka': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'a4cm8t7m': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '48en4wna': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'yju46icp': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'muvs0ky1': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '7bkv7g34': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '30c7bi72': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'vxzegbax': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '1l8o2kti': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'hn8vmwn5': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '4m6m7sct': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'u2wg19sv': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'cb5o64dt': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '1z2xkmmg': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    '41kvfxpq': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'x0ubj5oe': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'micwhtuq': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'abtpyh6e': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'l289awqv': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
    'uoqswjov': {
      'tr': '',
      'de': '',
      'el': '',
      'en': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
