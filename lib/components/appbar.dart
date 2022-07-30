import 'package:flutter/material.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({Key? key}) :preferredSize = Size.fromHeight(50.0),super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
       elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Tech',
                style: TextStyle(
                  color: Colors.red,
                )),
            Text('News', style: TextStyle(color: Colors.black))
          ],
        ),
    );
  }
}
