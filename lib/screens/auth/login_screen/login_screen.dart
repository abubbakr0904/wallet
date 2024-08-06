import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/bloc/auth_bloc/auth_bloc.dart';
import 'package:wallet/data/local/storage_repository.dart';
import 'package:wallet/screens/auth/register_screen/register_screen.dart';
import 'package:wallet/screens/auth/widget/password_textfield.dart';
import 'package:wallet/screens/auth/widget/text_field_item.dart';
import 'package:wallet/screens/tab_box/tab_box.dart';
import 'package:wallet/screens/widget/global_button.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                child: Text(
                  "Sign up",
                  style: AppTextStyle.montserratSemiBold,
                ),
              ),
            ),
            Text(
              "Welcome \nWallet app !",
              style: AppTextStyle.montserratBlack
                  .copyWith(color: AppColors.appMainColor, fontSize: 40),
            ),
            const SizedBox(height: 60),
            TextFieldItem(controller: username, hintText: "Username"),
            const SizedBox(height: 20),
            PasswordTextFieldItem(
                controller: password,
                hintText: "Password",
                onTap: () {
                  eye = !eye;
                  setState(() {});
                },
                eye: eye),
            const Spacer(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context , state){
                if(state is AuthSuccess){
                  StorageRepository.putString("new_user","new_user");
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const TabBox()),
                          (route) => false);
                }
                else if(state is AuthFailure){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Not valid data' , style: AppTextStyle.montserratBlack.copyWith(
                          color : Colors.white
                      ),),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return GlobalButton(
                    text: "Loading...",
                    onTap: () {},
                  );
                }
                if (state is AuthInitial) {
                  return GlobalButton(
                    text: "Login",
                    onTap: () {
                      if(password.text.length < 8 || username.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Not valid password and data' , style: AppTextStyle.montserratBlack.copyWith(
                                color : Colors.white
                            ),),
                          ),
                        );
                      }
                      else{
                        context.read<AuthBloc>().add(
                            LoginRequested(username: username.text, password: password.text,)
                        );
                      }

                    },
                  );
                } else {
                  return GlobalButton(
                    text: "Login",
                    onTap: () {
                      if(password.text.length < 8 || username.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Not valid password and data' , style: AppTextStyle.montserratBlack.copyWith(
                                color : Colors.white
                            ),),
                          ),
                        );
                      }
                      else{
                        context.read<AuthBloc>().add(
                            LoginRequested(username: username.text, password: password.text,)
                        );
                      }
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
