part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileController controller = ProfileController();

  @override
  void initState() {
    controller.setInitialData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAuthAppBar(title: tr("editInfo"), haveLeading: true, isCenterTitle: false),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          BuildProfileFields(profileController: controller),
          BuildUploadImage(registerDate: controller),
          BuildProfileButton(profileController: controller)
        ],
      ),
    );
  }
}
