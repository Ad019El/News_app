import 'package:flutter/material.dart';
import 'package:new_app/widgets/shimmer/shimmer_card.dart';
import 'package:shimmer/shimmer.dart';

// shimmer loading for general view
class Shimmer_loading_general_view extends StatelessWidget {
  const Shimmer_loading_general_view({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // height: 300,
        ListView(
          children: [
            ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 300.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                      child: ShimmerCard(),
                    ),
                  );
                }),
            SizedBox(height: 25),
            ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 135.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                      child: ShimmerCard(),
                    ),
                  );
                }),
          ],
        ),
      ],
    );
  }
}

class Shimmer_loaging_secondary_card extends StatelessWidget {
  const Shimmer_loaging_secondary_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // height: 300,
        ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, int index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 135.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                  child: ShimmerCard(),
                ),
              );
            }),
      ],
    );
  }
}


// Sta Shimmer_loaging_secondary_card() {
//   return Stack(children: [
//     Expanded(
//         // height: 300,
//         child: ListView.builder(
//             itemCount: 10,
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             physics: BouncingScrollPhysics(),
//             // physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, int index) {
//               return InkWell(
//                 onTap: () {},
//                 child: Container(
//                   width: double.infinity,
//                   height: 140.0,
//                   margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
//                   child: ShimmerCard(),
//                 ),
//               );
//             }))
//   ]);
// }
