import 'package:defeefront/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GallaryViewPost extends StatelessWidget {
  const GallaryViewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image(
              image: AssetImage('assets/images/dummy.png'),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "재로그",
            style: DefeeTextStyles.bodySmall,
          ),
          Text(
            "SOLID - SRP와 OCP",
            style: DefeeTextStyles.bodyLarge,
          ),
          SizedBox(height: 10),
          Divider(
            color: DefeeColors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
