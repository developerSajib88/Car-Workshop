import 'package:feature_first/common/widgets/buttons/primary_buttons.dart';
import 'package:feature_first/common/widgets/components/image_background.dart';
import 'package:feature_first/common/widgets/logo_widget.dart';
import 'package:feature_first/data/local_database/get_local_database.dart';
import 'package:feature_first/features/authentications/presentation/log_in/log_in_screen.dart';
import 'package:feature_first/features/dashboard/dashboard_screen.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  static String get path => "/splashScreen";
  static String get name => "splashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBackground(
          child: Column(
            crossAxisAlignment: crossCenter,
            mainAxisAlignment: mainCenter,
            children: [


              const LogoWidget(),

              gap12,

              Text(
                "Welcome to AutoCare",
                style: CustomTextStyles.titleTextStyles,
              ),

              Text(
                "Your trusted platform for car service bookings and management.",
                style: CustomTextStyles.primaryTextStyles,
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              Image.asset(
                "assets/images/red_car.png",
                width: 200.w,
              ).animate().slideX(),



              const Spacer(),

              PrimaryButton(
                  title: "Get Started",
                  onPressed: (){
                    if(GetLocalDatabase().userIsLogIn() ?? false){
                      Navigator.push(context,CupertinoPageRoute(builder: (context)=> const DashboardScreen()));
                    }else{
                      Navigator.push(context,CupertinoPageRoute(builder: (context)=> const LogInScreen()));
                    }
                  }
              ),



            ],
          )
      ),
    );
  }
}
