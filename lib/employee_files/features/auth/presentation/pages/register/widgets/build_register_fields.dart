part of 'register_widgets_imports.dart';

class BuildRegisterFields extends StatelessWidget {
  final RegisterDate registerDate;

  const BuildRegisterFields({Key? key, required this.registerDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;

    return Form(
      key: registerDate.formKey,
      child: Column(
        children: [
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: registerDate.nameController,
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
            controller: registerDate.emailController,
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
            controller: registerDate.phoneController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.phone,
            action: TextInputAction.next,
            validate: (value) => value?.validatePhone(),
            label: tr("phone"),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            margin: const EdgeInsets.symmetric(vertical: 10),
            // inputFormatters: [
            //   PhoneInputFormatter(
            //     allowEndlessPhone: false,
            //     defaultCountryCode: "SA",
            //   )
            // ],
          ),
          DropdownTextField<String>(
            onChange: registerDate.selectJob,
            searchHint: tr("search"),
            enableColor: MyColors.blackOpacity,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 10),
            hint: tr("job"),
            dropKey: registerDate.jobDropKey,
            useName: false,
            itemAsString: (dynamic item) => item,
            radius: BorderRadius.circular(10),
            validate: (value) => validateDropDown(""),
            data: const ["Manager", "Employee"],
            title: '',
          ),
          DropdownTextField<PlaceItem>(
            onChange: registerDate.selectPlaces,
            searchHint: tr("search"),
            enableColor: MyColors.blackOpacity,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 10),
            hint: tr("affiliateBrand"),
            dropKey: registerDate.placeDropKey,
            useName: true,
            itemAsString: (dynamic value) => value.name ?? "",
            radius: BorderRadius.circular(10),
            validate: (value) => validateDropDown(registerDate.placeModel),
            //  finData: (value) async => await registerDate.getPlaces(context),
            data: (value) async => await registerDate.getPlaces(context),
            title: '',
          ),
          Row(
            children: [
              Expanded(
                child: GenericTextField(
                  onTab: () => registerDate.onStartTime(context),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: registerDate.from,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.number,
                  action: TextInputAction.next,
                  validate: (value) => value?.validateEmpty(),
                  label: tr("from"),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: GenericTextField(
                  onTab: () => registerDate.onEndTime(context),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: registerDate.to,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.number,
                  action: TextInputAction.next,
                  validate: (value) => value?.validateEmpty(),
                  label: tr("to"),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ],
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: registerDate.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: registerDate.passwordController,
                  fieldTypes:
                      !state.data ? FieldTypes.password : FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.done,
                  validate: (value) => value?.validatePassword(),
                  label: tr("password"),
                  margin: const EdgeInsets.only(top: 10),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        registerDate.passwordCubit.onUpdateData(!state.data),
                    icon: Icon(
                      !state.data ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                      color: MyColors.grey,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
