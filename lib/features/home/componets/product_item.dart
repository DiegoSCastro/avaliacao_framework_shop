import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:avaliacao_framework_shop/app_styles/app_text_styles.dart';
import 'package:avaliacao_framework_shop/features/home/product_details/product_details_screen.dart';
import 'package:avaliacao_framework_shop/helpers/extensions.dart';
import 'package:avaliacao_framework_shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Container()),
              Hero(
                tag: product.imageAsset,
                child: Image.asset(
                  product.imageAsset,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    product.name,
                    style: AppTextStyles.textTitle2,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    product.price.formattedMoney(),
                    style: AppTextStyles.bodyText1,
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
