import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/return_to_appbar.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/models/forum_blog_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class ForumDescriptionScreen extends StatefulWidget {
  final ForumBlogModel blog;

  const ForumDescriptionScreen({
    super.key,
    required this.blog,
  });

  @override
  State<ForumDescriptionScreen> createState() => _ForumDescriptionScreenState();
}

class _ForumDescriptionScreenState extends State<ForumDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ReturnToAppbar(
          title: 'Blog Post',
          onTap: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: widget.blog.title.contains("Breaking")
                      ? Colors.purple[100]
                      : widget.blog.title.contains("PCOS")
                          ? Colors.blue[100]
                          : widget.blog.title.contains("Sustainable")
                              ? Colors.green[100]
                              : widget.blog.title.contains("Exercise")
                                  ? Colors.orange[100]
                                  : Colors.pink[100],
                  child: Icon(
                    widget.blog.title.contains("Breaking")
                        ? Icons.chat_bubble_outline
                        : widget.blog.title.contains("PCOS")
                            ? Icons.favorite_outline
                            : widget.blog.title.contains("Sustainable")
                                ? Icons.eco_outlined
                                : widget.blog.title.contains("Exercise")
                                    ? Icons.fitness_center
                                    : Icons.medical_services_outlined,
                    color: widget.blog.title.contains("Breaking")
                        ? Colors.purple
                        : widget.blog.title.contains("PCOS")
                            ? Colors.blue
                            : widget.blog.title.contains("Sustainable")
                                ? Colors.green
                                : widget.blog.title.contains("Exercise")
                                    ? Colors.orange
                                    : Colors.pink,
                    size:
                        28, // Slightly larger icon since this is the detail view
                  ),
                  radius: 24,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.blog.authorName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      timeago.format(widget.blog.datePosted),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              widget.blog.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.blog.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 24),
            Text(
              widget.blog.content,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
            SizedBox(height: 24),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.favorite_border, size: 24, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    '${widget.blog.likes}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 24),
                  Icon(Icons.chat_bubble_outline, size: 24, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    '${widget.blog.comments}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
