import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/model/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApplicationController extends GetxController {
  final supabase = Supabase.instance.client;

  final state = 0.obs;
  final position = ''.obs;
  List<Category> incomeCategory = [];
  List<Category> expenseCategory = [];

  var userEmail = ''.obs;
  var joinDate = ''.obs;
  var isLoggedin = false.obs;

  late final PageController pageController;

  final bottomNavBar = const [
    BottomNavigationBarItem(
      activeIcon: Icon(FontAwesomeIcons.chartPie),
      label: 'Home',
      icon: Icon(FontAwesomeIcons.chartPie)
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(FontAwesomeIcons.penToSquare),
      label: 'Create',
      icon: Icon(FontAwesomeIcons.penToSquare)
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(FontAwesomeIcons.userAstronaut),
      label: 'Profile',
      icon: Icon(FontAwesomeIcons.userAstronaut)
    )

  ];

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getIncomeCategory();
    getExpenseCategory();

    pageController = PageController(initialPage: state.value);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> getIncomeCategory() async {
    final res = await supabase.from('Categories').select('*').eq('type', 'income');
    print(res);

    incomeCategory = categoryFromJson(res);
  }

  Future<void> getExpenseCategory() async {
    final res = await supabase.from('Categories').select('*').eq('type', 'expense');
    print(res);

    expenseCategory = categoryFromJson(res);
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
