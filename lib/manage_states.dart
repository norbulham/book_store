import 'package:book_store_managestate/model/book_model.dart';
import 'package:book_store_managestate/model/delivery_model.dart';
import 'package:flutter/cupertino.dart';
class ManageState with ChangeNotifier {
  //for bookmark
  int _counter = 0;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  List<BookModel> _bookProducts = [];

  bool addToBook(BookModel product) {
    if(!_bookProducts.contains(product)) {
      _bookProducts.add(product);
      _counter++;
      notifyListeners();
      return true;
    }
    else {
      return false;
    }
  }

  List<BookModel> get bookProducts => _bookProducts;

  void increaseQuantity(BookModel product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(BookModel product) {
    if(product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    } else {
      _bookProducts.remove(product);
      _counter--;
      notifyListeners();
    }
  }
  void deleteProducts(BookModel product){
    _bookProducts.remove(product);
    _counter--;
    notifyListeners();
  }

  double calculate() {
    double total = 0;
    for(var product in bookProducts) {
      total = total + product.price * product.quantity;
    }
    return total;
  }



  List<BookModel> _fav = [];
  List<BookModel> get fav=>_fav;

  bool addToFav(BookModel product) {
    if(!_fav.contains(product)) {
      _fav.add(product);
      // _counter++;
      notifyListeners();
      return true;
    }
    else {
      return false;
    }
  }
  void deleteFav(BookModel product){
    _fav.remove(product);
    // _counter--;
    notifyListeners();
  }

  List<BookModel> _deliveryDetails = [];

  List<BookModel> get deliveryDetails => _deliveryDetails;

  List<DeliveryModel> _deliveryInfo = [];

  List<DeliveryModel> get deliveryInfo => _deliveryInfo;

  void addDeliveryInfo(String name, String address, String email,String phoneNo) {
    _deliveryInfo.add(
      DeliveryModel(
        name: name,
        email:email,
        address: address,
        phoneNo: phoneNo,
      ),
    );
  }

}






