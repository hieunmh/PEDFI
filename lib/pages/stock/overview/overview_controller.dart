import 'package:get/get.dart';

class OverviewController extends GetxController {
  var showTotalBalance = false.obs;

  var currencyList = [
    {
      'coinname': '1000SATS',
      'detail': '1000*SATS(Ordinals)',
    },
    {
      'coinname': 'SAND',
      'detail': 'The Sandbox',
    },
    {
      'coinname': 'VET',
      'detail': 'VeChain',
    },
    {
      'coinname': '1000SATS',
      'detail': '1000*SATS(Ordinals)',
    },
    {
      'coinname': 'SAND',
      'detail': 'The Sandbox',
    },
    {
      'coinname': 'VET',
      'detail': 'VeChain',
    },
    {
      'coinname': '1000SATS',
      'detail': '1000*SATS(Ordinals)',
    },
    {
      'coinname': 'SAND',
      'detail': 'The Sandbox',
    },
    {
      'coinname': 'VET',
      'detail': 'VeChain',
    },
  ].obs;

  void setShowTotalBalance(bool show) {
    showTotalBalance.value = show;
  }
}