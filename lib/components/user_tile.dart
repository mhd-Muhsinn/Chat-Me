import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  UserTile({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(
            12
          ),
          
        ),
        margin: EdgeInsets.symmetric(vertical: 4,horizontal: 21),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            //icon
            Icon(Icons.person),
            SizedBox(width: 20),
            //username
            Text(text)
          ],
        ),
      ),
    );
  }
}
