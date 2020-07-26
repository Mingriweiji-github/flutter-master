import 'product.dart';

class ProductRespository {
  static const _allProducts = <Product>[
    Product(
        cateroty: Category.accessories,
        id: 0,
        isFeatured: true,
        name: "AAA",
        price: 120
    ),
    Product(
      cateroty: Category.home,
      id: 9,
      isFeatured: true,
      name: "Desk",
      price: 29,
    ),
    Product(cateroty: Category.clothing,
        id: 33,
        isFeatured: true,
        name: "Tee",
        price: 42
    ),
  ];

  static List<Product> loadProducts(Category category) {
    if (category == Category.all) {
      return _allProducts;
    } else {
      return _allProducts.where((p) => p.cateroty == category).toList();
    }
  }
}