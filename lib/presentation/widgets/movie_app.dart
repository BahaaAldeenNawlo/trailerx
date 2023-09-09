import 'package:flutter/material.dart';

import '../../common/screenutil/screenutil.dart';
import '../../di/get_it.dart';
import '../../domain/entities/no_params.dart';
import '../../domain/usecases/get_trending.dart';
import '../journeys/home/home_screen.dart';
import '../themes/theme_color.dart';
import '../themes/theme_text.dart';

class MovieApp extends StatelessWidget {
  final getTranding;
  const MovieApp({super.key, required this.getTranding});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trailex',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(
        getTranding: getItInstance.get<GetTrending>()(NoParams()),
      ),
    );
  }
}
