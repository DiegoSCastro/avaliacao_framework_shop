import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:avaliacao_framework_shop/app_styles/app_text_styles.dart';
import 'package:avaliacao_framework_shop/features/home/product_details/product_details_controller.dart';
import 'package:avaliacao_framework_shop/helpers/extensions.dart';
import 'package:avaliacao_framework_shop/models/product.dart';
import 'package:avaliacao_framework_shop/widgets/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = ProductDetailsController(product: product);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name + ' - ${product.price.formattedMoney()}/kg'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: AppColors.white,
                  height: 300,
                  width: double.infinity,
                  child: Hero(
                    tag: product.imageAsset,
                    child: Image.asset(
                      product.imageAsset,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15,
                  left: (size.width / 2) - 100,
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(32)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        QuantityButton.remove(
                          onTap: controller.decrement,
                        ),
                        Observer(builder: (_) {
                          return Text(
                            controller.quantity.toString(),
                            style: AppTextStyles.textButtonWhite,
                          );
                        }),
                        QuantityButton.add(
                          onTap: controller.increment,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 60),
            _buildAddButton(controller, context)
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(
      ProductDetailsController controller, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(32),
        child: InkWell(
          onTap: () {
            controller.addToCart(context);
          },
          borderRadius: BorderRadius.circular(32),
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.add_shopping_cart,
                  color: AppColors.white,
                ),
                Text(
                  'Adicionar',
                  style: AppTextStyles.textButtonWhite,
                ),
                Observer(builder: (_) {
                  return Text(
                    controller.getSumPrice.formattedMoney(),
                    style: AppTextStyles.textButtonWhite,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
