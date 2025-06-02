import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/components/buttons/custom_back_button.dart';
import 'package:venille/core/constants/sizes.dart';

class CreateForumPostScreen extends StatefulWidget {
  const CreateForumPostScreen({super.key});

  @override
  State<CreateForumPostScreen> createState() => _CreateForumPostScreenState();
}

class _CreateForumPostScreenState extends State<CreateForumPostScreen> {
  final TextEditingController _postController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isPostEnabled = false;

  @override
  void initState() {
    super.initState();
    _postController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _postController.removeListener(_onTextChanged);
    _postController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _isPostEnabled = _postController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          // padding: MediaQuery.of(context).padding,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontal_15,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                TitleText(
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                  title: 'Legal',
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar and text input section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.pets,
                    color: AppColors.whiteColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                // Text input field
                Expanded(
                  child: TextField(
                    controller: _postController,
                    focusNode: _focusNode,
                    maxLines: null,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                    ),
                    decoration: const InputDecoration(
                      hintText: "What's on your mind?",
                      hintStyle: TextStyle(
                        color: AppColors.grayColor,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Media attachment section (placeholder)
            Padding(
              padding: const EdgeInsets.only(left: 62),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.grayLightColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.image_outlined,
                      color: AppColors.grayColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Post button
            Container(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: _isPostEnabled ? _handlePost : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isPostEnabled
                      ? AppColors.pinkColor
                      : AppColors.grayLightColor,
                  foregroundColor: AppColors.whiteColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Post',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _isPostEnabled
                        ? AppColors.whiteColor
                        : AppColors.grayColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePost() {
    if (_postController.text.trim().isNotEmpty) {
      // Handle post creation logic here
      print('Posting: ${_postController.text}');
      Navigator.pop(context);
    }
  }
}
