import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Button extends StatefulWidget {
  String txt;
  Function function;

  Button(this.txt,this.function);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  String time="";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 10.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      ),
      onPressed: widget.function,
      child: Row(
        children: [
          Text(widget.txt,style: TextStyle(
              fontSize: 18.sp,
              color: Colors.grey,
              fontWeight: FontWeight.bold)),
          SizedBox(width: 40.w,),
          Text(time),
          SizedBox(width: 40.w,),
          Icon(Icons.arrow_drop_down,color: Colors.grey,),
        ],
      ),
    );
  }
}

