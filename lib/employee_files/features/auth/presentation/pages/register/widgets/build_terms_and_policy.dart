part of 'register_widgets_imports.dart';

class BuildTermsAndPolicy extends StatelessWidget {
  final RegisterDate registerDate ;
  const BuildTermsAndPolicy({Key? key, required this.registerDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc:registerDate.termCubit,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
                activeColor: MyColors.primary,
                value: state.data,
                onChanged: (value)=>registerDate.termCubit.onUpdateData(value!)),
            GestureDetector(
              onTap: ()=>AutoRouter.of(context).push(const TermsRoute()),
              child: MyText(
                title: tr("agreeConditions"),
                color: MyColors.black,
                size: 11,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        );
      },
    );
  }
}
