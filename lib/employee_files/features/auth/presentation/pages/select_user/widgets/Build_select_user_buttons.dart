part of 'build_select_user_widgets_imports.dart';

class BuildSelectUserButtons extends StatelessWidget {
  final SelectUserData selectUserData;

  const BuildSelectUserButtons({Key? key, required this.selectUserData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String token = '0';
    var user = context.read<UserCubit>().state.model;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          LoadingButton(
              borderRadius: 8,
              title: tr("manager"),
              onTap: () {
                context
                    .read<UserCubit>()
                    .onUpdateUserData(UserModel(user: LoginModel(manger: "1")));
                AutoRouter.of(context).push(const LoginRoute());
              },
              color: MyColors.primary,
              textColor: MyColors.white,
              btnKey: selectUserData.btnKey1,
              margin: const EdgeInsets.symmetric(vertical: 10),
              fontSize: 14,
              height: 45),
          LoadingButton(
              borderRadius: 8,
              title: tr("employee"),
              onTap: () {
                context
                    .read<UserCubit>()
                    .onUpdateUserData(UserModel(user: LoginModel(manger: "0")));
                AutoRouter.of(context).push(const LoginRoute());
              },
              color: MyColors.primary,
              textColor: MyColors.white,
              btnKey: selectUserData.btnKey2,
              margin: const EdgeInsets.symmetric(vertical: 10),
              fontSize: 14,
              height: 45),

          ///
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                       
                        CustomerLogin(),
                  ));
            },
            child: Container(
              width: 355,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Text(
                'عميل',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // LoadingButton(
          //     borderRadius: 8,
          //     title: 'عميل', //tr("employee"),
          //     onTap: () {
          //       // context
          //       //     .read<UserCubit>()
          //       //     .onUpdateUserData(UserModel(user: LoginModel(manger: "0")));
          //       // AutoRouter.of(context).push(const LoginRoute());
          //     },
          //     color: MyColors.primary,
          //     textColor: MyColors.white,
          //     btnKey: selectUserData.btnKey2,
          //     margin: const EdgeInsets.symmetric(vertical: 10),
          //     fontSize: 14,
          //     height: 45),
        ],
      ),
    );
  }
}
