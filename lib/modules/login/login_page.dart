import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/buttons/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Scaffold(
          backgroundColor: AppColors.background,
          body: Container(
            width: size.width,
            height: size.height,
            child: Stack(children: [
              Container(
                width: size.width,
                height: size.height * 0.38,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [AppColors.primaryLight, AppColors.primary],
                      center: Alignment.bottomCenter,
                      focal: Alignment.bottomCenter,
                      radius: 1),
                ),
              ),
              Positioned(
                  top: size.height * 0.08,
                  // left: size.width * 0.5 - 104,
                  left: 0,
                  right: 0,
                  child: Image.asset(AppImages.person,
                      width: size.width, height: size.height * 0.46)),
              Positioned(
                  top: size.height * (0.427),
                  // left: size.width * 0.5 - 104,
                  left: 0,
                  right: 0,
                  child: Container(
                      width: size.width,
                      height: size.height * 0.113,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              // Add one stop for each color
                              // Values should increase from 0.0 to 1.0
                              stops: [
                            0.0,
                            0.5625,
                            0.7708,
                            1
                          ],
                              colors: [
                            AppColors.white0,
                            AppColors.white80,
                            AppColors.white94,
                            AppColors.white100
                          ])))),
              Positioned(
                bottom: size.height * 0.05,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.logomini),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 70, right: 70),
                      child: Text(
                        "Organize seus boletos em um lugar só",
                        textAlign: TextAlign.center,
                        style: TextStyles.titleHome,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: SocialLoginButton(
                        onTap: () {
                          controller.googleSignIn(context);
                        },
                      ),
                    )
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
