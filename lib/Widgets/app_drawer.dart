import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/Screens/product_overview_screen.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:shop/features/authentication/controllers/profile_controller.dart';
import 'package:shop/features/authentication/model_provider/user_model.dart';

import '../Screens/orders_screen.dart';
import '../Screens/user_product_screen.dart';

final control = Get.put(profileController());

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          FutureBuilder(
            future: control.getUserdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userdata = snapshot.data as UserModel;
                  return AppBar(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/bird_2.jpg'),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userdata.name,
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          userdata.phone,
                          style: const TextStyle(fontSize: 13),
                        ),
                        Text(
                          userdata.email,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductOverviewScreen.routeName,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).pushNamed(
                OrdersScreen.routeName,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('My Products'),
            onTap: () {
              Navigator.of(context).pushNamed(
                UserProductsScreen.routeName,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () async {
              await AuthenticationRepo.instance.logout();
            },
          ),
        ],
      ),
    );
  }
}
