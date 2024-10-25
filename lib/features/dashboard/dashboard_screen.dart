import 'package:feature_first/common/widgets/app_bars/dashboard_appbar.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/admin/admin_booking_list.dart';
import 'package:feature_first/features/admin/book_services/mechanic_list_screen.dart';
import 'package:feature_first/features/authentications/presentation/user_profile.dart/user_profile.dart';
import 'package:feature_first/features/mechanic/mechanic_job_list.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authenticationState = ref.watch(authenticationProvider);
    final authenticationCtrl = ref.read(authenticationProvider.notifier);
    final selectedIndex = useState<int>(0);

    void onItemTapped(int index) {
      selectedIndex.value = index;
    }

    final List<Widget> navigationScreen = [
      Visibility(
        visible: authenticationState.userModel?.userType == "Admin",
        replacement: const MechanicJobList(),
        child: const AdminBookingList(),
      ),
      const UserProfile()
    ];

    useEffect((){
      Future.microtask(()=> authenticationCtrl.setUserData());
      return null;
    },[]);

    return Scaffold(
      appBar: selectedIndex.value == 0 ?const DashboardAppBar() : null,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding6,
          child: navigationScreen[selectedIndex.value],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalates.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: radiusCircle),
        onPressed: (){
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (context, animation, secondaryAnimation) => const MechanicListScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: ColorPalates.defaultWhite,
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 40.h,
        elevation: 10,
        shadowColor: ColorPalates.customGrey,
        color: ColorPalates.defaultWhite,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 25.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              MaterialButton(
                minWidth: 40.w,
                shape: RoundedRectangleBorder(borderRadius: radiusCircle),
                onPressed: ()=> onItemTapped(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.dashboard_rounded,
                      color: selectedIndex.value == 0
                          ? ColorPalates.primaryColor
                          : ColorPalates.customGrey,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        color: selectedIndex.value == 0
                            ? ColorPalates.primaryColor
                            : ColorPalates.customGrey,
                      ),
                    ),
                  ],
                ),
              ),

              MaterialButton(
                minWidth: 40.w,
                shape: RoundedRectangleBorder(borderRadius: radiusCircle),
                onPressed: ()=> onItemTapped(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle_rounded,
                      color: selectedIndex.value == 1
                          ? ColorPalates.primaryColor
                          : ColorPalates.customGrey,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                        color: selectedIndex.value == 1
                            ? ColorPalates.primaryColor
                            : ColorPalates.customGrey,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
