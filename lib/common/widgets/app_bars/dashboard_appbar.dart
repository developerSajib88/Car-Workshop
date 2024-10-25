
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/data/local_database/set_local_database.dart';
import 'package:feature_first/features/authentications/presentation/log_in/log_in_screen.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final bool? showActionButton;
  final bool? isNotificationButton;
  const DashboardAppBar({
    super.key,
    this.showActionButton,
    this.isNotificationButton
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1.sw, 40.h);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authenticationState = ref.watch(authenticationProvider);


    void userLogOut(){
      SetLocalDatabase().cleanBox();
      ref.invalidate(authenticationProvider);
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> const LogInScreen()));
    }


    return Container(
      width: 1.sw,
      color: ColorPalates.primaryColor,
      padding: padding4,
      child: SafeArea(
        child: Row(
          children: [
            const CircleAvatar(
              child: Icon(Icons.account_circle_rounded),
            ),
        
            gap8,
        
            Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: mainCenter,
              children: [

                Text(
                  authenticationState.userModel?.name ?? "Sajib Hasan",
                  style: CustomTextStyles.primaryTextStylesBold.copyWith(
                      color: ColorPalates.defaultWhite
                  ),
                ),
        
                Text(
                  authenticationState.userModel?.userType ?? "Admin",
                  style: CustomTextStyles.descriptionTextStyles.copyWith(
                      color: Colors.white
                  ),
                )
        
              ],
            ),

            const Spacer(),

            IconButton(
                onPressed: ()=> userLogOut(),
                icon: Icon(Icons.logout_outlined,color: ColorPalates.defaultWhite)
            ),
        
            // SizedBox(
            //   width: 60.w,
            //   height: 22.h,
            //   child: PrimaryButton(
            //       title: "Book Now",
            //       backgroundColor: ColorPalates.defaultWhite,
            //       titleColor: ColorPalates.secondaryColor,
            //       onPressed: ()=> Navigator.push(context,CupertinoPageRoute(builder: (context)=> const MechanicListScreen()))
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}