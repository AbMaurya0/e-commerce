import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(this.id, this.productId, this.price, this.quantity, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text("Are you Sure?"),
                  content: const Text('Do u want to remove the item'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: const Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text('Yes'))
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(child: Text('\u{20B9}$price'))),
            ),
            title: Text(title),
            subtitle: Text('Total : \u{20B9}${(price * quantity)}'),
            trailing: SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<Cart>(
                      builder: (context, value, child) => IconButton(
                          onPressed: () {
                            value.addItem(productId, price, title);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                          ))),
                  Text('$quantity x'),
                  Consumer<Cart>(
                      builder: (context, cart, child) => IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              cart.removeSingleItem(productId);
                            },
                          ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
