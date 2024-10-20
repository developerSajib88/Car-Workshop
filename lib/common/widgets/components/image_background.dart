import 'package:feature_first/utils/utils.dart';
import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  final Widget? child;
  const ImageBackground({
    super.key,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [

          Image.asset(
            "assets/images/car_servicing.jpg",
            width: 1.sw,
            height: 1.sh,
            fit: BoxFit.cover,
          ),

          Container(
            width: 1.sw,
            height: 1.sh,
            color: Colors.white.withOpacity(0.9),
            padding: padding12,
            child: child,
          ),
        ],
      ),
    );
  }
}
