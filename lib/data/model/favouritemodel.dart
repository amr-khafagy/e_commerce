class FavouritesModel {
  String? favouriteId;
  String? favouriteUserid;
  String? favouriteItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsRating;
  String? itemsDate;
  String? itemsCat;
  String? id;

  FavouritesModel(
      {this.favouriteId,
        this.favouriteUserid,
        this.favouriteItemsid,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsRating,
        this.itemsDate,
        this.itemsCat,
        this.id});

  FavouritesModel.fromJson(Map<String, dynamic> json) {
    favouriteId = json['favourite_id'];
    favouriteUserid = json['favourite_userid'];
    favouriteItemsid = json['favourite_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsRating = json['items_rating'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['favourite_id'] = favouriteId;
    data['favourite_userid'] = favouriteUserid;
    data['favourite_itemsid'] = favouriteItemsid;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_rating'] = itemsRating;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['id'] = id;
    return data;
  }
}
