// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart' show SynchronousFuture;
// import 'dart:async';
// import 'languages/ar.dart';
// import 'languages/en.dart';

// class AppLocalizations {
//   final Locale locale;

//   AppLocalizations(this.locale);

//   static AppLocalizations? of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations);
//   }

//   static final Map<String, Map<String, String>> _localizedValues = {
//     'ar': english(),
//     'en': arabic(),
//   };

//   String? get joinNow {
//     return _localizedValues[locale.languageCode]?['Join now'];
//   }

//   String? get skip {
//     return _localizedValues[locale.languageCode]?['Skip'];
//   }

//   String? get phoneNum {
//     return _localizedValues[locale.languageCode]?['Phone number'];
//   }

//   String? get password {
//     return _localizedValues[locale.languageCode]?['Password'];
//   }

//   String? get forgetPassword {
//     return _localizedValues[locale.languageCode]?['Forget password!'];
//   }

//   String? get forgetPasswordText {
//     return _localizedValues[locale.languageCode]?['Forget password text'];
//   }

//   String? get signIn {
//     return _localizedValues[locale.languageCode]?['Sign in'];
//   }

//   String? get orUse {
//     return _localizedValues[locale.languageCode]?['Or use'];
//   }

//   String? get youDontHaveAnAccYet {
//     return _localizedValues[locale.languageCode]
//         ?['You don’t have an account yet!'];
//   }

//   String? get signUpNow {
//     return _localizedValues[locale.languageCode]?['Sign up now!'];
//   }

//   String? get createNewAcc {
//     return _localizedValues[locale.languageCode]?['Create new account'];
//   }

//   String? get userName {
//     return _localizedValues[locale.languageCode]?['User name'];
//   }

//   String? get email {
//     return _localizedValues[locale.languageCode]?['Email'];
//   }

//   String? get reEnterYourPass {
//     return _localizedValues[locale.languageCode]?['Re-enter your password'];
//   }

//   String? get agreeOnTerms {
//     return _localizedValues[locale.languageCode]
//         ?['I agree to the Terms of Use and Privacy'];
//   }

//   String? get signUp {
//     return _localizedValues[locale.languageCode]?['Sign up'];
//   }

//   String? get alreadyHaveAcc {
//     return _localizedValues[locale.languageCode]?['Already have an account!'];
//   }

//   String? get signInNow {
//     return _localizedValues[locale.languageCode]?['Sign in now!'];
//   }

//   String? get cannotBeEmpty {
//     return _localizedValues[locale.languageCode]?['Cannot be empty'];
//   }

//   String? get nameValidation {
//     return _localizedValues[locale.languageCode]?['name validation'];
//   }

//   String? get emailValidation {
//     return _localizedValues[locale.languageCode]?['email validation'];
//   }

//   String? get phoneValidation {
//     return _localizedValues[locale.languageCode]?['phone validation'];
//   }

//   String? get passwordValidation {
//     return _localizedValues[locale.languageCode]?['password validation'];
//   }

//   String? get twoPassNotMatch {
//     return _localizedValues[locale.languageCode]
//         ?['The two passwords do not match'];
//   }

//   String? get send {
//     return _localizedValues[locale.languageCode]?['Send'];
//   }

//   String? get reEnterNewPassword {
//     return _localizedValues[locale.languageCode]?['Re-enter new password'];
//   }

//   String? get enterNewPassword {
//     return _localizedValues[locale.languageCode]?['Enter new password'];
//   }

//   String? get newPassword {
//     return _localizedValues[locale.languageCode]?['New password'];
//   }

//   String? get save {
//     return _localizedValues[locale.languageCode]?['Save'];
//   }

//   String? get checkYourEmail {
//     return _localizedValues[locale.languageCode]?['Check your email'];
//   }

//   String? get confirm {
//     return _localizedValues[locale.languageCode]?['Confirm'];
//   }

//   String? get youCanTryAgainAfter {
//     return _localizedValues[locale.languageCode]?['You can try again after'];
//   }

//   String? get second {
//     return _localizedValues[locale.languageCode]?['s'];
//   }

//   String? get resendAgain {
//     return _localizedValues[locale.languageCode]?['Resend again'];
//   }

//   String? get nothing {
//     return _localizedValues[locale.languageCode]?['Nothing'];
//   }

//   String? get more {
//     return _localizedValues[locale.languageCode]?['More'];
//   }

//   String? get phoneNumberOrEmail {
//     return _localizedValues[locale.languageCode]?['Phone Number Or Email'];
//   }

//   String? get error {
//     return _localizedValues[locale.languageCode]?['Err'];
//   }

