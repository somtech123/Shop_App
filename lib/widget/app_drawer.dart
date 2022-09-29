import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_manager.dart';
import '../theme/constants.dart';
import '../screen/orders_screen.dart';
import '../screen/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'My Shop',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text(
              "Shop",
              style: Constant.kDrawerTextStyle,
            ),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text(
              "Order",
              style: Constant.kDrawerTextStyle,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(
              "Manage Products",
              style: Constant.kDrawerTextStyle,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
          Expanded(
            child: Card(
              child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: Consumer<ThemeManager>(
                  builder: (context, theme, child) => ListTile(
                    leading: Switch(
                      onChanged: ((value) {
                        theme.toggleTheme(value);
                      }),
                      value: theme.themeMode == ThemeMode.dark,
                      activeColor: Colors.grey,
                      inactiveThumbColor: Colors.white,
                    ),
                    title: const Text(
                      "Light | Dark",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
