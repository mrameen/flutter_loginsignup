import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginsignup/create_login.dart';
import 'package:loginsignup/sign_in.dart';

import 'home_signin_widget.dart';

class MenuFrame extends StatelessWidget {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 28.0,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.heartBroken,
                      color: Color.fromRGBO(245, 48, 111, 1),
                      size: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CONN',
                          style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(245, 48, 111, 1)),
                        ),
                        Text(
                          'CONNEXION',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Find and meet people aroud to find LOVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // SizedBox(
                    //   height: 25,
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics() ,
                controller: pageController,
                children: [
                  HomeSignInWidget(
                    goToSignIn: () {
                      pageController.animateToPage(1,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    goToSignUp: () {
                      pageController.animateToPage(2,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                  ),
                  SignIn(),
                  CreateLogin(
                    cancelBackToHome: () {
                      pageController.animateToPage(0,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 123, 67, 1),
              Color.fromRGBO(245, 50, 111, 1),
            ],
          ),
        ),
      ),
    );
  }
}
