
class CartModel {
  String title;
   int price;
   String assetLink;

  CartModel.fromJson(
      {required this.title, required this.price, required this.assetLink}) {
    title = title;
    price = price;
    assetLink = assetLink;
  }
}
