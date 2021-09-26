import 'package:avaliacao_framework_shop/features/cart/cart_controller.dart';
import 'package:avaliacao_framework_shop/models/product.dart';
import 'package:avaliacao_framework_shop/repositories/pdf_api.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'checkout_controller.g.dart';

class CheckoutController = _CheckoutController with _$CheckoutController;

abstract class _CheckoutController with Store {
  final cartController = GetIt.I<CartController>();

  @action
  Future<void> generatePdfAndOpenFile() async {
    final List<Product> cartList = [];
    cartList.addAll(cartController.cartProducts);
    final pdfFile = await PdfApi.generatePdfCoupon(
        'Minhas Compras no Framework Shop', cartList);
    PdfApi.openFile(pdfFile);
  }

  @action
  Future<void> generatePdfAndShare() async {
    final List<Product> cartList = [];
    cartList.addAll(cartController.cartProducts);
    final pdfFile = await PdfApi.generatePdfCoupon(
        'Minhas Compras no Framework Shop', cartList);
    PdfApi.shareFile(pdfFile);
  }

  @action
  void refreshCart() {
    cartController.cartProducts.clear();
  }
}
