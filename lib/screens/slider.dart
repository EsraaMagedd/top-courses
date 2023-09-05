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
  final _controller = LiquidController();

  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
              enableLoop: false,
              liquidController: _controller,
              onPageChangeCallback: (index) => setState(() {
                    currentPage = index;
                  }),
              pages: [
                buildPage(
                    Color(0xffe5f1f6)!,
                    [
                      'welcome to',
                      'Top ',
                      'Courses',
                      'will help you to explore courses with different categories such as Technologies, Sciences,'
                          'Marketing, and Languages',
                    ],
                    'assets/images/online.json'),
                buildPage(

                    Colors.grey[200]!,
                    [
                      '',
                      'Top',
                      'Courses ',
                      'will help you to search courses and get all needed details'
                          'in addition to enrolling in courses and tracking your progress.'
                    ],
                    'assets/images/business.json'),
                buildPage(


                    Color(0xffdcf5ff)!,
                    [
                      '',
                      'Top',
                      'Courses ',
                      'will help you to save your courses and contact '
                          'with instructors , take assessments to measure your'
                          'learning, and earn certificates of completion for courses. '
                    ],
                    'assets/images/marketing.json'),
              ]
          ),

        ],
      ),
    );
  }

  buildPage(Color color, List<String> texts, String animationJson,
      ){
    controller:
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
            SizedBox(height: 50,),
            Lottie.asset(
              animationJson,
              width: 450,
              height: 400,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 30,),
            RichText(
                text: TextSpan(
              text: texts[0],
              style: TextStyle(
                fontSize: 40,
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
                    fontSize: 35,
                    color: Color(0xff0497f5),
                    fontWeight: FontWeight.bold,
                  ),
                )),
                RichText(
                    text: TextSpan(
                  text: texts[2],
                  style: TextStyle(
                    fontSize: 25,
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
                fontSize: 18,
                color: Colors.black54,
              ),
            )),
            SizedBox(height: 130),
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
