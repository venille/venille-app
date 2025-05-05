import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';

class OrderPadScreen extends StatefulWidget {
  const OrderPadScreen({super.key});

  @override
  State<OrderPadScreen> createState() => _OrderPadScreenState();
}

class _OrderPadScreenState extends State<OrderPadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Order Pad',
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Text('Order Pad'),
      ),
    );
  }
}
