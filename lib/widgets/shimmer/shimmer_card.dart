import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey.shade300,
      baseColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.amber,
        ),
      ),
    );
  }
}