//   String? get birthday {
//     return _localizedValues[locale.languageCode]?['birthday'];
//   }

//   String? get gender {
//     return _localizedValues[locale.languageCode]?['gender'];
//   }

//   String? get idPhoto {
//     return _localizedValues[locale.languageCode]?['idPhoto'];
//   }

//   String? get options {
//     return _localizedValues[locale.languageCode]?['options'];
//   }

//   String? get captureImageFromCamera {
//     return _localizedValues[locale.languageCode]?['Capture Image From Camera'];
//   }

//   String? get takeImageFromGallery {
//     return _localizedValues[locale.languageCode]?['Take Image From Gallery'];
//   }

//   String? get selectImage {
//     return _localizedValues[locale.languageCode]?['Select Image'];
//   }

//   String? get noImageSelected {
//     return _localizedValues[locale.languageCode]?['No Image Selected!'];
//   }

//   String? get noElements {
//     return _localizedValues[locale.languageCode]?['No Elements'];
//   }

//   String? get validInput {
//     return _localizedValues[locale.languageCode]?['Valid input'];
//   }

//   String? get invalidEntry {
//     return _localizedValues[locale.languageCode]?['Please enter a valid entry'];
//   }

//   String? get apply {
//     return _localizedValues[locale.languageCode]?['Apply'];
//   }

//   String? get myAccount {
//     return _localizedValues[locale.languageCode]?['My account'];
//   }

//   String? get myAddress {
//     return _localizedValues[locale.languageCode]?['My address'];
//   }

//   String? get aboutUs {
//     return _localizedValues[locale.languageCode]?['About us'];
//   }

//   String? get aboutUsText {
//     return _localizedValues[locale.languageCode]?['About us text'];
//   }

//   String? get aboutUsText2 {
//     return _localizedValues[locale.languageCode]?['About us text2'];
//   }

//   String? get termsText {
//     return _localizedValues[locale.languageCode]?['terms text'];
//   }

//   String? get termsOfUseProfile {
//     return _localizedValues[locale.languageCode]?['Terms of use2'];
//   }

//   String? get language {
//     return _localizedValues[locale.languageCode]?['Language'];
//   }

//   String? get termsOfUse {
//     return _localizedValues[locale.languageCode]?['Terms of use'];
//   }

//   String? get contactUs {
//     return _localizedValues[locale.languageCode]?['Contact us'];
//   }

//   String? get shareApp {
//     return _localizedValues[locale.languageCode]?['Share app'];
//   }

//   String? get myData {
//     return _localizedValues[locale.languageCode]?['My Data'];
//   }

//   String? get logout {
//     return _localizedValues[locale.languageCode]?['Logout'];
//   }

//   String? get deleteAccount {
//     return _localizedValues[locale.languageCode]?['Delete account'];
//   }

//   String? get address {
//     return _localizedValues[locale.languageCode]?['Address'];
//   }

//   String? get orContactUsVia {
//     return _localizedValues[locale.languageCode]?['Or Contact us via'];
//   }

//   String? get wantToLogout {
//     return _localizedValues[locale.languageCode]?['Do you want to logout ?'];
//   }

//   String? get wantToDeleteAccount {
//     return _localizedValues[locale.languageCode]
//         ?['Do you want to delete your account'];
//   }

//   String? get changePassword {
//     return _localizedValues[locale.languageCode]?['Change Password'];
//   }

//   String? get cancel {
//     return _localizedValues[locale.languageCode]?['Cancel'];
//   }

//   String? get delete {
//     return _localizedValues[locale.languageCode]?['Delete'];
//   }

//   String? get home {
//     return _localizedValues[locale.languageCode]?['Home'];
//   }

//   String? get search {
//     return _localizedValues[locale.languageCode]?['Search'];
//   }

//   String? get searchText {
//     return _localizedValues[locale.languageCode]?['Search_Text'];
//   }

//   String? get changeTheLanguage {
//     return _localizedValues[locale.languageCode]?['Change the language'];
//   }

//   String? get loading {
//     return _localizedValues[locale.languageCode]?['Loading'];
//   }

//   String? get updating {
//     return _localizedValues[locale.languageCode]?['Updating'];
//   }

//   String? get deleting {
//     return _localizedValues[locale.languageCode]?['Deleting'];
//   }

//   String? get loginInProgress {
//     return _localizedValues[locale.languageCode]?['Login in progress'];
//   }

//   String? get signupInProgress {
//     return _localizedValues[locale.languageCode]?['Signup in progress'];
//   }

//   String? get verifying {
//     return _localizedValues[locale.languageCode]?['Verifying'];
//   }

