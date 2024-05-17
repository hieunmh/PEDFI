import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/model/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApplicationController extends GetxController {
  final supabase = Supabase.instance.client;

  final state = 0.obs;
  final position = ''.obs;
  List<Category> allCategory = [];

  var userEmail = ''.obs;
  var userId = ''.obs;
  var joinDate = ''.obs;
  var isLoggedin = false.obs;

  late final PageController pageController;

  final bottomNavBar = const [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(FontAwesomeIcons.list, size: 18)
    ),
    BottomNavigationBarItem(
      label: 'Create',
      icon: Icon(FontAwesomeIcons.penToSquare, size: 18)
    ),
    BottomNavigationBarItem(
      label: 'Calendar',
      icon: Icon(FontAwesomeIcons.calendar, size: 18)
    ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(FontAwesomeIcons.userAstronaut, size: 18)
    )

  ];

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getAllCategory();

    pageController = PageController(initialPage: state.value);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  Future<void> getAllCategory() async {
    final res = await supabase.from('Categories').select('*');
    allCategory = categoryFromJson(res);
  }

  Future<void> getProfile() async {
    var email = supabase.auth.currentUser?.email.toString();
    var createdAt = supabase.auth.currentUser?.createdAt.toString();
    var id = supabase.auth.currentUser?.id.toString();

    if (email == null || createdAt == null || id == null) {
      return;
    } else {
      userEmail.value = email;
      userId.value = id;
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
