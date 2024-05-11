import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/create/amount_input.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';
import 'package:pedfi/pages/application/create/date_input.dart';
import 'package:pedfi/pages/application/create/note_input.dart';
import 'package:pedfi/pages/application/create/tran_category.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CreateTransactionPage extends GetView<CreateTranController> {
  const CreateTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeState.getDarkTheme ? 
        Colors.black12 : Colors.grey.shade200,
        centerTitle: true,
        title: Text(
          'Create transaction',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 20
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            DateInput(),
        
            AmountInput(),
        
            NoteInput(),
        
            TranCatergory(),
          ],
        ),
      ),
    );
  }
}