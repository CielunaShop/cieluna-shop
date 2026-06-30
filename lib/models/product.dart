import 'product_category.dart';

class Product {
  final String id;

  final String title;

  final String tagline;

  final ProductCategory category;

  final String description;

  final List<String> images;

  /// Small badges shown below the title
  final List<String> highlights;

  /// Everything included in the purchase
  final List<String> contents;

  /// Technical information
  final String format;
  final String pageSize;
  final int pageCount;

  final int price;

  final String purchaseUrl;

  final bool featured;

  const Product({
    required this.id,
    required this.title,
    required this.tagline,
    required this.category,
    required this.description,
    required this.images,
    required this.highlights,
    required this.contents,
    required this.format,
    required this.pageSize,
    required this.pageCount,
    required this.price,
    required this.purchaseUrl,
    this.featured = false,
  });
}