//   String? get done {
//     return _localizedValues[locale.languageCode]?['Done'];
//   }

//   String? get waiting {
//     return _localizedValues[locale.languageCode]?['Waiting'];
//   }

//   String? get updatingData {
//     return _localizedValues[locale.languageCode]?['Updating data'];
//   }

//   String? get youMustBeLoggedIn {
//     return _localizedValues[locale.languageCode]?['You must be logged in'];
//   }

//   String? get successfulEntry {
//     return _localizedValues[locale.languageCode]?['Successful entry'];
//   }

//   String? get youHaveExpired {
//     return _localizedValues[locale.languageCode]?['You have expired'];
//   }

//   String? get pleaseGoToLogInAgain {
//     return _localizedValues[locale.languageCode]?['Please go to log in again'];
//   }

//   String? get back {
//     return _localizedValues[locale.languageCode]?['Back'];
//   }

//   String? get tellUs {
//     return _localizedValues[locale.languageCode]?['Tell us'];
//   }

//   String? get pleaseCheckTheCodeAndRetypeIt {
//     return _localizedValues[locale.languageCode]
//         ?['Please check the code and retype it'];
//   }

//   String? get errorLoggingOut {
//     return _localizedValues[locale.languageCode]?['Error logging out'];
//   }

//   String? get errorDeletingAccount {
//     return _localizedValues[locale.languageCode]?['Error deleting account'];
//   }

//   String? get pleaseCheckTheData {
//     return _localizedValues[locale.languageCode]?['Please check the data'];
//   }

//   String? get passwordChangedSuccessfully {
//     return _localizedValues[locale.languageCode]
//         ?['Password changed successfully'];
//   }

//   String? get thePasswordHasBeenSuccessfullyChangedTo {
//     return _localizedValues[locale.languageCode]
//         ?['The password has been successfully changed to'];
//   }

//   String? get pleaseLogInAgain {
//     return _localizedValues[locale.languageCode]?['Please log in again'];
//   }

//   String? get successfullyRegistered {
//     return _localizedValues[locale.languageCode]?['Successfully registered'];
//   }

//   String? get pleaseCheckYourEmailAndLogInAgain {
//     return _localizedValues[locale.languageCode]
//         ?['Please check your email and log in again'];
//   }

//   String? get theCodeHasBeenSent {
//     return _localizedValues[locale.languageCode]?['The code has been sent'];
//   }

//   String? get youWillBeRedirectedToTheLoginPage {
//     return _localizedValues[locale.languageCode]
//         ?['You will be redirected to the login page'];
//   }

//   String? get editMyData {
//     return _localizedValues[locale.languageCode]?['Edit data'];
//   }

//   String? get coupons {
//     return _localizedValues[locale.languageCode]?['coupons'];
//   }

//   String? get chat {
//     return _localizedValues[locale.languageCode]?['chat'];
//   }

//   String? get enterOtp {
//     return _localizedValues[locale.languageCode]?['enter otp'];
//   }

//   String? get agreeTermsAndConditions {
//     return _localizedValues[locale.languageCode]
//         ?['I agree to the terms and conditions and privacy policy'];
//   }

//   String? get brandEmployee {
//     return _localizedValues[locale.languageCode]?['As a brand employee!'];
//   }

//   String? get events {
//     return _localizedValues[locale.languageCode]?['events'];
//   }

//   String? get account {
//     return _localizedValues[locale.languageCode]?['account'];
//   }

//   String? get maps {
//     return _localizedValues[locale.languageCode]?['maps'];
//   }

//   String? get shops {
//     return _localizedValues[locale.languageCode]?['shops'];
//   }

//   String? get sections {
//     return _localizedValues[locale.languageCode]?['Sections'];
//   }

//   String? get seeAll {
//     return _localizedValues[locale.languageCode]?['See all'];
//   }

//   String? get perfumes {
//     return _localizedValues[locale.languageCode]?['perfumes'];
//   }

//   String? get fashion {
//     return _localizedValues[locale.languageCode]?['fashion'];
//   }

//   String? get cafes {
//     return _localizedValues[locale.languageCode]?['cafes'];
//   }

//   String? get accessories {
//     return _localizedValues[locale.languageCode]?['accessories'];
//   }

//   String? get restaurants {
//     return _localizedValues[locale.languageCode]?['restaurants'];
//   }

//   String? get kids {
//     return _localizedValues[locale.languageCode]?['kids'];
//   }

//   String? get services {
//     return _localizedValues[locale.languageCode]?['services'];
//   }

