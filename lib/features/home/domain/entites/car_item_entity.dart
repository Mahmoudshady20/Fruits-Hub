import 'package:commerce/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quanitty;

  CartItemEntity({required this.productEntity, this.quanitty = 0});

  num calculateTotalPrice() {
    return productEntity.price * quanitty;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quanitty;
  }

  increasQuantity() {
    quanitty++;
  }

  decreasQuantity() {
    quanitty--;
  }

  @override
  List<Object?> get props => [productEntity];
}
