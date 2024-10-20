import 'package:feature_first/common/widgets/components/item_view/mechanic_job_item_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MechanicJobList extends HookConsumerWidget {
  const MechanicJobList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index)=> const MechanicJobItemView()
    );
  }
}
