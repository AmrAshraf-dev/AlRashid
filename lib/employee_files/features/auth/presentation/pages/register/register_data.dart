part of 'register_imports.dart';

class RegisterDate {
  final GenericBloc<bool> passwordCubit = GenericBloc(false);
  final GenericBloc<bool> termCubit = GenericBloc(false);
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

  DateTime? fromDate;
  DateTime? toDate;
  PlaceItem? placeModel;
  String? job;

  Future<void> getImage(BuildContext context) async {
    var image = await getIt<Utilities>().getImageFile(context);
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
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
          toDate = date;},
        title: '');
  }

  void selectPlaces(PlaceItem? model) {
    placeModel = model;
  }

  Future<List<PlaceItem>> getPlaces(BuildContext context, {bool refresh = true}) async {
    var result = await GetPlaces().call(refresh);
    placeCubit.onUpdateData(result);
    return result;
  }

  void selectJob(String? jobTitle) {
    job = jobTitle;
  }

  void setRegisterManager(BuildContext context) async {
    if (imageCubit.state.data ==null) {
      return CustomToast.showSimpleToast(msg:tr("uploadNationalID"),type: ToastType.info);
    }
    if (!termCubit.state.data) {
      return CustomToast.showSimpleToast(msg: "قم بالموافقه علي الشروط والاحكام !",type: ToastType.info);
    }

    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      RegisterParams params = RegisterParams(
          phone: phoneController.text,
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          accountType: job =="Manager"?"manger":"employee",
          endWork: to.text,
          nationalId: imageCubit.state.data??File(""),
          placeId: placeModel?.id ?? 1,
          startWork: from.text);
      var results = await SetRegister().call(params);
      btnKey.currentState!.animateReverse();
      if (results !=null) {
        phoneController.clear();
        emailController.clear();
        passwordController.clear();
        nameController.clear();
        AutoRouter.of(context).pushAndPopUntil(const SelectUserRoute(),predicate: (o)=>false);
        CustomToast.showSnakeBar(tr("createAccountSuccess"),type: ToastType.success);
      }
    }
  }
}
