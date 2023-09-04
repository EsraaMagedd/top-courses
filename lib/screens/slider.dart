
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Start.dart';

class slider extends StatefulWidget {
  const slider({Key? key}) : super(key: key);

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  final controller = LiquidController();
  PageController _controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
              enableLoop: false,
              liquidController: controller,
              onPageChangeCallback: (index) => setState(() {
                currentPage = index;
              }),
              pages: [
                buildPage(
                    controller: _controller,
                    Color(0xfff9ece3)!,
                    [
                      'welcome to',
                      'Top ',
                      'Courses',
                      'help you explore courses with different categories...',
                    ],
                    'assets/images/online.json'),
                buildPage(
                    controller: _controller,
                    Colors.grey[200]!,
                    [
                      '',
                      'Top',
                      'Courses ',
                      'You will be able to search courses and get all needed details'
                    ],
                    'assets/images/business.json'),
                buildPage(
                    controller: _controller,
                    Color(0xffdcf5ff)!,
                    [
                      '',
                      'Top',
                      'Courses ',
                      'Ability to save your courses and contact with providers with special offers'
                    ],
                    'assets/images/marketing.json'),
              ]),
          Positioned(
            bottom: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: CustomizableEffect(
                          dotDecoration: DotDecoration(
                              height: 5,
                              width: 30,
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(2)),
                          activeDotDecoration: DotDecoration(
                              height: 5,
                              width: 50,
                              color: Color(0xff4ac5fd),
                              borderRadius: BorderRadius.circular(2)))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildPage(Color color, List<String> texts, String animationJson,
      {required PageController controller}) {
    controller:
    _controller;
    return Container(
      color: color,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              animationJson,
              width: 450,
              height: 400,
              fit: BoxFit.fill,
            ),
            RichText(
                text: TextSpan(
                  text: texts[0],
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey[800],
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Row(
              children: [
                RichText(
                    text: TextSpan(
                      text: texts[1],
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff0497f5),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                RichText(
                    text: TextSpan(
                      text: texts[2],
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff4ac5fd),
                        //   fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(
                  text: texts[3],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                )),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (context) => Start()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Color(0xff0497f5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}