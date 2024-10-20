import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/components/item_view/mechanic_job_item_view.dart';
import 'package:feature_first/features/common/booking_job_details/booking_job_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MechanicJobList extends HookConsumerWidget {
  const MechanicJobList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return WidgetBounce(
              onPressed: ()=> Navigator.push(context,
                  CupertinoPageRoute(builder: (context)=> const BookingJobDetailsScreen())),
              child: const MechanicJobItemView()
          );
        }
    );
  }
}
