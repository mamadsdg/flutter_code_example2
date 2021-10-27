import 'package:ex4_ui1/constants.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        title: Center(
          child: Text("Activities"),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: [
          topInformation(),
          chartImage(size),
          searchBar(size),
          items()
        ],
      ),
    );
  }

  topInformation() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, right: 10, left: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$7,520",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Text(
                      "-20% ",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    Text(
                      "than last month",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          MonthSpinner()
        ],
      ),
    );
  }

  chartImage(Size size) {
    return SizedBox(
      height: size.height*0.3,
      width: size.width,
      child: Image.asset("assets/images/chart.png"),
    );
  }

  searchBar(Size size) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: kTextColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Transaction",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                enabledBorder:InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Spacer(),
          Icon(Icons.search_sharp,color: Colors.white,)
        ],
      ),
    );
  }

  items() {
    return Column(
      children: [
        // Text("hello",style: TextStyle(color: Colors.white),)
        ItemsClass(
          pic: "assets/images/spotify.png",
          name: "Spotify",
          date: "June 10 - 12:30",
        ),
        ItemsClass(
          pic: "assets/images/netflix.png",
          name: "Netflix",
          date: "June 10 - 12:40",
        ),
        ItemsClass(
          pic: "assets/images/paypal.jpg",
          name: "Paypal",
          date: "June 10 - 12:50",
        ),
      ],
    );
  }
}

class ItemsClass extends StatelessWidget {
  final String pic, name, date, time;

  const ItemsClass({Key key, this.pic, this.name, this.date, this.time})
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

class MonthSpinner extends StatefulWidget {
  const MonthSpinner({Key key}) : super(key: key);

  @override
  _MonthSpinnerState createState() => _MonthSpinnerState();
}

class _MonthSpinnerState extends State<MonthSpinner> {
  // List<DropdownMenuItem<String>> times = ['1 month','2 months','3 months', '6 months','9 month','12 months'];
  String _choosenValue = '1 month';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: kTextColor,
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            onChanged: (String value) {
              setState(() {
                _choosenValue = value;
              });
            },
            value: _choosenValue,
            // style: TextStyle(color: Colors.red),
            dropdownColor: Colors.blue,
            focusColor: Colors.black,
            iconEnabledColor: Colors.blue,
            items: [
              '1 month',
              '2 months',
              '3 months',
              '6 months',
              '9 month',
              '12 months'
            ].map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ).toList(),
          ),
        ));
  }
}
