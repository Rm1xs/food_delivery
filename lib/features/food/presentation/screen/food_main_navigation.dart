import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/default/bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'food_main_content.dart';

class FoodMainNavigation extends StatefulWidget {
  const FoodMainNavigation({Key? key}) : super(key: key);

  @override
  State<FoodMainNavigation> createState() => _FoodMainNavigationState();
}

class _FoodMainNavigationState extends State<FoodMainNavigation> {
  static const List<Widget> _pages = <Widget>[
    FoodMainPage(),
    Icon(
      Icons.perm_phone_msg,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 22.h),
          child: Padding(
            padding: EdgeInsets.fromLTRB(6.w, 8.h, 6.w, 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find Your',
                      style: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                            fontSize: 23.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Favorite Food',
                      style: GoogleFonts.ptSans(
                        textStyle: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.fromLTRB(6.w, 0.h, 0.w, 0),
                  child: Container(
                    //width: 10.w,
                    //height: 5.h,
                    child: ClayContainer(
                      color: Colors.white,
                      borderRadius: 15,
                      depth: 20,
                      spread: 8,
                      child: Stack(children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            icon: IconTheme(
                              data: IconThemeData(color: Colors.green[300]),
                              child: Icon(Icons.notifications_none_sharp),
                            ),
                            color: Colors.white,
                            onPressed: () => {}),
                        _redDot(),
                      ],)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
        body: Center(
          child: _pages.elementAt(_selectedIndex), //New
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 8.h,
      backgroundColor: Colors.white,
      selectedIndex: _selectedIndex,
      showElevation: true,
      itemCornerRadius: 12,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _selectedIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home_filled),
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.people_alt),
          title: Text('Profile'),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          title: Text(
            'Cart',
          ),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text('Chat'),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  Widget _redDot() {
    return Positioned(
      right: 3.6.w,
      top: 1.6.h,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(7),
        ),
        constraints: const BoxConstraints(
          minWidth: 4,
          minHeight: 4,
        ),
        child: SizedBox(
          width: 1,
          height: 1,
        ),
      ),
    );
  }
}

