import 'package:aea_payload/model/colors/custom.dart';
import 'package:aea_payload/pages/home.dart';
import 'package:aea_payload/pages/sign_in.dart';
import 'package:aea_payload/pages/ticket.dart';
import 'package:aea_payload/pages/tickets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AEA Payload',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: customclr,
        primarySwatch: customclr,
        accentColor: customclr,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(title: 'Mombasa Maize Millers'),
      // home: SignInPage(),
      routes: {
        HomePage.route: (context) => HomePage(),
        SignInPage.route: (context) => SignInPage(),
        TicketsPage.route: (context) => TicketsPage(),
        TicketPage.route: (context) => TicketPage(),
      },
      initialRoute: HomePage.route,
    );
  }
}
