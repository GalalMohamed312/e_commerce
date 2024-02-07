import 'package:ecommerce/core/view_model/home_view_model.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyACnpGMWfNTg_aHTEeriV1vJMOasMP6GXQ",
      appId: "1:376824988408:android:2535ca18962e1f693a710d",
      messagingSenderId: "376824988408",
      projectId: "e-comeerce-app",
    ),
  );
  Get.put(HomeViewModel());
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        Color statusBarColor = Colors.white.withOpacity(0.2);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: Binding(),
          home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                statusBarColor: statusBarColor,
                // Customize the status bar color
                // statusBarBrightness: Brightness.dark,
                statusBarIconBrightness:
                    Brightness.dark // Customize the status bar brightness
                ),
            child: LoginView(),
          ),
          theme: ThemeData(
            fontFamily: 'SourceSans',
          ),
        );
      },
    );
  }
}
