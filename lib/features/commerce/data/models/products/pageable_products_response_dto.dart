class PageableProductsResponseDto {
  PageableProductsResponseDto({this.results, this.metadata, this.data});

  PageableProductsResponseDto.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }

  num? results;
  Metadata? metadata;
  List<ProductDto>? data;

  PageableProductsResponseDto copyWith({
    num? results,
    Metadata? metadata,
    List<ProductDto>? data,
  }) => PageableProductsResponseDto(
    results: results ?? this.results,
    metadata: metadata ?? this.metadata,
    data: data ?? this.data,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductDto {
  ProductDto({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.ratingsAverage,
    this.createdAt,
    this.count,
    this.updatedAt,
  });

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    count = json['count'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    ratingsQuantity = json['ratingsQuantity'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    imageCover = json['imageCover'];
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['_id'];
  }

  num? sold;
  num? count;
  List<String>? images;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductDto copyWith({
    num? sold,
    List<String>? images,
    num? ratingsQuantity,
    String? id,
    String? title,
    String? slug,
    String? description,
    num? quantity,
    num? price,
    num? priceAfterDiscount,
    String? imageCover,
    num? ratingsAverage,
    String? createdAt,
    String? updatedAt,
  }) => ProductDto(
    sold: sold ?? this.sold,
    images: images ?? this.images,
    ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
    id: id ?? this.id,
    title: title ?? this.title,
    slug: slug ?? this.slug,
    description: description ?? this.description,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    imageCover: imageCover ?? this.imageCover,
    ratingsAverage: ratingsAverage ?? this.ratingsAverage,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['imageCover'] = imageCover;
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    return map;
  }
}

class Metadata {
  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  num? currentPage;
  num? numberOfPages;
  num? limit;

  Metadata copyWith({num? currentPage, num? numberOfPages, num? limit}) =>
      Metadata(
        currentPage: currentPage ?? this.currentPage,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        limit: limit ?? this.limit,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
