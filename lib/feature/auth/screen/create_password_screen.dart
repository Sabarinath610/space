import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:space/core/custom_widget/space_button.dart';
import 'package:space/core/custom_widget/space_text.dart';
import 'package:space/core/custom_widget/space_text_field.dart';

import 'package:space/core/router/router_name.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

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
              customText("Create Password",
                  fontSize: 18,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 30),

            
              /// Password Field
              const SpaceTextField(hintText: "Password", obscureText: true),

              const SizedBox(height: 20),

              /// Next Button
              SpaceButton(
                text: "Next",
                onPressed: () {
                  context.pushNamed(RouteNames.EnterOtpScreen); // navigate further
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
