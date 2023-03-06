import 'package:flutter/material.dart';
import 'package:payment_apps/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String Pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: selectedIndex == index
                    ? Color(0xFF1976D2)
                    : Color(0xFFB0BEC5)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/images/selected.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/images/unselected.png',
                          width: 18,
                          height: 18,
                        ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planTextStyle,
                      ),
                      Text(
                        subTitle,
                        style: descTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 91,
                  ),
                  Text(
                    Pricing,
                    style: priceTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 32.0, right: 32.0),
        child: Column(children: [
          Center(
            child: Image.asset(
              'assets/images/background.jpg',
              width: 300,
              height: 300,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Upgrade to',
                style: titleTextStyle,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                'Pro',
                style: titleProTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Go unlock all features and \nbuild your own business bigger",
            textAlign: TextAlign.center,
          ),
        ]),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(71),
                    )),
                onPressed: () {},
                child: Text(
                  'Checkout Now',
                  style: buttonTextStyle,
                )),
          )
        ],
      );
    }

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    header(),
                    option(0, 'Monthly', 'Good for starting up', '\$20'),
                    option(1, 'Quarterly', 'Focusing on building', '\$55'),
                    option(2, 'Yearly', 'Steady Company', '\$220'),
                    SizedBox(
                      height: 20,
                    ),
                    selectedIndex == -1 ? SizedBox() : checkoutButton(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
