import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<int> list;

  const HistoryScreen({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(' Hasil Penjumlahan yang termasuk bilangan prima'),
            ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Text(
                    '${list[index]}',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  );
                  // });
                }),
          ],
        ),
      ),
    );
  }
}
