import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_practice/screens/edit.dart';
import 'package:todo_practice/database/db.dart';
import 'package:todo_practice/database/memo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Memo>> loadMemos() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  List<Widget> loadMemo() {
    List<Widget> memoList = [];
    memoList.add(Container(color: Colors.redAccent, height: 70));
    return memoList;
  }

  Widget memoBuilder() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == false) {
          return Container(
            child: Text('메모를 지금 바로 추가 해보세요!'),
          );
        }
        return ListView.builder(
            itemCount: projectSnap.data?.length,
            itemBuilder: (context, index) {
              List<Memo> memo = projectSnap.data;
              print(projectSnap.data?.length);
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(memo[index].title),
                    Text(memo[index].text),
                    Text(memo[index].createTime),
                    Text(memo[index].editTime),
                  ]);
            });
      },
      future: loadMemos(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('투두 리스트'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: memoBuilder()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => EditPage()));
        },
        label: Text('할 일 추가'),
        tooltip: '할 일을 추가하려면 클릭하세요',
        icon: Icon(Icons.add),
      ),
    );
  }
}
