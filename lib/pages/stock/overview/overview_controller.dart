import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OverviewController extends GetxController {
  var showTotalBalance = false.obs;
  var totalBalance = 0.0.obs;
  var coinList = [].obs;
  var historyList = [].obs;

  final supabase = Supabase.instance.client;

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

  @override
  void onInit() {
    super.onInit();

    getWalletCoin();
    getCoinList();
    getCoinHistory();
  }

  Future<void> getWalletCoin() async {
    var userId = supabase.auth.currentUser?.id.toString() ?? '';

    var res = await supabase.from('Wallets').select()
    .eq('user_id', userId).eq('name', 'coin').single();
    totalBalance.value = res['value'];
  }

  Future<void> getCoinList() async {
    var userId = supabase.auth.currentUser?.id.toString() ?? '';

    var coinlist = await supabase.from('Coins').select().eq('user_id', userId).gt('amount', 0);

    coinList.value = coinlist;
  }

  Future<void> getCoinHistory() async {
    var userId = supabase.auth.currentUser?.id.toString() ?? '';

    var history = await supabase.from('CoinTransHistory').select()
    .eq('user_id', userId).order('created_at', ascending: false);

    historyList.value = history;
  }

  void setShowTotalBalance(bool show) {
    showTotalBalance.value = show;
  }
}