class ApiNames{

  //development
  static const String baseUrl = "https://alrashid.hwzn.sa/api/employer/";

  // auth routes
  static const String login = "login";
  static const String logout = "logout";
  static const String forgetPassword = "reset-password-request";
  static const String resetPasswordByCode = "reset-password-code";
  static const String resetPassword = "reset-password-code";

  static const String savePublicKey = "users/";
  static const String updateUser = "update";
  static const String register = "register";
  static const String places = "https://alrashid.hwzn.sa/api/places";
  static const String place = "https://alrashid.hwzn.sa/api/place/";
  static const String activeAccount = "otp/verify";
  static const String resendCode = "ResendCode";
  static const String switchNotify = "SwitchNotify";
  static const String managerEmployees = "manger-emplyers";
  static const String acceptEmployees = "accept-employer";
  static const String refuseEmployees = "refused-employer";
  static const String deleteEmployees = "delete-employer";
  static const String updateEmployees = "update-emplyer";
  static const String shareInvoice = "upload-invoice";
  static const String changLang = "change-language";
  static const String scanCode = "scan-code";
  static const String confirmPrice = "confirm-amount";
  static const String qrCode = "https://alrashid.hwzn.sa/api/code and invoices/qr-code";
  static const String contactUs = "https://alrashid.hwzn.sa/api/contact";
  static const String settings = "https://alrashid.hwzn.sa/api/settings";

  //Ads routes
  static const String ADS = "Advertisements";


  //Agents routes
  static const String AGENTS = "Agents";
  static const String AGENTS_FEATURED = AGENTS+"/Featured";

  //Categories routes
  static const String CATEGORIES = "Category";
  static const String CATEGORIES_HOME = CATEGORIES+"/GetAllRoot";
  static const String CATEGORIES_ITEMS_HOME = CATEGORIES+"/GetHomeScreenCategoryItems";


  //items routes
  static const String ITEMS = "Items";
  static const String FEATURED_ITEMS = ITEMS+"/Featured";


  static const String REFRESH_TOKEN = "RefreshToken";
  static String GEOCODE_URL = "https://geocode.xyz/";



}