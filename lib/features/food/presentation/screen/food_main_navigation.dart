import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/default/bottom_bar.dart';
import 'package:food_delivery/core/default/red_dot.dart';
import 'package:food_delivery/features/food/domain/usecases/food_usecase_implementation.dart';
import 'package:food_delivery/features/food/presentation/cubit/food_cubit.dart';
import 'package:food_delivery/features/orders/presentation/screen/order_page.dart';
import 'package:food_delivery/features/profile/presentation/screen/profile_page_content.dart';
import 'package:food_delivery/screens/appbar/appbar_with_text.dart';
import 'package:food_delivery/screens/appbar/appbar_with_button.dart';
import 'package:food_delivery/screens/appbar/without_appbar.dart';
import 'package:food_delivery/screens/notification/notification_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../injection.dart';
import 'chat/all_chat_page.dart';
import 'food_main_content.dart';
import 'food_search_page.dart';

class FoodMainNavigation extends StatefulWidget {
  const FoodMainNavigation({Key? key}) : super(key: key);

  @override
  State<FoodMainNavigation> createState() => _FoodMainNavigationState();
}

class _FoodMainNavigationState extends State<FoodMainNavigation> {
  static final List<Widget> _pages = <Widget>[
    const FoodMainPage(),
    const Search(),
    const ProfilePageContent(),
    const OrderPage(),
    //const AnimatedContainerApp(),
    const AllChatPage(),
  ];

  int _selectedIndex = 0;
  late PreferredSizeWidget appbar;

  @override
  void initState() {
    appbar = appbarWithText(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodCubit>(
      create: (_) => FoodCubit(sl<FoodUseCaseImplementation>()),
      child: SafeArea(
        child: Scaffold(
          appBar: appbar,
          body: Stack(
            children: [
              Container(
                child: _pages.elementAt(_selectedIndex),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _bottomBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 7.h,
      backgroundColor: Colors.white,
      selectedIndex: _selectedIndex,
      showElevation: true,
      itemCornerRadius: 12,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => {
            if (index == 4)
              {
                setState(() {
                  appbar = appbarWithButton('Chat', true, context);
                })
              }
            else if (index == 2)
              {
                setState(() {
                  appbar = withoutAppBar(context);
                })
              }
            else if (index == 3)
              {
                setState(() {
                  appbar = appbarWithButton('Order details', false, context);
                })
              }
            else
              {
                setState(() {
                  appbar = appbarWithText(context);
                })
              },
            _selectedIndex = index
          }),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home_filled),
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
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
}
