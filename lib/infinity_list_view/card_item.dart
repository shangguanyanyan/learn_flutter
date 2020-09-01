import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_flutter/infinity_list_view/person.dart';

class CardItem extends StatelessWidget {
  final Person person;

  CardItem(this.person);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(msg: "正在通话中。。。", textColor: Colors.black);
      },
      child: Container(
        //height: 100,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                  color: Color(0x0d001E50),
                  offset: Offset(0, 8.0),
                  blurRadius: 10.0,
                  spreadRadius: 3.0)
            ]),
        child: Row(
          children: <Widget>[
            ClipOval(
              child: Image.asset(person.image, width: 60, height: 60),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(person.name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    //Spacer(),
                    Text(person.description,
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
