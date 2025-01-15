import 'package:flutter/material.dart';
import 'package:summit_gate/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Hedgehog 3 Mid',
      price: '145',
      description:
          ' a rugged design and waterproof DryVent™ membranes, all of which make them perfect for hiking. ',
      image:
          'assets/Mens-Hedgehog-3-Mid-Waterproof-Boots-in-TNF-BlackAsphalt-Grey.jpg',
    ),
    Shoe(
      name: 'Salomon X Ultra 4',
      price: '175',
      description:
          'It is as agile as a trail-running shoe but with all the stability, grip and waterproof protection you need to tackle technical terrain.',
      image: 'assets/X ULTRA 4 MID GORE-TEX.png',
    ),
    Shoe(
      name: 'HOKA Anacapa 2 Mid',
      price: '195',
      description:
          'Scrutinized through the lens of sustainability, we’ve reimagined our beloved Anacapa Mid GTX with a renewed focus on earth-friendly materials.',
      image: 'assets/HOKA Anacapa 2 Mid GTX.webp',
    ),
    Shoe(
      name: 'VECTIV Fastpack',
      price: '156',
      description:
          'VECTIV Fastpack Insulated Waterproof Boots features our innovative VECTIV™ platform for trail-tuned propulsion and stability.',
      image: 'assets/NF0A8AEVWMB-in-Military-OliveTNF-Black.jpg',
    ),
  ];

  // list of item in cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
