// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:pedfi/pages/category/category_bindings.dart';
import 'package:pedfi/pages/category/category_view.dart';
import 'package:pedfi/pages/create/create_tran_bindings.dart';
import 'package:pedfi/pages/create/create_tran_view.dart';
import 'package:pedfi/pages/custom_categogy/custom_bindings.dart';
import 'package:pedfi/pages/custom_categogy/custom_view.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_bindings.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_view.dart';
import 'package:pedfi/pages/application/application_bindings.dart';
import 'package:pedfi/pages/application/application_view.dart';
import 'package:pedfi/pages/auth/auth_bindings.dart';
import 'package:pedfi/pages/auth/auth_view.dart';
import 'package:pedfi/pages/stock/stock_bindings.dart';
import 'package:pedfi/pages/stock/stock_view.dart';
import 'package:pedfi/routes/routes.dart';

class AppPages {
  
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.APPLICATION, 
      page: () => ApplicationPage(),
      binding: ApplicationBindings()
    ),

    GetPage(
      name: AppRoutes.AUTH, 
      page: () => AuthPage(),
      binding: AuthBindings()
    ),

    GetPage(
      name: AppRoutes.PROFILE_DETAIL, 
      page: () => ProfileDetailPage(),
      binding: ProfileDetailBindings()
    ),

    GetPage(
      name: AppRoutes.STOCK, 
      page: () => StockPage(),
      binding: StockBindings()
    ),

    GetPage(
      name: AppRoutes.CATEGORY, 
      page: () => CategoryPage(),
      binding: CategoryBindings()
    ),

    GetPage(
      name: AppRoutes.CUSTOMCATEGORY, 
      page: () => CustomCategoryPage(),
      binding: CustomCategoryBindings()
    ),

    GetPage(
      name: AppRoutes.CREATE_TRANSACTION, 
      page: () => CreateTransactionPage(),
      binding: CreateTranBidings()
    ),
  ];
}