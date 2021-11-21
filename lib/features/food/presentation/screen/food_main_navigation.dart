import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/default/bottom_bar.dart';
import 'package:food_delivery/features/food/domain/usecases/food_usecase_implementation.dart';
import 'package:food_delivery/features/food/presentation/cubit/food_cubit.dart';
import 'package:food_delivery/features/orders/presentation/screen/order_page.dart';
import 'package:food_delivery/features/orders/presentation/screen/orders_page_main.dart';
import 'package:food_delivery/features/profile/presentation/screen/profile_page_content.dart';
import 'package:food_delivery/screens/appbar/appbar_with_text.dart';
import 'package:food_delivery/screens/appbar/appbar_with_button.dart';
import 'package:food_delivery/screens/appbar/without_appbar.dart';
import 'package:geolocator/geolocator.dart';
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

class _FoodMainNavigationState extends State<FoodMainNavigation>
    with TickerProviderStateMixin {

  static final List<Widget> _pages = <Widget>[
    const FoodMainPage(),
    const Search(),
    const ProfilePageContent(),
    const OrdersPageMain(),
    const AllChatPage()
    //const AllChatPage(),
  ];

  int _selectedIndex = 0;

  late PreferredSizeWidget appbar;
  late AnimationController _homeController;
  late AnimationController _searchController;
  late AnimationController _chatController;
  late AnimationController _chartController;
  late AnimationController _profileController;


  @override
  void initState() {
    super.initState();

    appbar = appbarWithText(context);

    _homeController = AnimationController(
        duration: const Duration(milliseconds: 950), vsync: this);
    _homeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _homeController.reset();
      }
    });

    _searchController = AnimationController(
        duration: const Duration(milliseconds: 950), vsync: this);
    _searchController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _searchController.reset();
      }
    });

    _chatController = AnimationController(
        duration: const Duration(milliseconds: 950), vsync: this);
    _chatController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _chatController.reset();
      }
    });

    _chartController = AnimationController(
        duration: const Duration(milliseconds: 950), vsync: this);
    _chartController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _chartController.reset();
      }
    });

    _profileController = AnimationController(
        duration: const Duration(milliseconds: 950), vsync: this);
    _profileController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _profileController.reset();
      }
    });
  }

  @override
  void dispose() {
    _homeController.dispose();
    super.dispose();
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
      containerHeight: 7.5.h,
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
          controller: _homeController,
          icon: 'assets/animated_buttons/home.json',
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          controller: _searchController,
          icon: 'assets/animated_buttons/search.json',
          title: Text('Search'),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: 'assets/animated_buttons/user.json',
          title: Text('Profile'),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
          controller: _profileController,
        ),
        BottomNavyBarItem(
          icon: 'assets/animated_buttons/order.json',
          title: Text(
            'Cart',
          ),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
          controller: _chartController,
        ),
        BottomNavyBarItem(
          icon: 'assets/animated_buttons/chat.json',
          title: Text('Chat'),
          activeColor: Colors.green,
          inactiveColor: Colors.green[200],
          textAlign: TextAlign.center,
          controller: _chatController,
        ),
      ],
    );
  }
}
