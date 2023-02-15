import 'package:app_products/l10n/l10n.dart';
import 'package:app_products/login/widgets/auth_background.dart';
import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const name = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 250.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              child: Container(
                padding: EdgeInsets.all(20.sp),
                width: double.infinity,
                height: 300.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15.sp,
                      offset: Offset(0, 5.sp),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      context.l10n.login,
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
