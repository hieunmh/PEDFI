import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApplicationController extends GetxController {

  final supabase = Supabase.instance.client;

  final state = 0.obs;
  final position = ''.obs;

  var userEmail = ''.obs;
  var joinDate = ''.obs;
  var isLoggedin = false.obs;


  late final PageController pageController;
  late final List<NavigationDestination> bottomNavDes;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    
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

  Future<void> getProfile() async {
    var email = supabase.auth.currentUser?.email.toString();
    var createdAt = supabase.auth.currentUser?.createdAt.toString();

    if (email == null || createdAt == null) {
      return;
    } else {
      userEmail.value = email;
      joinDate.value = createdAt;
      isLoggedin.value = true;
    }
  }

  void handlePageChange(int index) {
    state.value = index;
  }

  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }
}