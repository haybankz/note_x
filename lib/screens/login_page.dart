import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:note_x/util/margin.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createLoginWidget(context);
  }

  Widget createLoginWidget(BuildContext context){
    return  Container(
        color: Colors.grey[350],
        child: Center(
          child: Card(
            margin: EdgeInsets.only(
              top: screenHeight(context, percent: 0.17),
              bottom: screenHeight(context, percent: 0.12),
              left: screenHeight(context, percent: 0.04),
              right: screenHeight(context, percent: 0.04),
            ),
            color: Colors.white,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // YMargin(30),
                  FlutterLogo(
                    colors: Colors.deepOrange,
                    size: 60,
                  ),
                  YMargin(20),
                  Text(
                    "Account Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  YMargin(20),
                  Theme(
                    data: Theme.of(context).copyWith(primaryColor: Colors.green),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800],
                            // decorationColor: Colors.black87,
                            ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Icon(
                              Icons.mail,
                            ),
                          ),
                          hintText: "Email Address",
                          // border: OutlineInputBorder(
                          //   borderSide:
                          //       BorderSide(color: Colors.grey, width: 1.0),
                          //   borderRadius: BorderRadius.circular(24.0),
                          // ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),
                              // disabledBorder: OutlineInputBorder(
                              // borderSide:
                              //     BorderSide(color: Colors.blue, width: 2.0),
                              // borderRadius: BorderRadius.circular(25.0),
                              // ),
                              enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100].withOpacity(0.4), width: 40.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),

                        ),
                      ),
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(primaryColor: Colors.green),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
                      child: TextField(
                        obscureText: true,
                        maxLength: 20,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800],
                            decorationColor: Colors.grey[800]),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Icon(
                              Icons.lock,
                            ),
                          ),
                          hintText: "Password",
                          counterText: "",
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.red, width: 1.0),
                          //   borderRadius: BorderRadius.circular(24.0),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100].withOpacity(0.4), width: 40.0),
                              borderRadius: BorderRadius.circular(25.0),
                              ),
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {},
                    textColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
                      child: Text(
                        "Sign in".toUpperCase(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.green),
                    ),
                  ),
                  YMargin(5),
                  Text(
                    "-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  YMargin(8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Forgot ",
                          style: TextStyle(color: Colors.grey[500], fontSize: 16),
                        ),
                        TextSpan(
                          text: "Password?",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  YMargin(8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "New to SaversClub? ",
                          style: TextStyle(color: Colors.grey[500], fontSize: 16),
                        ),
                        TextSpan(
                          text: "create free account",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // YMargin(50),
                ],
              ),
            ),
          ),
        ),
      );
    

  }
}
