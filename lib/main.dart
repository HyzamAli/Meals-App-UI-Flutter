import 'package:flutter/material.dart';
import 'package:meals_app_p3/Constants.dart';
import 'package:meals_app_p3/Meals.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        bottomNavigationBar: CustomBar(),
        body: SafeArea(child: MyApp()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: <InlineSpan>[
                      TextSpan(
                        text: 'Find your Best \n',
                        style: kGreySmall,
                      ),
                      TextSpan(
                        text: 'Nutrition Meal',
                        style: kBlackMed,
                      ),
                    ]),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'images/profile.jpg',
                      width: 50,
                      height: 50,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search Foods',
                            hintStyle: kGreySmall,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10)),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/donut.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'BAKERY',
                        style: kBlackSmall,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/milk.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'DAIRY',
                        style: kBlackSmall,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/fish.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'SEAFOODS',
                        style: kBlackSmall,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/fast-food.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'SNACKS',
                        style: kBlackSmall,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mealsList.length,
              itemBuilder: (context, index) {
                return MealsCard(mealsList[index]);
              }),
        )
      ],
    );
  }
}

class MealsCard extends StatelessWidget {
  final Meals meals;

  MealsCard(this.meals);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Container(
            width: (MediaQuery.of(context).size.width / 2) * 1.2,
            height: (MediaQuery.of(context).size.height / 2) * 0.7,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(meals.img), fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height / 2) * 0.5,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: EdgeInsets.all(10),
              width: (MediaQuery.of(context).size.width / 2),
              height: (MediaQuery.of(context).size.height / 2) * 0.33,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    meals.name,
                    style: kBlackSmall,
                  ),
                  Text(
                    meals.price,
                    style: TextStyle(color: Colors.orange, fontSize: 14),
                  ),
                  Container(
                    width: double.infinity,
                    height: 15,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          if (index < meals.rating) {
                            return Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            );
                          }
                          return Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 15,
                          );
                        }),
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: meals.tags.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red[100]),
                            child: Text(
                              meals.tags[index],
                              style: TextStyle(color: Colors.red, fontSize: 13),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomBar extends StatefulWidget {
  @override
  _CustomBarState createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('HOME'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('OFFERS'),
          icon: Icon(Icons.local_offer),
        ),
        BottomNavigationBarItem(
          title: Text('MY ORDERS'),
          icon: Icon(Icons.shopping_basket),
        ),
        BottomNavigationBarItem(
          title: Text('PROFILE'),
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
