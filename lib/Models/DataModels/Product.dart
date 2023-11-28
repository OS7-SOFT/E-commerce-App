class Product {
  int Id;
  String Name;
  String Descriptoin;
  String ImageUrl;
  double Price;
  int Sold;
  

  Product(
      {
      required this.Id,
      required this.Name,
      required this.Descriptoin,
      required this.ImageUrl,
      required this.Price,
      this.Sold = 0,
      });
}
