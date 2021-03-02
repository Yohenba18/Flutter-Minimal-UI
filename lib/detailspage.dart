import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage({this.foodName, this.foodPrice, this.heroTag});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          //leading is used when a widget is used as a navigator tool to navigate in the app
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent, //produces no color
        elevation: 0,
        title: Text(
          'Details',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            //it is mainly use to stack multiple widgets ob top of each other
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height -
                    82.0, //it decides the hight of the container with respect to the screen
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                //this controls the position of the widgets(child) in the stack
                top: 75,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top:
                    20, //this two statement decides the position of the image wirth respect to the entire screen
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 25,
                right: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.foodName,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.foodPrice,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 25,
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        Container(
                          width: 125,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Color(0xFF7A9BEE),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    color: Color(0xFF7A9BEE),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFF7A9BEE),
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis
                            .horizontal, //allows to  scrool horizontally in a list
                        children: <Widget>[
                          _buildInfoCard('WEIGHT', '300', 'G'),
                          SizedBox(
                            width: 10,
                          ),
                          _buildInfoCard('CALORIES', '277', 'CAL'),
                          SizedBox(
                            width: 10,
                          ),
                          _buildInfoCard('VITAMINS', 'A,B6', 'VIT'),
                          SizedBox(
                            width: 10,
                          ),
                          _buildInfoCard('AVAIL', 'NO', 'AV'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0)),
                            color: Colors.black),
                        height: 50,
                        child: Center(
                          child: Text(
                            '\$52.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: cardTitle == selectedCard
                ? Colors.transparent
                : Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 0.75,
          ),
        ),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8, left: 15),
              child: Text(
                cardTitle,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: cardTitle == selectedCard
                      ? Colors.white
                      : Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: cardTitle == selectedCard
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: cardTitle == selectedCard
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
