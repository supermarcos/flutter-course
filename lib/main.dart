import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
// import './product_manager.dart';
import './pages/product_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

import './scoped-models/main.dart';
import './models/product.dart';

void main() {
  // widgets boundaries, margins, paddings and aligments
  // debugPaintSizeEnabled = true;

  // debugPaintBaselinesEnabled = true; // text baseline
  // debugPaintPointersEnabled = true; // highlights the widget is responding to the click / tap event

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
        // debugShowMaterialGrid: true, // displays a grid overlaying the application
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple,
        ),
        // home: AuthPage(),
        routes: {
          // if this '/' route is specified, home is not usable, in fact, both can't be at the same time
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => ProductsPage(model),
          '/admin': (BuildContext context) => ProductAdminPage(model),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final String productId = pathElements[2];
            final Product product = model.allProducts.firstWhere(
              (Product product) {
                return product.id == productId;
              },
            );
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(product),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(model),
          );
        },
      ),
    );
  }
}
