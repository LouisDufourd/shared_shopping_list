import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/api/models.dart';
import 'package:shared_shopping_list/widgets/shopping_list_item_card.dart';

import '../api/api_service.dart';

class ShoppingListPage extends StatefulWidget {
  final Home home;

  const ShoppingListPage(this.home, {super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {

  List<ShoppingListItem> _shoppingList = List.empty();


  @override
  void initState() {
    fetchShoppingList();
  }

  Future<void> fetchShoppingList() async {
    var fetchedShoppingList =
        (await ApiService().getShoppingList(widget.home.name)).shoppingList;

    setState(() {
      _shoppingList = fetchedShoppingList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var item in _shoppingList) ShoppingListItemCard(item)
        ],
      ),
    );
  }
}
