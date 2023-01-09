import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class MapAdressCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lon = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'map adress',
      apiUrl: 'https://tguinot.pythonanywhere.com/homescreen/${lat}/${lon}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic ownrocketchatid(dynamic response) => getJsonField(
        response,
        r'''$.own_info.rocket_chat.userid''',
      );
  static dynamic rockettoken(dynamic response) => getJsonField(
        response,
        r'''$.own_info.rocket_chat.token''',
      );
}

class MapAdressIbmCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lon = '',
  }) {
    final body = '''
{
  "lat": "${lat}",
  "lon": "${lon}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'map adress ibm',
      apiUrl:
          'https://eu-de.functions.appdomain.cloud/api/v1/web/839c8b2d-185e-42d7-88ce-2d78dfab04d6/default/depaniko-reverse-geolocate',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchstockproCall {
  static Future<ApiCallResponse> call({
    String? searchterm = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'searchstockpro',
      apiUrl: 'https://www.stock-pro.fr/stockpro/api/v1/references',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'per_page': 32,
        'page': 1,
        'has_public_stocks': true,
        'all_companies': true,
        'search[prefix_name]': searchterm,
        'search[location][lat]': 48.8421616,
        'search[location][lon]': 2.2927665,
        'search[order_by]': "distance+asc",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LocateAdressCall {
  static Future<ApiCallResponse> call({
    String? address = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'locate adress',
      apiUrl: 'https://tguinot.pythonanywhere.com/locate/${address}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic foundlatlng(dynamic response) => getJsonField(
        response,
        r'''$.latlng''',
      );
  static dynamic latitudefetched(dynamic response) => getJsonField(
        response,
        r'''$.latitude''',
      );
  static dynamic longitudefetched(dynamic response) => getJsonField(
        response,
        r'''$.longitude''',
      );
}

class RocketloginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    final body = '''
{
  "user": "${username}",
  "password":"${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rocketlogin',
      apiUrl: 'http://node149514-env-7236997.sh2.hidora.net:11341/api/v1/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic rocketoken(dynamic response) => getJsonField(
        response,
        r'''$.data.authToken''',
      );
}

