import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercupertinoapp/product_list_tab.dart';
import 'package:fluttercupertinoapp/search_tab.dart';
import 'package:fluttercupertinoapp/shopping_cart_tab.dart';
import 'styles.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
       home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return CupertinoPageScaffold(
//      child: Container(),
//      navigationBar: CupertinoNavigationBar(
//        middle: Text("Cupertino Store"),
//      ),
//    );
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  title: Text("Products"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search),
                  title: Text("Search"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.shopping_cart),
                  title: Text("Cart"),
                ),
              ] ),
          // ignore: missing_return
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                  return CupertinoTabView(builder: (context) {
                    return CupertinoPageScaffold(
                        child: ProductListTab()
                    );
                  });
              case 1:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                      child: SearchTab()
                  );
                });

              case 2:
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(
                    child: ShoppingCartTab(),
                  );
                });
            }
          });
  }
}