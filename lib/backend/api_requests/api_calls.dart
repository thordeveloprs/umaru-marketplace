import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start umaru Group Code

class UmaruGroup {
  static String baseUrl = 'https://staging.umarumart.com/';
  static Map<String, String> headers = {
    'Content_type': 'application/json',
    'Authorization': 'Bearer [token]',
  };
  static LoginCall loginCall = LoginCall();
  static AdminLoginCall adminLoginCall = AdminLoginCall();
  static GetCategoryInEnglishCall getCategoryInEnglishCall =
      GetCategoryInEnglishCall();
  static GetCategoryInFrenchCall getCategoryInFrenchCall =
      GetCategoryInFrenchCall();
  static BestSellerInFrenchCall bestSellerInFrenchCall =
      BestSellerInFrenchCall();
  static BestSellerInEnglishCall bestSellerInEnglishCall =
      BestSellerInEnglishCall();
  static GetProductByVenderCall getProductByVenderCall =
      GetProductByVenderCall();
  static CreateProductCall createProductCall = CreateProductCall();
  static EditProductCall editProductCall = EditProductCall();
  static GetCategoryByVendorCall getCategoryByVendorCall =
      GetCategoryByVendorCall();
  static RegisterCall registerCall = RegisterCall();
  static UpdateCompanyDetailsCall updateCompanyDetailsCall =
      UpdateCompanyDetailsCall();
  static UpdateUserDetailsCall updateUserDetailsCall = UpdateUserDetailsCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static ProductByCategoryIdAndProductIdCall
      productByCategoryIdAndProductIdCall =
      ProductByCategoryIdAndProductIdCall();
  static GetVendorDetailsByProductIdCall getVendorDetailsByProductIdCall =
      GetVendorDetailsByProductIdCall();
  static GetVendorAndCompanyDetailsCall getVendorAndCompanyDetailsCall =
      GetVendorAndCompanyDetailsCall();
  static VendorDetailsForProductPageCall vendorDetailsForProductPageCall =
      VendorDetailsForProductPageCall();
  static SearchVendorProductCall searchVendorProductCall =
      SearchVendorProductCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${UmaruGroup.baseUrl}vendorapi/index/login',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic vendorId(dynamic response) => getJsonField(
        response,
        r'''$.vendor_id''',
      );
  dynamic hashKey(dynamic response) => getJsonField(
        response,
        r'''$.hashkey''',
      );
  dynamic profileImage(dynamic response) => getJsonField(
        response,
        r'''$.profile_picture''',
      );
  dynamic vendorName(dynamic response) => getJsonField(
        response,
        r'''$.vendor_name''',
      );
}

