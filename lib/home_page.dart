import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List bookInfo = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/books.json").then((value) {
      bookInfo = json.decode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Book HUB",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.search,
                  size: 30,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Trending",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: bookInfo.length,
                  itemBuilder: (_, i) {
                    return Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("assets/card.jpg"),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 40,
                                  offset: Offset(8, 10),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.3),
                                ),
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(-1, -5),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.3),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                              right: 200,
                              top: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(bookInfo[i]['img']),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 100,
                            margin: EdgeInsets.only(left: 150, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bookInfo[i]['title'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  bookInfo[i]['author'],
                                  style: TextStyle(
                                    color: color.AppColor.homePagePlanColor,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Get PDF",
                                    style: TextStyle(
                                      color: color.AppColor.homePagePlanColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
