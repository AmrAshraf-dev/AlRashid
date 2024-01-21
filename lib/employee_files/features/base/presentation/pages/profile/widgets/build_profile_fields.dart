part of 'profile_widgets_imports.dart';

class BuildProfileFields extends StatelessWidget {
  final ProfileController profileController;

  const BuildProfileFields({Key? key, required this.profileController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Form(
      key: profileController.formKey,
      child: Column(
        children: [
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: profileController.nameController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            action: TextInputAction.next,
            validate: (value) => value?.validateName(),
            label: tr("userName"),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: profileController.emailController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value) => value?.validateEmail(),
            label: tr("mail"),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: profileController.phoneController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.phone,
            action: TextInputAction.next,
            validate: (value) => value?.validatePhone(),
            label: tr("phone"),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          // DropdownTextField<String>(
          //   selectedItem: profileController.job=="1"?"Manager":"Employee",
          //   onChange: profileController.selectJob,
          //   searchHint: "search",
          //   enableColor: MyColors.blackOpacity,
          //   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          //   margin: const EdgeInsets.symmetric(vertical: 10),
          //   hint: "المهنة",
          //   dropKey: profileController.jobDropKey,
          //   useName: false,
          //   itemAsString: (dynamic item) => item,
          //   radius: BorderRadius.circular(10),
          //   validate: (value) => validateDropDown(""),
          //   data: ["Manager","Employee"],
          // ),
          //
          DropdownTextField<PlaceItem>(
            selectedItem: profileController.placeModel,
            onChange: profileController.selectPlaces,
            searchHint: tr("search"),
            enableColor: MyColors.blackOpacity,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 10),
            hint: tr("affiliateBrand"),
            dropKey: profileController.placeDropKey,
            useName: false,
            itemAsString: (dynamic value) => value.name,
            radius: BorderRadius.circular(10),
            validate: (value) => validateDropDown(profileController.placeModel),
            data: (value) async => await profileController.getPlaces(context),
            //finData: (value) async => await profileController.getPlaces(context),
            title: '',
          ),
        ],
      ),
    );
  }
}
