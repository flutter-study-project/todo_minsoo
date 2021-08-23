import 'package:flutter/material.dart';
import 'package:todo_practice/database/db.dart';
import 'package:todo_practice/database/memo.dart';

class EditPage extends StatelessWidget {
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hi'),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            IconButton(onPressed: saveDB, icon: Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                // obscureText: true,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                decoration: InputDecoration(hintText: '제목을 적어주세요'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (String title) {
                  this.title = title;
                },
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              TextField(
                // obscureText: true,
                decoration: InputDecoration(hintText: '메모의 내용을 적어주세요'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (String text) {
                  this.text = text;
                },
              ),
            ],
          ),
        ));
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
        id: 1,
        title: this.title,
        text: this.text,
        createTime: DateTime.now().toString(),
        editTime: DateTime.now().toString());

    await sd.insertMemo(fido);

    print(await sd.memos());
  }
}
