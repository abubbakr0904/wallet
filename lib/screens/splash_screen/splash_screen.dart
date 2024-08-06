import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/data/local/storage_repository.dart';
import 'package:wallet/screens/auth/login_screen/login_screen.dart';
import 'package:wallet/screens/tab_box/tab_box.dart';
import 'package:wallet/utils/colors/app_colors.dart';
import 'package:wallet/utils/styles/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init()async{
    await Future.delayed(const Duration(seconds: 3));
    String a = StorageRepository.getString("new_user");
    if(a.isNotEmpty){
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=> const LoginScreen()), (route)=> false);
    }
    else{
      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=> const LoginScreen()), (route) => false);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wallet,
                color : AppColors.appMainColor,
                size: 100,
              ),
              const SizedBox(height: 20,),
              Text("Wallet app" , style: AppTextStyle.montserratBlack.copyWith(
                color : AppColors.appMainColor,
                fontSize: 50
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
