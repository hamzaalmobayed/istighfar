import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:third_project/mainEvent.dart';
import 'package:third_project/setting.dart';

import 'notificationShape.dart';
class Notifications extends StatefulWidget {
 

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text('notifyTitle'.tr(),style: TextStyle(fontSize: 25.sp),),
            padding: EdgeInsets.only(top: 50.h),
          ),
          centerTitle: true,
          leading: Container(
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: ()async{
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  await Share.share("this is my url",
                      subject: "",
                      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
                },
                padding: EdgeInsets.only(top: 50.h),
              )),
          toolbarHeight: 85.h,
          flexibleSpace: Image(
            height: 85.h,
            image: AssetImage(
              'images/image2.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        body:isSwitched?ListView(
            children:notify.map((e) => NotificationShape(e)).toList()
        ):Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.jpg",height: 200,width: 200,),
          Text("لا يوجد اشعارات",style: TextStyle(fontSize: 30,color: Color.fromRGBO(134, 64, 28, 1),),)
          ],
        ),)
    );
  }
}

