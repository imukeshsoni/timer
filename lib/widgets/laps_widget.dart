import 'package:flutter/material.dart';

class ListLaps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.red,
      child: Expanded(
        child: Row(
          children: [
            Column(
              children: [
                Card()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
