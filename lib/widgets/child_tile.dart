import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:test_task_santa/data/models/child_model.dart';
import 'package:test_task_santa/widgets/behaviour_chip.dart';

/// Custom Child Tile
class ChildTile extends StatelessWidget {
  const ChildTile({
    super.key,
    required this.child,
    required this.onBehaviourTap,
  });

  final Child child;
  final VoidCallback onBehaviourTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBehaviourTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent.shade100,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${child.name}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
            Text('country: ${child.country}'),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Behaviour  '),
                  BehaviourChip(isNaughty: child.isNaughty),
                ],
              ),
            ),
          ],
        ).paddingAll(10.r),
      ),
    );
  }
}
