import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      drawer: _navigation(context),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            "MyNote",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CupertinoListSection.insetGrouped(
          children: List.generate(
              3, // length
              (index) => CupertinoListTile(
                    title: Text("Title"),
                    onTap: () => {},
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => {},
                    ),
                  )),
        )
      ]),
    );
  }

  Widget _navigation(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width *
            0.6, // 고정값으로 하는 것보다 context에 따라 바뀌도록
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          // appbar에 contents 가리지 않도록
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("폴더관리"),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
