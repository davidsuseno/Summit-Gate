import 'package:flutter/material.dart';
import 'package:summit_gate/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Shoe image
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(shoe.image)),

          // description
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 10.0),
            child: Text(
              shoe.description,
              style: TextStyle(color: Colors.black54),
            ),
          ),

          // price + details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // shoe name
                    Text(
                      shoe.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),

                    // price
                    Text(
                      "\$${shoe.price}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                // plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 9, 2, 35),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),

          // button to add to cart
        ],
      ),
    );
  }
}