class AdminLoginCall {
  Future<ApiCallResponse> call({
    String? username = 'admin',
    String? password = 'admin@321#',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'admin login',
      apiUrl: '${UmaruGroup.baseUrl}/rest/V1/integration/admin/token',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'username': username,
        'password': password,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic responseToken(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetCategoryInEnglishCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get category in english',
      apiUrl: '${UmaruGroup.baseUrl}rest/en/V1/categories/list?searchCriteria',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic productCategories(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
}

class GetCategoryInFrenchCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get category in french',
      apiUrl: '${UmaruGroup.baseUrl}rest/V1/categories/list?searchCriteria',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BestSellerInFrenchCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'best seller in french',
      apiUrl: '${UmaruGroup.baseUrl}rest/V1/wishusucess/bestsellerproducts/',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BestSellerInEnglishCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'best seller in english',
      apiUrl: '${UmaruGroup.baseUrl}rest/en/V1/wishusucess/bestsellerproducts/',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetProductByVenderCall {
  Future<ApiCallResponse> call({
    String? hashkey = '',
    String? vendorId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get product by vender',
      apiUrl: '${UmaruGroup.baseUrl}vendorapi/vproducts/item/page/1',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'hashkey': hashkey,
        'vendor_id': vendorId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic productList(dynamic response) => getJsonField(
        response,
        r'''$.data.products''',
        true,
      );
}

class CreateProductCall {
  Future<ApiCallResponse> call({
    String? vendorId = '',
    String? hashkey = '',
    String? name = '',
    String? sku = '',
    int? price,
    int? qty,
    FFLocalFile? images,
    String? category = '',
    String? description = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'create product',
      apiUrl: '${UmaruGroup.baseUrl}vproductapi/vproducts/createproduct',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'vendor_id': vendorId,
        'hashkey': hashkey,
        'name': name,
        'sku': sku,
        'type': "simple",
        'is_in_stock': 1,
        'price': price,
        'set': 4,
        'visibility': 4,
        'qty': qty,
        'status': 1,
        'images': images,
        'category': category,
        'description': description,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditProductCall {
  Future<ApiCallResponse> call({
    String? vendorId = '',
    String? hashkey = '',
    String? name = '',
    String? sku = '',
    String? country = '',
    int? price,
    int? qty,
    List<String>? imagesList,
    int? productId,
  }) {
    final images = _serializeList(imagesList);

    return ApiManager.instance.makeApiCall(
      callName: 'edit  product',
      apiUrl: '${UmaruGroup.baseUrl}vproductapi/vproducts/createproduct',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'vendor_id': vendorId,
        'hashkey': hashkey,
        'name': name,
        'sku': sku,
        'country': country,
        'type': "simple",
        'is_in_stock': 1,
        'price': price,
        'set': 4,
        'visibility': 4,
        'qty': qty,
        'status': 1,
        'images': images,
        'product_id': productId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCategoryByVendorCall {
  Future<ApiCallResponse> call({
    int? vendorId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get category by vendor',
      apiUrl: '${UmaruGroup.baseUrl}vproductapi/vproducts/allowedAttribute?',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'vendor_id': vendorId,
        'set': 4,
        'type': "simple",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RegisterCall {
  Future<ApiCallResponse> call({
    dynamic? createaccountJson,
  }) {
    final createaccount = _serializeJson(createaccountJson);

    return ApiManager.instance.makeApiCall(
      callName: 'register',
      apiUrl: '${UmaruGroup.baseUrl}/vendorapi/index/create',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'createaccount': createaccount,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateCompanyDetailsCall {
  Future<ApiCallResponse> call({
    String? contactNumber = '',
    String? companyAddress = '',
    String? supportNumber = '',
    FFLocalFile? companyLogo,
    String? vendorId = '',
    String? hashkey = '',
    String? facebookId = '',
    String? supportEmail = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'update company details',
      apiUrl:
          '${UmaruGroup.baseUrl}/vendorapi/index/update?hashkey=${hashkey}&vendor_id=${vendorId}',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'contact_number': contactNumber,
        'company_address': companyAddress,
        'support_number': supportNumber,
        'facebook_id': facebookId,
        'support_email': supportEmail,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateUserDetailsCall {
  Future<ApiCallResponse> call({
    String? vendorId = '',
    String? hashkey = '',
    String? name = '',
    String? email = '',
    String? publicName = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'update user details ',
      apiUrl:
          '${UmaruGroup.baseUrl}/vendorapi/index/update?hashkey=${hashkey}&vendor_id=${vendorId}',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'name': name,
        'email': email,
        'public_name': publicName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'forgot password',
      apiUrl: '${UmaruGroup.baseUrl}vendorapi/index/forgotPassword',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProductByCategoryIdAndProductIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
    String? searchTerm = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'product by category id and product id',
      apiUrl: '${UmaruGroup.baseUrl}rest/en/V1/products',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'searchCriteria[filter_groups][0][filters][0][value]': id,
        'searchCriteria[filter_groups][0][filters][0][field]': searchTerm,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic getItems(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
}

class GetVendorDetailsByProductIdCall {
  Future<ApiCallResponse> call({
    int? productid,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get vendor details by product id',
      apiUrl: '${UmaruGroup.baseUrl}rest/V1/wishusucess/vendordetail/',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'productid': productid,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetVendorAndCompanyDetailsCall {
  Future<ApiCallResponse> call({
    String? hashkey = '',
    String? vendorId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get Vendor and Company Details',
      apiUrl: '${UmaruGroup.baseUrl}vendorapi/index/infos',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'hashkey': hashkey,
        'vendor_id': vendorId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic informationsgnrales(dynamic response) => getJsonField(
        response,
        r'''$.data['Informations générales']''',
        true,
      );
  dynamic informationssurlasocit(dynamic response) => getJsonField(
        response,
        r'''$.data["Informations sur la société"]''',
        true,
      );
  dynamic informationsd039assistance(dynamic response) => getJsonField(
        response,
        r'''$.data["Informations d&#039;assistance"]''',
        true,
      );
}

class VendorDetailsForProductPageCall {
  Future<ApiCallResponse> call({
    String? productid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'vendor details for product page',
      apiUrl: '${UmaruGroup.baseUrl}rest/V1/wishusucess/vendordetail/',
      callType: ApiCallType.POST,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'productid': productid,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchVendorProductCall {
  Future<ApiCallResponse> call({
    dynamic? filterJson,
    String? hashkey = '',
    String? vendorId = '',
  }) {
    final filter = _serializeJson(filterJson);

    return ApiManager.instance.makeApiCall(
      callName: 'search vendor product',
      apiUrl: '${UmaruGroup.baseUrl}vendorapi/vproducts/item/page/1',
      callType: ApiCallType.GET,
      headers: {
        ...UmaruGroup.headers,
      },
      params: {
        'filter': filter,
        'hashkey': hashkey,
        'vendor_id': vendorId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End umaru Group Code

/// Start search Group Group Code

class SearchGroupGroup {
  static String baseUrl = 'https://staging.umarumart.com/';
  static Map<String, String> headers = {
    'Content_type': 'application/json',
  };
  static SearchCall searchCall = SearchCall();
}

class SearchCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'search',
      apiUrl: '${SearchGroupGroup.baseUrl}rest/en/V1/products',
      callType: ApiCallType.GET,
      headers: {
        ...SearchGroupGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'searchCriteria[filter_groups][0][filters][0][field]': "name",
        'searchCriteria[filter_groups][0][filters][0][condition_type]': "like",
        'searchCriteria[filter_groups][0][filters][1][field]': "name",
        'searchCriteria[filter_groups][0][filters][0][value]': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
}

/// End search Group Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
