import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.white,
                child: Center(
                  child: Image.asset(
                    'assets/images/image_1.png',
                    width: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          : NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.white,
                    child: Center(
                      child: Image.asset(
                        'assets/images/image_1.png',
                        width: MediaQuery.of(context).size.width * 0.7,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                )
              : NavBarPage(),
          routes: [
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Home')
                  : HomeWidget(),
            ),
            FFRoute(
              name: 'splashScreen',
              path: 'splashScreen',
              builder: (context, params) => SplashScreenWidget(),
            ),
            FFRoute(
              name: 'Filter',
              path: 'filter',
              builder: (context, params) => FilterWidget(),
            ),
            FFRoute(
              name: 'main_Category',
              path: 'mainCategory',
              builder: (context, params) => MainCategoryWidget(
                cetegoryId: params.getParam('cetegoryId', ParamType.int),
                cateName: params.getParam('cateName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'search',
              path: 'search',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'search')
                  : SearchWidget(),
            ),
            FFRoute(
              name: 'BuyMembershipPage',
              path: 'buyMembershipPage',
              builder: (context, params) => BuyMembershipPageWidget(
                commingFromHome:
                    params.getParam('commingFromHome', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'registerFormPricing',
              path: 'registerFormPricing',
              builder: (context, params) => RegisterFormPricingWidget(),
            ),
            FFRoute(
              name: 'All_Category',
              path: 'allCategory',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'All_Category')
                  : AllCategoryWidget(),
            ),
            FFRoute(
              name: 'registerFormcompanyDetails',
              path: 'registerFormcompanyDetails',
              builder: (context, params) => RegisterFormcompanyDetailsWidget(),
            ),
            FFRoute(
              name: 'EditProfile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'ManageProducts',
              path: 'manageProducts',
              builder: (context, params) => ManageProductsWidget(),
            ),
            FFRoute(
              name: 'MyAccounts',
              path: 'myAccounts',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MyAccounts')
                  : MyAccountsWidget(),
            ),
            FFRoute(
              name: 'addProduct',
              path: 'addProduct',
              builder: (context, params) => AddProductWidget(),
            ),
            FFRoute(
              name: 'privacyPolicy',
              path: 'privacyPolicy',
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'LogInPage',
              path: 'logInPage',
              builder: (context, params) => LogInPageWidget(),
            ),
            FFRoute(
              name: 'sellerRegisteration',
              path: 'sellerRegisteration',
              builder: (context, params) => SellerRegisterationWidget(),
            ),
            FFRoute(
              name: 'sucessScreen2',
              path: 'sucessScreen2',
              builder: (context, params) => SucessScreen2Widget(
                msg: params.getParam('msg', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Product_detailPage',
              path: 'productDetailPage',
              builder: (context, params) => ProductDetailPageWidget(
                id: params.getParam('id', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'categoryPage',
              path: 'categoryPage',
              builder: (context, params) => CategoryPageWidget(
                categoryID: params.getParam('categoryID', ParamType.String),
                categoryName: params.getParam('categoryName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ChangePassword',
              path: 'changePassword',
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: 'webview',
              path: 'webview',
              builder: (context, params) => WebviewWidget(
                pagename: params.getParam('pagename', ParamType.String),
                pageURL: params.getParam('pageURL', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'editProduct',
              path: 'editProduct',
              builder: (context, params) => EditProductWidget(
                id: params.getParam('id', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'paymentWebView',
              path: 'paymentWebView',
              builder: (context, params) => PaymentWebViewWidget(
                url: params.getParam('url', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
