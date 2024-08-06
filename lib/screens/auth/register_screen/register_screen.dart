import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/bloc/register_bloc/register_bloc.dart';
import 'package:wallet/screens/auth/widget/password_textfield.dart';
import 'package:wallet/screens/auth/widget/text_field_item.dart';
import 'package:wallet/screens/widget/global_button.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController password = TextEditingController();
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Log In",
                  style: AppTextStyle.montserratSemiBold,
                ),
              ),
            ),
            Text(
              "Register !",
              style: AppTextStyle.montserratBlack
                  .copyWith(color: AppColors.appMainColor, fontSize: 40),
            ),
            const SizedBox(height: 60),
            TextFieldItem(controller: name, hintText: "Name"),
            const SizedBox(height: 20),
            TextFieldItem(controller: surname, hintText: "Surname"),
            const SizedBox(height: 20),
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
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context , state){
                if(state is RegisterSuccess){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.appMainColor,
                      content: Text('Login with Username' , style: AppTextStyle.montserratBlack.copyWith(
                          color : Colors.white
                      ),),
                    ),
                  );
                  Navigator.pop(context);
                }
                else if(state is RegisterFailure){
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
                if(state is RegisterLoading){
                  GlobalButton(
                    text: "Loading...",
                    onTap: (){},
                  );
                }
                if(state is RegisterInitial){
                  return GlobalButton(
                    text: "Register",
                    onTap: () {
                      if(password.text.length < 8 || username.text.isEmpty || name.text.isEmpty || surname.text.isEmpty){
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
                        context.read<RegisterBloc>().add(
                            RegisterUserEvent(username: username.text, password: password.text, name: name.text, surname: surname.text)
                        );
                      }
                    },
                  );
                }
                else{
                  return GlobalButton(
                    text: "LogIn",
                    onTap: (){
                      if(password.text.length < 8 || username.text.isEmpty || name.text.isEmpty || surname.text.isEmpty){
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
                        context.read<RegisterBloc>().add(
                            RegisterUserEvent(username: username.text, password: password.text, name: name.text, surname: surname.text)
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
