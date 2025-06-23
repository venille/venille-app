import 'package:flutter/material.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/utilities/index.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/profile_appbar.dart';
import 'package:venille/components/cards/referral_banner.dart';
import 'package:venille/components/buttons/logout_button.dart';
import 'package:venille/components/cards/profile_menu_item_card.dart';
import 'package:venille/components/buttons/delete_account_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();

    ServiceRegistry.accountService.fetchDetailedUserAccountInfoService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: ProfileAppBar(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontal_15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSizes.vertical_10),
                    const ReferralBanner(),
                    const SizedBox(height: AppSizes.vertical_10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: profileMenuItems.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return ProfileMenuItemCard(
                          hasTopBorder: index != 0,
                          item: profileMenuItems[index],
                        );
                      },
                    ),
                    Divider(color: AppColors.grayLightColor.withOpacity(0.6)),
                    const LogoutButton(),
                    const DeleteAccountButton(),
                    const SizedBox(height: AppSizes.vertical_50),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
