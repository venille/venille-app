import 'package:flutter/material.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      key: scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: TitledAppbar(
          title: 'Learn',
          scaffoldKey: scaffoldKey,
        ),
      ),
      body: Center(
        child: Text('Learn'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (int value) {
          ServiceRegistry.commonRepository.currentScreenIndex.value = value;
        },
        currentPage: ServiceRegistry.commonRepository.currentScreenIndex.value,
      ),
    );
  }
}
