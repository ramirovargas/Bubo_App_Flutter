import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Item2 {
  String id;
  String name;
  String description;
  int price;
  bool inStock;
  String imageUrl;
  String location;
  Item2(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.inStock,
        this.imageUrl,
        this.location});
  String get formattedAvailability => inStock ? "Available" : "Out of stock";
  String get formattedPrice => Item2.formatter.format(this.price);
  Color get availabilityColor => inStock ? Colors.grey : Colors.red;
  static final formatter =
  NumberFormat.currency(locale: 'id_ID', symbol: "Rp ");
  static List<Item2> get dummyItems => [
    Item2(
        id: "1",
        name: "Todo Tech (Centro de alta tecnología)              ",
        description: 'More magical than ever.',
        price: 2399400,
        inStock: true,
        imageUrl:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xr/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        location: "10 km"
    ),
    Item2(
        id: "1",
        name: "Diana y Ale (San Andresto Norte)             ",
        description: 'More magical than ever.',
        price: 2500000,
        inStock: true,
        imageUrl:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xr/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        location: "7 km"
    ),
    Item2(
        id: "1",
        name: "Compured (Unilago)             ",
        description: 'More magical than ever.',
        price: 2950000,
        inStock: true,
        imageUrl:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xr/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        location: "10 km"
    ),
    Item2(
        id: "1",
        name: " Fallablella       ",
        description: 'More magical than ever.',
        price: 3229000,
        inStock: true,
        imageUrl:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xr/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        location: "3 km"
    ),
    Item2(
        id: "1",
        name: "Alkosto           ",
        description: 'More magical than ever.',
        price: 3869000,
        inStock: true,
        imageUrl:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xr/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        location: "500 m"
    ),
    Item2(
        id: "1",
        name: "Tiendas Claro       ",
        description: 'More magical than ever.',
        price: 3999000,
        inStock: true,
        imageUrl:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/xr/iphone-xr-red-select-201809?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1551226038669',
        location: "250 m"
    ),

  ];
}