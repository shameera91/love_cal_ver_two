import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:love_calculator/services/admob_service.dart';
import 'package:love_calculator/views/result_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController firstName = new TextEditingController();
  TextEditingController secondName = new TextEditingController();
  String result = '';
  BannerAd _bannerAd;

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  @override
  Widget build(BuildContext context) {
    _bannerAd = AdMobService.createBannerAd()..load();
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: firstName,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Your Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                'LOVES',
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: secondName,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'His/Her Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                result = calculateLove(firstName.text, secondName.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultView(
                      result: result,
                      firstName: firstName.text,
                      secondName: secondName.text,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent.shade200,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: AdWidget(
          key: UniqueKey(),
          ad: _bannerAd,
        ),
      ),
    );
  }
}

String countChars(String firstName, String secondName) {
  String phrase =
      (firstName.trim() + "loves" + secondName.trim()).toLowerCase();

  String strAllChars = "";
  String strCount = "";
  for (int a = 0; a < phrase.length; a++) {
    if (strAllChars.indexOf(phrase[a]) < 0) {
      int count = 0;
      for (int j = 0; j < phrase.length; j++) {
        if (phrase[a] == phrase[j]) {
          count = count + 1;
        }
      }
      strAllChars = strAllChars + phrase[a];
      strCount = strCount + count.toString();
    }
  }
  return strCount;
}

String shortenNumber(String countList) {
  String shortenString = "";
  if (countList.length >= 2) {
    int numOne = int.parse(countList[0]);
    int numTwo = int.parse(countList[countList.length - 1]);
    shortenString = (numOne + numTwo).toString() +
        shortenNumber(countList.substring(1, countList.length - 1));
  } else {
    return countList;
  }
  return shortenString;
}

String calculateLove(String firstName, String secondName) {
  String shortString = countChars(firstName, secondName);
  do {
    shortString = shortenNumber(shortString);
  } while (shortString.length > 2);
  shortString = shortString + '%';
  return shortString;
}
