//const String baseUrl = 'https://test.hawzen.sa/alrashid/api/';
const String baseUrl = 'https://alrashid.hwzn.sa/api/';

mixin EndPointsUrls {
  //~ AUTH :
  static const String loginUrl = '${baseUrl}login';
  static const String signUpUrl = '${baseUrl}register';
  static const String socialLoginURL = "${baseUrl}social-login";
  static const String forgetPassUrl = "${baseUrl}reset-password-request";
  static const String checkOTPUrl = "${baseUrl}reset-password-code";
  //static const String resendOTPURL = "${baseUrl}send-verify-email";
  //static const String verifyEmailURL = "${baseUrl}verify-email";
  static const String userDataUrl = "${baseUrl}me";
  static const String resetPassUrl = "${baseUrl}reset-password";
  static const String updateMyDataUrl = "${baseUrl}update";
  static const String contactUsUrl = "${baseUrl}contact";
  static const String logoutUrl = "${baseUrl}logout";
  static const String deleteUrl = "${baseUrl}delete";

  //~ Home:
  static const String homeURL = "${baseUrl}home";
  static const String allEvents = "${baseUrl}events";
  static String showEventsById(String id) => "${baseUrl}events/$id";
  static String showServicesDetailsById(String id) => "${baseUrl}services/$id";
  static const String allCategories = "${baseUrl}categories";
  static String showCategoriesById(String id) => "${baseUrl}category/$id";

  //~ Search
  static String searchURL({
    required String keyWord,
    dynamic serviceID,
  }) =>
      "${baseUrl}search/?search=$keyWord&service=$serviceID";

//~ Stores
  static const String storesUrl = "${baseUrl}places";
  static String storesDetailsUrl(String id) => "${baseUrl}place/$id";

  //~ Coupons
  static const String couponsUrl = "${baseUrl}codes";

  //~Purchase value
  static const String purchaseValueUrl = "${baseUrl}confirm-price";
}
