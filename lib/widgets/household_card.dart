import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/pages/login_page.dart';
import 'package:shared_shopping_list/pages/shopping_list_page.dart';

import '../api/models.dart';

class HouseholdCard extends StatefulWidget {
  final Home _home;
  final int _homeMemberCount;
  final int _shoppingListProductCount;

  const HouseholdCard(this._home, this._homeMemberCount, this._shoppingListProductCount, {super.key});

  @override
  State<HouseholdCard> createState() => _HouseholdCardState();
}

class _HouseholdCardState extends State<HouseholdCard> {

  void _handleContainerTap(BuildContext context) {
    if (kDebugMode) {
      print("Container tapped!");
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingListPage(widget._home),));
  }

  void _handleIconTap(BuildContext context) {
    if (kDebugMode) {
      print("Icon tapped!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleContainerTap(context), // Handling tap on the entire container
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5), // Adjust the rounding as necessary
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget._home.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nombre de membre : ${widget._homeMemberCount}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Nombre de produit à acheter : ${widget._shoppingListProductCount}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.directions_walk, color: Colors.red,),
                tooltip: 'Quitter le foyer',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
