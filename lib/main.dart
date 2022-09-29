import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/cart_screen.dart';
import '../screen/product_detail_screen.dart';
import '../theme/theme_data.dart';
import './screen/product_overview_screen.dart';
import './providers/theme_manager.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screen/orders_screen.dart';
import './providers/orders.dart';
import './screen/edit_product_screen.dart';
import './screen/user_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProvider.value(value: Orders()),
        ],
        child: Consumer<ThemeManager>(
          builder: (context, value, child) => MaterialApp(
            title: 'Shop App',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: value.themeMode,
            home: HomePage(),
            routes: {
              UserProductScreen.routeName: ((context) => UserProductScreen()),
              OrderScreen.routName: ((context) => OrderScreen()),
              CartScreen.routName: (context) => CartScreen(),
              ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
              EditProductScreen.rourName: (context) => EditProductScreen(),
            },
          ),
        ));
  }
}
