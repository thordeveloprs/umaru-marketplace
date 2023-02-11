import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

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
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    '8awoabwy': {
      'en': 'Search',
      'fr': 'Recherche',
    },
    'zfq1n4yj': {
      'en': 'Top Categories',
      'fr': 'Principales catégories',
    },
    'k1gi8qmx': {
      'en': 'Sell Your Products here',
      'fr': 'Vendez vos produits ici',
    },
    '9tavr6i5': {
      'en': 'Register Now',
      'fr': 'S\'inscrire maintenant',
    },
    'f7l547t3': {
      'en': 'Best Sellers',
      'fr': 'Meilleures ventes',
    },
    '15llcaa4': {
      'en': 'FCFA',
      'fr': 'FCFA',
    },
    '5cphv3xj': {
      'en': 'FCFA',
      'fr': 'FCFA',
    },
    '20rx34jn': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // splashScreen
  {
    '6wwf5r46': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Filter
  {
    'emieego1': {
      'en': 'Price',
      'fr': 'Prix',
    },
    'n09m17xj': {
      'en': '622 CFA',
      'fr': '622 FCFA',
    },
    'smd8eb6y': {
      'en': '770 946 CFA',
      'fr': '770 946 FCFA',
    },
    'cukxqjse': {
      'en': 'Product Tags',
      'fr': 'Étiquettes de produit',
    },
    'eak40wmk': {
      'en': 'Tags (1)',
      'fr': 'Balises (1)',
    },
    'xcib4ui4': {
      'en': 'Product Color',
      'fr': 'Couleur du produit',
    },
    'qwocjax7': {
      'en': 'Black (1)',
      'fr': 'Noir (1)',
    },
    '7ypkzxv9': {
      'en': 'Product Size',
      'fr': 'Taille du produit',
    },
    'vlgbrdzs': {
      'en': '41 (1)',
      'fr': '41 (1)',
    },
    'vcafnukz': {
      'en': 'Apply',
      'fr': 'Appliquer',
    },
    'usx225pz': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // main_Category
  {
    '9j1wihv4': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // search
  {
    '0pkr8h18': {
      'en': 'Search',
      'fr': 'Appbar',
    },
    'c8qyhf09': {
      'en': 'Search',
      'fr': 'Recherche',
    },
    '9ugg92yn': {
      'en': 'FCFA',
      'fr': 'FCFA',
    },
    'fupa5x7j': {
      'en': 'FCFA',
      'fr': 'FCFA',
    },
    'l5195fyp': {
      'en': 'Search',
      'fr': 'Recherche',
    },
  },
  // BuyMembershipPage
  {
    'f262efla': {
      'en': 'Membership Details',
      'fr': 'Tarification',
    },
    'uyracpdl': {
      'en': 'Subscribe',
      'fr': '',
    },
    'bc5c9vv1': {
      'en': 'Skip',
      'fr': '',
    },
    'wfzqgmuf': {
      'en': 'Home',
      'fr': '',
    },
  },
  // registerFormPricing
  {
    'sq1mhc65': {
      'en': 'Pricing',
      'fr': 'Tarification',
    },
    '155zkjih': {
      'en': '100',
      'fr': '100',
    },
    'gxj14kty': {
      'en': 'CFA/month',
      'fr': 'CFA/mois',
    },
    'gvdwwaie': {
      'en': 'Some Benefit Goes Here',
      'fr': 'Certains avantages vont ici',
    },
    'dwtwt2pa': {
      'en': 'Select',
      'fr': 'Sélectionner',
    },
    'rdp9ejlu': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // All_Category
  {
    'nsgaqc3d': {
      'en': 'All Category',
      'fr': 'Toutes les catégories',
    },
    '5jj46l07': {
      'en': 'Categories',
      'fr': 'Catégories',
    },
  },
  // registerFormcompanyDetails
  {
    'xtlycfcc': {
      'en': 'Company Details',
      'fr': 'Détails de l\'entreprise',
    },
    'h4w025d2': {
      'en': 'Business email',
      'fr': 'E-mail professionnel',
    },
    '6pgoxn6p': {
      'en': 'Business Contact number',
      'fr': 'Numéro de contact professionnel',
    },
    'q3lw2e3j': {
      'en': 'Whatsapp number',
      'fr': 'Numéro WhatsApp',
    },
    'fwkphire': {
      'en': 'Facebook Links',
      'fr': 'Liens Facebook',
    },
    'bbkd2h8q': {
      'en': 'Image',
      'fr': 'Image',
    },
    '0e7f3t72': {
      'en': 'Upload',
      'fr': 'Télécharger',
    },
    'fpxooik2': {
      'en': 'Business Address',
      'fr': 'Adresse d\'affaires',
    },
    'r0eqtcse': {
      'en': 'Sign Up ',
      'fr': 'S\'inscrire',
    },
    'uodie97m': {
      'en': 'Email Field is required',
      'fr': 'Le champ e-mail est obligatoire',
    },
    '9bghbj11': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'c29g6rnb': {
      'en': 'Contact number is required',
      'fr': 'Le numéro de téléphone est requis',
    },
    '7vaopako': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qm8p52yr': {
      'en': 'Whatsapp number  is required',
      'fr': 'Le numéro Whatsapp est requis',
    },
    '9hbxr7hn': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ss6wq0c5': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '5yuny9d9': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ymr3i7mu': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'yv7x01y1': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1pi0d8h3': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '9q6ajhmf': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '924w0hrp': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // EditProfile
  {
    'f40622jz': {
      'en': 'Genreal Info',
      'fr': 'Informations générales',
    },
    'bv6314xi': {
      'en': 'Name',
      'fr': 'Nom',
    },
    'lq4l5hgv': {
      'en': '',
      'fr': '',
    },
    'schp4wrh': {
      'en': 'Your Email',
      'fr': 'Votre e-mail',
    },
    'm51jdzb0': {
      'en': '',
      'fr': 'Votre e-mail',
    },
    '7szg26og': {
      'en': 'Public Name',
      'fr': 'Nom public',
    },
    'o2843kjb': {
      'en': '',
      'fr': 'Nom public',
    },
    'tg4jnqx5': {
      'en': 'Gender',
      'fr': 'Genre',
    },
    'ddo9zma9': {
      'en': 'Male',
      'fr': 'Homme',
    },
    'hew0p9dx': {
      'en': 'Woman',
      'fr': 'Femme',
    },
    'qf74lgcw': {
      'en': 'Other',
      'fr': 'Autre',
    },
    'sj2zs9b5': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'yd8vgjd6': {
      'en': 'Shop URL',
      'fr': 'URL de la boutique',
    },
    'pu994wls': {
      'en': '',
      'fr': 'URL de la boutique',
    },
    'heuaoa1i': {
      'en': 'Contact Number',
      'fr': 'Numéro de contact',
    },
    '0dpc5py2': {
      'en': '',
      'fr': 'URL de la boutique',
    },
    'g0grv9bx': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'l7le2a87': {
      'en': 'Save',
      'fr': 'Sauvegarder',
    },
    'ygbk1uyd': {
      'en': 'Name is required',
      'fr': 'Le nom est requis',
    },
    'v43cw97q': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'b4j4zq3r': {
      'en': 'Email Field is required',
      'fr': 'Le champ e-mail est obligatoire',
    },
    '8bjhueol': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '11lkxwjs': {
      'en': 'Public Name is required',
      'fr': 'Le nom public est requis',
    },
    'on3cje95': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '72v7w22h': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '6o44jxxe': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'cvl0eeba': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'r3fn7yr4': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'je9s1pos': {
      'en': 'Company Info',
      'fr': 'Information d\'entreprise',
    },
    'mm9hofjm': {
      'en': 'Company Details',
      'fr': 'Détails de l\'entreprise',
    },
    'w66jit69': {
      'en': 'Company Name',
      'fr': 'Nom de l\'entreprise',
    },
    '1bgcum69': {
      'en': '',
      'fr': 'Liens Facebook',
    },
    'bobcwdkr': {
      'en': 'Business email',
      'fr': 'E-mail professionnel',
    },
    'qe1ao6ds': {
      'en': '',
      'fr': 'E-mail professionnel',
    },
    'wmqmt4zv': {
      'en': 'Business Contact number',
      'fr': 'Numéro de contact professionnel',
    },
    'uxm7mi4b': {
      'en': '',
      'fr': 'Numéro de contact professionnel',
    },
    'c5y6y0j4': {
      'en': 'Whatsapp number',
      'fr': 'Numéro WhatsApp',
    },
    'fkkb55hi': {
      'en': '',
      'fr': 'Numéro WhatsApp',
    },
    '3mfdocdn': {
      'en': 'About',
      'fr': 'À propos',
    },
    'vphnvefz': {
      'en': '',
      'fr': 'Liens Facebook',
    },
    '0fweyao9': {
      'en': 'Facebook Links',
      'fr': 'Liens Facebook',
    },
    '5mg8rgtx': {
      'en': '',
      'fr': 'Liens Facebook',
    },
    'lmenbq21': {
      'en': 'Twitter Links',
      'fr': 'Liens Twitter',
    },
    'e6qfakaz': {
      'en': '',
      'fr': 'Liens Facebook',
    },
    'da4rbw3c': {
      'en': 'Company Logo',
      'fr': 'Logo d\'entreprise',
    },
    'lkm40ew1': {
      'en': 'Update',
      'fr': 'Mise à jour',
    },
    'gnadkps6': {
      'en': 'Company Banner',
      'fr': 'Bannière de l\'entreprise',
    },
    'cjuh6ur0': {
      'en': 'Update',
      'fr': 'Mise à jour',
    },
    'mggg2z6a': {
      'en': 'Business Address',
      'fr': 'Adresse d\'affaires',
    },
    'gph2ryrn': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    'tyb3vn59': {
      'en': 'Meta Keywords',
      'fr': 'Méta-mots clés',
    },
    'evhoh7dd': {
      'en': 'Meta Description',
      'fr': 'Meta Description',
    },
    '868ao0pr': {
      'en': 'Address',
      'fr': 'Adresse',
    },
    'dm8drsmy': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    'rw528rrh': {
      'en': 'City',
      'fr': 'Ville',
    },
    'dct2e67u': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    'p58rnj7i': {
      'en': 'Zip Code',
      'fr': 'Code postal',
    },
    '6fvtied8': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    'f9dzocp8': {
      'en': 'State',
      'fr': 'État',
    },
    'u5hs8lnl': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    '0g7ke5wk': {
      'en': 'Country',
      'fr': 'Pays',
    },
    'hqxvs859': {
      'en': 'Senegal',
      'fr': 'Sénégal',
    },
    'ww71d6zu': {
      'en': 'Côte d’Ivoire',
      'fr': 'Côte d\'Ivoire',
    },
    'qwb5ffh1': {
      'en': 'Mali',
      'fr': 'Mali',
    },
    '2343jo0n': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'qesddxaj': {
      'en': 'Save',
      'fr': 'Sauvegarder',
    },
    'rtav37la': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'xi91pagh': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4rsrmp7c': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'bkp86x5h': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'tftwgqjq': {
      'en': 'Contact Number is required',
      'fr': 'Le numéro de téléphone est requis',
    },
    '7wykgm5d': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'uuwzcakn': {
      'en': 'Whatsapp number is required',
      'fr': 'Le numéro Whatsapp est requis',
    },
    'jmzm2hec': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '3ktzzw40': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '1pcqemsx': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jo1zt6nr': {
      'en': 'Social Media Link is required',
      'fr': 'Le lien vers les médias sociaux est requis',
    },
    'iz11i4ma': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '7pptcwbx': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'ywzfulkt': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ecoog53e': {
      'en': 'Business Address is required',
      'fr': 'L\'adresse de l\'entreprise est requise',
    },
    'qwfgpfbw': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '4e66c2x8': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ahx95ty2': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'bo6xwu0z': {
      'en': 'Address is required',
      'fr': 'L\'adresse est obligatoire',
    },
    'nhgjlggz': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'iyz1rz3f': {
      'en': 'City is required',
      'fr': 'La ville est obligatoire',
    },
    'k8h0u1qp': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '6tmywdg6': {
      'en': 'Zip is required',
      'fr': 'Le code postal est requis',
    },
    'dl67z9lr': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'd9ku6dhx': {
      'en': 'State is required',
      'fr': 'L\'état est requis',
    },
    'myi128hd': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'vu7ttq17': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ManageProducts
  {
    'e0pba0x2': {
      'en': 'Search',
      'fr': '',
    },
    'bys89djy': {
      'en': 'Add New',
      'fr': 'Ajouter nouveau',
    },
    'l78spfvj': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // MyAccounts
  {
    'h1ahj7v6': {
      'en': 'User',
      'fr': 'Utilisateur',
    },
    'pldvdyz5': {
      'en': 'Profile',
      'fr': 'Profil',
    },
    '4uwb1xdx': {
      'en': 'Manage Product',
      'fr': 'Gérer le produit',
    },
    'fqdv5hs8': {
      'en': 'Language',
      'fr': 'Langue',
    },
    '5vc88ei9': {
      'en': 'Currency',
      'fr': 'Monnaie',
    },
    'lk525ulh': {
      'en': 'XOF CFA',
      'fr': 'XOF CFA',
    },
    'labm5b1q': {
      'en': 'FAQs',
      'fr': 'FAQ',
    },
    'kzuiblqv': {
      'en': 'Contact Us',
      'fr': 'Contactez-nous',
    },
    '6kc9ijah': {
      'en': 'Terms & Conditions',
      'fr': 'termes et conditions',
    },
    'du1ib3ff': {
      'en': 'Privacy Policy',
      'fr': 'politique de confidentialité',
    },
    'h7it2kdi': {
      'en': 'Log Out',
      'fr': 'Se déconnecter',
    },
    '40ndwqug': {
      'en': 'Seller Login',
      'fr': 'Connexion vendeur',
    },
    'e5nh1b6y': {
      'en': 'Connect With us',
      'fr': 'Connecte-toi avec nous',
    },
    'j5glnhsd': {
      'en': 'Account',
      'fr': 'Compte',
    },
  },
  // addProduct
  {
    '51t5z7ao': {
      'en': 'Product Name',
      'fr': 'Nom du produit',
    },
    'hgsodskl': {
      'en': '*',
      'fr': '*',
    },
    '2kqyqkli': {
      'en': 'SKU',
      'fr': 'UGS',
    },
    'od9e4svd': {
      'en': '*',
      'fr': '*',
    },
    'jq9j560t': {
      'en': 'Price',
      'fr': 'Prix',
    },
    '4drw1ybi': {
      'en': '*',
      'fr': '*',
    },
    'gt3zd2as': {
      'en': 'Set Special Price',
      'fr': 'Est en vedette',
    },
    '1s67b7gm': {
      'en': 'Special Price',
      'fr': 'Prix spécial',
    },
    'hmf6t5s6': {
      'en': 'Special price from',
      'fr': 'Définissez le produit comme nouveau à partir de',
    },
    '9yhjpwb8': {
      'en': 'To',
      'fr': 'Pour',
    },
    '48bqkyu6': {
      'en': 'Quantity',
      'fr': 'Quantité',
    },
    '0u8mfm93': {
      'en': '*',
      'fr': '*',
    },
    'ln1tvq9n': {
      'en': 'Weight',
      'fr': 'Lester',
    },
    'fedck62x': {
      'en': 'Stock Status',
      'fr': 'État des stocks',
    },
    '3pmcynli': {
      'en': 'In Stock ',
      'fr': '',
    },
    'j8751bfb': {
      'en': 'In Stock ',
      'fr': 'En stock',
    },
    'xik083mw': {
      'en': 'Exhausted',
      'fr': 'Épuisé',
    },
    'll0gldf9': {
      'en': '',
      'fr': 'Veuillez sélectionner',
    },
    '7xo2l30t': {
      'en': 'Set the Product as a New from',
      'fr': 'Définissez le produit comme nouveau à partir de',
    },
    'zzsucxyz': {
      'en': 'To',
      'fr': 'Pour',
    },
    'xlh6u3rq': {
      'en': 'Is Featured ',
      'fr': 'Est en vedette',
    },
    'h2d0wn47': {
      'en': 'Country',
      'fr': 'Pays',
    },
    'hdze4isj': {
      'en': '*',
      'fr': '*',
    },
    '480yyzvg': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'j999msk4': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'ztcmmad9': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    'cy0qce3x': {
      'en': '*',
      'fr': '*',
    },
    'x7sf0j31': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'b1r8noxx': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'nc7d8gdm': {
      'en': 'Sub Category',
      'fr': 'Sous-catégorie',
    },
    '5u9vi356': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    '8zummp9n': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    's548nlpk': {
      'en': 'Image Upload',
      'fr': 'Téléchargement d\'images',
    },
    'myi910on': {
      'en': 'Select Photos',
      'fr': 'Sélectionnez Photos',
    },
    'wlkswa8h': {
      'en': 'Short Description',
      'fr': 'brève description',
    },
    'vxgfjtg2': {
      'en': '*',
      'fr': '*',
    },
    'drupwz7u': {
      'en': 'Description',
      'fr': 'Description',
    },
    '7qjvlohe': {
      'en': '*',
      'fr': '*',
    },
    'nse4uqkl': {
      'en': 'Meta Title',
      'fr': 'Méta-titre',
    },
    'hbi0gd7x': {
      'en': 'Meta Description',
      'fr': 'Meta Description',
    },
    'htvqm6j1': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
    'llpjwsbt': {
      'en': 'Product  Name  is required',
      'fr': 'Le nom du produit est requis',
    },
    'r30ljqln': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '70bbmi7a': {
      'en': 'SKU is required',
      'fr': 'SKU est requis',
    },
    'n1zj9hvm': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'obkalhf9': {
      'en': 'Price is required',
      'fr': 'Le prix est requis',
    },
    'dq3j5g2f': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8ki5uhi7': {
      'en': 'Field is required',
      'fr': '',
    },
    't41z7ffv': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '59g8tzsm': {
      'en': 'Quantity is required',
      'fr': '',
    },
    'b30ktoo3': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '2s349ffd': {
      'en': 'Field is required',
      'fr': '',
    },
    '6catfwqy': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'u04kux11': {
      'en': 'Short Description is required',
      'fr': 'La description est obligatoire',
    },
    '7ne2q8u9': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1ie876mk': {
      'en': 'Description is required',
      'fr': '',
    },
    '2hyts9k3': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'q0pvu7zq': {
      'en': 'Field is required',
      'fr': '',
    },
    'f78vtg40': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'xwjdbrv1': {
      'en': 'Field is required',
      'fr': '',
    },
    'fb085egi': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'b4hvqkxw': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // privacyPolicy
  {
    'dh9ypqda': {
      'en': 'Title',
      'fr': 'Titre',
    },
    '1oij1epq': {
      'en': 'Lorem Ipsum',
      'fr': 'Lorem Ipsum',
    },
    'vpsfkkts': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // LogInPage
  {
    'fd1zkw9n': {
      'en': 'Welcome back',
      'fr': 'Content de te revoir',
    },
    'cscivhoe': {
      'en': 'Don\'t have an account?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'vjjbth2j': {
      'en': ' Sign up here',
      'fr': 'Inscrivez-vous ici',
    },
    'wbfshhsf': {
      'en': 'Your Email',
      'fr': 'Votre e-mail',
    },
    'ah6h2pvf': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    '8h7dl375': {
      'en': 'Sign in',
      'fr': 'S\'identifier',
    },
    'ts6gw97x': {
      'en': 'Forgot password ?',
      'fr': 'Mot de passe oublié ?',
    },
    'rfngstlz': {
      'en': 'Click here',
      'fr': 'Cliquez ici',
    },
    'jekprojl': {
      'en': 'Email is required',
      'fr': 'L\'e-mail est requis',
    },
    '34cvqjvt': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1q7epzwu': {
      'en': 'Password is required',
      'fr': 'Mot de passe requis',
    },
    '2qyzwam9': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '0b0dap51': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // sellerRegisteration
  {
    '507gsmi3': {
      'en': 'Seller Registeration',
      'fr': 'Enregistrement du vendeur',
    },
    'y3g4pylj': {
      'en': 'Already have an account?',
      'fr': 'Vous avez déjà un compte?',
    },
    'yijis6u8': {
      'en': ' Sign In',
      'fr': 'S\'identifier',
    },
    '6mktuttj': {
      'en': 'First Name',
      'fr': 'Prénom',
    },
    '6jndcsg8': {
      'en': 'Last Name',
      'fr': 'Nom de famille',
    },
    'm61tmd77': {
      'en': 'Your Email',
      'fr': 'Votre e-mail',
    },
    'z7cxtr1a': {
      'en': 'Phone',
      'fr': 'Téléphone',
    },
    'r8s7rbuh': {
      'en': 'Public name',
      'fr': 'Nom public',
    },
    'k5uoh1nf': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'ceh0eslj': {
      'en': 'Confirm Password',
      'fr': 'Confirmez le mot de passe',
    },
    'p75gog2n': {
      'en': 'Subscribe to Newsletter',
      'fr': 'S\'inscrire à la Newsletter',
    },
    '70kusu88': {
      'en': 'I have read and accept',
      'fr': 'j\'ai lu et accepté',
    },
    '94ccrbne': {
      'en': 'Terms_condition',
      'fr': 'condition_terme',
    },
    'g89imkqo': {
      'en':
          'By creating an account, you agree to our Terms and have read and acknowledge the Global Privacy Statement.',
      'fr':
          'En créant un compte, vous acceptez nos conditions et avez lu et accepté la déclaration de confidentialité mondiale.',
    },
    '7soqrhdw': {
      'en': 'Next',
      'fr': 'Suivant',
    },
    'vqjv2fz0': {
      'en': 'First Name is required',
      'fr': 'Le prénom est requis',
    },
    'xrshpw1s': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'avdvxo4r': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'sri3guor': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'hziijhpq': {
      'en': 'Email Field is required',
      'fr': 'Le champ e-mail est obligatoire',
    },
    'rnwlsoc9': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qsdqlnxz': {
      'en': 'phone is required',
      'fr': 'le téléphone est requis',
    },
    '03z81t2j': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'e3fmorah': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '24zozx8k': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ap4ucqb0': {
      'en': 'Shop URL  is required',
      'fr': 'L\'URL de la boutique est requise',
    },
    '9d8jpn6s': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'yhccuozq': {
      'en': 'Password Field is required',
      'fr': 'Le champ mot de passe est obligatoire',
    },
    '0h94fvnd': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9qfw7mbj': {
      'en': 'Confirm Password Field is required',
      'fr': 'Le champ Confirmer le mot de passe est obligatoire',
    },
    'm9e2xne8': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'f89tzehl': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // sucessScreen2
  {
    'cejwnbr9': {
      'en': 'Sucess',
      'fr': 'Succès',
    },
    'n7b88mrq': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Product_detailPage
  {
    'ylvk7mye': {
      'en': 'Product Detail',
      'fr': 'Détail du produit',
    },
    'a0c7xuov': {
      'en': 'FCFA',
      'fr': 'FCFA',
    },
    'n2fi29rm': {
      'en': 'Product info',
      'fr': 'Information sur le produit',
    },
    'dd4gjdlh': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // categoryPage
  {
    'ua0ye29e': {
      'en': 'Search',
      'fr': 'Recherche',
    },
    'wwb2ohk2': {
      'en': 'FCFA',
      'fr': 'FCFA',
    },
    'jdacqglr': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // ChangePassword
  {
    'j3uepdqd': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'd88f1rma': {
      'en': 'Old Password',
      'fr': 'ancien mot de passe',
    },
    'yg39z3t3': {
      'en': 'New Password',
      'fr': 'nouveau mot de passe',
    },
    'wuyr64fn': {
      'en': 'Confirm New Password',
      'fr': 'Confirmer le nouveau mot de passe',
    },
    '3p2xgaq0': {
      'en': 'Change Password',
      'fr': 'Changer le mot de passe',
    },
    'lami9rc5': {
      'en': 'Old Password is required',
      'fr': 'L\'ancien mot de passe est requis',
    },
    '9y4g9e66': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ir8ckcpm': {
      'en': 'New Password is required',
      'fr': 'Un nouveau mot de passe est requis',
    },
    'zzljm1pv': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9qpko8cd': {
      'en': 'Confirm New Password is required',
      'fr': 'Confirmer que le nouveau mot de passe est requis',
    },
    'ho2vv5hb': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ba2a2ml6': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // webview
  {
    'xef2a47t': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // editProduct
  {
    'menrklms': {
      'en': 'Product Name',
      'fr': 'Nom du produit',
    },
    'mtuqqny5': {
      'en': '*',
      'fr': '*',
    },
    '2vg0rric': {
      'en': 'SKU',
      'fr': 'UGS',
    },
    'x7nlnghf': {
      'en': '*',
      'fr': '*',
    },
    'm790oisr': {
      'en': 'Price',
      'fr': 'Prix',
    },
    '80fgzf1b': {
      'en': '*',
      'fr': '*',
    },
    'awsuihr9': {
      'en': 'Set Special Price',
      'fr': 'Est en vedette',
    },
    'amc2lap9': {
      'en': 'Special Price',
      'fr': 'Prix spécial',
    },
    'pjrrc9x7': {
      'en': 'Special price from',
      'fr': 'Définissez le produit comme nouveau à partir de',
    },
    'k4fgkzs3': {
      'en': 'To',
      'fr': 'Pour',
    },
    'qx74i40q': {
      'en': 'Quantity',
      'fr': 'Quantité',
    },
    'mli64bxk': {
      'en': '*',
      'fr': '*',
    },
    'mfb9j1bq': {
      'en': 'Weight',
      'fr': 'Lester',
    },
    'xbbzt1u5': {
      'en': 'Stock Status',
      'fr': 'État des stocks',
    },
    'h4q1csch': {
      'en': 'In Stock ',
      'fr': '',
    },
    'fd8z6tju': {
      'en': 'In Stock ',
      'fr': 'En stock',
    },
    'fcu4dp1u': {
      'en': 'Exhausted',
      'fr': 'Épuisé',
    },
    '01nzfk23': {
      'en': '',
      'fr': 'Veuillez sélectionner',
    },
    'di06alia': {
      'en': 'Set the Product as a New from',
      'fr': 'Définissez le produit comme nouveau à partir de',
    },
    'p60y16md': {
      'en': 'To',
      'fr': 'Pour',
    },
    'ppi9gkv5': {
      'en': 'Is Featured ',
      'fr': 'Est en vedette',
    },
    'fyts3w4t': {
      'en': 'Country',
      'fr': 'Pays',
    },
    '96h5uvbg': {
      'en': '*',
      'fr': '*',
    },
    'zaqb2msj': {
      'en': 'Mali',
      'fr': 'Option 1',
    },
    '7v0bn8cm': {
      'en': 'Senegal',
      'fr': '',
    },
    'zyn8e18i': {
      'en': 'Cote d\'ivoire',
      'fr': '',
    },
    't225ejyg': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    '3ymbbsia': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    '3hu4o4ec': {
      'en': '*',
      'fr': '*',
    },
    'ihsc85xz': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    '8z9rp7ns': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'm2xeb55k': {
      'en': 'Sub Category',
      'fr': 'Sous-catégorie',
    },
    '0yl76fcg': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    '9i9d8l8h': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'vwgf8cd9': {
      'en': 'Image Upload',
      'fr': 'Téléchargement d\'images',
    },
    'vq98v1dx': {
      'en': 'Select Photos',
      'fr': 'Sélectionnez Photos',
    },
    'w3q1760b': {
      'en': 'Short Description',
      'fr': 'brève description',
    },
    'gxwmyljo': {
      'en': '*',
      'fr': '*',
    },
    'iehjjfex': {
      'en': 'Description',
      'fr': 'Description',
    },
    '1xdnh6bj': {
      'en': '*',
      'fr': '*',
    },
    'sle95kp0': {
      'en': 'Meta Title',
      'fr': 'Méta-titre',
    },
    '8ftb2hgu': {
      'en': 'Meta Description',
      'fr': 'Meta Description',
    },
    '8v228q18': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
    'h3gmsbrx': {
      'en': 'Product  Name  is required',
      'fr': 'Le nom du produit est requis',
    },
    '4qrjkwij': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'enhhuxpu': {
      'en': 'SKU is required',
      'fr': 'SKU est requis',
    },
    'r4omzblk': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'k6nnqzq3': {
      'en': 'Price is required',
      'fr': 'Le prix est requis',
    },
    '4q0pz3cf': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '6pucfdi2': {
      'en': 'Field is required',
      'fr': '',
    },
    'xf0n3f5f': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'x1a7o5rn': {
      'en': 'Quantity is required',
      'fr': '',
    },
    'vdr2cudq': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'wdzyqodv': {
      'en': 'Field is required',
      'fr': '',
    },
    'k2rqqulg': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'cgsqj3ex': {
      'en': 'Short Description is required',
      'fr': 'La description est obligatoire',
    },
    'vt0xnw79': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'zj9pedb3': {
      'en': 'Description is required',
      'fr': '',
    },
    '3voam8fj': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'wszjul3w': {
      'en': 'Field is required',
      'fr': '',
    },
    'xtql6ky1': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '2e24x3ua': {
      'en': 'Field is required',
      'fr': '',
    },
    'baydztbe': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'x0i4bayh': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // editProductCopy
  {
    'x92k84jw': {
      'en': 'Product Name',
      'fr': 'Nom du produit',
    },
    '639uciv9': {
      'en': '*',
      'fr': '*',
    },
    'i31dm0i1': {
      'en': 'SKU',
      'fr': 'UGS',
    },
    'wmlwuqpx': {
      'en': '*',
      'fr': '*',
    },
    'ub22s8qr': {
      'en': 'Price',
      'fr': 'Prix',
    },
    '0t52bf4x': {
      'en': '*',
      'fr': '*',
    },
    '52eroz1a': {
      'en': 'Set Special Price',
      'fr': 'Est en vedette',
    },
    '3f66vyfx': {
      'en': 'Special Price',
      'fr': 'Prix spécial',
    },
    'cbh2n86q': {
      'en': 'Special price from',
      'fr': 'Définissez le produit comme nouveau à partir de',
    },
    'fs3icq2j': {
      'en': 'To',
      'fr': 'Pour',
    },
    'j1q1pgce': {
      'en': 'Quantity',
      'fr': 'Quantité',
    },
    '4etwxld5': {
      'en': '*',
      'fr': '*',
    },
    'uiq62brm': {
      'en': 'Weight',
      'fr': 'Lester',
    },
    'h07r4osr': {
      'en': 'Stock Status',
      'fr': 'État des stocks',
    },
    'il21m270': {
      'en': 'In Stock ',
      'fr': '',
    },
    'qp5x503t': {
      'en': 'In Stock ',
      'fr': 'En stock',
    },
    '11g6vto6': {
      'en': 'Exhausted',
      'fr': 'Épuisé',
    },
    'i78cz4fn': {
      'en': '',
      'fr': 'Veuillez sélectionner',
    },
    '4lwgon8p': {
      'en': 'Set the Product as a New from',
      'fr': 'Définissez le produit comme nouveau à partir de',
    },
    '23683jnf': {
      'en': 'To',
      'fr': 'Pour',
    },
    'sjyh91i6': {
      'en': 'Is Featured ',
      'fr': 'Est en vedette',
    },
    'nn16hd1u': {
      'en': 'Country',
      'fr': 'Pays',
    },
    '6t8r8awj': {
      'en': '*',
      'fr': '*',
    },
    'yb3z65hy': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'keli239f': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'gnx4py4c': {
      'en': 'Category',
      'fr': 'Catégorie',
    },
    'c8vgd1nq': {
      'en': '*',
      'fr': '*',
    },
    'bft2m7jx': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    '04l07kis': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'sx7st6y0': {
      'en': 'Sub Category',
      'fr': 'Sous-catégorie',
    },
    'ln3q6942': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'pveysdbx': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    '9ah9pcxz': {
      'en': 'Image Upload',
      'fr': 'Téléchargement d\'images',
    },
    'khakxguz': {
      'en': 'Select Photos',
      'fr': 'Sélectionnez Photos',
    },
    '55b19a7g': {
      'en': 'Short Description',
      'fr': 'brève description',
    },
    'iujn647h': {
      'en': '*',
      'fr': '*',
    },
    'zvb3hbaz': {
      'en': 'Description',
      'fr': 'Description',
    },
    'rhx1o4vy': {
      'en': '*',
      'fr': '*',
    },
    '8b098ni9': {
      'en': 'Meta Title',
      'fr': 'Méta-titre',
    },
    'unltsxru': {
      'en': 'Meta Description',
      'fr': 'Meta Description',
    },
    '3t2mscl4': {
      'en': 'Confirm',
      'fr': 'Confirmer',
    },
    'qn4cta99': {
      'en': 'Product  Name  is required',
      'fr': 'Le nom du produit est requis',
    },
    'fw4ogj21': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'cy5vmb36': {
      'en': 'SKU is required',
      'fr': 'SKU est requis',
    },
    'am92qs75': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'o6iocwn3': {
      'en': 'Price is required',
      'fr': 'Le prix est requis',
    },
    '0ng2emku': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'eg7lcpwf': {
      'en': 'Field is required',
      'fr': '',
    },
    'zln3wlbj': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '1nez42ly': {
      'en': 'Quantity is required',
      'fr': '',
    },
    '2w5vts3v': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'zv3pg4hl': {
      'en': 'Field is required',
      'fr': '',
    },
    'a3zcffw3': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'ymp8xw13': {
      'en': 'Short Description is required',
      'fr': 'La description est obligatoire',
    },
    'l11zmabn': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jf7v9d3q': {
      'en': 'Description is required',
      'fr': '',
    },
    'l7gm1o3c': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'gvz1721k': {
      'en': 'Field is required',
      'fr': '',
    },
    'q7j5ir37': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '04jiyfau': {
      'en': 'Field is required',
      'fr': '',
    },
    '0jxszvfz': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'wjm6ikqr': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // forgotPassword
  {
    's01ryyvc': {
      'en': 'Forgot Password',
      'fr': 'Mot de passe oublié',
    },
    'jdkbxb5u': {
      'en': 'Your Email',
      'fr': 'Votre e-mail',
    },
    'ejhpbld9': {
      'en': 'Submit',
      'fr': 'Soumettre',
    },
    '046440qs': {
      'en': 'Email is required',
      'fr': 'L\'e-mail est requis',
    },
    'i7rt6sr6': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
  },
  // appbar
  {
    '0un09esu': {
      'en': 'Back',
      'fr': 'Dos',
    },
  },
  // sucessMsg
  {
    '4qqgfptk': {
      'en': 'Sucess',
      'fr': 'Succès',
    },
    'ycim0m5d': {
      'en': 'OK',
      'fr': 'D\'ACCORD',
    },
  },
  // languageSelection
  {
    'iqkzporf': {
      'en': 'Select language',
      'fr': 'Choisir la langue',
    },
    't8c9txrm': {
      'en': 'French',
      'fr': 'Français',
    },
    'ph2q3vwm': {
      'en': 'English',
      'fr': 'Anglais',
    },
  },
  // Miscellaneous
  {
    'w3opl0f8': {
      'en': '',
      'fr': '',
    },
    'jbkgbd9v': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
