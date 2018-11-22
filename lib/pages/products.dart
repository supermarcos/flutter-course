import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../product_manager.dart';
import '../scoped-models/main.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;

  ProductsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  initState() {
    widget.model.fetchProducts();
    super.initState();
  }

  Widget _buildSideDrawer(context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('manage products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => ProductAdminPage(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductsList() {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
      Widget content = Center(child: Text('No products found'));
      if (model.displayedProducts.length > 0 && !model.isLoading) {
        content = ProductManager();
      } else if (model.isLoading) {
        content = Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(
        child: content,
        onRefresh: () {
          return model.fetchProducts();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.displayFavoritesOnly
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          ),
        ],
      ),
      body: _buildProductsList(),
    );
  }
}
