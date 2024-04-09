import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),

      body: ListView(
        padding: EdgeInsets.only(
          right: 12.0,
          left: 12.0,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "0",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.attach_money,
                      size: 35.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.visibility,
                size: 35.0,
                color: Colors.blue,
              ),
              Icon(
                Icons.notifications,
                size: 35.0,
                color: Colors.blue,
              ),
            ],
          ),

          Row(
            children: [
              Text(
                "Tổng số dư",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black38,
                ),
              ),
              Icon(
                Icons.help_outline,
                size: 20.0,
                color: Colors.black38,
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.only(
              top: 12.0,
              bottom: 20.0,
            ),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(
                12.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ví của tôi',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Xem tất cả',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    padding: EdgeInsets.only(
                      top: 12.0,
                      bottom: 12.0,
                    ),
                    height: 1,
                    color: Colors.grey,
                  ),

                  SizedBox(
                    height: 76.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Image.asset(
                              'assets/images/meo.jpg',
                              width: 35.0,
                              height: 35.0,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Tiền mặt',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        
                        Row(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.attach_money,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Báo cáo chi tiêu',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Xem báo cáo',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.only(
              top: 12.0,
              bottom: 20.0,
            ),
            child: Container(
              width: 200,
              height: 1000,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                top: 20.0,
                right: 12.0,
                left: 12.0,
                bottom: 12.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



