part of 'login_widgets_imports.dart';

class BuildLoginForm extends StatelessWidget {
  final LoginData loginData;

  const BuildLoginForm({Key? key, required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        children: [
          GenericTextField(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              controller: loginData.email,
              fieldTypes: FieldTypes.normal,
              type: TextInputType.text,
              action: TextInputAction.next,
              validate: (value) => value?.validateEmail(),
              label: tr("mail"),
              margin: const EdgeInsets.only(top: 20)),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: loginData.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: loginData.password,
                  fieldTypes: !state.data ? FieldTypes.password : FieldTypes.normal,
                  type: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                  validate: (value) => value?.validatePassword(),
                  label: tr("password"),
                  margin: const EdgeInsets.only(top: 20),
                  suffixIcon: IconButton(
                    onPressed: () => loginData.passwordCubit.onUpdateData(!state.data),
                    icon: Icon(
                        !state.data ? Icons.visibility : Icons.visibility_off,
                        size: 20,
                        color: MyColors.grey),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
