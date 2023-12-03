
import 'package:flutter/material.dart';

import '../constants/theme_data/text_styles.dart';

class NewRowTextWidget extends StatelessWidget {
  const NewRowTextWidget({
    super.key,
    required this.txt2,
    required this.icon,
  });

  final IconData icon;
  final String txt2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 12,
        ),
        Expanded(child: Text(txt2, style: MyTextStyles.userListName)),
      ],
    );
  }
}
