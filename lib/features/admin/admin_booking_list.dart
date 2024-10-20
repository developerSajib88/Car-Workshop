import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/components/item_view/booking_item_view.dart';
import 'package:feature_first/features/common/booking_job_details/booking_job_details_screen.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminBookingList extends HookConsumerWidget {
  const AdminBookingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return WidgetBounce(
                onPressed: ()=> Navigator.push(context,CupertinoPageRoute(builder: (context)=> const BookingJobDetailsScreen())),
                child: const BookingItemView()
            );
          }
      ),
    );
  }
}
