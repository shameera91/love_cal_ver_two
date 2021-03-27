import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  ResultView({this.result, this.firstName, this.secondName});
  final String result;
  final String firstName;
  final String secondName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '  $result',
              style: TextStyle(fontSize: 90, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Calculate Again',
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent.shade200,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
