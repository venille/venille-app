import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/constants/routes.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/components/cards/ongoing_order_item_card.dart';
import 'package:venille/components/buttons/grouped_header_buttons.dart';
import 'package:venille/components/cards/completed_order_item_card.dart';
import 'package:venille/components/skeletons/empty_results_content.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String orderType = 'Ongoing';
  RxBool fetchingPaginatedData = false.obs;

  ScrollController scrollController = ScrollController();

  final List<String> orderTypes = ['Ongoing', 'Completed'];

  Future<void> initializeOrders() async {
    await ServiceRegistry.orderService.fetchUserOrdersService(
      currentPage: 1,
    );
  }

  @override
  void initState() {
    super.initState();

    initializeOrders();
    scrollController.addListener(_scrollHandler);
  }

  void _scrollHandler() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      fetchingPaginatedData.value = true;

      if (ServiceRegistry.userRepository.ordersHasNextPage.value == true) {
        await ServiceRegistry.orderService.fetchUserOrdersService(
          currentPage:
              ServiceRegistry.userRepository.ordersCurrentPage.value + 1,
        );

        fetchingPaginatedData.value = false;
      }

      fetchingPaginatedData.value = false;

      debugPrint('[END-OF-CONTENT]');
      debugPrint('[CONFIGURE-PAGINATION]');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Container(
            // color: Colors.amber,
            height: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              // top: AppSizes.vertical_5,
              horizontal: AppSizes.horizontal_15,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(
                      callBackFunction: () {
                        Get.back();
                      },
                    ),
                    const TitleText(
                      size: 16,
                      title: 'Orders',
                    ),
                    const SizedBox(width: AppSizes.horizontal_35),
                  ],
                ),
                const SizedBox(height: AppSizes.vertical_5),
                GroupedHeaderButtons(
                  currentItem: orderType,
                  buttonTypes: orderTypes,
                  onChangeHandler: (String value) {
                    log('[UPDATE-VIEW-ORDERS-TYPE] -> ${value.toUpperCase()}');

                    setState(() {
                      orderType = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 0,
        backgroundColor: AppColors.blackColor,
        foregroundColor: AppColors.whiteColor,
        onPressed: () {
          Get.toNamed(AppRoutes.orderPadRoute);
        },
        child: const Icon(FluentIcons.add_16_regular),
      ),
      body: RefreshIndicator(
        onRefresh: initializeOrders,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontal_15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderType == 'Ongoing'
                            ? const SizedBox(height: AppSizes.vertical_10)
                            : const SizedBox(),
                        orderType == 'Completed'
                            ? const SizedBox(height: AppSizes.vertical_10)
                            : const SizedBox(),
                        orderType == 'Ongoing'
                            ? ServiceRegistry
                                    .userRepository.ongoingOrders.isEmpty
                                ? const EmptyResultsContent(
                                    displayType: 'ONGOING_ORDERS',
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: ServiceRegistry
                                        .userRepository.ongoingOrders.length,
                                    itemBuilder: (_, index) {
                                      return OngoingOrderItemCard(
                                        orderInfo: ServiceRegistry
                                            .userRepository
                                            .ongoingOrders[index],
                                      );
                                    },
                                  )
                            : const SizedBox(),
                        orderType == 'Completed'
                            ? ServiceRegistry
                                    .userRepository.completedOrders.isEmpty
                                ? const EmptyResultsContent(
                                    displayType: 'COMPLETED_ORDERS',
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: ServiceRegistry
                                        .userRepository.completedOrders.length,
                                    itemBuilder: (_, index) {
                                      return CompletedOrderItemCard(
                                        orderInfo: ServiceRegistry
                                            .userRepository
                                            .completedOrders[index],
                                      );
                                    },
                                  )
                            : const SizedBox(),
                        const SizedBox(height: AppSizes.vertical_50),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
