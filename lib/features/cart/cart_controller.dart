import 'package:avaliacao_framework_shop/helpers/extensions.dart';
import 'package:avaliacao_framework_shop/models/product.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = _CartController with _$CartController;

abstract class _CartController with Store {
  ObservableList<Product> cartProducts = ObservableList<Product>();

  @observable
  double? cartSum;

  @action
  void calculateCartPrice() {
    double sum = 0;
    for (var i = 0; i < cartProducts.length; i++) {
      sum += cartProducts.map((e) => e.quantity * e.price).toList()[i];
    }
    cartSum = sum;
  }

  @action
  void removeItem(int index) {
    cartProducts.removeAt(index);
    calculateCartPrice();
  }

  @action
  void addCart(Product product) {
    product.quantity++;
    calculateCartPrice();
  }

  @action
  void removeCart(Product product) {
    if (product.quantity > 1) product.quantity--;
    calculateCartPrice();
  }

  @computed
  double get getCartPrice {
    double sum = 0;
    for (var i = 0; i < cartProducts.length; i++) {
      sum += cartProducts.map((e) => e.quantity * e.price).toList()[i];
    }
    return sum;
  }

  @computed
  String get getTotalCartPrice => cartSum != null
      ? cartSum!.formattedMoney()
      : getCartPrice.formattedMoney();
}
