import 'package:feature_first/common/widgets/buttons/widget_bounce.dart';
import 'package:feature_first/common/widgets/components/item_view/mechanic_item_view.dart';
import 'package:feature_first/core/dependency_injection/dependency_injection.dart';
import 'package:feature_first/features/admin/book_services/book_service_screen.dart';
import 'package:feature_first/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MechanicListScreen extends HookConsumerWidget {
  const MechanicListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final adminState = ref.watch(adminProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalates.primaryColor,
        leading: BackButton(
          color: ColorPalates.defaultWhite,
        ),
        title: Text(
          "Assign Mechanic",
          style: CustomTextStyles.primaryTextStyles.copyWith(
            color: ColorPalates.defaultWhite
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: paddingH4,
        child: Column(
          children: [

            Expanded(
                child: Skeletonizer(
                  enabled: adminState.isLoading,
                  child: ListView.builder(
                      itemCount: adminState.mechanicList?.length,
                      itemBuilder: (context,index){
                        return WidgetBounce(
                            onPressed: ()=> Navigator.push(context,CupertinoPageRoute(builder: (context)=> const BookServiceScreen())),
                            child: MechanicItemView(
                                mechanicId: adminState.mechanicList?[index]?.userId ?? 0000,
                                mechanicName: adminState.mechanicList?[index]?.name ?? "",
                                email: adminState.mechanicList?[index]?.email ?? "",
                            )
                        );
                      }
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}
