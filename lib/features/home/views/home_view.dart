import 'package:flutter/material.dart';
import 'package:my_market_admin/core/components/custom_elevated_button.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';
import 'package:my_market_admin/core/functions/navigation_service.dart';
import 'package:my_market_admin/features/products/views/products_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(context, 'Home'),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomElevatedButton(
              width: width * .3,
              height: height * .3,

              onPressed: () {
                NavigationService.pushTo(context, ProductsView());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Products',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.shopping_bag, size: 50),
                ],
              ),
            ),
                        CustomElevatedButton(
              width: width * .3,
              height: height * .3,

              onPressed: () {
                NavigationService.pushTo(context, ProductsView());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Product',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.add, size: 50),
                ],
              ),
            ),
                        CustomElevatedButton(
              width: width * .3,
              height: height * .3,

              onPressed: () {
                NavigationService.pushTo(context, ProductsView());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add An Admin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.admin_panel_settings, size: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
