import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MechanicJobList extends HookConsumerWidget {
  const MechanicJobList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemBuilder: itemBuilder
    );
  }
}
