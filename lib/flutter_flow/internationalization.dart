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
    'tbzjdptw': {
      'en': '27 189',
      'fr': '27 189',
    },
    '15llcaa4': {
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
    'c8qyhf09': {
      'en': 'Search',
      'fr': 'Recherche',
    },
    '9ugg92yn': {
      'en': 'FCFA',
      'fr': 'FCFA',
    },
    'l5195fyp': {
      'en': 'Search',
      'fr': 'Recherche',
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
      'fr': '',
    },
    'lq4l5hgv': {
      'en': '',
      'fr': 'Nom',
    },
    'schp4wrh': {
      'en': 'Your Email',
      'fr': '',
    },
    'm51jdzb0': {
      'en': '',
      'fr': 'Votre e-mail',
    },
    '7szg26og': {
      'en': 'Public Name',
      'fr': '',
    },
    'o2843kjb': {
      'en': '',
      'fr': 'Nom public',
    },
    'tg4jnqx5': {
      'en': 'Gender',
      'fr': '',
    },
    'ddo9zma9': {
      'en': 'Male',
      'fr': '',
    },
    'hew0p9dx': {
      'en': 'Female',
      'fr': '',
    },
    'sj2zs9b5': {
      'en': 'Please select...',
      'fr': '',
    },
    'yd8vgjd6': {
      'en': 'Shop URL',
      'fr': '',
    },
    'pu994wls': {
      'en': '',
      'fr': 'URL de la boutique',
    },
    'heuaoa1i': {
      'en': 'Contact Number',
      'fr': '',
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
      'en': 'First Name is required',
      'fr': 'Le prénom est requis',
    },
    'v43cw97q': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jfgayoj3': {
      'en': 'Last Name is required',
      'fr': 'Le nom de famille est requis',
    },
    'q2bphygf': {
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
      'fr': '',
    },
    '1bgcum69': {
      'en': '',
      'fr': 'Liens Facebook',
    },
    'bobcwdkr': {
      'en': 'Business email',
      'fr': '',
    },
    'qe1ao6ds': {
      'en': '',
      'fr': 'E-mail professionnel',
    },
    'wmqmt4zv': {
      'en': 'Business Contact number',
      'fr': '',
    },
    'uxm7mi4b': {
      'en': '',
      'fr': 'Numéro de contact professionnel',
    },
    'c5y6y0j4': {
      'en': 'Whatsapp number',
      'fr': '',
    },
    'fkkb55hi': {
      'en': '',
      'fr': 'Numéro WhatsApp',
    },
    '3mfdocdn': {
      'en': 'About',
      'fr': '',
    },
    'vphnvefz': {
      'en': '',
      'fr': 'Liens Facebook',
    },
    '0fweyao9': {
      'en': 'Facebook Links',
      'fr': '',
    },
    '5mg8rgtx': {
      'en': '',
      'fr': 'Liens Facebook',
    },
    'lmenbq21': {
      'en': 'Twitter Links',
      'fr': '',
    },
    'e6qfakaz': {
      'en': '',
      'fr': 'Liens Facebook',
    },
    'da4rbw3c': {
      'en': 'Company Logo',
      'fr': '',
    },
    'lkm40ew1': {
      'en': 'Upload',
      'fr': 'Télécharger',
    },
    'gnadkps6': {
      'en': 'Company Banner',
      'fr': '',
    },
    'cjuh6ur0': {
      'en': 'Upload',
      'fr': 'Télécharger',
    },
    'mggg2z6a': {
      'en': 'Business Address',
      'fr': '',
    },
    'gph2ryrn': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    'tyb3vn59': {
      'en': 'Meta Keywords',
      'fr': '',
    },
    'evhoh7dd': {
      'en': 'Meta Description',
      'fr': '',
    },
    '868ao0pr': {
      'en': 'Address',
      'fr': '',
    },
    'dm8drsmy': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    'rw528rrh': {
      'en': 'City',
      'fr': '',
    },
    'dct2e67u': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    'p58rnj7i': {
      'en': 'Zip Code',
      'fr': '',
    },
    '6fvtied8': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    'f9dzocp8': {
      'en': 'State',
      'fr': '',
    },
    'u5hs8lnl': {
      'en': '',
      'fr': 'Adresse d\'affaires',
    },
    '0g7ke5wk': {
      'en': 'Country',
      'fr': '',
    },
    'veo4aa6b': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'eaeq5isb': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
    },
    'qesddxaj': {
      'en': 'Save',
      'fr': 'Sauvegarder',
    },
    'eovt2t7s': {
      'en': 'Business Email is required',
      'fr': 'L\'adresse e-mail professionnelle est requise',
    },
    'gcym2erl': {
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
    'jo1zt6nr': {
      'en': 'Social Media Link is required',
      'fr': 'Le lien vers les médias sociaux est requis',
    },
    'iz11i4ma': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '9t5ndjli': {
      'en': 'Company Image is required',
      'fr': 'L\'image de l\'entreprise est requise',
    },
    'htcfvydd': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '7i079ogs': {
      'en': 'Industry is required',
      'fr': 'L\'industrie est nécessaire',
    },
    '719ieeyb': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'cfskauhh': {
      'en': 'Product categories is required',
      'fr': 'Les catégories de produits sont requises',
    },
    'xo2mg1qv': {
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
    'vu7ttq17': {
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
    '1s67b7gm': {
      'en': 'Special Price',
      'fr': 'Prix spécial',
    },
    '48bqkyu6': {
      'en': 'Quantity',
      'fr': 'Quantité',
    },
    'ln1tvq9n': {
      'en': 'Weight',
      'fr': 'Lester',
    },
    'fedck62x': {
      'en': 'Stock Status',
      'fr': 'État des stocks',
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
      'en': 'Please select',
      'fr': 'Veuillez sélectionner',
    },
    '7xo2l30t': {
      'en': 'Set the Product as a New from',
      'fr': 'Définissez le produit comme nouveau à partir de',
    },
    'tmgifpgv': {
      'en': '14-01-2023',
      'fr': '14-01-2023',
    },
    'zzsucxyz': {
      'en': 'To',
      'fr': 'Pour',
    },
    '9er7y2um': {
      'en': '15-02-2023',
      'fr': '15-02-2023',
    },
    'gt3zd2as': {
      'en': 'Is Featured ',
      'fr': 'Est en vedette',
    },
    'q2bgfi67': {
      'en': 'Non',
      'fr': 'Non',
    },
    'h2d0wn47': {
      'en': 'Country',
      'fr': 'Pays',
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
    'drupwz7u': {
      'en': 'Description',
      'fr': 'Description',
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
    'q7cbhdhb': {
      'en': 'Quantity is required',
      'fr': 'La quantité est requise',
    },
    'chdkyou7': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'u04kux11': {
      'en': 'Description is required',
      'fr': 'La description est obligatoire',
    },
    '7ne2q8u9': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
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
      'en': 'term_condition',
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
