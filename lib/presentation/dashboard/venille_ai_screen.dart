import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venille/components/buttons/custom_button.dart';
import 'package:venille/components/buttons/custom_loading_button.dart';
import 'package:venille/components/buttons/language_selection_dropdown.dart';
import 'package:venille/components/skeletons/insecure_dashboard_content.dart';
import 'package:venille/components/snackbars/custom_snackbar.dart';
import 'package:venille/components/text/title_text.dart';
import 'package:venille/core/constants/secrets.dart';
import 'package:venille/core/constants/sizes.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:venille/components/text/subtitle_text.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';
import 'package:venille/core/utilities/appLocale.dart';
import 'package:venille/data/infra_sdk/account/lib/account_sdk.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class VenilleAiScreen extends StatefulWidget {
  const VenilleAiScreen({super.key});

  @override
  State<VenilleAiScreen> createState() => _VenilleAiScreenState();
}

class _VenilleAiScreenState extends State<VenilleAiScreen> {
  bool _isGenerating = false;
  final List<ChatMessage> _messages = [];

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> _handleSubmit(String text) async {
    if (_isGenerating == true) return;
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        text: text.trim(),
        isUser: true,
        timestamp: DateTime.now(),
      ));
      _messageController.clear();
      _isGenerating = true;
    });

    _scrollToBottom();

    FocusScope.of(context).unfocus();

    String response =
        await ServiceRegistry.authenticationService.generateAiResponseService(
      prompt: text,
    );

    if (response.isEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          isUser: false,
          text: AppLocale.sorryICouldntGenerateAResponse.getString(context),
          timestamp: DateTime.now(),
        ));
        _isGenerating = false;
      });
      return;
    }

    setState(() {
      _messages.add(ChatMessage(
        isUser: false,
        text: response,
        timestamp: DateTime.now(),
      ));
      _isGenerating = false;
    });

    _scrollToBottom();
  }

  void _showReportDialog(ChatMessage message) {
    String? selectedReason;
    final TextEditingController otherReasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: TitleText(
                size: 14,
                title: AppLocale.reportAiResponse.getString(context),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocale.whyAreYouReportingThisResponse
                          .getString(context),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    RadioListTile<String>(
                      title: Text(AppLocale.itOffensive.getString(context)),
                      value: 'OFFENSIVE',
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                    RadioListTile<String>(
                      title: Text(AppLocale.itInAccurate.getString(context)),
                      value: 'INACCURATE',
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                    RadioListTile<String>(
                      title: Text(AppLocale.itHarmful.getString(context)),
                      value: 'HARMFUL',
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                    RadioListTile<String>(
                      title: Text(AppLocale.other.getString(context)),
                      value: 'OTHER',
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                    if (selectedReason == 'other') ...[
                      const SizedBox(height: 8),
                      TextField(
                        controller: otherReasonController,
                        decoration: InputDecoration(
                          hintText: AppLocale.pleaseSpecify.getString(context),
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocale.cancel.getString(context)),
                ),
                Obx(
                  () => ServiceRegistry.accountService
                          .isReportVenilleAiResponseProcessing.isTrue
                      ? const CustomLoadingButton(
                          height: 36,
                          width: 100,
                          backgroundColor: AppColors.blackColor,
                        )
                      : CustomButton(
                          text: AppLocale.submit.getString(context),
                          width: 100,
                          height: 36,
                          fontSize: 16,
                          borderRadius: 16,
                          onTapHandler: () {
                            if (selectedReason == null) {
                              return customErrorMessageSnackbar(
                                title: AppLocale.message.getString(context),
                                message: AppLocale.pleaseSelectReason
                                    .getString(context),
                              );
                            }

                            ReportAIResponseDTO payload = ReportAIResponseDTO(
                              (instance) => instance
                                ..prompt = message.text
                                ..responseType = selectedReason!,
                            );

                            ServiceRegistry.accountService
                                .reportVenilleAiResponseService(
                              payload: payload,
                              context: context,
                            );
                          },
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.whiteColor,
                          backgroundColor: AppColors.blackColor,
                        ),
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.vertical_8,
        horizontal: AppSizes.horizontal_10,
      ),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isUser)
            CircleAvatar(
              backgroundColor: AppColors.backgroundColor,
              child: Image.asset(
                'assets/icons/icon_brain.png',
                width: 20,
                height: 20,
              ),
            ),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.vertical_10,
                horizontal: AppSizes.horizontal_15,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: message.isUser
                      ? AppColors.grayColor.withOpacity(0.3)
                      : Colors.grey.withOpacity(0),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.isUser)
                    Text(
                      message.text,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    )
                  else
                    MarkdownBody(
                      data: message.text,
                      styleSheet: MarkdownStyleSheet(
                        p: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          height: 1.5,
                        ),
                        strong: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        em: TextStyle(
                          color: Colors.black87.withOpacity(0.9),
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                        listBullet: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        blockquote: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          height: 1.5,
                        ),
                        blockquoteDecoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: AppColors.primaryColor.withOpacity(0.3),
                              width: 4,
                            ),
                          ),
                        ),
                        code: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontFamily: 'monospace',
                          backgroundColor: Colors.grey[100],
                        ),
                        codeblockDecoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        h1: const TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        h2: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        h3: const TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        a: const TextStyle(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTapLink: (text, href, title) {
                        if (href != null) {
                          // Handle link taps here
                          print('Tapped link: $href');
                        }
                      },
                    ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      if (!message.isUser)
                        InkWell(
                          onTap: () => _showReportDialog(message),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  FluentIcons.warning_16_regular,
                                  size: 16,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  AppLocale.report.getString(context),
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (message.isUser)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Obx(
                () => Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 2,
                      color: AppColors.grayLightColor,
                    ),
                  ),
                  child: ClipOval(
                    child: CachedNetworkImageWidget(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      imageUrl: ServiceRegistry
                          .userRepository.accountInfo.value.profilePhoto,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      key: scaffoldKey,
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: TitledAppbar(
          title: 'Venille AI',
          scaffoldKey: scaffoldKey,
        ),
      ),
      body: ServiceRegistry.localStorage
                  .read(LocalStorageSecrets.authenticationMethod) ==
              'GUEST'
          ? const InsecureDashboardContent()
          : Column(
              children: [
                Expanded(
                  child: _messages.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/icon_brain.png',
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(height: 16),
                              SubtitleText(
                                color: AppColors.grayColor,
                                text: AppLocale.startaConversationWithVenilleAI
                                    .getString(context),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.only(bottom: 16),
                          itemCount: _messages.length,
                          itemBuilder: (context, index) =>
                              _buildMessage(_messages[index]),
                        ),
                ),
                if (_isGenerating)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.backgroundColor,
                          child: Image.asset(
                            'assets/icons/icon_brain.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                          ),
                          child: Row(
                            children: [
                              Text(AppLocale.thinking.getString(context)),
                              const SizedBox(width: 8),
                              const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, -2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppSizes.horizontal_10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2)),
                            ),
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: AppLocale.typeYourMessage.getString(context),
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                              onSubmitted: _handleSubmit,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: AppSizes.horizontal_10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(
                                FluentIcons.send_20_regular,
                                color: Colors.white,
                              ),
                              onPressed: () =>
                                  _handleSubmit(_messageController.text),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
