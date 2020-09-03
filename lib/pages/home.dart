import 'package:aea_payload/model/constants.dart';
import 'package:aea_payload/model/hover_extensions.dart';
import 'package:aea_payload/pages/sign_in.dart';
import 'package:aea_payload/pages/tickets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
      body: Center(
        child: new GridView.builder(
            itemCount: 16, // bridge_list.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              return new InkWell(
                onTap: () {
                  // print("Container $index");
                  Navigator.pushNamed(
                    context,
                    TicketsPage.route,
                    arguments: TicketsArguments(index),
                  );
                  return;
                },
                child: new Tooltip(
                  message: "Weighbridge ${index + 1}",
                  child: new Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: new Card(
                      elevation: 8,
                      child: new Container(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            new Align(
                              alignment: Alignment.topLeft,
                              child: new Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(),
                                child: new Text(
                                  "${index + 1}",
                                  style: new TextStyle(
                                    fontSize: 30,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            new Container(
                              width: 100,
                              height: 100,
                              child: Icon(
                                Icons.dns,
                                size: 100,
                              ),
                            ),
                            new Expanded(
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  new Container(
                                    child: new Row(
                                      children: [
                                        new Container(
                                          width: 50,
                                          height: 50,
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "IN",
                                            style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          width: 170,
                                          height: 50,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "00000000 KG",
                                            style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          width: 50,
                                          height: 50,
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.gps_fixed,
                                            size: 20,
                                            color: Colors.lightGreen[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new SizedBox(
                                    height: 5,
                                  ),
                                  new Container(
                                    child: new Row(
                                      children: [
                                        new Container(
                                          width: 50,
                                          height: 50,
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "OUT",
                                            style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          width: 170,
                                          height: 50,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "00000000 KG",
                                            style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          width: 50,
                                          height: 50,
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.gps_not_fixed,
                                            size: 20,
                                            color: Colors.orange[800],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ).showCursorOnHover;
            }),
      ),
    );
  }
}
