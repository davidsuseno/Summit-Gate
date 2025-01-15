import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summit_gate/models/cart.dart';
import 'package:summit_gate/models/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.image),
        title: Text(widget.shoe.name),
        subtitle: Text('Price: \$${widget.shoe.price}'),
        trailing: IconButton(
          onPressed: removeItemFromCart,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
