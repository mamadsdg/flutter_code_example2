import 'dart:ui';

import 'package:ex4_ui1/ActivitysPage.dart';
import 'package:ex4_ui1/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  var context;

  // const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {},
        ),
        title: Text("Hello, Mohammad"),
        actions: [
          IconButton(
              icon: SvgPicture.asset("assets/icons/pin.svg"), onPressed: () {})
        ],
      ),
      body:
          // test()
          mainBody(size),
    );
  }

  mainBody(Size size) {
    return Stack(
      children: [
        itemPicture(size),
        mainFeature(size),
      ],
    );
  }

  itemPicture(Size size) {
    return Positioned(
      top: 30,
      right: 20,
      left: 20,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: size.height * 0.3,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //       offset: Offset(0, 10),
              //       blurRadius: 60,
              //       color: kPrimaryColor.withOpacity(0.29))
              // ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  // alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img.jpg"))),
        ),
      ),
    );
  }

  mainFeature(Size size) {
    return Positioned(
      height: size.height * 0.9,
      // width: size.width,
      top: 180,
      right: 0,
      left: 0,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        // child: Text("this is a text"),
        child: SingleChildScrollView(
          child: Column(
            children: [
              column1(),
              column2(),
              column3(),
              column4(),
              LatestTransaction()
            ],
          ),
        ),
      ),
    );
  }

  column1() {
    return Container(
      padding: EdgeInsets.only(right: 30, left: 30),
      child: Row(
        children: [
          countText("7152"),
          countText("9306"),
          countText("1599"),
          countText("4455"),
        ],
      ),
    );
  }

  test() {
    return Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/img.jpg",
              width: 400,
              height: 300,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 10,
              bottom: 150,
              left: 30,
              right: 100,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  countText(txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        txt,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  column2() {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "08/24",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "mohammad seddighy",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  column3() {
    return Container(
      margin: EdgeInsets.only(top: 80, left: 10),
      child: Row(
        children: [
          Text(
            "Send money",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  column4() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Profile(
              pic: "assets/images/p1.jpg",
            ),
            Profile(
              pic: "assets/images/p2.jpg",
              press: () {
                goActivityPage();
              },
            ),
            Profile(
              pic: "assets/images/p3.png",
            ),
            Profile(
              pic: "assets/images/p4.jpg",
            ),
          ],
        ),
      ),
    );
  }

  goActivityPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ActivitiesPage()));
  }
}

class Profile extends StatelessWidget {
  final String pic;
  final Function press;

  const Profile({Key key, this.pic, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              height: 90,
              width: 90,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(pic), fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}

class LatestTransaction extends StatefulWidget {
  const LatestTransaction({Key key}) : super(key: key);

  @override
  _LatestTransactionState createState() => _LatestTransactionState();
}

class _LatestTransactionState extends State<LatestTransaction> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      "Latest Transaction",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                    Spacer(),
                    Text(
                      "View all",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
                visible: visible,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      LastestTransaction(
                        pic: "assets/images/spotify.png",
                        name: "Spotify",
                        date: "June 10 - 12:30",
                      ),
                      LastestTransaction(
                        pic: "assets/images/netflix.png",
                        name: "Netflix",
                        date: "June 10 - 12:40",
                      ),
                      LastestTransaction(
                        pic: "assets/images/paypal.jpg",
                        name: "Netflix",
                        date: "June 10 - 12:40",
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class LastestTransaction extends StatelessWidget {
  final String pic, name, date, time;

  const LastestTransaction({Key key, this.pic, this.name, this.date, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, right: 10, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            color: kTextColor),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  color: kPrimaryColor),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  pic,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      date,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
