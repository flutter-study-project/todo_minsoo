import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_practice/screens/edit.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> LoadMemo() {
    List<Widget> memoList = [];
    memoList.add(Container(color: Colors.redAccent, height: 70));
    return memoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('투두 리스트'),
      ),
      body: ListView(children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Text(
                '메모메모',
                style: TextStyle(fontSize: 36, color: Colors.blueAccent),
              ),
            )
          ],
        ),
        ...LoadMemo()
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => EditPage()));
        },
        label: Text('할 일 추가'),
        tooltip: '할 일을 추가하려면 클릭하세요',
        icon: Icon(Icons.add),
      ),
    );
    ;
  }
}
