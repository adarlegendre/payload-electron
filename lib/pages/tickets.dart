import 'dart:math';

import 'package:aea_payload/model/constants.dart';
import 'package:aea_payload/model/hover_extensions.dart';
import 'package:aea_payload/pages/home.dart';
import 'package:aea_payload/pages/sign_in.dart';
import 'package:flutter/material.dart';
// import 'package:horizontal_data_table/horizontal_data_table.dart';
// import 'package:responsive_table/responsive_table.dart';

class TicketsPage extends StatefulWidget {
  static const String route = '/tickets/';

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  var dts = DTS();
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final TicketsArguments args = ModalRoute.of(context).settings.arguments;
    var indx = (args.bridgeIndex != null) ? args.bridgeIndex : 1;

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
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 8.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PaginatedDataTable(
                      header: new Text("Tickets: Weighbridge $indx"),
                      columnSpacing: 56.0,
                      horizontalMargin: 24,
                      columns: [
                        new DataColumn(
                          label: new Text("col#1"),
                        ),
                        new DataColumn(
                          label: new Text("col#2"),
                        ),
                        new DataColumn(
                          label: new Text("col#3"),
                        ),
                        new DataColumn(
                          label: new Text("col#4"),
                        ),
                      ],
                      source: dts,
                      onRowsPerPageChanged: (r) {
                        setState(() {
                          _rowPerPage = r;
                        });
                      },
                      rowsPerPage: _rowPerPage,
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

class TicketsArguments {
  final int bridgeIndex;
  TicketsArguments(this.bridgeIndex);
}

class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text("#cell$index"),
        ),
        DataCell(
          Text("#cel2$index"),
        ),
        DataCell(
          Text("#cel3$index"),
        ),
        DataCell(
          Text("#cel4$index"),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
