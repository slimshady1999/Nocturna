import 'package:flutter/material.dart';
import 'package:nocturna/View/user_account/personal_user_account/personal_account_shopping_page/product_model.dart';

class PersonalAccountShoppingPage extends StatefulWidget {
  const PersonalAccountShoppingPage({super.key});

  @override
  State<PersonalAccountShoppingPage> createState() =>
      _PersonalAccountShoppingPageState();
}

class _PersonalAccountShoppingPageState
    extends State<PersonalAccountShoppingPage> {
  final productData = ProductModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Shop",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                // Get.to(() => const PersonalAccountShoppingPage());
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 25,
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: ListView.builder(
              itemCount: productData.productList.length,
              itemBuilder: (context, index) {
                final List data = productData.productList[index];
                return Column(
                  children: [Text(data[index])],
                );
              })),
    );
  }
}


//  Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Card(
//                     borderOnForeground: true,
//                     shadowColor: Colors.grey,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     child: SizedBox(
//                       height: 210,
//                       width: 150,
//                       child: Column(
//                         children: [
//                           //-- Product image
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.asset("assets/event1.jpg")),
//                           ),

//                           //-- Product name
//                           Text(
//                             "Product name",
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),

//                           //-- product price
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8),
//                             child: Text(
//                               "N7000",
//                               style: Theme.of(context).textTheme.bodyMedium,
//                             ),
//                           ),

//                           //-- Product checkout button and discount
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               CircleAvatar(
//                                 radius: 20,
//                                 backgroundColor:
//                                     Theme.of(context).colorScheme.secondary,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "39%",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyMedium!
//                                           .copyWith(
//                                               color: Colors.white,
//                                               fontSize: 10.5),
//                                     ),
//                                     Text(
//                                       "OFF",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall!
//                                           .copyWith(
//                                               color: Colors.white, fontSize: 8),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Container(
//                                   margin: const EdgeInsets.only(right: 5),
//                                   height: 30,
//                                   width:
//                                       MediaQuery.of(context).size.width / 3.9,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Theme.of(context)
//                                               .colorScheme
//                                               .secondary),
//                                       borderRadius: BorderRadius.circular(5)),
//                                   child: Center(
//                                     child: Text(
//                                       "Add to cart",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall!
//                                           .copyWith(
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .secondary),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),