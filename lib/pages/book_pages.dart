import 'package:book_store_managestate/constant.dart';
import 'package:book_store_managestate/data/book_list.dart';
import 'package:book_store_managestate/manage_states.dart';
import 'package:book_store_managestate/pages/userinfro_page.dart';
import 'package:book_store_managestate/pages/book_details_pages.dart';
import 'package:book_store_managestate/pages/favorite_pages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(
      builder: (context, ms, _) {
        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SettingsPage()));
                        },
                        leading: Icon(Icons.settings_outlined, size: 35,),
                        title: Text("Settings", style: myStyle(20),),
                      ),
                      ListTile(
                        leading: Icon(Icons.lock_outline, size: 35,),
                        title: Text("Privacy and Security", style: myStyle(20),),
                      ),
                      ListTile(
                        leading: Icon(Icons.question_answer_outlined, size: 35,),
                        title: Text("Help and Feedback", style: myStyle(20),),
                      ),
                    ],
                  ),
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
                    leading: Icon(Icons.logout, size: 35,color: Colors.red,),
                    title: Text("Log Out", style: myStyle(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xff9d0208),
            iconTheme: IconThemeData(color: Colors.white,size: 30
            ),
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
                          color: Colors.blue, shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text("${ms.counter}", style: TextStyle(color: Colors.white),),
                        ),
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
                          color: Colors.blue, shape: BoxShape.circle,
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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Rated Novels",
                  style: myStyle(29, Colors.black, FontWeight.bold),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: allbookdata.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>BookDetailsPages(bookList: allbookdata[index],)));
                          },
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  height: 171,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage("${allbookdata[index].imgURL}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Gap(10),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${allbookdata[index].name}",style: myStyle(20),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\$ ${allbookdata[index].price}", style: myStyle(18),),
                                          Row(
                                            children: [
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
                                                icon: Icon(Icons.bookmark_outline, size: 30, color: Colors.red,),
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
                                                icon: Icon(Icons.book, size: 30, color: Colors.black,),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

