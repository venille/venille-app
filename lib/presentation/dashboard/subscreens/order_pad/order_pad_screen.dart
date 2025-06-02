import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/core/providers/index.dart';

class OrderPadScreen extends StatefulWidget {
  const OrderPadScreen({super.key});

  @override
  State<OrderPadScreen> createState() => _OrderPadScreenState();
}

class _OrderPadScreenState extends State<OrderPadScreen> {
  int quantity = 1;
  String? deliveryMethod;
  bool isProcessing = false;

  final List<String> deliveryOptions = ['Delivery', 'Pickup'];

  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ServiceRegistry.authenticationService.fetchAvailableStatesService();
  }

  @override
  void dispose() {
    addressController.dispose();
    stateController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void _submitOrder() async {
    setState(() {
      isProcessing = true;
    });

    if (deliveryMethod == null) {
      customErrorMessageSnackbar(
        title: 'Message',
        message: 'Please select a delivery method',
      );

      setState(() {
        isProcessing = false;
      });

      return;
    }

    if (deliveryMethod == 'Delivery' &&
        (addressController.text.isEmpty ||
            stateController.text.isEmpty ||
            cityController.text.isEmpty)) {
      customErrorMessageSnackbar(
        title: 'Message',
        message: 'Please fill in all delivery details',
      );

      setState(() {
        isProcessing = false;
      });
      return;
    }

    await Future.delayed(const Duration(milliseconds: 3500));

    customSuccessMessageSnackbar(
      title: 'Success',
      message: 'Your pad request has been submitted!',
    );

    setState(() {
      quantity = 1;
      isProcessing = false;
      deliveryMethod = null;
      addressController.clear();
      stateController.clear();
      cityController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Order Pad',
          onTap: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pad Info Card
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.buttonPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: AppColors.buttonPrimaryColor, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Venille Pads',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• High-quality, comfortable sanitary pads',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '• Individually wrapped for hygiene',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '• Pack contains 8 pads',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Quantity Selector
            Text(
              'Select Quantity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                  icon: Icon(Icons.remove_circle_outline),
                  color: AppColors.buttonPrimaryColor,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.buttonPrimaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() => quantity++);
                  },
                  icon: Icon(Icons.add_circle_outline),
                  color: AppColors.buttonPrimaryColor,
                ),
                SizedBox(width: 8),
                Text(
                  'pack(s)',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Delivery Method
            Text(
              'Choose Delivery Method',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: deliveryOptions.map((option) {
                return ChoiceChip(
                  label: Text(option),
                  selected: deliveryMethod == option,
                  onSelected: (selected) {
                    setState(() {
                      deliveryMethod = selected ? option : null;
                    });
                  },
                  selectedColor: AppColors.buttonPrimaryColor,
                  checkmarkColor:
                      deliveryMethod == option ? Colors.white : Colors.black,
                  labelStyle: TextStyle(
                    color:
                        deliveryMethod == option ? Colors.white : Colors.black,
                  ),
                );
              }).toList(),
            ),
            if (deliveryMethod == 'Pickup')
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Pickup location will be shared after order confirmation',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            _buildDeliveryAddressFields(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Column(
          children: [
            isProcessing
                ? const CustomLoadingButton(height: 56)
                : CustomButton(
                    text: 'Submit Request',
                    width: double.maxFinite,
                    height: 56,
                    fontSize: 16,
                    borderRadius: 16,
                    onTapHandler: _submitOrder,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.whiteColor,
                    backgroundColor: AppColors.buttonPrimaryColor,
                  ),
            Text(
              'Free service for registered users',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryAddressFields() {
    if (deliveryMethod != 'Delivery') return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text(
          'Delivery Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: addressController,
          decoration: InputDecoration(
            hintText: 'Enter your street address',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.buttonPrimaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.buttonPrimaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: AppColors.buttonPrimaryColor, width: 2),
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'State',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.buttonPrimaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: stateController.text.isEmpty
                          ? null
                          : stateController.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: InputBorder.none,
                      ),
                      hint: Text('Select state'),
                      items: ServiceRegistry.userRepository.availableStates
                          .map((e) => DropdownMenuItem(
                                value: e.state,
                                child: Text(e.state),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          stateController.text = value!;
                          cityController.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'City',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.buttonPrimaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: cityController.text.isEmpty
                          ? null
                          : cityController.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: InputBorder.none,
                      ),
                      hint: Text('Select city'),
                      items: stateController.text.isEmpty
                          ? []
                          : ServiceRegistry.userRepository.availableStates
                                  .firstWhereOrNull((element) =>
                                      element.state == stateController.text)
                                  ?.lgas
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList() ??
                              [],
                      onChanged: (value) {
                        setState(() {
                          cityController.text = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
