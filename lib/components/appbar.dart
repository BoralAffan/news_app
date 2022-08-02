import 'package:flutter/material.dart';

class appbar extends StatelessWidget  {
 // const appbar({Key? key})super(key: key);

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
