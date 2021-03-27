import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    BannerAd ad = BannerAd(
      adUnitId: 'ca-app-pub-3246132399617809/7901120640',
      size: AdSize.smartBanner,
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (Ad ad) => print('Ad Loaded'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('Ad opened'),
        onAdClosed: (Ad ad) => print('Ad closed'),
      ),
    );
    return ad;
  }
}
