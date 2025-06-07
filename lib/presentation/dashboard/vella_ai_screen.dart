import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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

class VellaAiScreen extends StatefulWidget {
  const VellaAiScreen({super.key});

  @override
  State<VellaAiScreen> createState() => _VellaAiScreenState();
}

class _VellaAiScreenState extends State<VellaAiScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  bool _isGenerating = false;

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
          text: 'Sorry, I couldn\'t generate a response please try again.',
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

  Widget _buildMessage(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isUser)
            const Padding(
              padding: EdgeInsets.only(right: 2),
              child: CircleAvatar(
                backgroundColor: AppColors.backgroundColor,
                child: Icon(
                  color: AppColors.primaryColor,
                  FluentIcons.heart_pulse_20_regular,
                ),
              ),
            ),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: message.isUser
                    ? AppColors.primaryColor.withOpacity(0.1)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: message.isUser
                      ? AppColors.primaryColor.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.2),
                ),
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
                        a: TextStyle(
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
                  Text(
                    '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
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
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FluentIcons.chat_multiple_16_regular,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Start a conversation with Venille AI'.tr,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.backgroundColor,
                    child: Icon(
                      FluentIcons.heart_pulse_20_regular,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        const Text('Thinking...'),
                        const SizedBox(width: 8),
                        SizedBox(
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
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type your message...'.tr,
                          hintStyle: TextStyle(color: Colors.grey[500]),
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
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () => _handleSubmit(_messageController.text),
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
