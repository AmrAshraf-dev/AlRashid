part of 'profile_widgets_imports.dart';

class BuildUploadImage extends StatelessWidget {
  final ProfileController registerDate;

  const BuildUploadImage({Key? key, required this.registerDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserCubit>().state.model!.user;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child:Stack(
        alignment: Alignment.bottomLeft,
        children: [
          BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
            bloc: registerDate.imageCubit,
            builder: (context, state) {
              if(state is GenericUpdateState){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),

                      image: DecorationImage(image:FileImage(state.data!),fit: BoxFit.fill),
                      color: MyColors.grey.withOpacity(.2),
                      shape: BoxShape.rectangle),
                );
              }else{
                return CachedImage(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  alignment: Alignment.center,
                  boxShape: BoxShape.rectangle,
                  haveRadius: true,
                  borderRadius: BorderRadius.circular(5),
                  url:user!.national_id!.contains("alrashid.hwzn.sa")? user.national_id??"" :"https://alrashid.hwzn.sa/public/storage/files/${user.national_id}" ,
                );
              }
            },
          ),
          InkWell(
            onTap: () => registerDate.getImage(context),
            child: Container(
                width: 35,
                height: 35,
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: MyColors.primary, shape: BoxShape.circle),
                child: const Icon(
                  Icons.camera_alt,
                  color: MyColors.white,
                  size: 20,
                )),
          )
        ],
      ),
    );
  }
}
