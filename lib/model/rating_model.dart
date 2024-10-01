class Book {
  String image;
  double price;
  double rating;

  Book({
    required this.image,
    required this.price,
    this.rating = 0.0,
  });
}
