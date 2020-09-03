import 'package:aea_payload/model/constants.dart';
import 'package:aea_payload/model/hover_extensions.dart';
import 'package:aea_payload/pages/home.dart';
import 'package:aea_payload/pages/sign_in.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  static const String route = '/ticket/';
  final String refnumber;
  TicketPage({
    this.refnumber,
  });
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
        leading: Image.asset(mainAppLogo),
        title: new Container(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                tooltip: "Home",
                onPressed: () {
                  Navigator.of(context).pushNamed(HomePage.route);
                },
              ).showCursorOnHover,
              SizedBox(
                width: 30,
              ),
              IconButton(
                icon: Icon(Icons.logout),
                tooltip: "Logout",
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(SignInPage.route, (_) => false);
                },
              ).showCursorOnHover,
            ],
          ),
        ),
      ),
    );
  }
}
