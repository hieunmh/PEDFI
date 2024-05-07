import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/transaction/transaction_controller.dart';

class TimeLineMonth extends GetView<TransactionController> {
  const TimeLineMonth({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      height:50,
      child: ListView.builder(
        itemCount: controller.month.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(() =>
            GestureDetector(
              onTap: () {
                controller.setCurrentMonth(controller.month[index]);
                controller.scrollToCurrentMonth();
              },
              child: Container(
                width: 90,
                margin:const EdgeInsets.all(5),
                decoration: controller.currentMonth.value == controller.month[index] ? 
                  BoxDecoration(
                    color: AppColor.commonColor.withOpacity(1),
                    borderRadius: BorderRadius.circular(10)
                  ) : BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(10)
                  ),
                child: Center(
                  child: Text(
                    controller.month[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}