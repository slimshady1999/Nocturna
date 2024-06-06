class ProductModel {
  final String? productImage;
  final String? productName;
  final String? productPrice;
  final String? productDiscount;

  ProductModel(
      {this.productImage,
      this.productName,
      this.productPrice,
      this.productDiscount});

  final List productList = [
    ProductModel(
        productImage: "assets/event1.jpg",
        productName: "red wine,",
        productPrice: "N5,500",
        productDiscount: "50"),
    ProductModel(
        productImage: "assets/hotwine.jpg",
        productName: "hot wine,",
        productPrice: "N10000",
        productDiscount: "40"),
  ];
}
