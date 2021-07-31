import 'package:flutter/material.dart';
class NotificationShape extends StatelessWidget {
  String txt='';


  NotificationShape(this.txt);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1))
        ),
        width: double.infinity,
        height: 100,
        child:ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(flex:2,child: Text(txt,style: TextStyle(fontSize: 20,color: Color.fromRGBO(134, 64, 28, 1),),),),
                Expanded(flex:1,child: Image.asset("images/logo.jpg",height: 80,width: 80,)),

              ],
            ),
          ),
        ) ,
      ),
    ) ;
  }
}
