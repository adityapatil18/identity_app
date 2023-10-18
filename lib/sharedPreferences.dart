import '../main.dart';

class SharedPreferencesFunctions {
  saveLoginUserId(String userId) {
    sharedPreferences!.setString("userID", userId);
  }

  String? getLoginUserId() {
    return sharedPreferences!.getString("userID");
  }

  saveVerificationEmail(String emailAddress) {
    sharedPreferences!.setString("EMAIL", emailAddress);
  }

  String? getVerificationEmail() {
    return sharedPreferences!.getString("EMAIL");
  }

  saveLoginStatus(String status) {
    sharedPreferences!.setString("status", status);
  }

  String? getLoginStatus() {
    return sharedPreferences!.getString("status");
  }

  saveReferralCode(String referralCode) {
    sharedPreferences!.setString("referralCode", referralCode);
  }

  String? getReferralCode() {
    return sharedPreferences!.getString("referralCode");
  }

  saveKycStatus(String status) {
    sharedPreferences!.setString("status", status);
  }

  String? getKycStatus() {
    return sharedPreferences!.getString("status");
  }

  saveLoginToken(String Token) {
    sharedPreferences!.setString("Token", Token);
  }

  String? getLoginToken() {
    return sharedPreferences!.getString("Token");
  }

  saveLoginMobileNumber(String userMobileNo) {
    sharedPreferences!.setString("MobileNumber", userMobileNo);
  }

  String? getLoginMobileNumber() {
    return sharedPreferences!.getString("MobileNumber");
  }

  saveLoginEmail(String emailAddress) {
    sharedPreferences!.setString("EMAIL", emailAddress);
  }

  String? getLoginEmail() {
    return sharedPreferences!.getString("EMAIL");
  }

  saveLoginName(String name) {
    sharedPreferences!.setString("NAME", name);
  }

  String? getLoginName() {
    return sharedPreferences!.getString("NAME");
  }

  saveNotification(bool Notification) {
    sharedPreferences!.setBool("Notification", Notification);
  }

  bool? getNotification() {
    return sharedPreferences!.getBool("Notification");
  }

  saveSound(bool Sound) {
    sharedPreferences!.setBool("Sound", Sound);
  }

  bool? getSound() {
    return sharedPreferences!.getBool("Sound");
  }

  saveOfferNotification(bool isOfferNotificationActive) {
    sharedPreferences!
        .setBool("isOfferNotificationActive", isOfferNotificationActive);
  }

  bool? getOfferNotification() {
    return sharedPreferences!.getBool("isOfferNotificationActive");
  }

  saveImage(String image) {
    sharedPreferences!.setString("IMAGE", image);
  }

  String? getImage() {
    return sharedPreferences!.getString("IMAGE");
  }

  saveFrontAdharCard(String FrontAdharCard) {
    sharedPreferences!.setString("FrontAdharCard", FrontAdharCard);
  }

  String? getFrontAdharCard() {
    return sharedPreferences!.getString("FrontAdharCard");
  }

  saveBackAdharCard(String BackAdharCard) {
    sharedPreferences!.setString("BackAdharCard", BackAdharCard);
  }

  String? getBackAdharCard() {
    return sharedPreferences!.getString("BackAdharCard");
  }

  saveSelfie(String Selfie) {
    sharedPreferences!.setString("Selfie", Selfie);
  }

  String? getSelfie() {
    return sharedPreferences?.getString("Selfie");
  }

  saveFrontPanCard(String FrontPanCard) {
    sharedPreferences!.setString("FrontPanCard", FrontPanCard);
  }

  String? getFrontPanCard() {
    return sharedPreferences!.getString("FrontPanCard");
  }

  saveBackPanCard(String BackPanCard) {
    sharedPreferences!.setString("BackPanCard", BackPanCard);
  }

  String? getBackPanCard() {
    return sharedPreferences!.getString("BackPanCard");
  }

  saveUserLocation(String name) {
    sharedPreferences!.setString("LOCATION", name);
  }

  String? getUserLocation() {
    return sharedPreferences!.getString("LOCATION");
  }

  logout() {
    sharedPreferences!.clear();
  }
}
