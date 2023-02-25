import 'package:app_products/home/views/home_page.dart';
import 'package:app_products/l10n/l10n.dart';
import 'package:app_products/login/cubit/login_cubit.dart';
import 'package:app_products/login/widgets/auth_background.dart';
import 'package:app_products/utils/validators.dart';
import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:products_ui/products_ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const name = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const ViewLogin(),
    );
  }
}

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.goNamed(HomePage.name);
        } else if (state.isFailure) {
          print('error');
        }
      },
      builder: (context, state) {
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
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Form(
                            key: formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                ProductsTextFormField(
                                  handlePassword: false,
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: context.l10n.usergmail,
                                  labelText: context.l10n.email,
                                  validator: (value) =>
                                      validateEmail(value, context),
                                ),
                                SizedBox(
                                  height: 17.sp,
                                ),
                                ProductsTextFormField(
                                  handlePassword: true,
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: '******',
                                  labelText: context.l10n.password,
                                  validator: (value) =>
                                      validatePassword(value, context),
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  disabledColor: Colors.grey,
                                  elevation: 5.sp,
                                  color: Colors.deepPurple,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 80.sp,
                                      vertical: 15.sp,
                                    ),
                                    child: Text(
                                      context.l10n.enter,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<LoginCubit>()
                                        .validForm(formKey);
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.sp,
                  ),
                  Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
