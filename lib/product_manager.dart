import 'package:flutter/material.dart';

import './widgets/products/products.dart';
import './models/product.dart';

class ProductManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        Expanded(
          child: Products(),
        )
      ],
    );
  }
}
