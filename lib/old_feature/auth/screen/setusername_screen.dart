import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../old_core/custom_widget/space_button.dart';
import '../../../old_core/custom_widget/space_text_field.dart';
import '../../../old_core/router/router_name.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({super.key});

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
                "Set your Username",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 30),

              /// Password Field
              const SpaceTextField(hintText: "Username", obscureText: true),

              /// Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.pushNamed(RouteNames.CreatePasswordScreen);
                  },
                  child: const Text(
                    "Check Availability",
                    style: TextStyle(color: Colors.amber, fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Next Button
              SpaceButton(
                text: "Next",
                onPressed: () {
                  context.pushNamed(
                    RouteNames.CreatePasswordScreen,
                  ); // navigate further
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
