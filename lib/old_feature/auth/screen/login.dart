import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/old_core/extensions/widget_extensions.dart';

import '../../../old_core/constants/app_colors.dart';
import '../../../old_core/custom_widget/space_button.dart';
import '../../../old_core/custom_widget/space_text.dart';
import '../../../old_core/custom_widget/space_text_field.dart';
import '../../../old_core/router/router_name.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Logo
//                Image.asset(
//                 "assets/images/space_log.png",
//                 height: 200,
//                 width: 333,
//               ),

//               40.h,

//               const Text(
//                 "Login to your account",
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // Email field
//               const SpaceTextField(
//                 hintText: "Email or Phone",
//                 keyboardType: TextInputType.emailAddress,
//               ),

//               const SizedBox(height: 20),

//               // Password field
//               const SpaceTextField(
//                 hintText: "Password",
//                 obscureText: true,
//               ),

//               const SizedBox(height: 30),

//               // Login Button
//               SpaceButton(
//                 text: "Login",
//                 onPressed: () {
//                   print("Login Pressed");
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
/// ✅ Login Screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

              Image.asset(
                "assets/images/space_log.png",
                height: 200,
                width: 333,
              ),

              const SizedBox(height: 40),

              /// Title
              const Text(
                "Login to your account",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 30),

              /// Email Field
              const SpaceTextField(hintText: "Email or Phone"),

              const SizedBox(height: 16),

              /// Password Field
              const SpaceTextField(hintText: "Password", obscureText: true),

              const SizedBox(height: 8),

              /// Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.amber, fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Login Button
              SpaceButton(
                text: "Login",
                onPressed: () {
                  context.pushReplacement(RouteNames.SignUpScreen);
                  // handle login
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
                      "Or Login with",
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

              /// Sign Up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    "Don’t have an account?",
                    textColor: Colors.white54,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.SignUpScreen);
                    },
                    child: customText(
                      "Sign Up",
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
