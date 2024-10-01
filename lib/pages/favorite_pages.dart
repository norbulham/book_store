import 'package:book_store_managestate/constant.dart';
import 'package:book_store_managestate/manage_states.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';


class Favorite extends StatelessWidget {
  const Favorite ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Favorites", style: myStyle( 25,Colors.white),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white,size: 27
          ),
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.fav.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.29,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(19),bottomLeft: Radius.circular(19)),
                                      color: Colors.red,
                                      image: DecorationImage(image: AssetImage("${ms.fav[index].imgURL}"), fit: BoxFit.cover)),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.29,
                                  width: MediaQuery.of(context).size.width * 0.57,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${ms.fav[index].name}", style: myStyle(20, Colors.black,FontWeight.bold),),
                                        Gap(10),
                                        Text("${ms.fav[index].author}", style: myStyle(18, Colors.black,),),
                                        Gap(10),
                                        Text("${ms.fav[index].publishDate}", style: myStyle(18, Colors.black),),
                                        Gap(10),
                                        Text("\$${ms.fav[index].price}", style: myStyle(18, Colors.black,FontWeight.bold),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                ms.deleteFav(ms.fav[index]);
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                size: 30,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        )
    );
  }
}



