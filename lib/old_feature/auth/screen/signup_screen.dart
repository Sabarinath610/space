import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/old_core/extensions/widget_extensions.dart';

import '../../../old_core/constants/app_colors.dart';
import '../../../old_core/custom_widget/space_button.dart';
import '../../../old_core/custom_widget/space_text.dart';
import '../../../old_core/custom_widget/space_text_field.dart';
import '../../../old_core/router/router_name.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // dark bg
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              /// Logo
              Image.asset(
                "assets/images/space_log.png",
                height: 200,
                width: 333,
              ),

              const SizedBox(height: 40),

              /// Title
              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 30),

              /// Name Field
              const SpaceTextField(hintText: "Name"),

              const SizedBox(height: 16),

              /// Email Field
              const SpaceTextField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              /// Date of Birth Field
              const SpaceTextField(
                hintText: "Date of Birth",
                keyboardType: TextInputType.datetime,
              ),

              const SizedBox(height: 8),

              /// Helper Text (below DOB)
              Align(
                alignment: Alignment.centerLeft,
                child: customText(
                  "This will not be shown publicly.",
                  textColor: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 20),

              /// Next Button
              SpaceButton(
                text: "Next",
                onPressed: () {
                  context.pushNamed(RouteNames.SetUserNameScreen);
                },
              ),

              const SizedBox(height: 30),

              /// Divider with text
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.primaryColor)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or Register with",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.primaryColor)),
                ],
              ),

              const SizedBox(height: 20),

              /// Google Button
              Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xFF1E1E1E),
                ),
                child: Center(
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/300/300221.png",
                    height: 24,
                    width: 24,
                  ),
                ),
              ),

              5.h,

              /// Already have account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    "Already have an account?",
                    textColor: Colors.white54,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.LoginScreen);
                    },
                    child: customText(
                      "Login",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.amber,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
