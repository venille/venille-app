import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:venille/core/utilities/index.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'About Us',
          onTap: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.horizontal_10,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              SubtitleText(
                lineHeight: 1.6,
                text:
                    'Livestocx is an AI-powered livestock marketplace connecting small-holder livestock farmers directly to sellers, evading middlemen and managing all their logistics while reducing trade inefficiencies, low customer reach, unsustainable transport services, and hence losses',
              ),
              const SizedBox(height: 20),
              SubtitleText(
                lineHeight: 1.6,
                fontStyle: FontStyle.italic,
                weight: FontWeight.w600,
                alignment: TextAlign.center,
                text:
                    'Our platform provides a centralized, transparent, and efficient marketplace where local livestock farmers connect with buyers from anywhere around the United States, carry out transactions, and coordinate logistics.',
              ),
              const SizedBox(height: AppSizes.vertical_50),
              const Center(
                child: TitleText(
                  size: 14,
                  title: 'Made with ❤️ by Venille Inc',
                  weight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: AppSizes.vertical_100),
            ],
          ),
        ),
      ),
    );
  }
}
