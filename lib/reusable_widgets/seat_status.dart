import 'package:flutter/material.dart';

import '../utlis/app_color.dart';

class SeatStatus extends StatelessWidget {
  Color color;
  String status;
  SeatStatus({Key? key, required this.status, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: [
        Icon(
          Icons.tv,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          status,
          style: TextStyle(color: AppColors.liteGreyColor, fontSize: 12),
        ),
      ],
    ));
  }
}
