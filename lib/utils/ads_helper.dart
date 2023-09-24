
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:popcorn_sound_mobile/constants/ads_constant.dart';

mixin AdsHelper {
  //Advertising setup
  //****************************************
  RxBool isAdLoaded = RxBool(false);
  RewardedAd? rewardedAd;
  InterstitialAd? interstitialAd;

  ///Init method define
  initRewardedAd() async {
    await RewardedAd.load(
        adUnitId: AdsConstant.testKey,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
            ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  isAdLoaded.value = false;
                }
            );
            isAdLoaded.value = true;
            ad.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
          },
          onAdFailedToLoad: (LoadAdError error) {
            print(error);
          },
        )
    );
  }

  initInterstitialAd() async {
    InterstitialAd.load(
      adUnitId: AdsConstant.testKey,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                isAdLoaded.value = false;
              }
          );
          isAdLoaded.value = true;
          ad.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print(error);
        },
      ),
      request: const AdRequest(),
    );
  }
//****************************************
}