part of'home_main_imports.dart';

class HomeMainData{
  GenericBloc<PlaceModel?> placeBloc = GenericBloc(null);

  Future<void> fetchPlaceData(BuildContext context,{bool refresh = true})async{
    var placeId = context.read<UserCubit>().state.model?.token?.place?.id;
    var data = await GetPlaceById().call(PlaceParams(placeId,refresh: refresh));
    GlobalState.instance.set("name_ar", data?.place?.name_ar);
    GlobalState.instance.set("name_en", data?.place?.name_en);
    placeBloc.onUpdateData(data);
  }

}