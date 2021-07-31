import 'dart:async';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:third_project/home.dart';
import 'package:third_project/setting.dart';
import 'buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';


class MainEventLandScape extends StatefulWidget {
  const MainEventLandScape({Key key}) : super(key: key);

  @override
  _MainEventLandScapeState createState() => _MainEventLandScapeState();
}

enum Time { zero, one, two, three, four, five, six, seven }
Time group = Time.zero;
List<bool> rememberMe=[false,false,false,false,false,false,false,false,];
List<String> istighfar=["كل الاذكار","استغفر الله","استغفر الله و اتوب اليه","صل على محمد","الحمدلله رب العالمين","لا اله الا الله","لا حول و لا قوة الا بالله","سبحان الله"];
List<String> optionLandScape=[];
int i=0;

class _MainEventLandScapeState extends State<MainEventLandScape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(
            "mainTitle".tr(),
            style: TextStyle(fontSize: 25.sp),
          ),
          padding: EdgeInsets.only(top: 30.h),
        ),
        centerTitle: true,
        leading: Container(
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () async{
                final RenderBox box = context.findRenderObject() as RenderBox;
                await Share.share("this is my url",
                    subject: "",
                    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
              },
              padding: EdgeInsets.only(top: 30.h),
            )),
        toolbarHeight: 60.h,
        flexibleSpace: Image(
          height: 60.h,
          image: AssetImage(
            'images/image2.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                "set".tr(),
                style: TextStyle(
                    color: Color.fromRGBO(134, 64, 28, 1), fontSize: 25.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Button("alarmTime".tr(), () => openAlertBoxRadio()),
              SizedBox(
                height: 40.h,
              ),
              Button("alarmVoice".tr(), ()=>openAlertBoxCheck()),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(134, 64, 28, 1),
                  elevation: 10.h,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.symmetric(horizontal: 310.w, vertical: 20.h),
                ),
                onPressed: () {
                  if(isSwitched){
                    if(group==Time.zero){

                    }else if(group==Time.one){
                      Timer.periodic(Duration(seconds: 600), (Timer t) => Notify(0));

                    }else if(group==Time.two){
                      Timer.periodic(Duration(seconds: 900), (Timer t) => Notify(0));

                    }else if(group==Time.three){
                      Timer.periodic(Duration(seconds: 1800), (Timer t) => Notify(0));

                    }else if(group==Time.four){
                      Timer.periodic(Duration(seconds: 3600), (Timer t) => Notify(0));

                    }else if(group==Time.five){
                      Timer.periodic(Duration(seconds: 10800), (Timer t) => Notify(0));

                    }else if(group==Time.six){
                      Timer.periodic(Duration(seconds: 21600), (Timer t) => Notify(0));

                    }else if(group==Time.seven){
                      Timer.periodic(Duration(seconds: 86400), (Timer t) => Notify(0));

                    }
                  }

                },
                child: Text(
                  "button".tr(),
                  style: TextStyle(fontSize: 21.sp, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  openAlertBoxRadio() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 0.0.h),
            content: Container(
              width: 500.0.w,
              height: 420.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20.0.h, bottom: 10.0.h),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(134, 64, 28, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0)),
                    ),
                    child: Text(
                      "alarmTime".tr(),
                      style: TextStyle(color: Colors.white,fontSize: 25.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Expanded(flex:1,child: RadioButtonClass( "never".tr(),Time.zero),),

                  Expanded(flex:1,child:RadioButtonClass("10 "+ "minutes".tr(),Time.one)),

                  Expanded(flex:1,child: RadioButtonClass("15 "+ "minute".tr(),Time.two)),

                  Expanded(flex: 1,child: RadioButtonClass( "30 "+"minute".tr(),Time.three),),

                  Expanded(flex: 1,child: RadioButtonClass( "hour".tr(),Time.four),),

                  Expanded(flex: 1,child: RadioButtonClass( "3 "+"hours".tr(),Time.five),),

                  Expanded(flex:1,child: RadioButtonClass( "6 "+"hours".tr(),Time.six)),

                  Expanded(flex:1,child: RadioButtonClass( "24 "+"hour".tr(),Time.seven)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90.0.w,vertical:10.h),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(134, 64, 28, 1),
                        elevation: 10.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.symmetric( vertical: 5.h,),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "button".tr(),
                        style: TextStyle(fontSize: 25.sp, color: Colors.white),
                      ),
                    ),
                  )


                ],
              ),
            ),
          );
        });
  }
  openAlertBoxCheck() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 0.0.h),
            content: Container(
              width: 500.0.w,
              height: 420.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20.0.h, bottom: 10.0.h),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(134, 64, 28, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0)),
                    ),
                    child: Text(
                      "alarmVoice".tr(),
                      style: TextStyle(color: Colors.white,fontSize: 25.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Expanded(flex:1,child: checkBox( "كل الاذكار",0),),

                  Expanded(flex:1,child:checkBox( "سبحان الله",1)),

                  Expanded(flex:1,child: checkBox( "استغفر الله و اتوب اليه",2)),

                  Expanded(flex: 1,child: checkBox( "الحمدلله",3),),

                  Expanded(flex: 1,child: checkBox( "الحمدلله رب العالمين",4),),

                  Expanded(flex: 1,child: checkBox( "لا اله الا الله",5),),

                  Expanded(flex:1,child: checkBox( "لا حول و لا قوة الا بالله",6)),

                  Expanded(flex:1,child: checkBox( "صل على محمد",7)),

                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 90.0.w,vertical:10.h),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(134, 64, 28, 1),
                        elevation: 10.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.symmetric( vertical: 5.h),
                      ),
                      onPressed: () {Navigator.of(context).pop();},
                      child: Text(
                        "button".tr(),
                        style: TextStyle(fontSize: 25.sp, color: Colors.white),
                      ),
                    ),
                  )


                ],
              ),
            ),
          );
        });
  }
  Widget RadioButtonClass(String title,Time value){
    return Row(
      children: [
        Radio(
          activeColor: Color.fromRGBO(134, 64, 28, 1),
          focusColor: Color.fromRGBO(134, 64, 28, 1),
          fillColor:MaterialStateProperty.all(Color.fromRGBO(134, 64, 28, 1)),
          groupValue: group,
          value: value,
          onChanged: (v) {
            setState(() {
              group = v;
              print(group);
              Navigator.of(context).pop();
              openAlertBoxRadio();
            });
          },
        ),
        Text(title,style: TextStyle(color: Color.fromRGBO(134, 64, 28, 1)),),
      ],
    );
  }
  Widget checkBox(String title,int value){

    return Row(
      children: [
        Checkbox(
          activeColor: Color.fromRGBO(134, 64, 28, 1),
          focusColor: Color.fromRGBO(134, 64, 28, 1),
          fillColor:MaterialStateProperty.all(Color.fromRGBO(134, 64, 28, 1)),
          value: rememberMe[value],
          onChanged: (bool newValue) => setState(() {
            rememberMe[value] = newValue;
            print(rememberMe);
            if(optionLandScape!=null)optionLandScape.clear();
            for(int i=0;i<rememberMe.length;i++){

              if(rememberMe[i]==true){
                print(istighfar[i]);
                optionLandScape.add(istighfar[i]);
                print(optionLandScape);
              }
              Navigator.of(context).pop();
              openAlertBoxCheck();
            }
          }),
        ),
        Text(title,style: TextStyle(color: Color.fromRGBO(134, 64, 28, 1)),),
      ],
    );
  }
  void Notify(time)  async{
    String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,

          channelKey: 'key1',
          title: 'تذكير',
          body:notifyString(),
          displayOnBackground: true,
          displayOnForeground: true,
          bigPicture: 'https://i.pinimg.com/564x/6f/31/a9/6f31a91fbd3aec5b10b501b6c6f712ab.jpg',
          notificationLayout: NotificationLayout.BigPicture
      ),
      schedule: NotificationInterval(interval: time,timeZone: timezom,repeats: true),
    );
  }
  String notifyString(){
    String stringList;
    Random random=Random();
    print(optionLandScape[random.nextInt(optionLandScape.length)]);
    return optionLandScape[random.nextInt(optionLandScape.length)];
  }
}
