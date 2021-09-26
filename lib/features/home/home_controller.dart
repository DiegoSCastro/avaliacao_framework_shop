import 'package:avaliacao_framework_shop/helpers/extensions.dart';
import 'package:avaliacao_framework_shop/models/product.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController() {
    productsList.addAll(products);
  }

  ObservableList<Product> productsList = ObservableList<Product>();

  ObservableList<Product> get filteredList => ObservableList.of(search != ''
      ? productsList.where((p) => p.name
          .toLowerCase()
          .withoutDiacriticalMarks
          .contains(search.toLowerCase().withoutDiacriticalMarks))
      : productsList);

  @observable
  String search = '';
  @action
  setSearch(String value) => search = value;

  @observable
  bool searchVisible = false;
  @action
  toggleSearchVisible() => searchVisible = !searchVisible;
}
