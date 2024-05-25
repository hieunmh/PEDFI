// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/database/database_service.dart';
import 'package:pedfi/model/transaction_model.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {

  final supabase = Supabase.instance.client;
  final DatabaseService databaseService = DatabaseService.instance;

  var currentMonth = DateFormat('MM-y').format(DateTime.now()).obs;

  var month = [].obs;

  var firstDay = DateFormat('dd MMMM, y').format(DateTime(DateTime.now().year, DateTime.now().month, 1)).toString().obs;
  var lastDay = DateFormat('dd MMMM, y').format(DateTime(DateTime.now().year, DateTime.now().month + 1, 0)).toString().obs;

  final scrollController = ScrollController();
  final tranScroll = ScrollController();

  var appController = Get.find<ApplicationController>();

  var allTransaction = <Transaction>[].obs;
  var filterTransaction = <Transaction>[].obs;

  var incomeTransaction = <Transaction>[].obs;
  var expenseTransaction = <Transaction>[].obs;

  var incomeAllTran = <Transaction>[].obs;
  var expenseAllTran = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllTransaction();
    DateTime now = DateTime.now();

    for (int i = -23; i <= 0; i++) {
      month.add(DateFormat('MM-y').format(DateTime(now.year, now.month + i, 1)));
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }); 

  }

  int incomeMonthValue() {
    int res = 0;
    for (int i = 0; i < incomeTransaction.value.length; i++) {
      res += incomeTransaction.value[i].value;
    }
    return res;
  }

  int incomeAllValue() {
    int res = 0;
    for (int i = 0; i < incomeAllTran.value.length; i++) {
      res += incomeAllTran.value[i].value;
    }
    return res;
  }

  int expenseMonthValue() {
    int res = 0;
    for (int i = 0; i < expenseTransaction.value.length; i++) {
      res += expenseTransaction.value[i].value;
    }
    return res;
  }

  int expenseAllValue() {
    int res = 0;
    for (int i = 0; i < expenseAllTran.value.length; i++) {
      res += expenseAllTran.value[i].value;
    }
    return res;
  }

  

  Future<void> getAllTransaction() async {

    var x = 1;

    if (x > 0) {
      var res = await databaseService.getAllTransaction();

      allTransaction.value = res;

      incomeAllTran.value = allTransaction.value.where((i) => i.value > 0).toList();
      expenseAllTran.value = allTransaction.value.where((i) => i.value < 0).toList();
      
      transactionByMonthYear(currentMonth.value);
    } else {
      if (appController.userId.isEmpty) {
        return;
      }

      final res = await supabase.from('Transactions')
      .select('*,  Categories(image, name)')
      .eq('user_id', appController.userId.value).order('date', ascending: false);


      allTransaction.value = TransactionFromJson(res); 

      incomeAllTran.value = allTransaction.value.where((i) => i.value > 0).toList();
      expenseAllTran.value = allTransaction.value.where((i) => i.value < 0).toList();
      
      transactionByMonthYear(currentMonth.value);
    }
  }

  void transactionByMonthYear(String monthyear) {
    final splitted = monthyear.split('-');

    var intYear = int.parse(splitted[1]);
    var intMonth = int.parse(splitted[0]);

    filterTransaction.value = allTransaction.value.where((e) {
      return DateTime.parse(e.date).year == intYear && DateTime.parse(e.date).month == intMonth;
    }).toList();

    incomeTransaction.value = filterTransaction.value.where((i) => i.value > 0).toList();
    expenseTransaction.value = filterTransaction.value.where((i) => i.value < 0).toList();
  }


  Future<void> deleteTransaction(String id) async {
    var x = 1; 
    if (x > 0) {
      await databaseService.deleteTransactionById(id);
    } else {
      await supabase.from('Transactions').delete().eq('id', id);
    }

    await getAllTransaction();
  }

  void setCurrentMonth(String month) {
    currentMonth.value = month;
    transactionByMonthYear(month);
  }

  void setFirstLastDay(String current) {

    final splitted = current.split('-');

    var intYear = int.parse(splitted[1]);
    var intMonth = int.parse(splitted[0]);

    firstDay.value = DateFormat('dd MMMM, y').format(DateTime(intYear, intMonth, 1)).toString();
    lastDay.value = DateFormat('dd MMMM, y').format(DateTime(intYear, intMonth + 1, 0)).toString();
  }


  void scrollToCurrentMonth() {

    final selectedMonth = month.indexOf(currentMonth.value);
    final maxItemPerScreen  = (Get.width / 90.0).round();

    if (selectedMonth >= (maxItemPerScreen / 2).round() && 
      selectedMonth < month.length - (maxItemPerScreen / 2).round()
    ) {
      final scrollOffset = (selectedMonth * 90.0) - Get.width / 2 + 45;
      scrollController.animateTo(
        scrollOffset, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }

    if (selectedMonth < (maxItemPerScreen / 2).round()) {
      scrollController.animateTo(
        0, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }

    if (selectedMonth >= month.length - (maxItemPerScreen / 2).round()) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }
  }
}