class OrdersModel {
  String? ordersId;
  String? ordersUserid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersCoupon;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersPaymentmethod;
  String? ordersTotalprice;
  String? ordersStatues;
  String? ordersDatetime;
  String? addressId;
  String? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;

  OrdersModel(
      {this.ordersId,
        this.ordersUserid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersCoupon,
        this.ordersRating,
        this.ordersNoterating,
        this.ordersPaymentmethod,
        this.ordersTotalprice,
        this.ordersStatues,
        this.ordersDatetime,
        this.addressId,
        this.addressUserid,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLang});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersTotalprice = json['orders_totalprice'];
    ordersStatues = json['orders_statues'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_statues'] = ordersStatues;
    data['orders_datetime'] = ordersDatetime;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_lang'] = addressLang;
    return data;
  }
}
