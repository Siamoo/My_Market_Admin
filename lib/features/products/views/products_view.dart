import 'package:flutter/material.dart';
import 'package:my_market_admin/core/components/custom_elevated_button.dart';
import 'package:my_market_admin/core/components/custom_image.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String imageUrl =
        'https://pikaso.cdnpk.net/private/production/1994537836/C9afrqSZgCNPBbPoJHM6jAl7Wts3fq7nEKm3AfVd.jpg?token=exp=1778457600~hmac=39fae6cfeb43bded9f5b1833b06dc538fc4dcd8d32464e1e51f1241cf8acfde5';
    return Scaffold(
      appBar: customAppBar(context, 'Products'),
      body: Center(
        child: Row(
          children: [
            CustomImage(width: width*.2, height: height*.2, imageUrl: imageUrl),
            const SizedBox(width: 20  ),
            Column(children: [
              Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
               SizedBox(height: 10,),
              Text('Product Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              SizedBox(height: 10,),
              Text('Product Price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              CustomElevatedButton(width: width, height: height, child: Icon(Icons.edit), onPressed: (){})
            ],),
            const SizedBox(width: 20  ),
            Column(children: [
              Text('Product price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
               SizedBox(height: 10,),
              Text('Product sale', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              SizedBox(height: 10,),
              Text('Product Price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              CustomElevatedButton(width: width, height: height, child: Icon(Icons.comment), onPressed: (){})
            ],)
          ],
        ),
      ),
    );
  }
}
