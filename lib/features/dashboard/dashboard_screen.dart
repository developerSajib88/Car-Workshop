import 'package:feature_first/common/widgets/app_bars/dashboard_appbar.dart';
import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/components/booking_item_view.dart';
import 'package:feature_first/features/admin/book_services/booking_details/booking_details_screen.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: padding6,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
              return WidgetBounce(
                  onPressed: ()=> Navigator.push(context,CupertinoPageRoute(builder: (context)=> const BookingDetailsScreen())),
                  child: const BookingItemView()
              );
            }
        ),
      ),
    );
  }
}
