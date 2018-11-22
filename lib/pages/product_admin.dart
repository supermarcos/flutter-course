import 'package:flutter/material.dart';
import './product_edit.dart';
import './product_list.dart';
import '../scoped-models/main.dart';

class ProductAdminPage extends StatelessWidget {
  final MainModel model;

  ProductAdminPage(this.model);

  Widget _buildSideDrawer(context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('back to products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Product admin'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create product',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My products',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(),
            ProductListPage(model),
          ],
        ),
        // floatingActionButton: new FloatingActionButton(
        //   backgroundColor: Colors.black,
        //   child: const Icon(Icons.add),
        //   onPressed: () {},
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: new BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 10.0,
        //   color: Colors.black,
        //   child: new Padding(
        //     padding:
        //         EdgeInsets.only(bottom: 0.0, left: 10.0, right: 10.0, top: 0.0),
        //     child: new Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         FlatButton(
        //           textColor: Colors.white,
        //           child: Text('Add Product'),
        //           onPressed: () {},
        //         ),
        //         FlatButton(
        //           textColor: Colors.white,
        //           child: Text('Add Product'),
        //           onPressed: () {},
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.create),
        //       title: Text('Create product'),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.create),
        //       title: Text('Create product'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
