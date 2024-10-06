import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/api/models.dart';

class ShoppingListItemCard extends StatefulWidget {
  final ShoppingListItem item;

  const ShoppingListItemCard(this.item, {super.key});

  @override
  State<ShoppingListItemCard> createState() => _ShoppingListItemCardState();
}

class _ShoppingListItemCardState extends State<ShoppingListItemCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16), // Responsive padding
      margin: const EdgeInsets.all(10), // Responsive margin
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5), // Adjust the rounding as necessary
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded widget makes the text area take the available space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                if (widget.item.description.isNotEmpty)
                  Text(
                    'description : ${widget.item.description}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  'Quantité : ${widget.item.quantity}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // The row for icons, placed on the right side
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Implement your edit functionality
                },
                icon: const Icon(Icons.edit, color: Colors.blue),
                tooltip: 'Modifier le produit',
              ),
              IconButton(
                onPressed: () {
                  // Implement your delete functionality
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                tooltip: 'Supprimer le produit',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
