import 'package:flutter/material.dart';
import 'package:my_market_admin/core/components/custom_elevated_button.dart';
import 'package:my_market_admin/core/components/custom_network_image.dart';
import 'package:my_market_admin/core/components/custom_text_form_field.dart';
import 'package:my_market_admin/core/functions/custom_appbar.dart';
import 'package:my_market_admin/core/functions/shared_pref.dart';

class EditProductsView extends StatefulWidget {
  const EditProductsView({super.key});

  @override
  State<EditProductsView> createState() => _EditProductsViewState();
}

class _EditProductsViewState extends State<EditProductsView> {
  String selectedValue = 'collections';
  String sale = '10';
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController oldPriceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(context, 'Edit Products'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownMenu(
                  onSelected: (String? value) {
                    setState(() {
                      selectedValue = value ?? 'collections';
                    });
                  },
                  initialSelection: selectedValue,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      label: 'collections',
                      value: 'collections',
                    ),
                    DropdownMenuEntry(
                      label: 'electronics',
                      value: 'electronics',
                    ),
                    DropdownMenuEntry(label: 'sports', value: 'sports'),
                    DropdownMenuEntry(label: 'books', value: 'books'),
                    DropdownMenuEntry(label: 'games', value: 'games'),
                    DropdownMenuEntry(label: 'cars', value: 'cars'),
                  ],
                ),

                Column(
                  children: [
                    Text('Sale', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('$sale %'),
                  ],
                ),
                Column(
                  children: [
                    CustomNetworkImage(
                      width: width * .4,
                      height: height * .4,
                      imageUrl:
                          'data:image/jpeg;base64,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',
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CustomElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.image),
                        ),
                        SizedBox(width: 10),
                        CustomElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.upload_file_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 60),
            CustomTextFormField(
              labelText: 'Product Name',
              controller: productNameController,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'New Price',
              controller: priceController,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'Old Price',
              controller: oldPriceController,
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'Product Description',
              controller: descriptionController,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomElevatedButton(
                width: width * .1,
                height: height * .05,
                child: const Text('Update'),
                onPressed: () async {
                  String? token = await SharedPref.getToken();
                  print('token $token');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    productNameController.dispose();
    priceController.dispose();
    oldPriceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
