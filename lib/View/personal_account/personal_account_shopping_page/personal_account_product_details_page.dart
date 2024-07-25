import 'package:flutter/material.dart';
import 'package:nocturna/View/personal_account/personal_account_shopping_page/product_model.dart';

class PersonalAccountShopDetailsPage extends StatelessWidget {
  final ProductModel productModelData;
  const PersonalAccountShopDetailsPage(
      {super.key, required this.productModelData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Product Details",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
        actions: [
          Container(
            height: 30,
            width: 100,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Add to Cart",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            Container(
              height: double.infinity,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Text(
                      "ADD TO CART",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    productModelData.productImage.toString(),
                    height: MediaQuery.of(context).size.height / 3.0,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            //-- Official Store logo / Title / pricing / discount container
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height / 5.1,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10, top: 10),
                      height: 25,
                      width: 95,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text("Official Store",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                      )),

                  //-- Title Text
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(productModelData.productName.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                  ),

                  //-- Price Text
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Text(
                          productModelData.productPrice.toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            productModelData.productDiscountPrice.toString(),
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(210, 255, 153, 0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                  "-${productModelData.productDiscount.toString()}%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white)),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //-- Product Description
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height / 3.9,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Description",
                        style: Theme.of(context).textTheme.bodyLarge),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
