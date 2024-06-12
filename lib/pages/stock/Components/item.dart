import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Item extends StatelessWidget {
  var item;
  Item({this.item});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color textColor = themeState.getDarkTheme
        ? AppColor.textDarkThemeColor
        : AppColor.textLightThemeColor;

    final Color bgColor = themeState.getDarkTheme
        ? AppColor.bgDarkThemeColor
        : AppColor.bgLightThemeColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        height: myHeight * 0.06,
        child: Row(
          children: [
            SizedBox(
              width: 35,
              height: 35,
              child: Image.network(item.image),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      color: textColor
                    ),
                  ),
                  Text(
                    '0.4 ' + item.symbol,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12, 
                      color: Colors.grey
                    )
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 10),
            SizedBox(
              width: 80,
              child: Sparkline(
                data: item.sparklineIn7D.price,
                lineColor: item.marketCapChangePercentage24H >= 0
                    ? Colors.green
                    : Colors.red,
                lineWidth: 1.5,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                    colors: item.marketCapChangePercentage24H >= 0
                        ? [Colors.green.shade200, Colors.green.shade50]
                        : [Colors.red.shade200, Colors.red.shade50]),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$ " + item.currentPrice.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor.withOpacity(0.8)
                  ),
                ),
                Row(
                  children: [
                    Text(item.priceChange24H.toStringAsFixed(2) + "\$",
                        style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    const SizedBox(width: 5),
                    Text(
                      item.marketCapChangePercentage24H.toStringAsFixed(2) + "%",
                      style: TextStyle(
                      fontSize: 12,
                      color: item.marketCapChangePercentage24H >= 0
                      ? Colors.green : Colors.red
                      )
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
