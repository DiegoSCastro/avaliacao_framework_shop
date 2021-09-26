import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:avaliacao_framework_shop/app_styles/app_text_styles.dart';
import 'package:avaliacao_framework_shop/helpers/extensions.dart';
import 'package:avaliacao_framework_shop/models/product.dart';
import 'package:avaliacao_framework_shop/widgets/quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../cart_controller.dart';

class CartListItem extends StatefulWidget {
  final Product product;
  final int index;

  const CartListItem({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  final cartController = GetIt.I<CartController>();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (v) {
        cartController.removeItem(widget.index);
      },
      background: Container(
        padding: const EdgeInsets.only(right: 8),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.delete,
          color: AppColors.white,
          size: 40,
        ),
      ),
      key: widget.key!,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        height: 110,
        width: double.infinity,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  widget.product.imageAsset,
                  height: 56,
                  width: 56,
                ),
                Text(
                  widget.product.name,
                  style: AppTextStyles.bodyText1,
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.product.price.formattedMoney(),
                        style: AppTextStyles.bodyText1,
                      ),
                      Text(
                        ' X ${widget.product.quantity} kg',
                        style: AppTextStyles.bodyText1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuantityButton.remove(
                        color: AppColors.purple,
                        onTap: () {
                          setState(() {
                            cartController.removeCart(widget.product);
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      QuantityButton.add(
                        color: AppColors.purple,
                        onTap: () {
                          setState(() {
                            cartController.addCart(widget.product);
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total',
                  style: AppTextStyles.bodyText1,
                ),
                const SizedBox(height: 8),
                Text(
                  (widget.product.quantity * widget.product.price)
                      .formattedMoney(),
                  style: AppTextStyles.bodyText1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
