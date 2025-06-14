import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/text/column_text.dart';
import 'package:venille/components/text/small_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/tiny_text.dart';
import 'package:venille/core/middlewares/index.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';

class OngoingOrderItemCard extends StatelessWidget {
  final OrderInfo orderInfo;
  const OngoingOrderItemCard({super.key, required this.orderInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppSizes.vertical_10,
      ),
      margin: const EdgeInsets.only(
        bottom: AppSizes.vertical_10,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.grayLightColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.primaryColor,
                    child: Image.asset(
                      'assets/icons/icon_sanitary.png',
                    ),
                  ),
                  const SizedBox(width: AppSizes.horizontal_5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TinyText(
                        text: 'Venille',
                      ),
                      const TitleText(
                        title: 'Sanitary Pad Order',
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.vertical_5,
                  horizontal: AppSizes.horizontal_5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.orangeColor.withOpacity(0.5),
                ),
                child: TinyText(
                  text: 'Pending',
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.vertical_10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColumnText(
                label: 'Quantity',
                value: '${orderInfo.quantity}',
              ),
              Row(
                children: [
                  Icon(
                    orderInfo.deliveryMethod ==
                            OrderInfoDeliveryMethodEnum.delivery
                        ? FluentIcons.vehicle_bicycle_16_regular
                        : FluentIcons.shopping_bag_arrow_left_20_regular,
                    size: 18,
                  ),
                  const SizedBox(width: AppSizes.horizontal_5),
                  ColumnText(
                    label: 'Delivery Method',
                    value: capitalizeFirstLetter(orderInfo.deliveryMethod.name),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
