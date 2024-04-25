import 'package:flutter/material.dart';
import 'package:pulsz_app/theme/colors.dart';
import 'package:pulsz_app/widgets/app_container.dart';

class GuideTile extends StatefulWidget {
  final String topic;
  final String question;
  final String titleFirst;
  final String textFirst;
  final String titleSecond;
  final String textSecond;
  final String titleThird;
  final String textThird;

  const GuideTile(
      {super.key,
      required this.topic,
      required this.question,
      required this.titleFirst,
      required this.textFirst,
      required this.titleSecond,
      required this.textSecond,
      required this.titleThird,
      required this.textThird});

  @override
  State<GuideTile> createState() => _GuideTileState();
}

class _GuideTileState extends State<GuideTile> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isOpen) {
            isOpen = false;
          } else {
            isOpen = true;
          }
        });
      },
      child: AppContainer(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.topic,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
                isOpen
                    ? Icon(
                        Icons.arrow_upward,
                        color: AppColors.white,
                      )
                    : Icon(
                        Icons.arrow_downward,
                        color: AppColors.white,
                      ),
              ],
            ),
            if (isOpen)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    widget.question,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: widget.titleFirst,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                      children: [
                        TextSpan(
                          text: widget.textFirst,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: widget.titleSecond,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                      children: [
                        TextSpan(
                          text: widget.textSecond ,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: widget.titleThird,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                      children: [
                        TextSpan(
                          text: widget.textThird,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
