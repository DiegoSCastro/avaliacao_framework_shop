import 'package:avaliacao_framework_shop/features/home/home_controller.dart';
import 'package:avaliacao_framework_shop/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'componets/cart_button.dart';
import 'componets/product_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          if (controller.searchVisible) {
            return CustomTextField(
              onChanged: controller.setSearch,
              initialValue: controller.search,
              autofocus: true,
            );
          }
          return const Text('FrameworkShop');
        }),
        actions: [
          IconButton(
            onPressed: controller.toggleSearchVisible,
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      floatingActionButton: CartButton(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 4),
                itemCount: controller.filteredList.length,
                itemBuilder: (context, index) {
                  final product = controller.filteredList[index];
                  return ProductItem(product: product);
                },
              );
            }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
