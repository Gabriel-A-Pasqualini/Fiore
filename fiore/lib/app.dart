import 'package:fiore/core/theme/app_colors.dart';
import 'package:fiore/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FioreApp extends StatelessWidget {
  const FioreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fiore',

          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.background,

            textTheme: GoogleFonts.poppinsTextTheme(),

            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              surface: AppColors.background, // background está depreciado
            ),
          ),

          home: const HomePage(),
        );
      },
    );
  }
}
