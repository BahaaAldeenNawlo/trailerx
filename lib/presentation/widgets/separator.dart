import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extensions.dart';
import 'package:movieapp/presentation/themes/app_color.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h as double,
      width: Sizes.dimen_80.w as double,
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h as double,
        bottom: Sizes.dimen_6.h as double,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_1.h as double),
        ),
        gradient: const LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royaBlue,
          ],
        ),
      ),
    );
  }
}
