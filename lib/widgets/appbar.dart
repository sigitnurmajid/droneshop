import 'package:flutter/material.dart';

getAppBar(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu, color: Colors.grey),
        Row(
          children: const [
            Icon(Icons.search, color: Colors.grey,),
            SizedBox(width: 10,),
            Icon(Icons.filter_alt_rounded, color: Colors.grey,),
            SizedBox(width: 10,),
            Icon(Icons.notifications_active, color: Colors.grey,)
          ],
        )
      ],
    ),
  );
}