import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/components/item_view/mechanic_job_item_view.dart';
import 'package:feature_first/common/widgets/empty_widget.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/common/booking_job_details/booking_job_details_screen.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MechanicJobList extends HookConsumerWidget {
  const MechanicJobList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mechanicState = ref.watch(mechanicProvider);

    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Skeletonizer(
        enabled: mechanicState.isLoading,
        child: Visibility(
          visible: (mechanicState.mechanicBookingJobList?.length ?? 0) > 0 && mechanicState.isLoading == false,
          replacement: const EmptyWidget(
              message: "Don't have here to your any assign booking services."
          ),
          child: ListView.builder(
              itemCount: mechanicState.mechanicBookingJobList?.length,
              itemBuilder: (context,index){
                return WidgetBounce(
                    onPressed: ()=> Navigator.push(context,CupertinoPageRoute(builder:
                        (context)=> BookingJobDetailsScreen(
                      bookingTitle: mechanicState.mechanicBookingJobList?[index].bookingTitle ?? "",
                      startDate: mechanicState.mechanicBookingJobList?[index].startDate ?? "",
                      endDate: mechanicState.mechanicBookingJobList?[index].endDate ?? "",
                      customerName: mechanicState.mechanicBookingJobList?[index].customerName ?? "",
                      customerPhone: mechanicState.mechanicBookingJobList?[index].customerPhone ?? "",
                      customerEmail: mechanicState.mechanicBookingJobList?[index].customerEmail ?? "",
                      carCompany: mechanicState.mechanicBookingJobList?[index].carCompany ?? "",
                      carModel: mechanicState.mechanicBookingJobList?[index].carModel ?? "",
                      registrationPlate: mechanicState.mechanicBookingJobList?[index].registrationPlates ?? "",
                      carYear: mechanicState.mechanicBookingJobList?[index].carYear ?? "",
                    )
                    )),

                    child: MechanicJobItemView(
                      customerName: mechanicState.mechanicBookingJobList?[index].customerName ?? "",
                      customerNumber: mechanicState.mechanicBookingJobList?[index].customerPhone ?? "",
                      startDate: mechanicState.mechanicBookingJobList?[index].startDate ?? "",
                      endDate: mechanicState.mechanicBookingJobList?[index].endDate ?? "",
                    )
                );
              }
          ),
        ),
      ),
    );
  }
}
