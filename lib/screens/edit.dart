import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method
import 'package:flutter/material.dart';
import 'package:todo_practice/database/db.dart';
import 'package:todo_practice/database/memo.dart';

class EditPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hi'),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            IconButton(onPressed: saveDB, icon: Icon(Icons.save)),
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
                  controller: titleController),
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
        id: StrTosha256(DateTime.now().toString()),
        title: titleController.text,
        text: this.text,
        createTime: DateTime.now().toString(),
        editTime: DateTime.now().toString());

    await sd.insertMemo(fido);

    print(await sd.memos());
  }

  String StrTosha256(String text) {
    var bytes = utf8.encode("text"); // data being hashed

    return sha256.convert(bytes).toString();
  }
}
