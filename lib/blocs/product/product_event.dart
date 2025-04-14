abstract class ProductEvent {}

class FetchProductsByCategory extends ProductEvent {
  final String category;

  FetchProductsByCategory(this.category);
}