//   String? get showShop {
//     return _localizedValues[locale.languageCode]?['show shop'];
//   }

//   String? get womenFashion {
//     return _localizedValues[locale.languageCode]?['women fashion'];
//   }

//   String? get beautyProducts {
//     return _localizedValues[locale.languageCode]?['beauty products'];
//   }

//   String? get bagsAndShoes {
//     return _localizedValues[locale.languageCode]?['bags & shoes'];
//   }

//   String? get kidsFashion {
//     return _localizedValues[locale.languageCode]?['kids fashion'];
//   }

//   String? get menFashion {
//     return _localizedValues[locale.languageCode]?['men fashion'];
//   }

//   String? get jewelry {
//     return _localizedValues[locale.languageCode]?['jewelry'];
//   }

//   String? get electronics {
//     return _localizedValues[locale.languageCode]?['electronics'];
//   }

//   String? get yourMessage {
//     return _localizedValues[locale.languageCode]?['Your message'];
//   }

//   String? get enterYourMessageHere {
//     return _localizedValues[locale.languageCode]?['Enter your message here'];
//   }

//   String? get availableCoupons {
//     return _localizedValues[locale.languageCode]?['Available coupons'];
//   }

//   String? get voucher {
//     return _localizedValues[locale.languageCode]?['Voucher'];
//   }

//   String? get allRequests {
//     return _localizedValues[locale.languageCode]?['All requests'];
//   }

//   String? get expiryDate {
//     return _localizedValues[locale.languageCode]?['Expiry date'];
//   }

//   String? get showQR {
//     return _localizedValues[locale.languageCode]?['show QR'];
//   }

//   String? get rs {
//     return _localizedValues[locale.languageCode]?['RS'];
//   }

//   String? get blazaFloor {
//     return _localizedValues[locale.languageCode]?['Blaza floor'];
//   }

//   String? get groundFloor {
//     return _localizedValues[locale.languageCode]?['ground floor'];
//   }

//   String? get firstFloor {
//     return _localizedValues[locale.languageCode]?['first floor'];
//   }

//   String? get secondFloor {
//     return _localizedValues[locale.languageCode]?['second floor'];
//   }

//   String? get thirdFloor {
//     return _localizedValues[locale.languageCode]?['third floor'];
//   }

//   String? get floorPlanScreen {
//     return _localizedValues[locale.languageCode]?['Floor Plan Screen'];
//   }

//   String? get moveMap {
//     return _localizedValues[locale.languageCode]?['move map'];
//   }

//   String? get draggingFingers {
//     return _localizedValues[locale.languageCode]
//         ?['Start by dragging with your fingers'];
//   }

//   String? get workHours {
//     return _localizedValues[locale.languageCode]?['Work hours'];
//   }

//   String? get showInMap {
//     return _localizedValues[locale.languageCode]?['show in map'];
//   }

//   String? get youHaveToAcceptTerms {
//     return _localizedValues[locale.languageCode]?['You have to accept terms'];
//   }

//   String? get theWorldIsBetweenYourHands {
//     return _localizedValues[locale.languageCode]
//         ?['The world is between your hands'];
//   }

//   String? get theWorldIsInYourHands {
//     return _localizedValues[locale.languageCode]
//         ?['The world is in your hands at Al Rashid Mall'];
//   }

//   String? get unforgetableDay {
//     return _localizedValues[locale.languageCode]
//         ?['You should have an unforgettable day'];
//   }

//   String? get purchaseValue {
//     return _localizedValues[locale.languageCode]?['Purchase value'];
//   }

//   String? get valueOfPurchasedGoods {
//     return _localizedValues[locale.languageCode]
//         ?['Please enter the value of the purchases you have purchased'];
//   }

//   String? get proceed {
//     return _localizedValues[locale.languageCode]?['Continue'];
//   }

//   String? get yourBill {
//     return _localizedValues[locale.languageCode]?['Your bill'];
//   }

//   String? get from {
//     return _localizedValues[locale.languageCode]?['from'];
//   }

//   String? get to {
//     return _localizedValues[locale.languageCode]?['to'];
//   }

//   String? get loginAsEmployee {
//     return _localizedValues[locale.languageCode]?['loginAsEmplyee'];
//   }

//   String? get fromtoGo {
//     return _localizedValues[locale.languageCode]?['please enter from to go'];
//   }

//   String? get serverERR {
//     return _localizedValues[locale.languageCode]?["Server_Err"];
//   }
// }

// class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

//   @override
//   Future<AppLocalizations> load(Locale locale) {
//     return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
//   }

//   @override
//   bool shouldReload(AppLocalizationsDelegate old) => false;
// }
