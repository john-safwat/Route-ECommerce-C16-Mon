import 'package:route_e_commerce_v2/features/commerce/data/models/products/pageable_products_response_dto.dart';

class CartResponseDto {
  CartResponseDto({this.status, this.numOfCartItems, this.cartId, this.data});

  CartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? CartDto.fromJson(json['data']) : null;
  }

  String? status;
  num? numOfCartItems;
  String? cartId;
  CartDto? data;

  CartResponseDto copyWith({
    String? status,
    num? numOfCartItems,
    String? cartId,
    CartDto? data,
  }) => CartResponseDto(
    status: status ?? this.status,
    numOfCartItems: numOfCartItems ?? this.numOfCartItems,
    cartId: cartId ?? this.cartId,
    data: data ?? this.data,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class CartDto {
  CartDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  CartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? id;
  String? cartOwner;
  List<ProductDto>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  CartDto copyWith({
    String? id,
    String? cartOwner,
    List<ProductDto>? products,
    String? createdAt,
    String? updatedAt,
    num? v,
    num? totalCartPrice,
  }) => CartDto(
    id: id ?? this.id,
    cartOwner: cartOwner ?? this.cartOwner,
    products: products ?? this.products,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
    totalCartPrice: totalCartPrice ?? this.totalCartPrice,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }
}
