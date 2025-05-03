import 'package:flutter/material.dart';
import 'package:venille/core/constants/colors.dart';
import 'package:venille/components/images/cached_network_image_widget.dart';

class NetworkImageAvatar extends StatelessWidget {
  final double width;
  final double height;
  final Color borderColor;
  final double borderRadius;
  final String imageUrl;
  const NetworkImageAvatar({
    super.key,
    this.width = 50,
    this.height = 50,
    this.borderRadius = 100,
    required this.imageUrl,
    this.borderColor = AppColors.grayLightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: ClipOval(
        child: CachedNetworkImageWidget(
          imageUrl: imageUrl,
          width: double.maxFinite,
          height: double.maxFinite,
          errorAssetImage: 'assets/images/default.jpg',
        ),
      ),
    );
  }
}
