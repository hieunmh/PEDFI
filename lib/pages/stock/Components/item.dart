import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.05, vertical: myHeight * 0.017),
      child: Container(
        height: myHeight * 0.06,
        child: Row(
          children: [
            Expanded(
                flex: 1, child: Container(child: Image.network(item.image))),
            SizedBox(
              width: myWidth * 0.02,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  Text('0.4 ' + item.symbol,
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(
              width: myWidth * 0.02,
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: myHeight * 0.06,
                width: myWidth * 0.3,
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
            ),
            SizedBox(
              width: myWidth * 0.03,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$ " + item.currentPrice.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor.withOpacity(0.8)),
                  ),
                  Row(
                    children: [
                      Text(item.priceChange24H.toStringAsFixed(2) + "\$",
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                      SizedBox(
                        width: myWidth * 0.015,
                      ),
                      Text(
                          item.marketCapChangePercentage24H.toStringAsFixed(2) +
                              "%",
                          style: TextStyle(
                              fontSize: 13,
                              color: item.marketCapChangePercentage24H >= 0
                                  ? Colors.green
                                  : Colors.red)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
