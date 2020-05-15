import 'package:buboapp/models/compare_shopping_cart.dart';
import 'package:flutter/material.dart';

import '../compare_cart_list.dart';
import 'item.dart';
import 'item2.dart';
class CompareListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompareListState();
  }
}
class _CompareListState extends State<CompareListWidget> {
  CompareShoppingCart cart = CompareShoppingCart();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Item2> items2 = Item2.dummyItems;
  @override
  Widget build(BuildContext context) {
    final columnCount =
    MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4;
    final width = MediaQuery.of(context).size.width / columnCount;
    const height = 400;
    List<Widget> items = [];
    for (var x = 0; x < this.items2.length; x++) {
      bool isSideLine;
      if (columnCount == 2) {
        isSideLine = x % 2 == 0;
      } else {
        isSideLine = x % 4 != 3;
      }
      final item2 = this.items2[x];
      items.add(_CompareListItem(
        item2: item2,
        isInCart: cart.isExists(item2),
        isSideLine: isSideLine,
        onTap: (item) {
          _scaffoldKey.currentState.hideCurrentSnackBar();
          if (cart.isExists(item)) {
            cart.remove(item);
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Item is removed from cart!'),
            ));
          } else if (item.inStock) {
            cart.add(item);
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Item is added to cart!'),
            ));
          } else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Item is out of stock!'),
            ));
          }
          this.setState(() {});
        },
      ));
    }
    return Scaffold(
        key: _scaffoldKey,
        body: GridView.count(
          childAspectRatio: width / height,
          scrollDirection: Axis.vertical,
          crossAxisCount: columnCount,
          children: items,
        ),
        floatingActionButton: cart.isEmpty
            ? null
            : FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CompareCartListWidget(
                  cart: this.cart,
                )));
          },
          icon: Icon(Icons.shopping_cart),
          label: Text("${cart.numOfItems}"),
        ));
  }
}
class _CompareListItem extends StatelessWidget {
  final Item2 item2;
  final bool isInCart;
  final bool isSideLine;
  dynamic onTap;
  _CompareListItem({this.item2, this.isInCart, this.isSideLine, this.onTap});
  @override
  Widget build(BuildContext context) {
    Border border;
    if (isSideLine) {
      border = Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
          right: BorderSide(color: Colors.grey, width: 0.5));
    } else {
      border = Border(bottom: BorderSide(color: Colors.grey, width: 0.5));
    }
    return InkWell(
        onTap: () => this.onTap(item2),
        child: Container(
            decoration: BoxDecoration(border: border),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Container(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(item2.imageUrl),
                  ),
                  height: 250,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Text(item2.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .apply(fontSizeFactor: 0.8)),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Text(item2.formattedPrice,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .apply(fontSizeFactor: 0.8)),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                ),
                Text(item2.location,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .apply(fontSizeFactor: 0.8)),
                Padding(
                  padding: EdgeInsets.only(top: 8 ),
                ),
                Text(this.isInCart ? "In Cart" : item2.formattedAvailability,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption.apply(
                        fontSizeFactor: 0.8,
                        color:
                        isInCart ? Colors.blue : item2.availabilityColor)),
              ],
            )));
  }
}