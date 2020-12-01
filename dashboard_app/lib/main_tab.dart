import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dashboard_app/depenses_tab.dart';
import 'package:dashboard_app/models/ocr_view.dart';
import 'package:dashboard_app/ocr_tab.dart';
import 'package:dashboard_app/ventes_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  Color mainColor = Color.fromRGBO(236,236,236,1.0);
  Color secondColor = Color.fromRGBO(53, 46, 155,1.0);
  PageController _controller = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          physics:new NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            DepensesTab(),
            VentesTab(),
            OCRView()

          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration:BoxDecoration(
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavyBar(
          currentIndex: _currentPage,
          onItemSelected: (index) => setState(() {
            _currentPage = index;
            _controller.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          }),


          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              title: Text('Dépenses'),
              activeColor: secondColor,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.money),
                title: Text('Ventes'),
                activeColor: secondColor
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.camera),
                title: Text('Scanner Facture'),
                activeColor: secondColor
            ),
          ],
        ),
      ),

    );
  }

}