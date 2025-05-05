import 'package:flutter/material.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';

class VellaAIScreen extends StatefulWidget {
  const VellaAIScreen({super.key});

  @override
  State<VellaAIScreen> createState() => _VellaAIScreenState();
}

class _VellaAIScreenState extends State<VellaAIScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Form values
  String? selectedFlowType;
  String? selectedPainLevel;
  String? selectedEmotionalState;

  // Dropdown options
  final List<String> flowTypes = ['Light', 'Medium', 'Heavy', 'Spotting'];
  final List<String> painLevels = ['None', 'Mild', 'Moderate', 'Severe'];
  final List<String> emotionalStates = [
    'Happy',
    'Calm',
    'Anxious',
    'Irritable',
    'Sad',
    'Energetic',
    'Tired'
  ];

  void _submitDailyLog() {
    // TODO: Implement log saving functionality
    if (selectedFlowType == null ||
        selectedPainLevel == null ||
        selectedEmotionalState == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    customSuccessMessageSnackbar(
      title: 'Message',
      message: 'Daily log saved successfully!',
    );

    // Reset form
    setState(() {
      selectedFlowType = null;
      selectedPainLevel = null;
      selectedEmotionalState = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      key: scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: TitledAppbar(
          title: 'Daily Checklist',
          scaffoldKey: scaffoldKey,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How are you feeling today?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                // color: Color(0xFFFF7DAD),
              ),
            ),
            SizedBox(height: 24),

            // Flow Type Dropdown
            Text(
              'Flow Type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonFormField<String>(
                value: selectedFlowType,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                hint: Text('Select flow type'),
                items: flowTypes.map((String type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedFlowType = value;
                  });
                },
              ),
            ),
            SizedBox(height: 24),

            // Pain Level Dropdown
            Text(
              'Pain Level',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonFormField<String>(
                value: selectedPainLevel,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                hint: Text('Select pain level'),
                items: painLevels.map((String level) {
                  return DropdownMenuItem(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedPainLevel = value;
                  });
                },
              ),
            ),
            SizedBox(height: 24),

            // Emotional State Dropdown
            Text(
              'Emotional State',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonFormField<String>(
                value: selectedEmotionalState,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                hint: Text('Select emotional state'),
                items: emotionalStates.map((String state) {
                  return DropdownMenuItem(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedEmotionalState = value;
                  });
                },
              ),
            ),
            SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitDailyLog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save Daily Log',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
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
