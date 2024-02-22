import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop/Screens/product_overview_screen.dart';
import 'package:shop/features/authentication/authentication_repository/authentication_repository.dart';
import 'package:shop/features/authentication/screens/Login_or_signup_screen.dart';
import 'package:shop/firebase_options.dart';

import '../Screens/product_detail_screen.dart';
import '../Screens/cart_screen.dart';
import '../Screens/orders_screen.dart';
import '../Screens/user_product_screen.dart';
import '../Screens/edit_product_screen.dart';

import '../providers/products.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepo()));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Cart(),
    ),
    ChangeNotifierProvider.value(
      value: Products(),
    ),
    ChangeNotifierProvider.value(
      value: Orders(),
    )
  ], child: const Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const Center(
        child: CircularProgressIndicator(),
      ),
      routes: {
        ProductOverviewScreen.routeName: (context) =>
            const ProductOverviewScreen(),
        LoginSignupScreen.routeName: (context) => LoginSignupScreen(),
        ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
        OrdersScreen.routeName: (context) => const OrdersScreen(),
        UserProductsScreen.routeName: (context) => const UserProductsScreen(),
        EditProductScreen.routeName: (context) => const EditProductScreen(),
      },
    );
  }
}
