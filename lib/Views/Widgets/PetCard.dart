import 'package:flutter/material.dart';
import 'package:petstore_test/Models/PetModel.dart';
import 'package:petstore_test/Models/pet.api.dart';
import 'package:petstore_test/Views/Widgets/Widget_select_status.dart';

class Pet_View extends StatefulWidget {
  Pet_View({Key? key}) : super(key: key);

  static String screenroute = "Pet_View";

  @override
  _Pet_ViewState createState() => _Pet_ViewState();
}

class _Pet_ViewState extends State<Pet_View> {
  bool isLoading = false;
  bool isExpand = false;
  List<PetModel> RestauUserslist = [];
  List<PetModel> selectedProduitsList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Select_status(),
        Container(
          height: 38,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
              ),
            ],
          ),
        ),
        Container(
          //   color: Colors.amber,

          height: 137,
          child: FutureBuilder(
              future: getViewhome(
                listsearchu: listsearchu,
                listsearchp: listsearchp,
              ),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                print("objecttestttttt");
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 17,
                          bottom: 3,
                        ),
                        child: GestureDetector(
                          child: Container(
                            // color: Colors.red,
                            height: 96, // we specified before
                            width: 112,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  //   margin: EdgeInsets.only(right: 20),
                                  height: 96,
                                  width: 112,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 10),
                                    ],
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  bottom: 73,
                                  left: 27,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                      height: 60,
                                      width: 60,
                                      image: NetworkImage(
                                          snapshot.data[i]["photoUrls"]),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 2.0, right: 0),
                                    child: Text(
                                      //   restaurants[i].NomRestu.toString(),
                                      //  restaurantsnew[0][i].toString(),
                                      snapshot.requireData[i]["name"],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Abel",
                                          color: Colors.black.withOpacity(0.9)),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                      padding: EdgeInsets.only(bottom: 7.0),
                                      child: IconButton(
                                          iconSize: 20,
                                          onPressed: null,
                                          icon: Icon(
                                              Icons.favorite_border_sharp))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
}
