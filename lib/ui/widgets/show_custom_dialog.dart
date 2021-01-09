import 'package:flutter/material.dart';

void showCustomDialog(BuildContext ctx, String title, String description) {
  showDialog(
    context: ctx,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        FlatButton(
          child: Text('Ok'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    ),
  );
}
