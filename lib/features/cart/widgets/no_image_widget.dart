import 'package:bozorlik/common/values/app_assets.dart';
import 'package:flutter/cupertino.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: CupertinoColors.systemGroupedBackground),
      child: Center(
        child: Image.asset(AppImages.box, height: height / 2, width: width / 2),
      ),
    );
  }
}
