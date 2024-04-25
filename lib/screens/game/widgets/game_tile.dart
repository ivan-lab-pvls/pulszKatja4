import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/dialog_container.dart';

class GameTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;
  final void Function()? onTap;

  const GameTile({super.key, required this.iconPath, required this.title, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DialogContainer(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(iconPath),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
