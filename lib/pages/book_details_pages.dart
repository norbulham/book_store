
import 'package:book_store_managestate/constant.dart';
import 'package:book_store_managestate/manage_states.dart';
import 'package:book_store_managestate/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class BookDetailsPages extends StatefulWidget {
  BookModel bookList;
  BookDetailsPages({super.key,required this.bookList});

  @override
  State<BookDetailsPages> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetailsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blueAccent,
        title: Text("About Novels",style: myStyle(25,Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white,size: 30
        ),
      ),
      body: Consumer<ManageState>(
        builder: (context,ms,_){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.64,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("${widget.bookList.imgURL}",),fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name:  ${widget.bookList.name}",style: myStyle(19, Colors.black, FontWeight.bold),),
                      Text("Published Date: ${widget.bookList.publishDate}",style: myStyle(17),),
                      Text("${widget.bookList.location}",style: myStyle(17),),
                      Text("Author: ${widget.bookList.author}",style: myStyle(17),),
                      Gap(10),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.yellow,size: 30,),
                          Icon(Icons.star, color: Colors.yellow,size: 30,),
                          Icon(Icons.star_border, color: Colors.black,size: 30,),
                          Text("       \$${widget.bookList.price}", style: myStyle(18),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

