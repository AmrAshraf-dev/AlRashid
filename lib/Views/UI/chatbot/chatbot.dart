// import 'package:alrashid_mall_app/locale/locale.dart';
// // import 'package:dialogflow_flutter/dialogflowFlutter.dart';
// // import 'package:dialogflow_flutter/googleAuth.dart';
// // import 'package:dialogflow_flutter/language.dart';
// // import 'package:dialogflow_flutter/message.dart';
// import 'package:flutter/material.dart';

// class Chatbot extends StatefulWidget {
//   const Chatbot({Key? key}) : super(key: key);

//   @override
//   State<Chatbot> createState() => _ChatbotState();
// }

// class _ChatbotState extends State<Chatbot> {
//   final List<ChatMessage> _messages = <ChatMessage>[];
//   final TextEditingController _textController = TextEditingController();

//   Widget _buildTextComposer() {
//     var locale = AppLocalizations.of(context);
//     return IconTheme(
//       data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: <Widget>[
//             Flexible(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   style: const TextStyle(
//                     fontFamily: ('DINNextLTArabic'),
//                   ),
//                   controller: _textController,
//                   onSubmitted: _handleSubmitted,
//                   decoration: InputDecoration(
//                     suffixIcon: IconButton(
//                         icon: Image.asset(
//                           'assets/images/sendmsg.png',
//                           width: 20.0,
//                           height: 15.0,
//                         ),
//                         onPressed: () =>
//                             _handleSubmitted(_textController.text)),
//                     hintText: locale!.enterYourMessageHere!,
//                     enabledBorder: OutlineInputBorder(
//                         // borderSide: const BorderSide(
//                         //     color: Color(0xfff2f2f2), width: 32.0),
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(25.0)),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                           color: Color(0xfff2f2f2), width: 32.0),
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                     fillColor: const Color(0xfff2f2f2),
//                     filled: true,
//                   ),
//                 ),
//               ),
//             ),
//             // Container(
//             //   margin: EdgeInsets.symmetric(horizontal: 4.0),
//             //   child:
//             //   IconButton(
//             //       icon: Image.asset(
//             //         'assets/images/sendmsg.png',
//             //         width: 20.0,
//             //         height: 15.0,
//             //       ),
//             //       onPressed: () => _handleSubmitted(_textController.text)),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   // void response(query) async {
//   //   _textController.clear();
//   //   AuthGoogle authGoogle =
//   //       await AuthGoogle(fileJson: "assets/credentials.json").build();
//   //   DialogFlow dialogflow =
//   //       DialogFlow(authGoogle: authGoogle, language: Language.english);
//   //   AIResponse response = await dialogflow.detectIntent(query);
//   //   ChatMessage message = ChatMessage(
//   //     text: response.getMessage() ??
//   //         CardDialogflow(response.getListMessage()[0]).title,
//   //     name: "Eliana",
//   //     type: false,
//   //   );
//   //   setState(() {
//   //     _messages.insert(0, message);
//   //   });
//   // }

//   void _handleSubmitted(String text) {
//     _textController.clear();
//     ChatMessage message = ChatMessage(
//       text: text,
//       name: "Me",
//       type: true,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     // response(text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     var locale = AppLocalizations.of(context);
//     return Scaffold(
//       backgroundColor: const Color(0xffb83f48),
//       body: Directionality(
//         textDirection: locale!.locale.languageCode == 'en'
//             ? TextDirection.rtl
//             : TextDirection.ltr,
//         child: Column(children: <Widget>[
//           Directionality(
//             textDirection: locale.locale.languageCode == 'en'
//                 ? TextDirection.rtl
//                 : TextDirection.ltr,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: locale.locale.languageCode == 'en'
//                       ? Padding(
//                           padding: EdgeInsets.only(
//                             right: width * 0.05,
//                             top: height * 0.05,
//                           ),
//                           child: const Icon(
//                             Icons.arrow_back_ios,
//                             color: Colors.white,
//                           ),
//                         )
//                       : Padding(
//                           padding: EdgeInsets.only(
//                             left: width * 0.05,
//                             top: height * 0.05,
//                           ),
//                           child: const Icon(
//                             Icons.arrow_back_ios,
//                             color: Colors.white,
//                           ),
//                         ),
//                 ),
//                 locale.locale.languageCode == 'en'
//                     ? Padding(
//                         padding: EdgeInsets.only(
//                             top: height * 0.05, right: width * 0.3),
//                         child: Text(
//                           locale.chat!,
//                           style: const TextStyle(
//                               color: Color(0xffffffff),
//                               fontFamily: ('DINNextLTArabic'),
//                               fontSize: 25.0),
//                         ),
//                       )
//                     : Padding(
//                         padding: EdgeInsets.only(
//                             top: height * 0.05, left: width * 0.3),
//                         child: Text(
//                           locale.chat!,
//                           style: const TextStyle(
//                               color: Color(0xffffffff),
//                               fontFamily: ('DINNextLTArabic'),
//                               fontSize: 25.0),
//                         ),
//                       ),
//               ],
//             ),
//           ),
//           Flexible(
//               child: Padding(
//             padding: EdgeInsets.only(top: height * 0.05),
//             child: Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(50),
//                   topLeft: Radius.circular(50),
//                 ),
//                 color: Colors.white,
//               ),
//               child: ListView.builder(
//                 padding: const EdgeInsets.all(8.0),
//                 reverse: true,
//                 itemBuilder: (_, int index) => _messages[index],
//                 itemCount: _messages.length,
//               ),
//             ),
//           )),
//           //const Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//             child: _buildTextComposer(),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   const ChatMessage(
//       {Key? key, required this.text, required this.name, required this.type})
//       : super(key: key);

//   final String text;
//   final String name;
//   final bool type;

//   List<Widget> otherMessage(context) {
//     return [
//       Container(
//         margin: const EdgeInsets.only(right: 16.0),
//         child: const CircleAvatar(child: Text('B')),
//       ),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//             Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: Text(text),
//             ),
//           ],
//         ),
//       ),
//     ];
//   }

//   ///MY MESSAGE
//   List<Widget> myMessage(context) {
//     return <Widget>[
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             //Text(name),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Container(
//                 padding: const EdgeInsets.only(
//                     left: 10, right: 10, bottom: 10.0, top: 10.0),
//                 width: 100,
//                 decoration: const BoxDecoration(
//                   color: Color(0xffb83f48),
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(10),
//                     topLeft: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                   ), //BorderRadius.all
//                 ),
//                 margin: const EdgeInsets.only(top: 5.0),
//                 child: LimitedBox(
//                   child: Center(
//                     child: Text(
//                       text,
//                       textAlign: TextAlign.center,
//                       softWrap: true,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 15.0,
//                         fontFamily: ('DINNextLTArabic'),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // Container(
//       //   margin: const EdgeInsets.only(left: 16.0),
//       //   child: CircleAvatar(
//       //       child: Text(
//       //     name[0],
//       //     style: const TextStyle(fontWeight: FontWeight.bold),
//       //   )),
//       // ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: type ? myMessage(context) : otherMessage(context),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  JavascriptChannel toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: WebView(
        initialUrl: "https://alrashid.hwzn.sa/chat",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        // backgroundColor: const Color(0x00000000),
      ),
    );
  }
}
