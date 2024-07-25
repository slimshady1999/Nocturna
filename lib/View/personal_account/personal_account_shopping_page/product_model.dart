class ProductModel {
  final String? productImage;
  final String? productName;
  final String? productPrice;
  final String? productDiscount;
  final String? productDiscountPrice;

  ProductModel(
      {this.productImage,
      this.productName,
      this.productPrice,
      this.productDiscount,
      this.productDiscountPrice});
}

final List productList = [
  ProductModel(
      productImage: "assets/shirt.jpg",
      productName: "Black Hood",
      productPrice: "N5,500",
      productDiscount: "50",
      productDiscountPrice: "N6,000"),
  ProductModel(
      productImage: "assets/shirt.jpg",
      productName: "2024 Black Hood",
      productPrice: "N17,000",
      productDiscount: "40",
      productDiscountPrice: "N20,000"),
  ProductModel(
      productImage: "assets/shirt.jpg",
      productName: "Winter shirts",
      productPrice: "N5,500",
      productDiscount: "50",
      productDiscountPrice: "N6,000"),
  ProductModel(
      productImage: "assets/shirt.jpg",
      productName: "Black Hood",
      productPrice: "N10,000",
      productDiscountPrice: "N12,000",
      productDiscount: "40"),
];
