
import 'package:dashboard_app/ocr2_tab.dart';
import 'package:dashboard_app/ocr_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import controller


import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
class OCRView extends StatefulWidget  {
  @override
  _OCRViewState createState() => _OCRViewState();
}

class _OCRViewState extends State<OCRView> {

  Color mainColor = Color.fromRGBO(	211, 232, 213,1.0);
  Color secondColor = Color.fromRGBO(53, 46, 155,1.0);

  // RegisterOneView one = Get.find();

  PageController _controller = PageController(
    initialPage: 0,
  );
  String a = "Suivant" ;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void move ()
  {
    print('kmel') ;
    _controller.jumpToPage(1) ;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height*0.80,
              child: PageView(
                onPageChanged: (int index) async {
                  // Validate returns true if the form is valid, otherwise false.

                },
                controller: _controller,

                children: [
                  OCRTab(tabController:_controller),
                  OCR2TAB()
                ],
              ),
            ),
            Column(
              children: [
                Divider(
                  height: Get.height * 0.05,
                  color: Colors.white,
                ),
                SmoothPageIndicator(
                    controller: _controller,  // PageController
                    count:  2,
                    effect:  WormEffect(
                      dotColor: secondColor.withOpacity(0.3),
                      activeDotColor: secondColor,
                      paintStyle:  PaintingStyle.fill,
                    ),  // your preferred effect
                    onDotClicked: (index){
                      _controller.jumpToPage(index) ;
                    }
                )


              ],
            )

          ],
        ),
      ),
    );
  }

}