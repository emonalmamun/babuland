// To parse this JSON data, do
//
//     final myTicketModel = myTicketModelFromJson(jsonString);

import 'dart:convert';

MyTicketModel myTicketModelFromJson(String str) => MyTicketModel.fromJson(json.decode(str));

String myTicketModelToJson(MyTicketModel data) => json.encode(data.toJson());

class MyTicketModel {
  MyTicketModel({
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

  factory MyTicketModel.fromJson(Map<String, dynamic> json) => MyTicketModel(
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
    this.iteminfoFk,
    this.tslmsFk,
    this.dsc,
    this.tp,
    this.mrp,
    this.qty,
    this.discount,
    this.vat,
    this.bunitFk,
    this.isCombo,
    this.appAvail,
    this.msmasteridOffersid,
  });

  int? pk;
  int? iteminfoFk;
  int? tslmsFk;
  String? dsc;
  int? tp;
  int? mrp;
  int? qty;
  int? discount;
  int? vat;
  int? bunitFk;
  int? isCombo;
  dynamic appAvail;
  String? msmasteridOffersid;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    pk: json["pk"],
    iteminfoFk: json["iteminfo_fk"],
    tslmsFk: json["tslms_fk"],
    dsc: json["dsc"],
    tp: json["tp"],
    mrp: json["mrp"],
    qty: json["qty"],
    discount: json["discount"],
    vat: json["vat"],
    bunitFk: json["bunit_fk"],
    isCombo: json["is_combo"],
    appAvail: json["app_avail"],
    msmasteridOffersid: json["msmasterid_offersid"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "iteminfo_fk": iteminfoFk,
    "tslms_fk": tslmsFk,
    "dsc": dsc,
    "tp": tp,
    "mrp": mrp,
    "qty": qty,
    "discount": discount,
    "vat": vat,
    "bunit_fk": bunitFk,
    "is_combo": isCombo,
    "app_avail": appAvail,
    "msmasterid_offersid": msmasteridOffersid,
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
