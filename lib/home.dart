import 'package:flutter/material.dart';
import 'package:third_project/mainEvent.dart';
import 'package:third_project/setting.dart';
import 'package:third_project/settingLandScape.dart';
import 'mainEventLandScape.dart';
import 'notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  settingDirection(){
    return MediaQuery.of(context).orientation==Orientation.portrait?Setting():SettingLandScape();
  }
  mainDirection(){
    return MediaQuery.of(context).orientation==Orientation.portrait?MainEvent():MainEventLandScape();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      mainDirection(),
      Notifications(),
      settingDirection(),
    ];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: MediaQuery.of(context).orientation==Orientation.portrait?Size(360, 712):Size(712, 360),
        orientation: Orientation.portrait);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items:[
              BottomNavigationBarItem(
                activeIcon: ImageIcon( AssetImage("images/quran.png"),color: Color.fromRGBO(134,64,28,1),size: 27,),
                icon: ImageIcon( AssetImage("images/quran.png"),color: Colors.grey,),
                  label:'mainTitle'.tr(),

              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.notifications,color: Color.fromRGBO(134,64,28,1),size: 27,),
                icon: Icon(Icons.notifications,color: Colors.grey,),
                  label:'notifyTitle'.tr(),

              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.settings,color: Color.fromRGBO(134,64,28,1),size: 27),
                icon: Icon(Icons.settings,color: Colors.grey,),
                label: 'settingTitle'.tr(),

              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Color.fromRGBO(134,64,28,1),
            selectedLabelStyle: TextStyle(color: Color.fromRGBO(134,64,28,1),fontSize: 16.sp),
            unselectedLabelStyle:TextStyle(color: Colors.grey,fontSize: 14.sp) ,
            iconSize:25.w,
            onTap: _onItemTapped,
            elevation: 5.h
        ),
      ),
    );
  }
}
