import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({Key? key}) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

// this bool will check rememberMe is checked
bool checkboxValue = false;

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return FormField<bool>(
      builder: (state) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                    value: checkboxValue,
                    onChanged: (value) {
                      setState(() {
//save checkbox value to variable that store terms and notify form that state changed
                        checkboxValue = value!;
                        state.didChange(value);
                      });
                    }),
                Flexible(
                  child: Text(
                    tr('agreeConditions'),
                    style: const TextStyle(
                        color: Color(0xff333333),
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 14.0),
                  ),
                ),
              ],
            ),
//display error in matching theme
            Text(
              state.errorText ?? '',
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            )
          ],
        );
      },
//output from validation will be displayed in state.errorText (above)
      validator: (value) {
        if (!checkboxValue) {
          return tr('You have to accept terms');
        } else {
          return null;
        }
      },
    );
  }
}
