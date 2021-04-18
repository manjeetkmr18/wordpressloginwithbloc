import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextEditingController ctrl;
  final Function(String)?    changed;
  final TextInputType keyboard;

  const EntryField({Key? key,required this.title,required this.isPassword,required this.ctrl, this.changed,required this.keyboard}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Material(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            elevation: 5,
            child: TextField(
              controller: ctrl,
              onChanged: changed,
              keyboardType: keyboard,
                obscureText: isPassword,
                decoration: InputDecoration(  
                    border: InputBorder.none,
                    fillColor: Colors.grey.shade200,
                    filled: true
                    )),
          )
        ],
      ),
    );
  }
}
