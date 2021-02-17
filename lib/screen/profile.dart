import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                    'https://scontent.fcgk18-1.fna.fbcdn.net/v/t1.0-9/139000661_1681939242008181_6582985187196825943_o.jpg?_nc_cat=111&ccb=3&_nc_sid=09cbfe&_nc_eui2=AeH4p4FnkwpnrktKMkJDKb4-oLks9xAMPr6guSz3EAw-vjNuKbKqi3Ghiww4P-VGzHzYWxRF41UQq7IRdvJf_1tV&_nc_ohc=LzjF8jMvyUoAX86mS7s&_nc_ht=scontent.fcgk18-1.fna&oh=360513b0d868e5b08da3106b8d16543e&oe=6054768C',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Nama : Rifdi Ardhi Ramadhandi',
                style: TextStyle(color: Color(0xff555555), fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Email : masrifdi404@gmail.com',
                style: TextStyle(color: Color(0xff555555), fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Github : ',
                  children: [
                    TextSpan(
                        text: 'https://github.com/rifdi12',
                        style:
                            TextStyle(color: Color(0xff6495ED), fontSize: 20),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const url = 'https://github.com/rifdi12';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          })
                  ],
                  style: TextStyle(color: Color(0xff555555), fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'LinkedIn : ',
                  children: [
                    TextSpan(
                        text:
                            'https://www.linkedin.com/in/rifdi-ardhi-ramadhandi-183924129/',
                        style:
                            TextStyle(color: Color(0xff6495ED), fontSize: 20),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const url =
                                'https://www.linkedin.com/in/rifdi-ardhi-ramadhandi-183924129/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          })
                  ],
                  style: TextStyle(color: Color(0xff555555), fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
