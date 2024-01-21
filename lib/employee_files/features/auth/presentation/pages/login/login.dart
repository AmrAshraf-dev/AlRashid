part of 'login_imports.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginData loginData = LoginData();

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserCubit>().state.model;

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: const BuildAuthAppBar(haveLeading: true,),
      body: GestureDetector(
        onTap:()=> FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const BuildHeaderLogo(),
              MyText(
                alien: TextAlign.center,
                title: tr("login"),
                color: MyColors.black,
                size: 17
              ),
              BuildLoginForm(loginData: loginData),
              BuildLoginButton(loginData: loginData),
              const BuildForgetPasswordView(),
              const BuildDontHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
}
