import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class CheckIn extends StatefulWidget {
  @override
  CheckInState createState() => CheckInState();
}

class CheckInState extends State<CheckIn> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align children to the bottom
        children: [
          Center(
            child: SliderButton(
              action: () async {
                /// Do something here OnSlide
                return true;
              },
              label: Text(
                "Check in",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              icon: Icon(
                Icons.add_location_alt_outlined,
                color: Color(0xFF359756),
                size: 40.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              boxShadow: BoxShadow(
                color: Color(0xFF359756),
                blurRadius: 12,
              ),
              alignLabel: Alignment.center, // Center align label
              width: 380,
              radius: 15,
              buttonColor: Color.fromARGB(255, 255, 255, 255),
              backgroundColor: Color(0xFF359756),
              highlightedColor: Color(0xFF359756),
              baseColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(height: 40.0), // Add some space below the button
        ],
      ),
    );
  }
}
