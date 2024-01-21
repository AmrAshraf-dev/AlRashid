part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final HomeController homeController = HomeController();

  @override
  void initState() {
    homeController.initBottomNavigation(this);
    homeController.getSocialData(context);

    var loc = context.read<LocationCubit>().state.model;
    double lat = loc?.lat ?? 26.2908949;
    double lng = loc?.lng ?? 50.1807205;
    homeController.locationModel = LocationEntity(lat: lat, lng: lng);
    context.read<LocationCubit>().onLocationUpdated(loc!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserCubit>().state.model!.user;
    print('======>>> user ${user?.toJson()}');
    var f = DateFormat("HH:mm");
    var now = f.format(DateTime.now());
    var workNow = f.parse(now);
    var startWork = f.parse(user?.start_work ?? "");
    DateTime startDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, startWork.hour, startWork.minute, startWork.second);

    var endWork = f.parse(user?.end_work ?? "");
    DateTime endDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, endWork.hour, endWork.minute, endWork.second);

    return WillPopScope(
      onWillPop: homeController.onBackPressed,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            floatingActionButton: ElasticInDown(
              child: FloatingActionButton(
                  backgroundColor: MyColors.primary,
                  child: Image.asset(Res.scan, height: 20, width: 20),
                  onPressed: () {
                    if (workNow.isAfter(startDate) || workNow.isBefore(endDate)) {
                      AutoRouter.of(context).push(const QrScanRoute());
                    } else {
                      showDialog(context: context, builder: (context) => const BuildFaildQr(isLocation: false));
                    }
                  }),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: TabBarView(
                controller: homeController.tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [HomeMain(), MyProfile()]),
            bottomNavigationBar:
                BuildBottomNavigationBar(controller: homeController)),
      ),
    );
  }
}
