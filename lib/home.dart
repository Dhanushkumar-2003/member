import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projrct1/member_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void toggleSwitch(bool value) {
    if (on == false) {
      setState(() {
        on = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        on = false;
      });
      print('Switch Button is OFF');
    }
  }

  TextEditingController sc = TextEditingController();

  bool add = false;
  bool on = false;
  bool readMore = false;
  // List<String> _allItems() {
  //   return [
  //     'Apple',
  //     'Banana',
  //     'Cherry',
  //     'Date',
  //     'Elderberry',
  //     'Fig',
  //     'Grape',
  //     'Honeydew',
  //   ];
  // }

  List<String> searchResults = [];
  final List members = [
    {
      "name": "Yashika",
      "image": "http://sms.jpg",
      "age": 23,
      "isFollowing": true,
      "id": 0
    },
    {
      "name": "lavanya",
      "image": "http://sms.jpg",
      "age": 20,
      "isFollowing": false,
      "id": 1
    },
    {
      "name": "saranya",
      "image": "http://sms.jpg",
      "age": 20,
      "isFollowing": true,
      "id": 2
    },
    {
      "name": "yasodiya",
      "image": "http://sms.jpg",
      "age": 40,
      "isFollowing": false,
      "id": 3
    },
    {
      "name": "kaviya",
      "image": "http://sms.jpg",
      "age": 40,
      "isFollowing": false,
      "id": 4
    },
    {
      "name": "priya",
      "image": "http://sms.jpg",
      "age": 50,
      "isFollowing": false,
      "id": 5
    },
    {
      "name": "ram",
      "image": "http://sms.jpg",
      "age": 40,
      "isFollowing": false,
      "id": 6
    }
  ];
  List<Member> member_response = [];

  List<String> allItems = [
    "yashika",
    "ashika",
    "priya",
    "akasha",
    "ram",
    "dhanush",
    "dk",
    "yathesh",
  ];

  // void onQueryChanged(String query) {
  //   setState(() {
  //     searchResults = _allItems()
  //         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }
  List<Member> filteredItems() {
    if (searchQuery.isEmpty) {
      return member_response;
    } else {
      return member_response
          .where((item) => item.name
              .toLowerCase()
              .trim()
              .contains(searchQuery.toLowerCase()))
          .toList();
    }
    ;
  }

  bool of = false;
  String searchQuery = "";
  String text =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  void initState() {
    // TODO: implement initState
    member_response = memberfromjson(jsonEncode(members));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          // title: Container(
          //     // padding: EdgeInsets.only(bottom: 40),
          //     // margin: EdgeInsets.only(top: 50),
          //     color: Color.fromRGBO(195, 36, 34, 1),
          //     height: 80,
          //     width: double.infinity,
          //     child: ListTile(
          //       title: Text("The weeknd",
          //           style: TextStyle(
          //             color: Colors.white,
          //           )),
          //       trailing: Container(
          //           // padding: EdgeInsets.only(top: 25),
          //           child: Image(image: AssetImage("images/s.png"))),
          //       subtitle: Text(
          //         "Community .+11k Members",
          //         style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 10,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     )
          //     // height: 100,
          //     // width,
          //     // color: Colors.red,
          //     // child:
          //     ),
          leadingWidth: 13,
          toolbarHeight: 90,
          backgroundColor: Color.fromRGBO(195, 36, 34, 5),
          pinned: true,
          floating: false,
          // snap: false,
          expandedHeight: 350,
          flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(bottom: 1),
              title: Container(

                  // padding: EdgeInsets.only(bottom: 40),
                  // margin: EdgeInsets.only(top: 50),
                  color: Color.fromRGBO(195, 36, 34, 1),
                  height: 80,
                  width: double.infinity,
                  child: ListTile(
                    title: Text("The weeknd",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    trailing: Container(
                        // padding: EdgeInsets.only(top: 25),
                        child: Image(image: AssetImage("images/s.png"))),
                    subtitle: Text(
                      "Community .+11k Members",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                  // height: 100,
                  // width,
                  // color: Colors.red,
                  // child:
                  ),
              background: Image(
                image: AssetImage("images/image 121.png"),
                fit: BoxFit.cover,
                // height: double.infinity,
                // width: double.infinity,
              )),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => Container(
                  // scrollDirection: Axis.vertical,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 27,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 5),
                          child: Text(
                            text,
                            style: TextStyle(fontSize: 16),
                            maxLines: readMore ? 15 : 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.all(6),
                          child: GestureDetector(
                            child: Text(
                              readMore ? "Read less" : "Read more",
                              style: TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              setState(() {
                                readMore = !readMore;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(239, 69, 111, 1),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "outdoor",
                                    style: TextStyle(
                                      color: Color.fromRGBO(239, 69, 111, 1),
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(239, 69, 111, 1),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "outdoor",
                                    style: TextStyle(
                                      color: Color.fromRGBO(239, 69, 111, 1),
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(239, 69, 111, 1),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "outdoor",
                                    style: TextStyle(
                                      color: Color.fromRGBO(239, 69, 111, 1),
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(239, 69, 111, 1),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "outdoor",
                                    style: TextStyle(
                                      color: Color.fromRGBO(239, 69, 111, 1),
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Media,doc and links",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 600,
                          child: Container(
                            margin: EdgeInsets.only(left: 15, right: 5),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 15,
                              itemBuilder: (BuildContext context, int index) =>
                                  Card(
                                child: Center(
                                    child: Image(
                                  image: AssetImage("images/image 121.png"),
                                )),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "mute notification",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Container(
                                  child: Switch(
                                      inactiveTrackColor: Colors.white,
                                      value: on,
                                      onChanged: toggleSwitch))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Image(image: AssetImage("images/trash.png")),
                              SizedBox(
                                width: 7,
                              ),
                              Text("clear chat",
                                  style: TextStyle(fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Image(image: AssetImage("images/Group.png")),
                              SizedBox(
                                width: 17,
                              ),
                              Text(
                                "Encription",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 11),
                          child: Row(
                            children: [
                              Image(image: AssetImage("images/logout.png")),
                              SizedBox(
                                width: 17,
                              ),
                              Text(
                                "Exit community",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(255, 48, 64, 1)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              Image(image: AssetImage("images/dislike.png")),
                              SizedBox(
                                width: 17,
                              ),
                              Text(
                                "Report",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(255, 48, 64, 1)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Member",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  // Container(
                                  //   width: 200,
                                  //   height: 100,
                                  //   child: TextField(
                                  //     controller: sc,
                                  //     decoration: InputDecoration(
                                  //       labelText: "Search",
                                  //       border: OutlineInputBorder(),
                                  //     ),
                                  //     onChanged: (value) {
                                  //       setState(() {
                                  //         searchQuery = value;
                                  //       });
                                  //     },
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   width: 200,
                                  //   height: 200,
                                  //   child: Container(
                                  //     child: ListView.builder(
                                  //       itemCount: filteredItems(searchQuery).length,
                                  //       itemBuilder: (context, index) {
                                  //         return ListTile(
                                  //           title: Text(filteredItems(searchQuery)[index]),
                                  //         );
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),

                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          of = !of;
                                        });
                                      },
                                      child: of == false
                                          ? IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  of = !of;
                                                });
                                              },
                                              icon: Icon(Icons.search))
                                          : SizedBox(
                                              // color: Colors.black,
                                              width: 250,
                                              height: 50,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 200,
                                                      height: 50,
                                                      child: TextFormField(
                                                        controller: sc,
                                                        decoration:
                                                            new InputDecoration(
                                                                filled: true,
                                                                fillColor: Color
                                                                    .fromRGBO(
                                                                        233,
                                                                        233,
                                                                        235,
                                                                        1),
                                                                hintText:
                                                                    'search member',
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            14.0,
                                                                        bottom:
                                                                            8.0,
                                                                        top:
                                                                            8.0),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      new BorderSide(
                                                                          color:
                                                                              Colors.white),
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(
                                                                          25.7),
                                                                ),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      new BorderSide(
                                                                          color:
                                                                              Colors.white),
                                                                  borderRadius:
                                                                      new BorderRadius
                                                                          .circular(
                                                                          25.7),
                                                                )),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            searchQuery = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        sc.text = "";
                                                      },
                                                      child: Text(
                                                        "cancel",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ]),
                                            )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 500,
                            width: 600,
                            child: Container(
                              margin: EdgeInsets.only(left: 15, right: 5),
                              child: ListView.builder(
                                // shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: filteredItems()
                                    .length, //member_response.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/image 110.png"),
                                  ),
                                  title: Text(
                                    member_response[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  subtitle: Text(
                                      "${member_response[index].age.toString()},India"),
                                  trailing: GestureDetector(
                                    child: Container(
                                        width: 110,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(239, 69, 111, 1),
                                          // color: Color.fromRGBO(239, 69, 111, 1),
                                          // border: Border.all(
                                          //   color: Color.fromRGBO(239, 69, 111, 1),
                                          //   width: 2,
                                          // ),
                                          borderRadius:
                                              BorderRadius.circular(115),
                                        ),
                                        child: member_response[index]
                                                    .isFollowing ==
                                                true
                                            ? ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    member_response[index]
                                                            .isFollowing =
                                                        !member_response[index]
                                                            .isFollowing;
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          239, 69, 111, 1),
                                                ),
                                                child: Text(
                                                  "Add",
                                                  style: const TextStyle(
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            239, 69, 111, 1),
                                                    color: Colors.white,
                                                  ),
                                                )
                                                // Container(
                                                //     // width: 200,
                                                //     child: Text(
                                                //       "following",
                                                //       style: TextStyle(
                                                //         backgroundColor: Color.fromRGBO(
                                                //             170, 171, 171, 1),
                                                //         color: Colors.white,
                                                //       ),
                                                //     ),
                                                //   )):,
                                                )
                                            : ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    member_response[index]
                                                            .isFollowing =
                                                        !member_response[index]
                                                            .isFollowing;
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          170, 171, 171, 1),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "following",
                                                    style: const TextStyle(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              170, 171, 171, 1),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ))

                                        // width: 100,
                                        // height: 30,
                                        // color: Colors.red,
                                        // decoration: BoxDecoration(
                                        //   // color: Color.fromRGBO(239, 69, 111, 1),
                                        // border: Border.all(
                                        //   color: Color.fromRGBO(239, 69, 111, 1),
                                        //   width: 2,
                                        // ),
                                        // borderRadius: BorderRadius.circular(115),
                                        ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ))),
      ]),
    );
  }
}
