// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wash_wuz_app/core/utils/color_resrouces.dart';
import 'package:wash_wuz_app/core/utils/dimensions.dart';
import 'package:wash_wuz_app/core/utils/images.dart';
import 'package:wash_wuz_app/features/auth/presentation/pages/register/register.dart';
import 'package:wash_wuz_app/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:wash_wuz_app/features/home/presentation/pages/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: ColorResources.GreyBackground,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(ImagesPath.logoForLogin)),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorResources.WhiteBackground,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Spacer(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.workSans(
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                          ),
                          const CustomAuthTextField(
                            text: "Email/Username",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              label: Text(
                                "Password",
                                style: GoogleFonts.workSans(
                                  fontSize: Dimensions.fontSizeDefault,
                                ),
                              ),
                              //
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: ColorResources.GreyText,
                              ),
                              child: Text(
                                'Forgot Password?',
                                style: GoogleFonts.workSans(),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorResources.BlueButton,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Homepage()));
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.workSans(
                                  fontSize: Dimensions.fontSizeDefault,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: GoogleFonts.workSans(),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: ColorResources.BlueAuth,
                                ),
                                child: Text(
                                  'Register',
                                  style: GoogleFonts.workSans(),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()));
                                },
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
