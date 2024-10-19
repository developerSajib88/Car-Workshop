
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:feature_first/utils/utils.dart';

class RouteErrorPage extends HookWidget {
  final GoRouterState state;
  const RouteErrorPage({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        //color Changed Here
        title: Text(
          "Something went wrong!",
          style: CustomTextStyles.primaryTextStylesBold
              .copyWith(color: Colors.white),
        ),

        leading: null,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainCenter,
          children: [
            Center(
              child: Padding(
                padding: padding20,
                child: Text(
                  'Error log: ${state.error.toString()}',
                  //style: CustomTextStyles.primaryTextStyles,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}