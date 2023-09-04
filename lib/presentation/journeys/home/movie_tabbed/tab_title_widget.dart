import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extensions.dart';
import 'package:movieapp/presentation/themes/app_color.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const TabTitleWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
              color: isSelected ? AppColor.royaBlue : Colors.transparent,
              width: Sizes.dimen_1.h as double,
            ))),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context).textTheme.royalblueSubtitle1
              : Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
