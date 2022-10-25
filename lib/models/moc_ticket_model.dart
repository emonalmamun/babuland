// To parse this JSON data, do
//
//     final mocTicketModel = mocTicketModelFromJson(jsonString);

import 'dart:convert';

MocTicketModel mocTicketModelFromJson(String str) => MocTicketModel.fromJson(json.decode(str));

String mocTicketModelToJson(MocTicketModel data) => json.encode(data.toJson());

class MocTicketModel {
  MocTicketModel({
    this.items,
    this.hasMore,
    this.limit,
    this.offset,
    this.count,
    this.links,
  });

  List<Item>? items;
  bool? hasMore;
  int? limit;
  int? offset;
  int? count;
  List<Link>? links;

  factory MocTicketModel.fromJson(Map<String, dynamic> json) => MocTicketModel(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    hasMore: json["hasMore"],
    limit: json["limit"],
    offset: json["offset"],
    count: json["count"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "hasMore": hasMore,
    "limit": limit,
    "offset": offset,
    "count": count,
    "links": List<dynamic>.from(links!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.pk,
    this.customerIdFk,
    this.mobileNumber,
    this.total,
    this.discountAmount,
    this.subTotal,
    this.receivedAmount,
    this.returnAmount,
    this.paymentType,
    this.sellPerson,
    this.bunitFk,
    this.sellDate,
    this.couponCode,
    this.vat,
    this.slType,
    this.trnId,
    this.discountAble,
    this.discountCoupon,
    this.discountPct,
    this.vatableAmt,
    this.netAmt,
    this.appAvil,
    this.unixtimestamp,
    this.usedBranch,
    this.useDate,
    this.startDate,
  });

  int? pk;
  dynamic customerIdFk;
  String? mobileNumber;
  int? total;
  int? discountAmount;
  int? subTotal;
  int? receivedAmount;
  int? returnAmount;
  String? paymentType;
  String? sellPerson;
  int? bunitFk;
  String? sellDate;
  String? couponCode;
  int? vat;
  dynamic slType;
  dynamic trnId;
  int? discountAble;
  String? discountCoupon;
  int? discountPct;
  int? vatableAmt;
  int? netAmt;
  dynamic appAvil;
  dynamic unixtimestamp;
  dynamic usedBranch;
  dynamic useDate;
  dynamic startDate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    pk: json["pk"],
    customerIdFk: json["customer_id_fk"],
    mobileNumber: json["mobile_number"],
    total: json["total"],
    discountAmount: json["discount_amount"],
    subTotal: json["sub_total"],
    receivedAmount: json["received_amount"],
    returnAmount: json["return_amount"],
    paymentType: json["payment_type"],
    sellPerson: json["sell_person"],
    bunitFk: json["bunit_fk"],
    sellDate: json["sell_date"],
    couponCode: json["coupon_code"] == null ? null : json["coupon_code"],
    vat: json["vat"],
    slType: json["sl_type"],
    trnId: json["trn_id"],
    discountAble: json["discount_able"],
    discountCoupon: json["discount_coupon"] == null ? null : json["discount_coupon"],
    discountPct: json["discount_pct"],
    vatableAmt: json["vatable_amt"],
    netAmt: json["net_amt"],
    appAvil: json["app_avil"],
    unixtimestamp: json["unixtimestamp"],
    usedBranch: json["used_branch"],
    useDate: json["use_date"],
    startDate: json["start_date"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "customer_id_fk": customerIdFk,
    "mobile_number": mobileNumber,
    "total": total,
    "discount_amount": discountAmount,
    "sub_total": subTotal,
    "received_amount": receivedAmount,
    "return_amount": returnAmount,
    "payment_type": paymentType,
    "sell_person": sellPerson,
    "bunit_fk": bunitFk,
    "sell_date": sellDate,
    "coupon_code": couponCode == null ? null : couponCode,
    "vat": vat,
    "sl_type": slType,
    "trn_id": trnId,
    "discount_able": discountAble,
    "discount_coupon": discountCoupon == null ? null : discountCoupon,
    "discount_pct": discountPct,
    "vatable_amt": vatableAmt,
    "net_amt": netAmt,
    "app_avil": appAvil,
    "unixtimestamp": unixtimestamp,
    "used_branch": usedBranch,
    "use_date": useDate,
    "start_date": startDate,
  };
}

class Link {
  Link({
    this.rel,
    this.href,
  });

  String? rel;
  String? href;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    rel: json["rel"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "rel": rel,
    "href": href,
  };
}
