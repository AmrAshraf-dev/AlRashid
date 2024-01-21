part of 'my_profile_imports.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  MyProfileData myProfileData = MyProfileData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var type = context.read<UserCubit>().state.model!.user!.manger;
    var android = context.read<SettingCubit>().state.model?.androidStoreLink;
    var ios = context.read<SettingCubit>().state.model?.iosStoreLink;
    var isShare = (android != null && ios != null);
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: BuildAuthAppBar(title: tr("account"), isCenterTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            BuildMyProfileItem(
                isOpenContainer: true,
                icon: Icons.person_outline,
                title: tr("profile"),
                page: const Profile()),
            if (type == 1 || type == "1")
              BuildMyProfileItem(
                  isOpenContainer: true,
                  icon: Icons.group,
                  title: tr("employees"),
                  page: const Employees()),
            BuildMyProfileItem(
                isOpenContainer: true,
                icon: Icons.report_gmailerrorred,
                title: tr("about"),
                page: const About()),
            BuildMyProfileItem(
                isOpenContainer: true,
                icon: Icons.receipt_long_outlined,
                title: tr("terms"),
                page: const Terms()),
            BuildMyProfileItem(
                isOpenContainer: true,
                icon: Icons.security,
                title: tr("privacy"),
                page: const Privacy()),
            BuildMyProfileItem(
              isOpenContainer: true,
              icon: Icons.call,
              title: tr("contactUs"),
              page: const ContactUs(),
            ),
            if (isShare)BuildMyProfileItem(
                  isOpenContainer: false,
                  icon: Icons.share,
                  title: tr("shareApp"),
                  onTap: () => getIt<Utilities>()
                      .shareApp(Platform.isIOS ? ios : android)
                  // onTap: () => showDialog(
                  //     context: context, builder: (context) => BuildShareModal()),
                  ),
            BuildMyProfileItem(
                isOpenContainer: false,
                icon: Icons.language,
                title: tr("changeLang"),
                onTap: () => showDialog(
                    context: context,
                    builder: (context) =>
                        BuildLangModal(myProfileData: myProfileData))),
            BuildMyProfileItem(
              isOpenContainer: false,
              icon: Icons.logout,
              title: tr("logout"),
              onTap: () async => await SetLogOut(context).call(NoParams()),
            ),
          ],
        ),
      ),
    );
  }
}
