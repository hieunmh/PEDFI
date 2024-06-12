import 'package:get/get.dart';
import 'package:pedfi/model/coinModel.dart';
import 'package:http/http.dart' as http;

class MarketController extends GetxController {

  var isRefreshing = false.obs;
  var coinMarket = [].obs;
  var coinMarketList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getCoinMarket();
  }

  Future<List<CoinModel>?> getCoinMarket() async {
    isRefreshing.value = true;
    var url = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true');
    var response = await http.get(url);

    isRefreshing.value = false;

    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList.value = coinModelFromJson(x);
      
      coinMarket = coinMarketList;

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}