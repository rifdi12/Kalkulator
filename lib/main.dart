import 'package:flutter/material.dart';
import 'package:kalkulator/provider/function.dart';
import 'package:kalkulator/screen/history.dart';
import 'package:kalkulator/screen/profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<Kalkulator>(create: (_) => Kalkulator()),
      ], child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<Kalkulator>(
                          builder: (context, value, _) => IconButton(
                            icon: Icon(Icons.history, size: 35),
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ChangeNotifierProvider<Kalkulator>.value(
                                          value: Kalkulator(),
                                          child: HistoryScreen(
                                            list: value.hasilPrima,
                                          )),
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Consumer<Kalkulator>(
                      builder: (context, kalkulator, _) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${kalkulator.hasil ?? ''}',
                            style: TextStyle(
                                color: Color(0xff555555), fontSize: 40),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${kalkulator.input ?? ''}',
                            style: TextStyle(
                                color: Color(0xff7d1dd6), fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<Kalkulator>(
              builder: (context, kalkulator, _) => Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            GestureDetector(
                              onTap: () {
                                kalkulator.input = null;
                              },
                              child: Text(
                                'AC',
                                style: TextStyle(
                                    color: Color(0xff7d1dd6), fontSize: 35),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (kalkulator.input.length > 0) {
                                  kalkulator.input = kalkulator.input.substring(
                                      0, kalkulator.input.length - 1);
                                }
                              },
                              child: Icon(Icons.backspace_outlined,
                                  color: Color(0xff555555), size: 35),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input != null &&
                                    kalkulator.input != '' &&
                                    kalkulator.input.substring(
                                            kalkulator.input.length - 1) !=
                                        '÷') {
                                  kalkulator.input += '÷';
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffe9e9e9)),
                                child: Text(
                                  '÷',
                                  style: TextStyle(
                                      color: Color(0xff555555), fontSize: 35),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '7';
                                } else {
                                  kalkulator.input += '7';
                                }
                              },
                              child: Text(
                                '7',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '8';
                                } else {
                                  kalkulator.input += '8';
                                }
                              },
                              child: Text(
                                '8',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '9';
                                } else {
                                  kalkulator.input += '9';
                                }
                              },
                              child: Text(
                                '9',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input != null &&
                                    kalkulator.input != '' &&
                                    kalkulator.input.substring(
                                            kalkulator.input.length - 1) !=
                                        '×') {
                                  kalkulator.input += '×';
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffe9e9e9)),
                                child: Text(
                                  '×',
                                  style: TextStyle(
                                      color: Color(0xff555555), fontSize: 35),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '4';
                                } else {
                                  kalkulator.input += '4';
                                }
                              },
                              child: Text(
                                '4',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '5';
                                } else {
                                  kalkulator.input += '5';
                                }
                              },
                              child: Text(
                                '5',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '6';
                                } else {
                                  kalkulator.input += '6';
                                }
                              },
                              child: Text(
                                '6',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input != null &&
                                    kalkulator.input != '' &&
                                    kalkulator.input.substring(
                                            kalkulator.input.length - 1) !=
                                        '-') {
                                  kalkulator.input += '-';
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffe9e9e9)),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Color(0xff555555), fontSize: 35),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '1';
                                } else {
                                  kalkulator.input += '1';
                                }
                              },
                              child: Text(
                                '1',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '2';
                                } else {
                                  kalkulator.input += '2';
                                }
                              },
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input == null) {
                                  kalkulator.input = '3';
                                } else {
                                  kalkulator.input += '3';
                                }
                              },
                              child: Text(
                                '3',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input != null &&
                                    kalkulator.input != '' &&
                                    kalkulator.input.substring(
                                            kalkulator.input.length - 1) !=
                                        '+') {
                                  kalkulator.input += '+';
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffe9e9e9)),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Color(0xff555555), fontSize: 35),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input != null) {
                                  kalkulator.input += '0';
                                } else {
                                  kalkulator.input = '0';
                                }
                              },
                              child: Text(
                                '0',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input != null) {
                                  kalkulator.input += '00';
                                }
                              },
                              child: Text(
                                '00',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (kalkulator.input != null) {
                                  kalkulator.input += '.';
                                }
                              },
                              child: Text(
                                '.',
                                style: TextStyle(
                                    color: Color(0xff555555), fontSize: 35),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print(kalkulator.hasilPrima);
                                if (kalkulator.input != null) {
                                  kalkulator.hasil = kalkulator.input;
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffe9e9e9)),
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                      color: Color(0xff555555), fontSize: 35),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
