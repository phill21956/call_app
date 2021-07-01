
import 'package:call_app/components/rounded_button.dart';
import 'package:call_app/components/video_call.dart';
import 'package:call_app/constants.dart';
import 'package:call_app/size_config.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Image
        Image.asset(
          "assets/images/full_image.png",
          fit: BoxFit.cover,
        ),
        // Black Layer
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jemmy \nWilliams",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.white),
                ),
                VerticalSpacing(of: 10),
                Text(
                  "Incoming 00:01".toUpperCase(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                      press: () {},
                      iconSrc:"assets/icons/Icon Volume.svg",
                    ),
                    RoundedButton(
                      press: () {
                        Navigator.pop(context);
                      },
                      color: kRedColor,
                      iconColor: Colors.white,
                      iconSrc: "assets/icons/call_end.svg",
                    ),
                    RoundedButton(
                      press: () {
                         Navigator.push(context,MaterialPageRoute(builder:(context)=>VideoCall()),);
                      },
                      iconSrc:"assets/icons/Icon Video.svg", 
                      
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
