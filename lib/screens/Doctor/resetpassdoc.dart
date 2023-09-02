import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Signin.dart';


class resetpassdoc extends StatefulWidget {
  const resetpassdoc({Key? key}) : super(key: key);

  @override
  State<resetpassdoc> createState() => _resetpassdocState();
}

class _resetpassdocState extends State<resetpassdoc> {
  String msgStatus = '';

  final _formkey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController ComfController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure1 = true;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 250;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: _headerHeight,
            //   child: HeaderWidget(_headerHeight, false,
            //       Icons.login_rounded), //let's create a common header widget
            // ),
            SafeArea(
                child: Form(
              key: _formkey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView(padding: EdgeInsets.zero, children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Enter Your Password :',
                            style: TextStyle(
                              //  color: firstBackColor,
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: _isObscure,
                              //  cursorColor: firstBackColor,
                              controller: password,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (val) =>
                                  val!.isEmpty ? 'Password is required' : null,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      //   color: firstBackColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: _isObscure1,
                              controller: ComfController,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (text) {
                                if (text == null ||
                                    text == '' ||
                                    text.isEmpty) {
                                  return 'Can\'t be empty';
                                }
                                if (text != password) {
                                  return 'not match';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: ' Enter your password again',
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure1
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure1 = !_isObscure1;
                                      });
                                    }),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              children: [
                                Container(
                                  // decoration: ThemeHelper().buttonBoxDecoration(context),
                                  child: ElevatedButton(
                                    //    style: ThemeHelper().buttonStyle(),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text(
                                        'Sign In'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                        Get.to(() => SigninScreeen());
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
