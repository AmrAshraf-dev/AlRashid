part of 'home_imports.dart';

class HomeController {
  final GenericBloc<int> homeTabCubit = GenericBloc(0);
  late AnimationController animationController;
  late TabController tabController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  List<IconData> tabs = [
    Icons.home,
    Icons.person_outline
    ];
  List<String> tabsTxt = [
    tr("home"),
    tr("myAccount")
  ];

  void getSocialData(BuildContext context)async{
    var result = await GetSettings().call(true);
    context.read<SettingCubit>().onUpdateSettingData(result??SettingModel());
  }

  void initBottomNavigation(TickerProvider ticker) {
    tabController = TabController(length: 2, vsync: ticker);
  }


  void animateTabsPages(int index, BuildContext context) {
    if (index != homeTabCubit.state.data) {
      homeTabCubit.onUpdateData(index);
      tabController.animateTo(index);
    }
  }
  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
  late LocationEntity locationModel;


  // this method used to validate date and time

  Future<void> qrValidation(DateTime workNow, DateTime startWork, DateTime endWork, BuildContext context) async {
    var _loc = await getIt<Utilities>().getCurrentLocation();
    double lat = _loc?.latitude ?? 26.2908949;
    double lng = _loc?.longitude ?? 50.1807205;
    locationModel = LocationEntity(lat: lat, lng: lng);
    var res = Geolocator.distanceBetween(26.2908949,50.1807205,locationModel.lat, locationModel.lng,);
    if(workNow.isBefore(startWork)||workNow.isAfter(endWork)){
      showDialog(context: context, builder: (context)=>const BuildFaildQr(isLocation: false,));
    // }
    // else if(res>200){
    //   showDialog(context: context, builder: (context)=>BuildFaildQr(isLocation: true,));
    }else{
      AutoRouter.of(context).push(const QrScanRoute());

    }
  }

}
