import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/header_widget.dart';
import '../Signin.dart';
import 'forgotpasswordverification_doctor.dart';

class forgotpassword_doctor extends StatefulWidget {
  const forgotpassword_doctor({Key? key}) : super(key: key);

  @override
  State<forgotpassword_doctor> createState() => _forgotpassword_doctorState();
}

class _forgotpassword_doctorState extends State<forgotpassword_doctor> {
  final _formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child:
                    HeaderWidget(_headerHeight, false, Icons.password_rounded),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'NanumMyeongjo',
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Enter the email address associated with your account.',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontFamily: 'JosefinSans',
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'We will email you a verification code to check your authenticity.',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'JosefinSans',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                validator: (String? text) {
                                  if (text == null ||
                                      text == '' ||
                                      text.isEmpty) {
                                    return 'Can\'t be empty';
                                  }
                                  if (text.length < 6) {
                                    return 'too short';
                                  }
                                  if (text.contains('@') == false ||
                                      text.contains('.com') == false) {
                                    return 'Invalid email format';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Email Address'),
                                  hintText: 'mohammad@gmail.com',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Color.fromRGBO(10, 199, 220, 10),
                                  ),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
//     color: secoundBackColor,
                                          )),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              //       decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: grey),
                                //       style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Send".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Get.to(() =>
                                        forgotpasswordverification_doctor());
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "Remember your password? "),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(() => SigninScreeen());
                                      },
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
