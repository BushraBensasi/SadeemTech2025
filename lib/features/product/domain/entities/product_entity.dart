class ProductEntity {
final int id;
final String title;
final String description;
final String thumbnail;
final double price;
final double discountPercentage;

ProductEntity({
  required this.id,
  required this.title,
  required this.description,
  required this.thumbnail,
  required this.price,
  required this.discountPercentage,
});
}