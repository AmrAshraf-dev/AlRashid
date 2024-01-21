import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EntryField extends StatefulWidget {
  final String? hintText, lableText;
  final bool isPassword,
      isAddressPage,
      isPaymentPageForPadding,
      isSecureTextForEver,
      isBigContentText,
      readOnly;
  final Null Function(String)? onChange;
  final String? Function(String?) validator;
  final TextInputType keyboardType, keyboardTypeNumbers, inputFormatters;
  // keyboardType: TextInputType.number,
  final String? initialValue;
  final String? type;
  final TextEditingController? fieldTextEditingController;
  final FocusNode? fieldFocusNode;
  final Iterable<String>? autofillHints;
  const EntryField(
      {Key? key,
      this.hintText,
      required this.isPassword,
      required this.lableText,
      this.onChange,
      required this.validator,
      this.initialValue,
      this.type,
      this.fieldTextEditingController,
      this.autofillHints,
      this.fieldFocusNode,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.keyboardTypeNumbers = TextInputType.number,
      this.inputFormatters = TextInputType.number,
      this.isAddressPage = false,
      this.isPaymentPageForPadding = false,
      this.isSecureTextForEver = false,
      this.isBigContentText = false})
      : assert(lableText != '' && hintText != '', 'text cannot be empty'),
        super(key: key);

  @override
  State<EntryField> createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChange,
      validator: widget.validator,
      controller: widget.fieldTextEditingController,
      //maxLines: widget.isBigContentText ? null : 1,
      obscureText: widget.isPassword ? _obscureText : false,
      //textDirection: locale.locale.languageCode == 'ar'
      // ? TextDirection.ltr
      // : TextDirection.rtl,
      style: const TextStyle(
        fontFamily: ('DINNextLTArabic'),
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        // labelText: "رقم الجوال / البريد الالكترونى",
        labelText: widget.lableText,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: _toggle,
                child: Icon(
                  _obscureText
                      ? FontAwesomeIcons.eyeSlash
                      : FontAwesomeIcons.eye,
                  size: 15.0,
                  color: Colors.black,
                ),
              )
            : const Offstage(),

        // filled: true,
        labelStyle: const TextStyle(
          color: Color(0xff333333),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
      ),
    );
  }
}
