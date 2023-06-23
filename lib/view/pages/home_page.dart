import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      drawer: _navigation(context),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            "MyNote",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
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
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoListSection.insetGrouped(
              children: List.generate(
                  5, // length
                  (index) => CupertinoListTile(
                        title: Text("Title"),
                        subtitle: Text("폴더?"),
                        additionalInfo: Text("작성시간"),
                        onTap: () => {},
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => {},
                        ),
                      )),
            ),
            FloatingActionButton.extended(
              label: Text('노트 추가'),
              icon: Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => _buildInsertAlertDialog());
              },
            ),
          ],
        ),
      ),
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
      ),
    );
  }

  AlertDialog _buildInsertAlertDialog() {
    //_controller.text = '';
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              //controller: _controller,
              ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // viewModel.onEvent(HomeEvent.insert(_controller.text));
            // Navigator.pop(context, true);
          },
          child: const Text('Insert'),
        ),
      ],
    );
  }
}
