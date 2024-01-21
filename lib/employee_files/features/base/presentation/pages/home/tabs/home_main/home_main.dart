part of 'home_main_imports.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final HomeMainData mainData = HomeMainData();

  @override
  void initState() {
    mainData.fetchPlaceData(context, refresh: false);
    // mainData.fetchPlaceData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topStart,
        children: [
          BlocBuilder<GenericBloc<PlaceModel?>, GenericState<PlaceModel?>>(
            bloc: mainData.placeBloc,
            builder: (context, state) {
              return Container(
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Res.home), fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if(state is GenericUpdateState)Container(
                      height: 550,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: MyColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        fit: StackFit.loose,
                        children: [
                          BuildHomeInfo(model: state.data!),
                          Positioned(top: -50, child: BuildHomeImage(logo: state.data?.place?.image??"https://media.istockphoto.com/vectors/profile-picture-vector-illustration-vector-id587805156"))
                        ],
                      ),
                    ),
                    if(state is GenericInitialState)Container(
                      height: 550,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: MyColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    )
                  ],
                ),
              );
            },
          ),
          const Positioned(top: 50, right: 20, child: BuildHomeLocation())
        ],
      ),
    );
  }
}
