import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './product_card.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget productCards;
    if (products.length > 0) {
      // listview.builder is more performant for undetermined long lists of items
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      // if I don't want to return anything, I could return simply 'productCards = Container();'
      productCards = Center(child: Text('No products found, please add some'));
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProductList(model.displayedProducts);
      },
    );

    // return ListView(
    //     children: products
    //         .map(
    //           (element) => Card(
    //                 child: Column(children: <Widget>[
    //                   Image.asset('assets/food.jpg'),
    //                   Text(element)
    //                 ]),
    //               ),
    //         )
    //         .toList());
  }
}
