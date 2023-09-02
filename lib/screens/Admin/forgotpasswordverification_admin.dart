import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../Network/DataBaseHelper.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/header_widget.dart';

class forgotpasswordverification_admin extends StatefulWidget {
  @override
  State<forgotpasswordverification_admin> createState() =>
      _forgotpasswordverification_adminState();
}

class _forgotpasswordverification_adminState
    extends State<forgotpasswordverification_admin> {
  //DatabaseHelper databaseHelper = new DatabaseHelper();
  final _formkey = GlobalKey<FormState>();

  var vercode = TextEditingController();
  _onPressed() {
    setState(() {
      DataBaseHelper.repassvData(vercode.text,);
    });
  }

  final _formKey = GlobalKey<FormState>();
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
                child: HeaderWidget(
                    _headerHeight, false, Icons.privacy_tip_outlined),
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
                              'Verification',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Enter the verification code we just sent you on your email address.',
                              style: TextStyle(
                                color: Colors.black87,
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
                                controller: vercode,
                                keyboardType: TextInputType.number,
                                validator: (String? text) {
                                  if (text == null ||
                                      text == '' ||
                                      text.isEmpty) {
                                    return 'Can\'t be empty';
                                  }
                                  if (text.length < 6) {
                                    return 'too short';
                                  }
                                  if (text.length > 6) {
                                    return 'check your code and try again';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label: Text('Verification code'),
                                  prefixIcon: Icon(
                                    Icons.verified_user,
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
                            SizedBox(height: 50.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "If you didn't receive a code! ",
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Resend',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                title: Text("Successful"),
                                                content: Container(
                                                  height: 100,
                                                  width: 100,
                                                  child: Text(
                                                      "Verification code resend successful."),
                                                ));
                                          },
                                        );
                                      },
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              // decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                  style:
                                      ElevatedButton.styleFrom(primary: grey),
                                  //    style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Verify'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              title: Text("Successful"),
                                              content: Container(
                                                height: 100,
                                                width: 100,
                                              ));
                                        });

                                    _onPressed();
                                  }),
                            )
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
