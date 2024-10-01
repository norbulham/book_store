import 'package:book_store_managestate/constant.dart';
import 'package:book_store_managestate/manage_states.dart';
import 'package:book_store_managestate/pages/delivery_pages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("User Information", style: myStyle(25, Colors.white, FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          iconTheme: IconThemeData(color: Colors.white,size: 25),

        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.bookProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage("${ms.bookProducts[index].imgURL}"), fit: BoxFit.cover)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${ms.bookProducts[index].name}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    Text("${ms.bookProducts[index].author}", style: TextStyle(fontSize: 17),),
                                    Text("${ms.bookProducts[index].publishDate}", style: TextStyle(fontSize: 17,),),
                                    Text("\$ ${ms.bookProducts[index].price}", style: TextStyle(fontSize: 17,),
                                    ),
                                    Gap(15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            ms.decreaseQuantity(ms.bookProducts[index]);
                                          },
                                          icon: Icon(
                                            Icons.remove, size:25, color: Colors.red,
                                          ),
                                        ),
                                        Gap(10),
                                        Text("${ms.bookProducts[index].quantity}", style: TextStyle(fontSize: 20, ),),
                                        Gap(10),
                                        IconButton(
                                          onPressed: () {
                                            ms.increaseQuantity(ms.bookProducts[index]);
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Colors.green,
                                          ),
                                        ),Gap(10),
                                        IconButton(
                                          onPressed: () {
                                            ms.deleteProducts(ms.bookProducts[index]);
                                          },
                                          icon: Icon(
                                            Icons.delete_outline,
                                            size: 25,
                                            color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Totalprice:",style: myStyle(20,Colors.black),),
                            Text(" \$${ms.calculate()}", style: myStyle(18,Colors.black,FontWeight.bold),),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>DeliveryPages()));
                          },
                          child: Container(
                              padding: EdgeInsets.all(19),
                              height: MediaQuery.of(context).size.height*0.08,
                              width: MediaQuery.of(context).size.width*0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue
                              ),
                              child: Center(child: Text("Check Out", style: myStyle(20,Colors.white),))
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        )
    );
  }
}
