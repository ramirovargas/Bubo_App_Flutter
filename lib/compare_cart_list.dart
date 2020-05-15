import 'dart:async';
import 'package:buboapp/models/compare_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/item2.dart';

import 'package:url_launcher/url_launcher.dart';

_launchURL()async{
  const url = 'https://www.google.com/maps?q=centro+de+alta+tecnologia&um=1&ie=UTF-8&sa=X&ved=2ahUKEwjyiYD8hf3oAhUFUt8KHVB9ASQQ_AUoAXoECA8QAw';
  if( await canLaunch(url)){
    await launch(url);
  }
  else{
    print('Could not launch URL');
  }
}

class CompareCartListWidget extends StatefulWidget {
  final CompareShoppingCart cart;
  CompareCartListWidget({this.cart});
  @override
  State<StatefulWidget> createState() {
    return _CompareCartListWidgetState();
  }
}
class _CompareCartListWidgetState extends State<CompareCartListWidget> {
  static const platform = const MethodChannel('camellabs.com/payment');
  Future<void> _checkout() async {
    await platform.invokeMethod('charge', widget.cart.toMap);
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    widget.cart.items.forEach((c) {
      items.add(_CompareCartListItemWidget(
        item2: c,
      ));
      items.add(Padding(
        padding: EdgeInsets.only(top: 8.0),
      ));
    });
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Color(0xfff0eff4)),
            child: Stack(
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.only(bottom: 64),
                  children: items,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 64,
                  child: _CompareCartListSummaryFooterWidget(
                    totalPrice: widget.cart.formattedTotalPrice,
                  ),
                )
              ],
            )));
  }
}
class _CompareCartListSummaryFooterWidget extends StatelessWidget {
  final String totalPrice;
  _CompareCartListSummaryFooterWidget({this.totalPrice});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0XFFF4F4F4),
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Row(
                children: <Widget>[
                  Text(
                    'Total',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Expanded(
                      child: Text(
                        this.totalPrice,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.subhead,
                      ))
                ],
              )),
        ));
  }
}
class _CompareCartListItemWidget extends StatelessWidget {
  final Item2 item2;
  _CompareCartListItemWidget({this.item2});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
              bottom: BorderSide(color: Colors.grey, width: 0.5))),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 64,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(item2.imageUrl),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          Expanded(
              child: Text(
                item2.name,
                style:
                Theme.of(context).textTheme.title.apply(fontSizeFactor: 0.75),
              )),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          Text(
            item2.formattedPrice,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.subhead,
          ),

          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Container(
            height: 64,
            child: InkWell(
              onTap: () => _launchURL(),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset('assets/images/maps.jpg'),
            )


            ),
          ),

        ],
      ),
    );
  }
}