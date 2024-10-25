import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/components/item_view/booking_item_view.dart';
import 'package:feature_first/common/widgets/empty_widget.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/common/booking_job_details/booking_job_details_screen.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdminBookingList extends HookConsumerWidget {
  const AdminBookingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final adminState = ref.watch(adminProvider);
    final adminCtrl = ref.read(adminProvider.notifier);

    useEffect((){
      Future.microtask(()=> adminCtrl.getAdminBookingList());
      return null;
    },[]);

    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Visibility(
        visible: (adminState.adminBookingList?.length ?? 0) > 0 && adminState.isLoading == false,
        replacement: const EmptyWidget(
          message: "You don't have any booking service. Please! Book a new Service.",
        ),
        child: Skeletonizer(
          enabled: adminState.isLoading,
          child: ListView.builder(
              itemCount: adminState.adminBookingList?.length,
              itemBuilder: (context,index){
                return WidgetBounce(

                    onPressed: ()=> Navigator.push(context,CupertinoPageRoute(builder:
                        (context)=> BookingJobDetailsScreen(
                          bookingTitle: adminState.adminBookingList?[index].bookingTitle ?? "",
                          startDate: adminState.adminBookingList?[index].startDate ?? "",
                          endDate: adminState.adminBookingList?[index].endDate ?? "",
                          customerName: adminState.adminBookingList?[index].customerName ?? "",
                          customerPhone: adminState.adminBookingList?[index].customerPhone ?? "",
                          customerEmail: adminState.adminBookingList?[index].customerEmail ?? "",
                          carCompany: adminState.adminBookingList?[index].carCompany ?? "",
                          carModel: adminState.adminBookingList?[index].carModel ?? "",
                          registrationPlate: adminState.adminBookingList?[index].registrationPlates ?? "",
                          carYear: adminState.adminBookingList?[index].carYear ?? "",
                        )
                    )),

                    child: BookingItemView(
                      mechanicImage: adminState.adminBookingList?[index].mechanicImage ?? ImageConstants.mehanicImage,
                      mechanicId: (adminState.adminBookingList?[index].mechanicId ?? 0000).toString(),
                      mechanicName: adminState.adminBookingList?[index].mechanicName ?? "",
                      email: adminState.adminBookingList?[index].mechanicEmail ?? "",
                      customerName: adminState.adminBookingList?[index].customerName ?? "",
                      customerNumber: adminState.adminBookingList?[index].customerPhone ?? "",
                      startDate: adminState.adminBookingList?[index].startDate ?? "",
                      endDate: adminState.adminBookingList?[index].endDate ?? ""
                    )
                );
              }
          ),
        ),
      ),
    );
  }
}
