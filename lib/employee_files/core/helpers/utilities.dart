import 'dart:convert';
import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/models/user_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_custom_widgets/utils/CustomLoading.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/base/domain/use_cases/get_addresses.dart';
import '../../features/general/domain/entities/location_entity.dart';
import '../bloc/lang_cubit/lang_cubit.dart';
import '../models/address/address_model.dart';
import 'custom_toast.dart';

@lazySingleton
class Utilities {

  void launchURL({required String url}) async {
    await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
  }

  void launchWhatsApp(BuildContext context, String phone,) async {
    String message = "مرحبا بك ";
    String _whatsAppUrl;
    if (Platform.isIOS) {
      _whatsAppUrl = "whatsapp://wa.me/$phone/?text=${Uri.encodeFull(message)}";
    } else {
      _whatsAppUrl =
      "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";
    }
    await launch(_whatsAppUrl);
  }

  void shareApp(url) {
    print("url $url");
    CustomLoading.showLoadingView();
    Share.share(url).whenComplete(() {
      EasyLoading.dismiss();
    });
  }
  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    await Geolocator.requestPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CustomToast.showSnakeBar('Location services are disabled');
      Geolocator.openLocationSettings();
      return null;
    }
    return null;
  }


  void copyToClipBoard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((value) {
      CustomToast.showSnakeBar("Copied successfully", type: ToastType.success);
    });
  }


  void changeLanguage(String lang, BuildContext context) async {
    context.read<LangCubit>().onUpdateLanguage(Locale(lang));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", lang);
  }
  Future<AddressModel?> getCurrentAddress(LatLng latLng, BuildContext context) async {
    final params = LocationEntity(lat: latLng.latitude, lng: latLng.longitude);
    return await GetGeoCodeAddress().call(params);
    // GeoCode geoCode = GeoCode(apiKey: "307492059888177453631x47444");
    // try {
    //   var address = await geoCode.reverseGeocoding(latitude: latLng.latitude, longitude: latLng.longitude);
    //   return address;
    // } catch (e) {
    //   log(e.toString());
    //   return null;
    // }
  }


  Future<PermissionStatus> getContactsPermission() async {
    await Permission.contacts.request();
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
      await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.granted;
    } else {
      return permission;
    }
  }


  String customizePhoneNumber(String phone, String? code) {
    String phoneNumber = "";
    if (phone.startsWith("0")) {
      phoneNumber = phone.replaceFirst("0", code ?? "+20");
    } else {
      phoneNumber = "${(code ?? "+20") }$phone";
    }
    return phoneNumber;
  }


  Future<File?> getImageFile(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false
    );
    if (result != null) {
      File imageFile = File(result.files.single.path!);
      return imageFile;
    }
    return null;
  }

  Future<File?> getAttachmentFile(FileType fileType) async {
    if(fileType == FileType.any){
      return await getAPdfFile();
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowMultiple: false,
    );
    if (result != null) {
      File imageFile = File(result.files.single.path!);
      return imageFile;
    }
    return null;
  }

  Future<File?> getAPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf']
    );
    if (result != null) {
      File imageFile = File(result.files.single.path!);
      return imageFile;
    }
    return null;
  }

  /// used to get the current store path
  Future<String> getFilePath() async {
    String _sdPath = "";
    // if (Platform.isIOS) {
    //   Directory tempDir = await getTemporaryDirectory();
    //   _sdPath = tempDir.path;
    // } else {
    //   _sdPath = "/storage/emulated/0/new_record_sound";
    // }
    Directory tempDir = await getTemporaryDirectory();
    _sdPath = tempDir.path;
    var d = Directory(_sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    String storagePath = _sdPath + "/" + DateTime.now().toIso8601String() +".m4a";
    return storagePath;
  }

  Future<String> getAddress(LatLng latLng, BuildContext context) async {
    GeoCode geoCode = GeoCode();

    try {
      var address = await geoCode.reverseGeocoding(latitude: latLng.latitude, longitude: latLng.longitude);
      var data = "${address.countryName??""}  ${address.city??""}  ${address.region??""}  ${address.streetAddress??""}";
      print(data);
      return data;
    } catch (e) {
      return "";
    }
  }

  String convertDigitsToLatin(String s) {
    var sb = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }

  Future<PermissionStatus> getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }
  Future<File?> getCameraImage() async {
    var result = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1280,
        maxHeight: 720,
        imageQuality: 100,
        preferredCameraDevice: CameraDevice.rear);
    if (result != null) {
      return File(result.path);
    } else {
      return null;
    }
  }

  Future<void> saveUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toJson()));
  }
}
