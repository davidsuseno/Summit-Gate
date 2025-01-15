import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summit_gate/components/shoe_tile.dart';
import 'package:summit_gate/models/cart.dart';
import 'package:summit_gate/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert teh user, shoe successfully added to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Succesfully Added'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Search",
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Lengkapi kebutuhan mendakimu sekarang!",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          // hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Lagi Promo Nih🔥",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 9, 2, 35)
                    )),
                Text("See all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue))
              ],
            ),
          ),

          const SizedBox(height: 20),

          // list of shoe for sale
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get shoe data from shop list
                Shoe shoe = value.getShoeList()[index];

                // return the item
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
