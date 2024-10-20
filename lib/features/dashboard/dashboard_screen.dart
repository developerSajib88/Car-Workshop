import 'package:feature_first/common/widgets/app_bars/dashboard_appbar.dart';
import 'package:feature_first/features/admin/admin_booking_list.dart';
import 'package:feature_first/features/mechanic/mechanic_job_list.dart';
import 'package:feature_first/utils/constants/ui_constants.dart';
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
        child: const Visibility(
          visible: true,
          replacement: MechanicJobList(),
          child: AdminBookingList(),
        ),
      ),
    );
  }
}
