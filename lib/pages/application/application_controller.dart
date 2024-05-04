import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {

  final state = 0.obs;
  final position = ''.obs;

  late final PageController pageController;
  // late final List<BottomNavigationBarItem> bottomNavBar;
  late final List<NavigationDestination> bottomNavDes;

  @override
  void onInit() {
    super.onInit();

    // bottomNavBar = <BottomNavigationBarItem> [
    //   const BottomNavigationBarItem(
    //     activeIcon: Icon(CupertinoIcons.square_list_fill),
    //     icon: Icon(CupertinoIcons.square_list),
    //     label: 'Home',
    //   ),

    //   const BottomNavigationBarItem(
    //     activeIcon: Icon(CupertinoIcons.add_circled_solid),
    //     icon: Icon(CupertinoIcons.add_circled),
    //     label: 'Add',
    //   ),
      
    //   const BottomNavigationBarItem(
    //     activeIcon: Icon(CupertinoIcons.person_fill),
    //     icon: Icon(CupertinoIcons.person),
    //     label: 'Profile',
    //   ),
    // ];
    
    bottomNavDes = const [
      NavigationDestination(
        selectedIcon: Icon(
          CupertinoIcons.square_list_fill, 
          size: 25,
          color: Colors.white,
        ),
        icon: Icon(CupertinoIcons.square_list, size: 25), 
        label: 'Home'
      ),
      NavigationDestination(
        selectedIcon: Icon(
          CupertinoIcons.add_circled_solid, 
          size: 25,
          color: Colors.white,
        ),
        icon: Icon(CupertinoIcons.add_circled, size: 25), 
        label: 'Add'
      ),
      NavigationDestination(
        selectedIcon: Icon(
          CupertinoIcons.person_fill, 
           size: 25,
           color: Colors.white,
        ),
        icon: Icon(CupertinoIcons.person, size: 25), 
        label: 'Profile',
      ),
    ];

    pageController = PageController(initialPage: state.value);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void handlePageChange(int index) {
    state.value = index;
  }

  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }
}