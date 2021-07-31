import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}
enum Time { zero, one, }
Time group ;
bool isSwitched = false;
class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('settingTitle'.tr(),style: TextStyle(fontSize: 25.sp),),
          padding: EdgeInsets.only(top: 50.h),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("title1".tr(),style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.fromBorderSide(BorderSide(color: Colors.grey))
              ),
              width: 400.w,
              height: 270.h,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: ListView(
                  children: [
                    TextButton(
                      onPressed: (){},
                      child: ListTile(
                        title: Text("support".tr(),style: TextStyle(color: Colors.grey),),
                        leading:Icon(Icons.volunteer_activism),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Divider(color: Colors.grey,height: 1.h,),
                    ),
                    TextButton(
                      onPressed: ()=>openAlertBoxRadio(),
                      child: ListTile(
                        title: Text("lang".tr(),style: TextStyle(color: Colors.grey),),
                        leading: Icon(Icons.messenger_outline),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 25.w),
                      child: Divider(color: Colors.grey,height: 1.h,),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 8.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 7,
                            child: ListTile(
                              title: Text("notifyTitle".tr(),style: TextStyle(color: Colors.grey),),
                              leading: Icon(Icons.notifications_none),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0.w),
                              child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Color.fromRGBO(134,64,28,0.8),
                              activeColor:Color.fromRGBO(134,64,28,1),
                          ),
                            ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.w),
                      child: Divider(color: Colors.grey,height: 1.h,),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: ListTile(
                        title: Text("appearance".tr(),style: TextStyle(color: Colors.grey),),
                        leading: Icon(Icons.vpn_lock_sharp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text("title2".tr(),style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.fromBorderSide(BorderSide(color: Colors.grey))
              ),
              width: 400.w,
              height: 150.h,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: ListView(
                  children: [
                    TextButton(
                      onPressed: (){},
                      child: ListTile(
                        title: Text("policy".tr(),style: TextStyle(color: Colors.grey),),
                        leading: Icon(Icons.vpn_lock_sharp),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.w),
                      child: Divider(color: Colors.grey,height: 1.h,),
                    ),

                    Padding(
                      padding:EdgeInsets.only(left: 8.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 10,
                            child: ListTile(
                              title: Text("version".tr(),style: TextStyle(color: Colors.grey),),
                              leading: Icon(Icons.ad_units),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:EdgeInsets.only(right: 8.0.w),
                              child: Text("2.0v",style: TextStyle(color: Colors.grey),),
                            ),)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
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
              height: 280.h,
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
                      "choose".tr(),
                      style: TextStyle(color: Colors.white,fontSize: 25.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  RadioButtonClass( "العربية",Time.zero),
                  RadioButtonClass( "English",Time.one),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical:10.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(134, 64, 28, 1),
                            elevation: 10.h,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.symmetric( vertical: 8.h,horizontal: 30.w),
                          ),
                          onPressed: () {
                            if(group==Time.zero){
                              EasyLocalization.of(context).setLocale(Locale('ar'));
                            }else{
                              EasyLocalization.of(context).setLocale(Locale('en'));
                            }
                          },
                          child: Text(
                            "button".tr(),
                            style: TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:10.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            elevation: 10.h,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            padding: EdgeInsets.symmetric( vertical: 8.h,horizontal: 30.w),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "cancel".tr(),
                            style: TextStyle(fontSize: 20.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
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
}

