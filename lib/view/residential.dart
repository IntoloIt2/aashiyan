import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/bunglow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Residential extends StatelessWidget {
  const Residential({Key? key}) : super(key: key);
  static const namedRoute = '/residential';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: buildAppbar("Residential"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildRow(),
            Container(
              width: width * 1,
              height: height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Bunglow.namedRoute);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          height: height * 1,
                          width: width * 0.5,
                          child: Image.asset("assets/images/Screen.png"),
                        ),
                        Positioned(
                          height: height * 0.32,
                          width: width * 0.32,
                          child: Center(
                              child:
                                  Image.asset("assets/images/ragrawalji.jpg")),
                        ),
                        Positioned(
                          bottom: height * 0.215,
                          child: Text(
                            "Bunglow",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.018,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        height: height * 1,
                        width: width * 0.5,
                        child: Image.asset("assets/images/Screen.png"),
                      ),
                      Positioned(
                        height: height * 0.32,
                        width: width * 0.32,
                        child: Center(
                            child: Image.asset("assets/images/ragrawalji.jpg")),
                      ),
                      Positioned(
                        bottom: height * 0.215,
                        child: Text(
                          "Houses/Duplex",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.018,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: width * 1,
              height: height * 0.04,
              margin: EdgeInsets.all(10),
              color: primaryColor,
              child: Center(
                  child: Text(
                "Prestigious",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Container(
              width: width * 1,
              child: FutureBuilder(
                  future: getPrestigious(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return CarouselSlider.builder(
                        itemCount: dataPrestigiousList.length,
                        itemBuilder: (context, i, id) {
                          return Card(
                            child: SizedBox(
                              height: height * 0.4,
                              width: width * 0.9,
                              child: Image.network(
                                imageUrl + dataPrestigiousList[i]["img_path"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 1,
                        ),
                      );
                    }
                  }),
            ),
            Container(
              width: width * 1,
              height: height * 0.04,
              margin: EdgeInsets.all(10),
              color: primaryColor,
              child: Center(
                  child: Text(
                "Recents",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Container(
              width: width * 1,
              child: FutureBuilder(
                  future: getRecent(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return CarouselSlider.builder(
                        itemCount: dataRecentList.length,
                        itemBuilder: (context, i, id) {
                          return Container(
                            height: height * 0.4,
                            width: width * 0.9,
                            child: Image.network(
                              imageUrl + dataRecentList[i]["img_path"],
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 1,
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: iconColor,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                color: iconColor,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: iconColor,
              ),
              label: ""),
        ],
      ),
    );
  }
}
