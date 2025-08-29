import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/core/custom_widget/space_text.dart';
import 'package:space/core/extensions/widget_extensions.dart';
import 'package:space/core/router/router_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF1E1E1E), // Background color
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                "assets/images/space_log.png",
                height: 200,
                width: 333,
              ),

              // SvgPicture.asset(
              //   "assets/images/app_logo.svg",
              //   width: 150,
              //   height: 150,
              // ),
              20.h,
              customText(
                "SPACE",
                fontSize: 30,
                // textColor: AppColors.primaryColor,
                 textColor: Colors.amber,
                fontWeight:FontWeight.bold,
                letterSpacing: 3,
              ),

              // // App Name
              // const Text(
              //   "SPACE",
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.amber,
              //     letterSpacing: 3,
              //   ),
              // ),

              const SizedBox(height: 214),

              // Get Started Button
              SizedBox(
                width: 300,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to next screen

                   context.pushNamed(RouteNames.LoginScreen);
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
