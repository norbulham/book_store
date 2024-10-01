import 'package:book_store_managestate/constant.dart';
import 'package:book_store_managestate/data/book_list.dart';
import 'package:book_store_managestate/manage_states.dart';
import 'package:book_store_managestate/pages/userinfro_page.dart';
import 'package:book_store_managestate/pages/book_details_pages.dart';
import 'package:book_store_managestate/pages/favorite_pages.dart';
import 'package:book_store_managestate/pages/profile_pages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class BookHomepages extends StatelessWidget {
  const BookHomepages({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context, ms, _){
        return Scaffold(
          drawer: Drawer(
            child: Container(
              color: Color(0xffd6d5c9).withOpacity(0.6),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/images/profile.png")),
                          Gap(20),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ProfilePage())
                              );
                            },
                            child: ListTile(
                              leading: Icon(Icons.person, size: 30,),
                              title: Text("Your Profile", style: myStyle(20),),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingsPage()));
                            },
                            leading: Icon(Icons.settings_outlined, size: 30,),
                            title: Text("Settings", style: myStyle(20),),
                          ),
                          ListTile(
                            leading: Icon(Icons.lock_outline, size: 30,),
                            title: Text("Privacy and Security", style: myStyle(20),),
                          ),
                          ListTile(
                            leading: Icon(Icons.share, size: 30,),
                            title: Text("Share to Friends", style: myStyle(20),),
                          ),ListTile(
                            leading: Icon(Icons.star, size: 30,),
                            title: Text("Review & Rating", style: myStyle(20),),
                          ),ListTile(
                            leading: Icon(Icons.system_security_update_warning_rounded, size: 30,),
                            title: Text("Update ", style: myStyle(20),),
                          ),
                          MaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AlertDialog(
                                          title: Text("Do you want to Log Out?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {},
                                                child: Text("Yes", style: myStyle(19),)
                                            ),
                                            SizedBox(width: 120,),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("No", style: myStyle(19),)
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: ListTile(
                              leading: Icon(Icons.logout, size: 28,),
                              title: Text("Log Out", style: myStyle(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            iconTheme: IconThemeData(color: Colors.white,size: 35),
            actions: [
              Icon(Icons.search, size: 30, color: Colors.white),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => Favorite()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.favorite, size: 30, color: Colors.white,
                    ),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.pink, shape: BoxShape.circle,
                        ),
                        child: Center(child: Text("${ms.fav.length}", style: TextStyle(color: Colors.white),),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => MyCartPage()));
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.book, size: 30, color: Colors.white,),
                    Positioned(
                      right: -10,
                      top: -10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent, shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text("${ms.counter}", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Rated Novels", style: myStyle(25, Colors.black, FontWeight.bold),),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    itemCount: allbookdata.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Image.asset("${allbookdata[index].imgURL}", fit: BoxFit.cover,),
                      );
                    },
                  ),
                ),
                Gap(10),
                Text(
                  "Today a Reader, Tomorrow a Leader", style: myStyle(21, Colors.black, FontWeight.bold),),
                Gap(10),
                Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: allbookdata.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>BookDetailsPages(
                                bookList: allbookdata[index],
                              )
                              )
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height*0.11,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage("${allbookdata[index].imgURL}"), fit: BoxFit.cover)
                                  ),
                                ),
                                Gap(10),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${allbookdata[index].name}",style: myStyle(15, Colors.black, FontWeight.bold),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("\$${allbookdata[index].price}", style: myStyle(13),),
                                          IconButton(
                                            onPressed: () {
                                              bool added = ms.addToFav(allbookdata[index]);
                                              String message = added
                                                  ? "Favorite has been added"
                                                  : "Favorite is already added";
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  duration: Duration(seconds: 2),
                                                  content: Text(message),
                                                ),
                                              );
                                            },
                                            icon: Icon(Icons.favorite_border, size: 18, color: Colors.red,),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              bool added = ms.addToBook(allbookdata[index]);
                                              String message = added
                                                  ? "Book has been added"
                                                  : "Book is already added";
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  duration: Duration(seconds: 2),
                                                  content: Text(message),
                                                ),
                                              );
                                            },
                                            icon: Icon(Icons.book, size: 18, color: Colors.blue,),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}