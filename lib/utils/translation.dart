import 'package:translator/translator.dart';

class GoogleTranslation {
  final translator = GoogleTranslator();

  Future<String> translateFromARtoEN({required String sentance}) async {
    Translation translation =
        await translator.translate(sentance, from: 'ar', to: 'en');
    return translation.text;
  }
}
