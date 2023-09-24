import 'dart:io';

class AdsConstant {

  static final AdsKey _androidAds = AdsKey(
    appId: "ca-app-pub-2054952505259569~2272052570",
    openAppAds: "ca-app-pub-2054952505259569/7659825216",
    interstitialAds: "ca-app-pub-2054952505259569/9659302597",
  );

  static final AdsKey _iOSAds = AdsKey(
    appId: "ca-app-pub-2054952505259569~1491084250",
    openAppAds: "ca-app-pub-2054952505259569/4367694882",
    interstitialAds: "ca-app-pub-2054952505259569/3131468987",
  );

  static final String testKey = "ca-app-pub-3940256099942544/4411468910";

  static AdsKey getAdsKey() {
    if (Platform.isAndroid) {
      return _androidAds; // Ad Unit ID cho Android
    } else if (Platform.isIOS) {
      return _iOSAds; // Ad Unit ID cho iOS
    } else {
      throw UnsupportedError('No support');
    }
  }

}

class AdsKey {
  final String appId;
  final String interstitialAds;
  final String openAppAds;

  AdsKey({
    required this.appId,
    required this.interstitialAds,
    required this.openAppAds,
  });
}
