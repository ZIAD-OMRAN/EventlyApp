import 'package:flutter/material.dart';

class SnackBarHelper {
 static ShowSnakbarEROOR(BuildContext context, String errormasseage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          spacing: 20,
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            Text(
              errormasseage,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

 static ShowSnakbarsucsess(BuildContext context, String masseage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          spacing: 20,
          children: [
            Icon(Icons.done, color: Colors.white),
            Text(
              masseage,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