class RocketgetmessagesCall {
  static Future<ApiCallResponse> call({
    String? usertoken = '',
    String? userid = '',
    String? roomid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'rocketgetmessages',
      apiUrl:
          'http://node149514-env-7236997.sh2.hidora.net:11341/api/v1/chat.syncMessages',
      callType: ApiCallType.GET,
      headers: {
        'X-Auth-Token': '${usertoken}',
        'X-User-Id': '${userid}',
      },
      params: {
        'roomId': roomid,
        'lastUpdate': "2022-04-16T18:30:46.669Z",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic messages(dynamic response) => getJsonField(
        response,
        r'''$.result.updated''',
        true,
      );
}

class RocketUserInfosCall {
  static Future<ApiCallResponse> call({
    String? userid = '',
    String? usertoken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'rocket user infos',
      apiUrl:
          'http://node149514-env-7236997.sh2.hidora.net:11341/api/v1/users.info',
      callType: ApiCallType.GET,
      headers: {
        'X-Auth-Token': '${usertoken}',
        'X-User-Id': '${userid}',
      },
      params: {
        'username': userid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic username(dynamic response) => getJsonField(
        response,
        r'''$.user.username''',
      );
  static dynamic userid(dynamic response) => getJsonField(
        response,
        r'''$.user._id''',
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.user.name''',
      );
  static dynamic avatartag(dynamic response) => getJsonField(
        response,
        r'''$.user.avatarETag''',
      );
}

class RocketsendmessageCall {
  static Future<ApiCallResponse> call({
    String? usertoken = '',
    String? userid = '',
    String? roomid = '',
    String? text = '',
  }) {
    final body = '''
{
  "roomId": "${roomid}",
  "text": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rocketsendmessage',
      apiUrl:
          'http://node149514-env-7236997.sh2.hidora.net:11341/api/v1/chat.postMessage',
      callType: ApiCallType.POST,
      headers: {
        'X-Auth-Token': '${usertoken}',
        'X-User-Id': '${userid}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic messages(dynamic response) => getJsonField(
        response,
        r'''$.result.updated''',
        true,
      );
}

class OffersCall {
  static Future<ApiCallResponse> call({
    String? searchid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'offers',
      apiUrl: 'https://tguinot.pythonanywhere.com/proposal/${searchid}/offers',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic alloffers(dynamic response) => getJsonField(
        response,
        r'''$.offers''',
        true,
      );
  static dynamic allquestions(dynamic response) => getJsonField(
        response,
        r'''$.offers[:].worker_questions[:]''',
        true,
      );
  static dynamic locations(dynamic response) => getJsonField(
        response,
        r'''$.offers[:].company.location''',
        true,
      );
}

class OffersCopyCall {
  static Future<ApiCallResponse> call({
    String? searchid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'offers Copy',
      apiUrl: 'https://tguinot.pythonanywhere.com/proposal/${searchid}/offers',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic alloffers(dynamic response) => getJsonField(
        response,
        r'''$.offers''',
        true,
      );
  static dynamic allquestions(dynamic response) => getJsonField(
        response,
        r'''$.offers[:].worker_questions[:]''',
        true,
      );
}

class OfferCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'offer',
      apiUrl: 'https://tguinot.pythonanywhere.com/offer/${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.worktime''',
      );
  static dynamic delay(dynamic response) => getJsonField(
        response,
        r'''$.quote.line_items[0].quantity''',
      );
  static dynamic hours(dynamic response) => getJsonField(
        response,
        r'''$.quote.line_items[0].quantity''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic materials(dynamic response) => getJsonField(
        response,
        r'''$.quote.line_items[2].price''',
      );
  static dynamic rate(dynamic response) => getJsonField(
        response,
        r'''$.quote.line_items[0].price''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.quote.total''',
      );
  static dynamic travelcost(dynamic response) => getJsonField(
        response,
        r'''$.quote.line_items[1].price''',
      );
  static dynamic workercity(dynamic response) => getJsonField(
        response,
        r'''$.company.city''',
      );
  static dynamic workerid(dynamic response) => getJsonField(
        response,
        r'''$.company_id''',
      );
  static dynamic searchjob(dynamic response) => getJsonField(
        response,
        r'''$.search.job''',
      );
  static dynamic workername(dynamic response) => getJsonField(
        response,
        r'''$.company.name''',
      );
  static dynamic workertelephone(dynamic response) => getJsonField(
        response,
        r'''$.company.telephone''',
      );
  static dynamic lineitemone(dynamic response) => getJsonField(
        response,
        r'''$.quote.line_items[0].desc''',
      );
  static dynamic lineitemtwo(dynamic response) => getJsonField(
        response,
        r'''$.quote.line_items[1].desc''',
      );
  static dynamic experience(dynamic response) => getJsonField(
        response,
        r'''$.company.experience''',
      );
  static dynamic searchworktype(dynamic response) => getJsonField(
        response,
        r'''$.search.worktype''',
      );
  static dynamic companyworktypes(dynamic response) => getJsonField(
        response,
        r'''$.company.worktypes''',
        true,
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.search.address''',
      );
  static dynamic rocketchatid(dynamic response) => getJsonField(
        response,
        r'''$.company.rocket_chat_id''',
      );
}

class MyworksCall {
  static Future<ApiCallResponse> call({
    String? customerId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'myworks',
      apiUrl: 'https://tguinot.pythonanywhere.com/works/${customerId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic currentworks(dynamic response) => getJsonField(
        response,
        r'''$.started''',
        true,
      );
  static dynamic futureworks(dynamic response) => getJsonField(
        response,
        r'''$.searchings''',
        true,
      );
  static dynamic pastworks(dynamic response) => getJsonField(
        response,
        r'''$.finished''',
        true,
      );
}

class GetsearchCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getsearch',
      apiUrl: 'https://tguinot.pythonanywhere.com/search/${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.address''',
      );
  static dynamic customerid(dynamic response) => getJsonField(
        response,
        r'''$.customer_id''',
      );
  static dynamic customershopifyid(dynamic response) => getJsonField(
        response,
        r'''$.customer_shopify_id''',
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  static dynamic epicentre(dynamic response) => getJsonField(
        response,
        r'''$.epicentre''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic job(dynamic response) => getJsonField(
        response,
        r'''$.job''',
      );
  static dynamic worktime(dynamic response) => getJsonField(
        response,
        r'''$.worktime''',
      );
  static dynamic worktype(dynamic response) => getJsonField(
        response,
        r'''$.worktype''',
      );
  static dynamic qualificationsids(dynamic response) => getJsonField(
        response,
        r'''$.qualifications_ids''',
        true,
      );
}

class SubmitsearchCall {
  static Future<ApiCallResponse> call({
    String? latitude = '',
    String? customerId = '',
    String? address = '',
    String? job = '',
    String? worktype = '',
    String? description = '',
    String? longitude = '',
    String? stripeCustomerId = 'bla',
    double? searchdistance,
    List<String>? qualificationsList,
  }) {
    final qualifications = _serializeList(qualificationsList);

    final body = '''
{
  "location": {
    "latitude": "${latitude}",
    "longitude": "${longitude}"
  },
  "customer_id": "${customerId}",
  "address": "${address}",
  "job": "${job}",
  "worktype": "${worktype}",
  "description": "${description}",
  "stripe_customer_id": "${stripeCustomerId}",
  "searchdistance": ${searchdistance},
  "qualifications_ids": ${qualifications}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitsearch',
      apiUrl: 'https://tguinot.pythonanywhere.com/search/new',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic searchid(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class CreateofferCall {
  static Future<ApiCallResponse> call({
    double? travelCost,
    double? fixedRate,
    double? materialsPrice,
    String? searchId = '',
    String? taskProductId = '',
    double? hourlyRate,
    int? hours,
    String? companyId = '',
    int? delay,
    String? job = '',
    String? task = '',
  }) {
    final body = '''
{
  "travel_cost": ${travelCost},
  "fixed_rate": ${fixedRate},
  "materials_price": ${materialsPrice},
  "hourly_rate": ${hourlyRate},
  "hours": ${hours},
  "company_id": "${companyId}",
  "task_product_id": "${taskProductId}",
  "delay": ${delay},
  "job": "${job}",
  "task": "${task}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createoffer',
      apiUrl:
          'https://tguinot.pythonanywhere.com/search/${searchId}/offer/create',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AcceptOfferCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'accept offer',
      apiUrl: 'https://tguinot.pythonanywhere.com/offer/${id}/accept',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateQuotePdfCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'create quote pdf',
      apiUrl: 'https://tguinot.pythonanywhere.com/offer/${id}/quote',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SignquotepdfCall {
  static Future<ApiCallResponse> call({
    String? signatureUrl = '',
    String? offerid = '',
  }) {
    final body = '''
{
  "sig_url": "${signatureUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signquotepdf',
      apiUrl: 'https://tguinot.pythonanywhere.com/offer/${offerid}/sign_quote',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic quoteid(dynamic response) => getJsonField(
        response,
        r'''$.cart_id''',
      );
  static dynamic companyid(dynamic response) => getJsonField(
        response,
        r'''$.company_id''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic quoteurl(dynamic response) => getJsonField(
        response,
        r'''$.quote_url''',
      );
  static dynamic searchid(dynamic response) => getJsonField(
        response,
        r'''$.search_id''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.worktime''',
      );
}

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
