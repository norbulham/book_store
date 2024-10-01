
import 'package:book_store_managestate/constant.dart';
import 'package:book_store_managestate/data/delivery_list.dart';
import 'package:book_store_managestate/data/payment_list.dart';
import 'package:book_store_managestate/manage_states.dart';
import 'package:book_store_managestate/model/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();

  PaymentModel _selectedMethod = allMethods[0];
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _remark = TextEditingController();

  bool _showCardDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Payment Information", style: myStyle(25,Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white
        ),
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${customer[0].name}', style: myStyle(20,Colors.black,FontWeight.bold),),
                Text('Email: ${customer[0].email}', style: myStyle(20,Colors.black,FontWeight.bold),),
                Text('Contact: ${customer[0].phoneNo}', style: myStyle(20,Colors.black,FontWeight.bold),),
                Text('Address: ${customer[0].address}', style:myStyle(20,Colors.black,FontWeight.bold),),
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text("Number of Books:  ${ms.cardProducts[index].quantity}", style: myStyle(25,Colors.black,FontWeight.bold),),
                                Text("Total Price:  \$ ${ms.calculate()}", style: myStyle(20,Colors.black,FontWeight.bold),),
                                Gap(10),
                                Text("Choose your payment method", style: myStyle(23,Colors.black, FontWeight.bold),),
                                Gap(10),
                                Card(
                                  elevation: 4,
                                  child: DropdownButton<PaymentModel>(
                                    value: _selectedMethod,
                                    onChanged: (PaymentModel? newValue) {
                                      setState(() {
                                        _selectedMethod = newValue!;
                                        _showCardDetails = _selectedMethod != allMethods[0];
                                      });
                                    },
                                    items: allMethods.map<DropdownMenuItem<PaymentModel>>(
                                          (PaymentModel method) {
                                        return DropdownMenuItem<PaymentModel>(
                                          value: method,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 36,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(image: AssetImage("${method.imgUrl}"), fit: BoxFit.cover),
                                                ),
                                              ),
                                              Gap(10),
                                              Text("${method.paymentMethod}"),
                                            ],
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _cardNumber,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Beneficiary Account Number',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _amount,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Amount',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _password,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: "T-Pin",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "T-Pin";
                                    }
                                    if (value.length >= 8) {
                                      return "number must be only least 4 characters";
                                    }
                                    return null;
                                  },
                                ),
                                Gap(10),
                                TextFormField(
                                  controller: _remark,
                                  decoration: InputDecoration(hintText: "Remarks",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Gap(20),
                                MaterialButton(
                                  height: 45,
                                  color:Colors.blue,
                                  minWidth: double.infinity,
                                  onPressed: () {
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> PaymentInfo()));
                                    Get.snackbar('Payment Status','Payment Successful',titleText:Text('Payment Status', style: myStyle(20,Colors.black, FontWeight.bold),),messageText: Text("Payment Sucessful", style: myStyle(18, Colors.black),), backgroundColor: Color(0xffcaf0f8));
                                    },
                                  child: Text("Summit", style: myStyle(23, Colors.white, FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
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
