import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBestItem extends StatelessWidget {
  const ShimmerBestItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 148, 143, 143),
      highlightColor: const Color.fromARGB(255, 221, 215, 215),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
            ),
            width: 100,
            height: 150,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 100,
                  height: 20,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 50,
                  height: 20,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
