import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:avaliacao_framework_shop/app_styles/app_text_styles.dart';
import 'package:avaliacao_framework_shop/features/checkout/checkout_controller.dart';
import 'package:avaliacao_framework_shop/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  final checkoutController = CheckoutController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Pedido realizado com Sucesso',
              style: AppTextStyles.textTitle3,
              textAlign: TextAlign.center,
            ),
          ),
          const Icon(
            Icons.check,
            color: AppColors.green,
            size: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                child: CustomButton(
                    color: AppColors.pink,
                    labelText: 'Nova Compra',
                    onTap: () {
                      checkoutController.refreshCart();
                      Navigator.popUntil(context, ModalRoute.withName('/home'));
                    }),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 48,
                    child: CustomButton(
                      labelText: 'Abrir PDF',
                      onTap: () {
                        checkoutController.generatePdfAndOpenFile();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 48,
                    child: CustomButton(
                      labelText: 'Compartilhar PDF',
                      onTap: () {
                        checkoutController.generatePdfAndShare();
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
