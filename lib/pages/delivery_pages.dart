import 'package:book_store_managestate/constant.dart';
import 'package:book_store_managestate/data/delivery_list.dart';
import 'package:book_store_managestate/manage_states.dart';
import 'package:book_store_managestate/model/delivery_model.dart';
import 'package:book_store_managestate/pages/payment_pages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class DeliveryPages extends StatefulWidget {
  const DeliveryPages({super.key});

  @override
  State<DeliveryPages> createState() => _AddressPageState();
}

class _AddressPageState extends State<DeliveryPages> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Delivery Information", style: myStyle(27,Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white,size: 27
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ManageState>(
            builder: (context,ms,_){
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Enter your Name",
                              //border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Name";
                              }
                              return null;
                            },
                          ),
                          Gap(10),
                          TextFormField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              hintText: "Enter your Location",
                              //border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Address";
                              }
                              return null;
                            },
                          ),
                          Gap(10),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Enter your Email",
                              //border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Email";
                              }
                              if (!value.contains("@gmail.com")) {
                                return "Email should contain 'gmail.com'";
                              }
                              return null;
                            },
                          ),
                          Gap(10),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Enter your Number",
                              //border: OutlineInputBorder(),
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return "Please enter Phone Number";
                            //   }
                            //   if (value.length >= 8) {
                            //     return "number must be at least 8 characters";
                            //   }
                            //   return null;
                            // },
                          ),
                          Gap(20),
                          Text("Total Price: \$ ${ms.calculate()}", style: myStyle(20, Colors.black, FontWeight.bold),),
                          Gap(20),
                          MaterialButton(
                            minWidth: MediaQuery.of(context).size.width * 0.8,
                            color: Colors.blue,
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),  onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              customer.add(
                                DeliveryModel(
                                  name: _nameController.text.toString(),
                                  address: _addressController.text.toString(),
                                  email: _emailController.text.toString(),
                                  phoneNo: _phoneController.text.toString(),
                                ),
                              );      Navigator.of(context).push(
                                MaterialPageRoute(builder: (builder) => PaymentPage()),      );
                            }
                          },
                            child: Text("Make Payment", style: myStyle(23, Colors.white, FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}








