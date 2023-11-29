import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Behaviour chip
class BehaviourChip extends StatelessWidget {
  const BehaviourChip({super.key, required this.isNaughty});

  final bool isNaughty;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(isNaughty ? 'Naughty' : 'Nice'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      backgroundColor: Colors.red.shade300.withOpacity(0.3),
    );
  }
}
