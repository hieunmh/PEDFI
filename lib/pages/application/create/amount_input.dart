import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class AmountInput extends GetView<CreateTranController> {
  const AmountInput({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
            width: 0.2
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              'Amount',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700
              ),
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              children: [
                TextField(
                  textAlignVertical: TextAlignVertical.top,
                  controller: controller.amountController,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      symbol: '',
                      decimalDigits: 0,
                    )
                  ],
                  keyboardType: TextInputType.number,
                  cursorColor: color,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '0', 
                    hintStyle:  TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500
                    )
                  ),
                ),
                const SizedBox(height: 5)
              ],
            ),
          ),

          const SizedBox(width: 10),

          Text(
            'VND',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700
            ),
          )
        
        ],
      ),
    );
  }
}