import 'package:alrashid_mall_app/cubit_resources/cubit/user_data_state.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alrashid_mall_app/Views/UI/Profile/profile-nologin.dart';
import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/user_data_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/utils/entry_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class EditMyData extends StatefulWidget {
  String? token;
  EditMyData({
    Key? key,
    this.token,
  }) : super(key: key);

  @override
  State<EditMyData> createState() => _EditMyDataState();
}

class _EditMyDataState extends State<EditMyData> {
  bool showErrorMessage = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController birthDateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String? imageController;
  // String? nameController;
  // String? emailController;
  // String? phoneNumberController;
  // String? passwordController;
  final formGlobalKey = GlobalKey<FormState>();

  final maxLines = 5;

  String? hintName;

  String? hintEmail;

  String? hintPhone;

  File? imgFile;
  final imgPicker = ImagePicker();

  @override
  void initState() {
    final UsersCubit _blocUsers = BlocProvider.of<UsersCubit>(context);
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _blocUsers
          .fetchAllUsersData(context, widget.token ?? '')
          .whenComplete(() {
        nameController.text = AuthController.userDataModel.name ?? '';
        emailController.text = AuthController.userDataModel.email ?? '';
        phoneNumberController.text =
            AuthController.userDataModel.phone.toString();

        birthDateController.text = AuthController.userDataModel.birthDate ?? '';
        genderController.text = AuthController.userDataModel.gender ?? '';
        // imgFile = AuthController.userDataModel.identityImage;
        /// newww ...
        if (kDebugMode) {
          print(
              'AuthController.userDataModel.name : ${AuthController.userDataModel.name}');
        }
        if (kDebugMode) {
          print(
              'AuthController.userDataModel.email : ${AuthController.userDataModel.email}');
        }
        if (kDebugMode) {
          print(
              'AuthController.userDataModel.phone : ${AuthController.userDataModel.phone}');
        }
        if (kDebugMode) {
          print(
              'AuthController.userDataModel.birth date : ${AuthController.userDataModel.birthDate}');
        }
        if (kDebugMode) {
          print(
              'AuthController.userDataModel.gender : ${AuthController.userDataModel.gender}');
        }
      });
    });
  }

  //bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final UsersCubit _blocUsers = BlocProvider.of<UsersCubit>(context);

    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Directionality(
          textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              return ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Directionality(
                    textDirection:
                        lang == 'ar' //locale.locale.languageCode == 'en'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: const Color(0xff2eb83f48),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 18,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            tr('Edit data'),
                            style: const TextStyle(
                                color: Color(0xff333333),
                                fontFamily: ('DINNextLTArabic'),
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///
                  /// الاسم
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: EntryField(
                        fieldTextEditingController: nameController,
                        //  initialValue: AuthController.userDataModel.name ?? '',
                        keyboardType: TextInputType.text,
                        isPassword: false,
                        lableText: tr('userName'),
                        // onChange: (String v) {
                        //   nameController = v;
                        // },
                        validator: (String? v) {
                          v!.isEmpty ? tr('Cannot be empty') : null;
                          if (v.length < 2) {
                            return tr('name validation');
                          }
                          return null;
                        }),
                  ),

                  /// البريد الالكترونى

                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: EntryField(
                        fieldTextEditingController: emailController,

                        ///initialValue: AuthController.userDataModel.email ?? '',
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        lableText: tr('email'),
                        // onChange: (String v) {
                        //   emailController = v;
                        // },
                        validator: (String? v) {
                          v!.isEmpty ? tr('Cannot be empty') : null;
                          if (!v.contains('@')) {
                            return tr('email validation');
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///phone
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: EntryField(
                        fieldTextEditingController: phoneNumberController,
                        // initialValue: AuthController.userDataModel.phone ?? '',
                        keyboardType: TextInputType.number,
                        isPassword: false,
                        lableText: tr('Phone number'),
                        // onChange: (String v) {
                        //   phoneNumberController = v;
                        // },
                        validator: (String? v) {
                          var regex = RegExp(
                              r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})');
                          if (v == null || v.length > 10) {
                            return tr('phoneValidation');
                          } else if (!regex.hasMatch(v)) {
                            return tr('phoneValidation');
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //كلمة المرور
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: EntryField(
                        fieldTextEditingController: passwordController,
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        lableText: tr('Password'),
                        // onChange: (String v) {
                        //   passwordController = v;
                        // },
                        validator: (String? isPasswordValid) {
                          var regex =
                              RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
                          if (isPasswordValid == null ||
                              isPasswordValid.length < 8) {
                            return tr('password validation');
                          } else if (!regex.hasMatch(isPasswordValid)) {
                            return tr('password validation');
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(height: 25.0),

                  /// تاريخ الميلاد
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: EntryField(
                        fieldTextEditingController: birthDateController,
                        keyboardType: TextInputType.text,
                        isPassword: false,
                        lableText: tr('birthday'),
                        hintText: 'dd/mm/yyyy',

                        // onChange: (String v) {
                        //   passwordController = v;
                        // },
                        validator: (String? v) {
                          return v!.isEmpty ? tr('Cannot be empty') : null;
                        }),
                  ),
                  const SizedBox(height: 25.0),

                  ///الجنس
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: EntryField(
                        fieldTextEditingController: genderController,
                        keyboardType: TextInputType.text,
                        isPassword: false,
                        lableText: tr('gender'),
                        // onChange: (String v) {
                        //   passwordController = v;
                        // },
                        validator: (String? v) {
                          return v!.isEmpty ? tr('Cannot be empty') : null;
                        }),
                  ),
                  const SizedBox(height: 25.0),

                  ///رقم الهوية

                  Center(
                    child: Visibility(
                      visible: AuthController.userDataModel.image == null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          displayImage(),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              showOptionsDialog(context);
                            },
                            child: Text(tr('Select Image')),
                          ),
                        ],
                      ),
                      replacement: AuthController.userDataModel.image
                              .toString()
                              .contains('svg')
                          ? SvgPicture.network(
                              AuthController.userDataModel.image.toString(),
                              //fit: BoxFit.cover,
                              width: 200,
                              height: 100,
                            )
                          : CachedNetworkImage(
                              width: 200,
                              height: 100,
                              imageUrl:
                                  AuthController.userDataModel.image.toString(),
                            ),
                    ),
                  ),

                  const SizedBox(height: 25.0),

                  ///حفظ
                  GestureDetector(
                    onTap: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        final bool update =
                            await AuthController.updateMyDatafunc(
                          context,
                          phoneNumber: phoneNumberController.text.trim(),
                          password: passwordController.text.trim(),
                          email: emailController.text.trim(),
                          name: nameController.text.trim(),
                          birthDate: birthDateController.text.trim(),
                          gender: genderController.text.trim(),
                          identityImage: imgFile,
                        );
                        if (kDebugMode) {
                          print('phoneNumber : $phoneNumberController');
                        }
                        if (kDebugMode) {
                          print('email address : $emailController');
                        }
                        if (kDebugMode) {
                          print('nameeeeeeeeee : $nameController');
                        }
                        if (kDebugMode) {
                          print('password : $passwordController');
                        }
                        if (kDebugMode) {
                          print('birth dateee : $birthDateController');
                        }
                        if (kDebugMode) {
                          print('gender : $genderController');
                        }
                        if (update) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const ProfileNoLogin()));
                          // Navigator.pop(context);
                        }
                      }
                      //formGlobalKey.currentState!.save();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: 350,
                        height: 45,
                        child: Center(
                          child: Text(
                            tr('save'),
                            style: const TextStyle(
                              color: Color(0xffb83f48),
                              fontFamily: ('DINNextLTArabic'),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffb83f48),
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool isName(String name) => name.isNotEmpty;

  bool isEmail(String email) => email.isNotEmpty;

  bool isMobile(String mobile) {
    return mobile.length >= 11;
  }

  bool isPasswordValid(String password) => password.length >= 6;

  Widget displayImage() {
    if (imgFile == null) {
      return const Text('اختر الصورة');
    } else {
      return Image.file(imgFile!, width: 100, height: 100);
    }
  }

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('الخيارات'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: const Text('التقط الصورة من الكاميرا'),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: const Text('اخذ الصورة من الاستوديو'),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

// Future<String?> uploadImage(filepath, url) async {
//   var request = http.MultipartRequest('POST', Uri.parse(EndPointsUrls.updateMyDataUrl));
//   request.files.add(await http.MultipartFile.fromPath('identity_image', filepath));
//   var res = await request.send();
//   return res.reasonPhrase;
// }
  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery!.path);
    });
    Navigator.of(context).pop();
  }
}
