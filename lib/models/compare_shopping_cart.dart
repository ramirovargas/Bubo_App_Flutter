import 'item2.dart';
import 'package:uuid/uuid.dart';
class CompareShoppingCart {
  final orderId = Uuid().v4();
  List<Item2> items = [];
  bool get isEmpty => items.isEmpty;
  int get numOfItems => items.length;
  int get totalPrice {
    int totalPrice = 0;
    items.forEach((i) {
      totalPrice += i.price;
    });
    return totalPrice;
  }
  String get formattedTotalPrice {
    if (isEmpty) {
      return Item2.formatter.format(0);
    }
    return Item2.formatter.format(this.totalPrice);
  }
  bool isExists(item) {
    if (items.isEmpty) {
      return false;
    }
    final indexOfItem = items.indexWhere((i) => item.id == i.id);
    return indexOfItem >= 0;
  }
  void add(Item2 item) {
    if (items.isEmpty) {
      items.add(item);
      return;
    }
    if (!this.isExists(item)) {
      items.add(item);
    }
  }
  void remove(Item2 item) {
    if (items.isEmpty) return;
    final indexOfItem = items.indexWhere((i) => item.id == i.id);
    if (indexOfItem >= 0) {
      items.removeAt(indexOfItem);
    }
  }
  Map<String, dynamic> get toMap {
    final List<Map<String, dynamic>> items = this
        .items
        .map((i) => {
      'id': i.id,
      'name': i.name,
      'description': i.description,
      'price': i.price,
      'inStock': i.inStock,
      'imageUrl': i.imageUrl
    })
        .toList();
    return {"orderId": this.orderId, "items": items, "total": this.totalPrice};
  }
}