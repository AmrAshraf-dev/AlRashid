import 'package:alrashid_mall_app/utils/global_state.dart';

mixin EndPointHeaders {
  static Map<String, String> onlyContentTypeMap = {
    'Content-Type': 'application/json',
  };
  
  static Map<String, String> contentTypeAndTokenMap(String token) => {
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      };
         
  static Map<String, String> contentTypeAndAcceptAndTokenMap(String token) => {
        'Accept': 'application/json',
        "Authorization": "Bearer ${GlobalState.instance.get('token')}",
        "Content-Type": 'application/json'
      };

  static Map<String, String> onlyTokenMap(String token) => {
        "Authorization": "Bearer ${GlobalState.instance.get('token')}",
      };
}
