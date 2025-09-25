import 'package:flutter/material.dart';
import 'package:space/old_core/extensions/widget_extensions.dart';

import '../../../old_core/constants/app_colors.dart';
import '../../../old_core/custom_widget/space_button.dart';
import '../../../old_core/custom_widget/space_text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                height: 100,
                width: 100,
              ),

              const SizedBox(height: 40),

              /// Title
              customText(
                "Enter the OTP",
                textColor: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 30),

              /// OTP Fields (4 digits)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// Done Button
              SpaceButton(
                text: "Done",
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Wait until next screen designed 😎"),
                      duration: Duration(seconds: 2), // How long it stays
                    ),
                  );
                },
              ),

              20.h,

              /// Resend OTP option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    "Didn’t receive code?",
                    textColor: Colors.white54,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                    onPressed: () {
                      // Resend OTP logic
                    },
                    child: customText(
                      "Resend",
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
