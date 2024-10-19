import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarWorkshop extends HookConsumerWidget {
  const CarWorkshop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(187.5,406),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) => MaterialApp.router(
        title: "Car Workshop",
        debugShowCheckedModeBanner: false,
        // theme: AppTheme.themeData,
        // themeMode: ThemeMode.light,
        // routerConfig: router,
      ),
    );
  }
}
