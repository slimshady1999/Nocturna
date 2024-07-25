import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nocturna/View/personal_account/personal_account_shopping_page/personal_account_product_details_page.dart';
import 'package:nocturna/View/personal_account/personal_account_shopping_page/product_model.dart';

class PersonalAccountShoppingPage extends StatefulWidget {
  const PersonalAccountShoppingPage({super.key});

  @override
  State<PersonalAccountShoppingPage> createState() =>
      _PersonalAccountShoppingPageState();
}

class _PersonalAccountShoppingPageState
    extends State<PersonalAccountShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Market Place",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                //   Get.to(() => const PersonalAccountShoppingPage());
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.deepPurple,
                  size: 25,
                ),
              )),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          //-- Search bar
          Row(children: [
            //-- search box
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  height: 50,
                  child: TextField(
                    cursorColor: Colors.black,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(29, 158, 158, 158),
                      hintText: 'search...',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )),
            ),

            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                right: 20,
              ),
              child: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  radius: 20,
                  child: Icon(Icons.search, color: Colors.white)),
            )
          ]),

          //-- Cloth  Sale Advert
          Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
              height: MediaQuery.of(context).size.width / 2.7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(children: [
                //-- Image
                Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/girl.png")),

                //-- Text
                Padding(
                  padding: const EdgeInsets.only(right: 45, top: 18),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Big Sale!!",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white)),
                        Text("Get perfect discounts",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white)),
                        Text("on new arrivals",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white)),
                        Text("up to 50% OFF",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                )
              ])),

          //-- Category Tab bar
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Card(
                    color: Colors.deepPurple,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Products",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white)),
                    )),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Featured",
                      style: Theme.of(context).textTheme.bodyMedium),
                )),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Shirts",
                      style: Theme.of(context).textTheme.bodyMedium),
                )),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Trousers",
                      style: Theme.of(context).textTheme.bodyMedium),
                )),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Wine",
                      style: Theme.of(context).textTheme.bodyMedium),
                )),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Shoes",
                      style: Theme.of(context).textTheme.bodyMedium),
                )),
              ]),
            ),
          ),

          //-- Products
          const SizedBox(height: 13),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.0,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  ProductModel products = productList[index];

                  return Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(() => PersonalAccountUserChats(
                          //       chat: chat,
                          //     ));
                        },
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => PersonalAccountShopDetailsPage(
                                productModelData: products));
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 251, 248, 248),
                            child: SizedBox(
                                height: 100,
                                width: 100,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //-- Image
                                      Expanded(
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: Image.asset(
                                                products.productImage
                                                    .toString(),
                                                height: 200,
                                                width: 200)),
                                      ),

                                      //-- Products Discount
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        height: 25,
                                        width: 70,
                                        decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5))),
                                        child: Center(
                                          child: Text(
                                              "${products.productDiscount}% OFF",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: Colors.white)),
                                        ),
                                      ),

                                      //-- Texts / Cart Button
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        products.productName
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall),
                                                  ),
                                                  Text(
                                                      products.productPrice
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium),
                                                ],
                                              ),
                                            ),

                                            //-- Cart Button
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8),
                                              child: CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor:
                                                      Colors.deepPurple,
                                                  child: Icon(
                                                      Icons.shopping_cart,
                                                      size: 17,
                                                      color: Colors.white)),
                                            )
                                          ],
                                        ),
                                      )
                                    ])),
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
