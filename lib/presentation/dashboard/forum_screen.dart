import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venille/components/appbar/titled_appbar.dart';
import 'package:venille/components/navigation/custom_side_drawer.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/core/providers/index.dart';
import 'package:venille/components/navigation/custom_bottom_navigation_bar.dart';
import 'package:venille/core/utilities/index.dart';
import 'package:venille/presentation/dashboard/subscreens/forum/forum_description_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
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
          title: 'Forum',
          scaffoldKey: scaffoldKey,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: forumBlogs.length,
        itemBuilder: (context, index) {
          final blog = forumBlogs[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => ForumDescriptionScreen(blog: blog));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: blog.title.contains("Breaking")
                              ? Colors.purple[100]
                              : blog.title.contains("PCOS")
                                  ? Colors.blue[100]
                                  : blog.title.contains("Sustainable")
                                      ? Colors.green[100]
                                      : blog.title.contains("Exercise")
                                          ? Colors.orange[100]
                                          : Colors.pink[100],
                          child: Icon(
                            blog.title.contains("Breaking")
                                ? Icons.chat_bubble_outline
                                : blog.title.contains("PCOS")
                                    ? Icons.favorite_outline
                                    : blog.title.contains("Sustainable")
                                        ? Icons.eco_outlined
                                        : blog.title.contains("Exercise")
                                            ? Icons.fitness_center
                                            : Icons.medical_services_outlined,
                            color: blog.title.contains("Breaking")
                                ? Colors.purple
                                : blog.title.contains("PCOS")
                                    ? Colors.blue
                                    : blog.title.contains("Sustainable")
                                        ? Colors.green
                                        : blog.title.contains("Exercise")
                                            ? Colors.orange
                                            : Colors.pink,
                          ),
                          radius: 20,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              blog.authorName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              timeago.format(blog.datePosted),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      blog.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      blog.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 1),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border,
                            size: 20, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          '${blog.likes}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.chat_bubble_outline,
                            size: 20, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          '${blog.comments}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
