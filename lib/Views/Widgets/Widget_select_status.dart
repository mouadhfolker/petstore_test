import 'package:flutter/material.dart';
import 'package:petstore_test/Views/Home.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

bool test = true;
int indexx = 0;

class Select_status extends StatefulWidget {
  const Select_status({Key? key}) : super(key: key);

  @override
  State<Select_status> createState() => _Select_statusState();
}

class _Select_statusState extends State<Select_status> {
  Widget Function_test(int index) {
    if (indexx == index) {
      return Container(
        height: 3,
        color: Color(0xffFABB51),
        width: 70,
      );
    } else
      return Container();
  }

  final List status = [
    "pending",
    "available",
    "Sold",
  ];
  ItemScrollController _scrollController = ItemScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ScrollablePositionedList.builder(
        initialScrollIndex: indexx,
        itemScrollController: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          test = false;
                          indexx = index;

                          //     Navigator.pop(context);  // pop current page

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Home(title: "title")));

                          //    restaurantsnew.insert(0, listsearchu);
                          //   restaurantsnew.insert(1, listsearchp);
                          //   getViewhome(listsearchu:listsearchu,listsearchp:listsearchp,foodss:foodss);
                        });
                      },
                      child: Text(
                        status[index],
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontFamily: "Abel"),
                      ),
                    ),
                    test ? Container() : Function_test(index),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: status.length,
      ),
    );
  }
}
