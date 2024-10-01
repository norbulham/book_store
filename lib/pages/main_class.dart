import 'package:book_store_managestate/model/book_model.dart';
import 'package:book_store_managestate/model/delivery_model.dart';
import 'package:flutter/cupertino.dart';
class ManageState with ChangeNotifier{
  /// for book buying
  int _counter = 0;

  set counter(int value){
    _counter=value;
    notifyListeners();
  }
  int get counter=>_counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  List<BookModel> _cardProducts=[];

  bool addToCard(BookModel product){
    if(!_cardProducts.contains(product)){
      _cardProducts.add(product);
      _counter++;
      notifyListeners();
      return true;
    }
    else{
      return false;
    }
  }

  List<BookModel> get cardProducts=> _cardProducts;

  /// for bookmark
  int _bookmarkCounter = 0;
  set bookmarkCounter(int value){
    _bookmarkCounter=value;
    notifyListeners();
  }

  int get bookmarkCounter => _bookmarkCounter;
  void incrementBookmarkCounter() {
    _bookmarkCounter++;
    notifyListeners();
  }

  List<BookModel> _cardProduct=[];

  bool addToBookmark(BookModel product) {
    if(!_cardProduct.contains(product)){
      _cardProduct.add(product);
      _bookmarkCounter++;
      notifyListeners();
      return true;
    }
    else{
      return false;
    }
  }
  List<BookModel> get cardProduct=> _cardProduct;

  void increaseQuantity(BookModel product){
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(BookModel product){
    if(product.quantity>0){
      product.quantity--;
      notifyListeners();
    }
    // else{
    //   _cardProducts.remove(product);
    //   _counter--;
    //   notifyListeners();
    // }
  }

  double calculate(){
    double total=0;
    for(var product in _cardProducts){
      total+=product.price*product.quantity;
    }
    return total;
  }

  void deleteProducts(BookModel product){
    _cardProducts.remove(product);
    _counter--;
    notifyListeners();
  }
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