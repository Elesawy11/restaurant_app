// import 'package:flutter/material.dart';
// import 'package:restaurant_app/core/utils/styles.dart';
// import 'package:restaurant_app/features/home/views/widgets/cart_item_widget.dart';

// import '../data/models/cart_item.dart';

// class MyCartPage extends StatefulWidget {
//   const MyCartPage({super.key});

//   @override
//   _MyCartPageState createState() => _MyCartPageState();
// }

// class _MyCartPageState extends State<MyCartPage> {
//   double totalPrice = 180.0;

//   List<CartItem> cartItems = [
//     CartItem(
//       id: 1,
//       name: "Appam & Stew - 2 nos",

//       price: 180.0,
//       quantity: 1,
//       imageUrl: "assets/images/appam_stew.jpg",
//     ),
//     CartItem(
//       id: 2,
//       name: "Appam & Stew - 2 nos",

//       price: 50,
//       quantity: 1,
//       imageUrl: "assets/images/appam_stew.jpg",
//     ),
//   ];

//   void updateTotalPrice() {
//     double total = 0;
//     for (var item in cartItems) {
//       total += item.price * item.quantity;
//     }
//     setState(() {
//       totalPrice = total;
//     });
//   }

//   void increaseQuantity(int id) {
//     setState(() {
//       cartItems.firstWhere((item) => item.id == id).quantity++;
//       updateTotalPrice();
//     });
//   }

//   void decreaseQuantity(int id) {
//     setState(() {
//       var item = cartItems.firstWhere((item) => item.id == id);
//       if (item.quantity > 1) {
//         item.quantity--;
//         updateTotalPrice();
//       }
//     });
//   }

//   void removeItem(int id) {
//     setState(() {
//       cartItems.removeWhere((item) => item.id == id);
//       updateTotalPrice();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('My Cart: ', style: Styles.font18W600),
//           // Price Row
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Price',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   '₹ ${totalPrice.toStringAsFixed(0)}',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: cartItems.length,
//               itemBuilder: (context, index) {
//                 final item = cartItems[index];
//                 return CartItemWidget(
//                   item: item,
//                   decreaseQuantity: decreaseQuantity(item.id),
//                   increaseQuantity: increaseQuantity(item.id),
//                   removeItem: removeItem(item.id),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
