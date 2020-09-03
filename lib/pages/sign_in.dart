import 'package:aea_payload/model/colors/custom.dart';
import 'package:aea_payload/model/constants.dart';
import 'package:aea_payload/model/hover_extensions.dart';
import 'package:aea_payload/pages/home.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static const String route = '/login/';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: customclr,
        child: new Center(
          child: new Card(
            elevation: 8,
            child: new Container(
              width: 500,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Container(
                      width: 200,
                      height: 200,
                      padding: EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        mainAppLogo,
                        // height: 100.0,
                        // width: 100.0,
                      ),
                    ),
                    new SizedBox(
                      height: 20.0,
                    ),
                    new TextFormField(
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                      controller: usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Username",
                        labelText: "Username",
                        alignLabelWithHint: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Icon(Icons.person),
                        ),
                        contentPadding: const EdgeInsets.all(7.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3.0,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return; // formValidation("signin", "username", value);
                      },
                    ),
                    new SizedBox(
                      height: 10.0,
                    ),
                    new TextFormField(
                      obscureText: true,
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        labelText: "Password",
                        alignLabelWithHint: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Icon(Icons.lock),
                        ),
                        contentPadding: const EdgeInsets.all(7.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3.0,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return; // formValidation("signin", "password", value);
                      },
                      onFieldSubmitted: (value) {},
                    ),
                    new SizedBox(
                      height: 20.0,
                    ),
                    new Tooltip(
                      message: "Login",
                      child: new FlatButton(
                        child: new Text(
                          "Login",
                          style: new TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).primaryColor, // Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          bottom: 16.0,
                          right: 22.0,
                          left: 22.0,
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              HomePage.route, (_) => false);
                          // Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
                          /*
                          if (!_isLoading) {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              if (connectedToNetwork) {
                                _signin();
                              } else {
                                var alerticon = Icons.report_problem;
                                var alerttext = "No connection...";
                                var alerttextcolor = Colors.black54;
                                var alerticoncolor = Colors.black54;
                                if (deviceOs == deviceOsOptions.i) {
                                  showDialog(
                                    context: context,
                                    builder: (_) => ActionAlert(
                                      theTitle: alerttext,
                                      theIcon: alerticon,
                                      theTextColor: alerttextcolor,
                                      theIconColor: alerticoncolor,
                                    ),
                                    barrierDismissible: false,
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (_) => ActionAlert(
                                      theTitle: alerttext,
                                      theIcon: alerticon,
                                      theTextColor: alerttextcolor,
                                      theIconColor: alerticoncolor,
                                    ),
                                    barrierDismissible: false,
                                  );
                                }
                                Future.delayed(
                                    Duration(
                                      seconds: 2,
                                    ), () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop("dialog");
                                });
                              }
                            }
                          }
                          */
                        },
                      ).showCursorOnHover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
