// import 'package:dialogflow_flutter/dialogflowFlutter.dart';
// import 'package:dialogflow_flutter/googleAuth.dart';
// import 'package:dialogflow_flutter/language.dart';


// class Bot {
//   Bot() {
//     //_init();
//   }
//   static _init() async {
//     AuthGoogle _authGoogle = await AuthGoogle(fileJson: "assets/small-talk-duvbxs-65dcf602fcbe.json").build();
//     DialogFlow _dialogflow = DialogFlow(authGoogle: _authGoogle, language: Language.english);
//     return _dialogflow;
//   }

//   static dynamic sendMessage({required String query}) async {
//     try {
//       var dialogflow = await _init();
//       AIResponse response = await dialogflow.detectIntent(query);
//       print(response.getMessage());
//       return response;
//     } catch (e) {
//       print("Encountered an exception with dialog flow ${e.toString()}");
//     }
//   }
// }