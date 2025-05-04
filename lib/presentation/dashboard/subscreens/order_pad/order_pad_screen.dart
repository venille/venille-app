import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';

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
      body: Center(
        child: Text('Order Pad'),
      ),
    );
  }
}
