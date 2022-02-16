class CartEntity {
  final String id;
  final String delivery;
  final int total;
  final List<BasketEntity> basket;

  const CartEntity({
    required this.id,
    required this.delivery,
    required this.total,
    required this.basket,
  });
}

class BasketEntity {
  final int id;
  final String images;
  final int price;
  final String title;

  const BasketEntity({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });
}
