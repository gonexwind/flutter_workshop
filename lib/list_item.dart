import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  ListItem(this.borderColor, this.title, this.badge);

  MaterialColor borderColor;
  String title;
  String badge;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 10,
              color: borderColor,
            ),
            SizedBox(width: 8),
            // Tambah Logo Tim
            CircleAvatar(
              backgroundImage: NetworkImage(badge),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
