import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/model/HomeModel.dart';

HomeModel $HomeModelFromJson(Map<String, dynamic> json) {
	final HomeModel homeModel = HomeModel();
	final List<Banner>? banners = jsonConvert.convertListNotNull<Banner>(json['banners']);
	if (banners != null) {
		homeModel.banners = banners;
	}
	final List<Product>? products = jsonConvert.convertListNotNull<Product>(json['products']);
	if (products != null) {
		homeModel.products = products;
	}
	final String? ad = jsonConvert.convert<String>(json['ad']);
	if (ad != null) {
		homeModel.ad = ad;
	}
	return homeModel;
}

Map<String, dynamic> $HomeModelToJson(HomeModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['banners'] =  entity.banners.map((v) => v.toJson()).toList();
	data['products'] =  entity.products.map((v) => v.toJson()).toList();
	data['ad'] = entity.ad;
	return data;
}

Banner $BannerFromJson(Map<String, dynamic> json) {
	final Banner banner = Banner();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		banner.id = id;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		banner.image = image;
	}
	final Category? category = jsonConvert.convert<Category>(json['category']);
	if (category != null) {
		banner.category = category;
	}
	final dynamic product = jsonConvert.convert<dynamic>(json['product']);
	if (product != null) {
		banner.product = product;
	}
	return banner;
}

Map<String, dynamic> $BannerToJson(Banner entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['image'] = entity.image;
	data['category'] = entity.category?.toJson();
	data['product'] = entity.product;
	return data;
}

Category $CategoryFromJson(Map<String, dynamic> json) {
	final Category category = Category();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		category.id = id;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		category.image = image;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		category.name = name;
	}
	return category;
}

Map<String, dynamic> $CategoryToJson(Category entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['image'] = entity.image;
	data['name'] = entity.name;
	return data;
}

Product $ProductFromJson(Map<String, dynamic> json) {
	final Product product = Product();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		product.id = id;
	}
	final double? price = jsonConvert.convert<double>(json['price']);
	if (price != null) {
		product.price = price;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		product.image = image;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		product.name = name;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		product.description = description;
	}
	final List<String>? images = jsonConvert.convertListNotNull<String>(json['images']);
	if (images != null) {
		product.images = images;
	}
	final bool? inFavorites = jsonConvert.convert<bool>(json['inFavorites']);
	if (inFavorites != null) {
		product.inFavorites = inFavorites;
	}
	final bool? inCart = jsonConvert.convert<bool>(json['inCart']);
	if (inCart != null) {
		product.inCart = inCart;
	}
	return product;
}

Map<String, dynamic> $ProductToJson(Product entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['price'] = entity.price;
	data['image'] = entity.image;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['images'] =  entity.images;
	data['inFavorites'] = entity.inFavorites;
	data['inCart'] = entity.inCart;
	return data;
}