part of 'register_widgets_imports.dart';

class BuildUploadImage extends StatelessWidget {
  final RegisterDate registerDate;

  const BuildUploadImage({Key? key, required this.registerDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
            bloc: registerDate.imageCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return InkWell(
                  onTap: () => registerDate.getImage(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: MyColors.primary),
                      image: DecorationImage(
                        image: FileImage(state.data!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColors.grey),
                  shape: BoxShape.rectangle,
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Image.asset(
                        Res.upload,
                        height: 40,
                        width: 40,
                      ),
                      MyText(
                          title: tr("uploadNationalID"),
                          color: MyColors.blackOpacity,
                          size: 11),
                      InkWell(
                        onTap: () => registerDate.getImage(context),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 15
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 20),
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: MyText(
                              title: tr("loading"), color: MyColors.white, size: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
