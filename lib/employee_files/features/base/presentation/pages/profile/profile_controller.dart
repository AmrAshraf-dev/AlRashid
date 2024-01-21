part of 'profile_imports.dart';

class ProfileController {
  DateTime? fromDate;
  DateTime? toDate;
  PlaceItem? placeModel;
  int? placeId;
  String? job;
  String? image;
  final GenericBloc<bool> passwordCubit = GenericBloc(false);
  final GlobalKey<DropdownSearchState> placeDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> jobDropKey = GlobalKey();
  final GenericBloc<List<PlaceItem>> placeCubit = GenericBloc([]);

  final GenericBloc<File?> imageCubit = GenericBloc(null);

  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController to = TextEditingController();
  final TextEditingController from = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController additionalPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> getImage(BuildContext context) async {
    var image = await getIt<Utilities>().getImageFile(context);
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  void setInitialData(BuildContext context) {
    var user = context.read<UserCubit>().state.model!.user;
    var place = context.read<UserCubit>().state.model!.token!.place;
    nameController.text = user?.name ?? "";
    emailController.text = user?.email ?? "";
    phoneController.text = "${user?.phone}";
    from.text = user?.start_work ?? "";
    to.text = user?.end_work ?? '';
    image = user?.national_id ?? "";
    job = user?.manger;
    placeModel = PlaceItem(
        name: GlobalState.instance.get("name_ar") ??
            GlobalState.instance.get("name_en") ??
            "",
        id: place?.id);
  }

  String selectJob(String? jobTitle) {
    if (job == "1") {
      jobTitle = "Manager";
    } else {
      jobTitle = "Employee";
    }
    return jobTitle;
  }

  void onStartTime(BuildContext context) {
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          from.text = DateFormat("HH:mm").format(date!);
          fromDate = date;
        },
        title: '');
  }

  void onEndTime(BuildContext context) {
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          to.text = DateFormat("HH:mm").format(date!);
          toDate = date;
        },
        title: '');
  }

  void selectPlaces(PlaceItem? model) {
    placeModel = model;
  }

  Future<List<PlaceItem>> getPlaces(BuildContext context) async {
    var result = await GetPlaces().call(true);
    placeCubit.onUpdateData(result);
    return result;
  }

  void updateProfile(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState?.animateForward();
      UpdateProfileParams params = UpdateProfileParams(
          phone: phoneController.text,
          email: emailController.text,
          name: nameController.text,
          endWork: to.text,
          placeId: placeModel?.id,
          nationalId: imageCubit.state.data,
          startWork: from.text);
      var result = await UpdateProfile()(params);
      btnKey.currentState?.animateReverse();
      if (result != null) {
        var user = context.read<UserCubit>().state.model!;
        var token = TokenModel(
            token: user.token?.token, place: Place.fromJson(result["place"]));
        LoginModel model = LoginModel(
            id: result["user"]["id"],
            name: result["user"]["name"],
            email: result["user"]["email"],
            phone: result["user"]["phone"],
            place_id: result["user"]["place_id"],
            national_id: result["user"]["national_id"],
            start_work: result["user"]["start_work"],
            end_work: result["user"]["end_work"],
            manger: result["user"]["manger"]);
        GlobalState.instance.set("name_ar", result["place"]["name_ar"]);
        GlobalState.instance.set("name_en", result["place"]["name_en"]);
        UserModel userModel = UserModel(token: token, user: model);
        context.read<UserCubit>().onUpdateUserData(userModel);
        getIt<Utilities>().saveUserData(userModel);
        AutoRouter.of(context).pop();
        CustomToast.showSimpleToast(
            msg: tr("updateInfoSuccess"), type: ToastType.success);
      }
    }
  }
}
