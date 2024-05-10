import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

    return Scaffold(
        body: Container(
      height: myHeight,
      width: myWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(0, 151, 150, 150), bgColor]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: myHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.05, vertical: myHeight * 0.01),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "STOCK",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                ),
                // to do
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ 100,000.000",
                    style: TextStyle(fontSize: 30, color: textColor)),
                Container(
                    padding: EdgeInsets.all(myWidth * 0.01),
                    height: myHeight * 0.05,
                    width: myWidth * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      'assets/icons/5.1.png',
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
            child: Row(
              children: [
                Text("+ 162% all time",
                    style: TextStyle(fontSize: 15, color: textColor)),
              ],
            ),
          ),
          SizedBox(
            height: myHeight * 0.015,
          ),
          Container(
            height: myHeight * 0.7,
            width: myWidth,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 5)
                ]),
            child: Column(
              children: [
                SizedBox(
                  height: myHeight * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Assets",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                      Icon(Icons.add)
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.02,
                ),
                Expanded(
                    flex: 2,
                    child: Center(
                      child: CircularProgressIndicator(),
                    )),
              ],
            ),
          )
        ],
      ),
    ));
  }

  bool isRefreshing = false;
}
