import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'constants/color.dart';
import 'providers/product_provider.dart';
import 'ui/pages/home/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // ✨ responsive base
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Cieluna Shop",

          theme: ThemeData(
            scaffoldBackgroundColor: background,
            fontFamily: "Poppins",
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}
