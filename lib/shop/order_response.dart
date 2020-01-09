// To parse this JSON data, do
//
//     final orderResponseFinal = orderResponseFinalFromJson(jsonString);

import 'dart:convert';

OrderResponseFinal orderResponseFinalFromJson(String str) =>
    OrderResponseFinal.fromJson(json.decode(str));

String orderResponseFinalToJson(OrderResponseFinal data) =>
    json.encode(data.toJson());

class OrderResponseFinal {
  bool success;
  Order order;

  OrderResponseFinal({
    this.success,
    this.order,
  });

  factory OrderResponseFinal.fromJson(Map<String, dynamic> json) =>
      OrderResponseFinal(
        success: json["success"],
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "order": order.toJson(),
      };
}

class Order {
  int id;
  String status;
  String statusLabel;
  String channelName;
  int isGuest;
  String customerEmail;
  String customerFirstName;
  String customerLastName;
  dynamic shippingMethod;
  dynamic shippingTitle;
  String paymentTitle;
  dynamic shippingDescription;
  dynamic couponCode;
  dynamic isGift;
  int totalItemCount;
  String totalQtyOrdered;
  String baseCurrencyCode;
  String channelCurrencyCode;
  String orderCurrencyCode;
  String grandTotal;
  String formatedGrandTotal;
  String baseGrandTotal;
  String formatedBaseGrandTotal;
  dynamic grandTotalInvoiced;
  String formatedGrandTotalInvoiced;
  dynamic baseGrandTotalInvoiced;
  String formatedBaseGrandTotalInvoiced;
  dynamic grandTotalRefunded;
  String formatedGrandTotalRefunded;
  dynamic baseGrandTotalRefunded;
  String formatedBaseGrandTotalRefunded;
  String subTotal;
  String formatedSubTotal;
  String baseSubTotal;
  String formatedBaseSubTotal;
  dynamic subTotalInvoiced;
  String formatedSubTotalInvoiced;
  dynamic baseSubTotalInvoiced;
  String formatedBaseSubTotalInvoiced;
  dynamic subTotalRefunded;
  String formatedSubTotalRefunded;
  dynamic discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  dynamic discountInvoiced;
  String formatedDiscountInvoiced;
  dynamic baseDiscountInvoiced;
  String formatedBaseDiscountInvoiced;
  dynamic discountRefunded;
  String formatedDiscountRefunded;
  dynamic baseDiscountRefunded;
  String formatedBaseDiscountRefunded;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  dynamic taxAmountInvoiced;
  String formatedTaxAmountInvoiced;
  dynamic baseTaxAmountInvoiced;
  String formatedBaseTaxAmountInvoiced;
  dynamic taxAmountRefunded;
  String formatedTaxAmountRefunded;
  dynamic baseTaxAmountRefunded;
  String formatedBaseTaxAmountRefunded;
  dynamic shippingAmount;
  String formatedShippingAmount;
  dynamic baseShippingAmount;
  String formatedBaseShippingAmount;
  dynamic shippingInvoiced;
  String formatedShippingInvoiced;
  dynamic baseShippingInvoiced;
  String formatedBaseShippingInvoiced;
  dynamic shippingRefunded;
  String formatedShippingRefunded;
  dynamic baseShippingRefunded;
  String formatedBaseShippingRefunded;
  Customer customer;
  Channel channel;
  IngAddress shippingAddress;
  IngAddress billingAddress;
  AtedAt updatedAt;
  List<Item> items;
  List<dynamic> invoices;
  List<dynamic> shipments;
  AtedAt createdAt;

  Order({
    this.id,
    this.status,
    this.statusLabel,
    this.channelName,
    this.isGuest,
    this.customerEmail,
    this.customerFirstName,
    this.customerLastName,
    this.shippingMethod,
    this.shippingTitle,
    this.paymentTitle,
    this.shippingDescription,
    this.couponCode,
    this.isGift,
    this.totalItemCount,
    this.totalQtyOrdered,
    this.baseCurrencyCode,
    this.channelCurrencyCode,
    this.orderCurrencyCode,
    this.grandTotal,
    this.formatedGrandTotal,
    this.baseGrandTotal,
    this.formatedBaseGrandTotal,
    this.grandTotalInvoiced,
    this.formatedGrandTotalInvoiced,
    this.baseGrandTotalInvoiced,
    this.formatedBaseGrandTotalInvoiced,
    this.grandTotalRefunded,
    this.formatedGrandTotalRefunded,
    this.baseGrandTotalRefunded,
    this.formatedBaseGrandTotalRefunded,
    this.subTotal,
    this.formatedSubTotal,
    this.baseSubTotal,
    this.formatedBaseSubTotal,
    this.subTotalInvoiced,
    this.formatedSubTotalInvoiced,
    this.baseSubTotalInvoiced,
    this.formatedBaseSubTotalInvoiced,
    this.subTotalRefunded,
    this.formatedSubTotalRefunded,
    this.discountPercent,
    this.discountAmount,
    this.formatedDiscountAmount,
    this.baseDiscountAmount,
    this.formatedBaseDiscountAmount,
    this.discountInvoiced,
    this.formatedDiscountInvoiced,
    this.baseDiscountInvoiced,
    this.formatedBaseDiscountInvoiced,
    this.discountRefunded,
    this.formatedDiscountRefunded,
    this.baseDiscountRefunded,
    this.formatedBaseDiscountRefunded,
    this.taxAmount,
    this.formatedTaxAmount,
    this.baseTaxAmount,
    this.formatedBaseTaxAmount,
    this.taxAmountInvoiced,
    this.formatedTaxAmountInvoiced,
    this.baseTaxAmountInvoiced,
    this.formatedBaseTaxAmountInvoiced,
    this.taxAmountRefunded,
    this.formatedTaxAmountRefunded,
    this.baseTaxAmountRefunded,
    this.formatedBaseTaxAmountRefunded,
    this.shippingAmount,
    this.formatedShippingAmount,
    this.baseShippingAmount,
    this.formatedBaseShippingAmount,
    this.shippingInvoiced,
    this.formatedShippingInvoiced,
    this.baseShippingInvoiced,
    this.formatedBaseShippingInvoiced,
    this.shippingRefunded,
    this.formatedShippingRefunded,
    this.baseShippingRefunded,
    this.formatedBaseShippingRefunded,
    this.customer,
    this.channel,
    this.shippingAddress,
    this.billingAddress,
    this.updatedAt,
    this.items,
    this.invoices,
    this.shipments,
    this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
        statusLabel: json["status_label"],
        channelName: json["channel_name"],
        isGuest: json["is_guest"],
        customerEmail: json["customer_email"],
        customerFirstName: json["customer_first_name"],
        customerLastName: json["customer_last_name"],
        shippingMethod: json["shipping_method"],
        shippingTitle: json["shipping_title"],
        paymentTitle: json["payment_title"],
        shippingDescription: json["shipping_description"],
        couponCode: json["coupon_code"],
        isGift: json["is_gift"],
        totalItemCount: json["total_item_count"],
        totalQtyOrdered: json["total_qty_ordered"],
        baseCurrencyCode: json["base_currency_code"],
        channelCurrencyCode: json["channel_currency_code"],
        orderCurrencyCode: json["order_currency_code"],
        grandTotal: json["grand_total"],
        formatedGrandTotal: json["formated_grand_total"],
        baseGrandTotal: json["base_grand_total"],
        formatedBaseGrandTotal: json["formated_base_grand_total"],
        grandTotalInvoiced: json["grand_total_invoiced"],
        formatedGrandTotalInvoiced: json["formated_grand_total_invoiced"],
        baseGrandTotalInvoiced: json["base_grand_total_invoiced"],
        formatedBaseGrandTotalInvoiced:
            json["formated_base_grand_total_invoiced"],
        grandTotalRefunded: json["grand_total_refunded"],
        formatedGrandTotalRefunded: json["formated_grand_total_refunded"],
        baseGrandTotalRefunded: json["base_grand_total_refunded"],
        formatedBaseGrandTotalRefunded:
            json["formated_base_grand_total_refunded"],
        subTotal: json["sub_total"],
        formatedSubTotal: json["formated_sub_total"],
        baseSubTotal: json["base_sub_total"],
        formatedBaseSubTotal: json["formated_base_sub_total"],
        subTotalInvoiced: json["sub_total_invoiced"],
        formatedSubTotalInvoiced: json["formated_sub_total_invoiced"],
        baseSubTotalInvoiced: json["base_sub_total_invoiced"],
        formatedBaseSubTotalInvoiced: json["formated_base_sub_total_invoiced"],
        subTotalRefunded: json["sub_total_refunded"],
        formatedSubTotalRefunded: json["formated_sub_total_refunded"],
        discountPercent: json["discount_percent"],
        discountAmount: json["discount_amount"],
        formatedDiscountAmount: json["formated_discount_amount"],
        baseDiscountAmount: json["base_discount_amount"],
        formatedBaseDiscountAmount: json["formated_base_discount_amount"],
        discountInvoiced: json["discount_invoiced"],
        formatedDiscountInvoiced: json["formated_discount_invoiced"],
        baseDiscountInvoiced: json["base_discount_invoiced"],
        formatedBaseDiscountInvoiced: json["formated_base_discount_invoiced"],
        discountRefunded: json["discount_refunded"],
        formatedDiscountRefunded: json["formated_discount_refunded"],
        baseDiscountRefunded: json["base_discount_refunded"],
        formatedBaseDiscountRefunded: json["formated_base_discount_refunded"],
        taxAmount: json["tax_amount"],
        formatedTaxAmount: json["formated_tax_amount"],
        baseTaxAmount: json["base_tax_amount"],
        formatedBaseTaxAmount: json["formated_base_tax_amount"],
        taxAmountInvoiced: json["tax_amount_invoiced"],
        formatedTaxAmountInvoiced: json["formated_tax_amount_invoiced"],
        baseTaxAmountInvoiced: json["base_tax_amount_invoiced"],
        formatedBaseTaxAmountInvoiced:
            json["formated_base_tax_amount_invoiced"],
        taxAmountRefunded: json["tax_amount_refunded"],
        formatedTaxAmountRefunded: json["formated_tax_amount_refunded"],
        baseTaxAmountRefunded: json["base_tax_amount_refunded"],
        formatedBaseTaxAmountRefunded:
            json["formated_base_tax_amount_refunded"],
        shippingAmount: json["shipping_amount"],
        formatedShippingAmount: json["formated_shipping_amount"],
        baseShippingAmount: json["base_shipping_amount"],
        formatedBaseShippingAmount: json["formated_base_shipping_amount"],
        shippingInvoiced: json["shipping_invoiced"],
        formatedShippingInvoiced: json["formated_shipping_invoiced"],
        baseShippingInvoiced: json["base_shipping_invoiced"],
        formatedBaseShippingInvoiced: json["formated_base_shipping_invoiced"],
        shippingRefunded: json["shipping_refunded"],
        formatedShippingRefunded: json["formated_shipping_refunded"],
        baseShippingRefunded: json["base_shipping_refunded"],
        formatedBaseShippingRefunded: json["formated_base_shipping_refunded"],
        customer: Customer.fromJson(json["customer"]),
        channel: Channel.fromJson(json["channel"]),
        shippingAddress: IngAddress.fromJson(json["shipping_address"]),
        billingAddress: IngAddress.fromJson(json["billing_address"]),
        updatedAt: AtedAt.fromJson(json["updated_at"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        invoices: List<dynamic>.from(json["invoices"].map((x) => x)),
        shipments: List<dynamic>.from(json["shipments"].map((x) => x)),
        createdAt: AtedAt.fromJson(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "status_label": statusLabel,
        "channel_name": channelName,
        "is_guest": isGuest,
        "customer_email": customerEmail,
        "customer_first_name": customerFirstName,
        "customer_last_name": customerLastName,
        "shipping_method": shippingMethod,
        "shipping_title": shippingTitle,
        "payment_title": paymentTitle,
        "shipping_description": shippingDescription,
        "coupon_code": couponCode,
        "is_gift": isGift,
        "total_item_count": totalItemCount,
        "total_qty_ordered": totalQtyOrdered,
        "base_currency_code": baseCurrencyCode,
        "channel_currency_code": channelCurrencyCode,
        "order_currency_code": orderCurrencyCode,
        "grand_total": grandTotal,
        "formated_grand_total": formatedGrandTotal,
        "base_grand_total": baseGrandTotal,
        "formated_base_grand_total": formatedBaseGrandTotal,
        "grand_total_invoiced": grandTotalInvoiced,
        "formated_grand_total_invoiced": formatedGrandTotalInvoiced,
        "base_grand_total_invoiced": baseGrandTotalInvoiced,
        "formated_base_grand_total_invoiced": formatedBaseGrandTotalInvoiced,
        "grand_total_refunded": grandTotalRefunded,
        "formated_grand_total_refunded": formatedGrandTotalRefunded,
        "base_grand_total_refunded": baseGrandTotalRefunded,
        "formated_base_grand_total_refunded": formatedBaseGrandTotalRefunded,
        "sub_total": subTotal,
        "formated_sub_total": formatedSubTotal,
        "base_sub_total": baseSubTotal,
        "formated_base_sub_total": formatedBaseSubTotal,
        "sub_total_invoiced": subTotalInvoiced,
        "formated_sub_total_invoiced": formatedSubTotalInvoiced,
        "base_sub_total_invoiced": baseSubTotalInvoiced,
        "formated_base_sub_total_invoiced": formatedBaseSubTotalInvoiced,
        "sub_total_refunded": subTotalRefunded,
        "formated_sub_total_refunded": formatedSubTotalRefunded,
        "discount_percent": discountPercent,
        "discount_amount": discountAmount,
        "formated_discount_amount": formatedDiscountAmount,
        "base_discount_amount": baseDiscountAmount,
        "formated_base_discount_amount": formatedBaseDiscountAmount,
        "discount_invoiced": discountInvoiced,
        "formated_discount_invoiced": formatedDiscountInvoiced,
        "base_discount_invoiced": baseDiscountInvoiced,
        "formated_base_discount_invoiced": formatedBaseDiscountInvoiced,
        "discount_refunded": discountRefunded,
        "formated_discount_refunded": formatedDiscountRefunded,
        "base_discount_refunded": baseDiscountRefunded,
        "formated_base_discount_refunded": formatedBaseDiscountRefunded,
        "tax_amount": taxAmount,
        "formated_tax_amount": formatedTaxAmount,
        "base_tax_amount": baseTaxAmount,
        "formated_base_tax_amount": formatedBaseTaxAmount,
        "tax_amount_invoiced": taxAmountInvoiced,
        "formated_tax_amount_invoiced": formatedTaxAmountInvoiced,
        "base_tax_amount_invoiced": baseTaxAmountInvoiced,
        "formated_base_tax_amount_invoiced": formatedBaseTaxAmountInvoiced,
        "tax_amount_refunded": taxAmountRefunded,
        "formated_tax_amount_refunded": formatedTaxAmountRefunded,
        "base_tax_amount_refunded": baseTaxAmountRefunded,
        "formated_base_tax_amount_refunded": formatedBaseTaxAmountRefunded,
        "shipping_amount": shippingAmount,
        "formated_shipping_amount": formatedShippingAmount,
        "base_shipping_amount": baseShippingAmount,
        "formated_base_shipping_amount": formatedBaseShippingAmount,
        "shipping_invoiced": shippingInvoiced,
        "formated_shipping_invoiced": formatedShippingInvoiced,
        "base_shipping_invoiced": baseShippingInvoiced,
        "formated_base_shipping_invoiced": formatedBaseShippingInvoiced,
        "shipping_refunded": shippingRefunded,
        "formated_shipping_refunded": formatedShippingRefunded,
        "base_shipping_refunded": baseShippingRefunded,
        "formated_base_shipping_refunded": formatedBaseShippingRefunded,
        "customer": customer.toJson(),
        "channel": channel.toJson(),
        "shipping_address": shippingAddress.toJson(),
        "billing_address": billingAddress.toJson(),
        "updated_at": updatedAt.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "invoices": List<dynamic>.from(invoices.map((x) => x)),
        "shipments": List<dynamic>.from(shipments.map((x) => x)),
        "created_at": createdAt.toJson(),
      };
}

class IngAddress {
  int id;
  String email;
  String firstName;
  String lastName;
  List<String> address1;
  String country;
  String countryName;
  String state;
  String city;
  String postcode;
  String phone;
  AtedAt createdAt;
  AtedAt updatedAt;

  IngAddress({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.address1,
    this.country,
    this.countryName,
    this.state,
    this.city,
    this.postcode,
    this.phone,
    this.createdAt,
    this.updatedAt,
  });

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address1: List<String>.from(json["address1"].map((x) => x)),
        country: json["country"],
        countryName: json["country_name"],
        state: json["state"],
        city: json["city"],
        postcode: json["postcode"],
        phone: json["phone"],
        createdAt: AtedAt.fromJson(json["created_at"]),
        updatedAt: AtedAt.fromJson(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "address1": List<dynamic>.from(address1.map((x) => x)),
        "country": country,
        "country_name": countryName,
        "state": state,
        "city": city,
        "postcode": postcode,
        "phone": phone,
        "created_at": createdAt.toJson(),
        "updated_at": updatedAt.toJson(),
      };
}

class AtedAt {
  DateTime date;
  int timezoneType;
  Timezone timezone;

  AtedAt({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: timezoneValues.map[json["timezone"]],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezoneValues.reverse[timezone],
      };
}

enum Timezone { ASIA_KOLKATA }

final timezoneValues = EnumValues({"Asia/Kolkata": Timezone.ASIA_KOLKATA});

class Channel {
  int id;
  String code;
  String name;
  dynamic description;
  dynamic timezone;
  dynamic theme;
  String homePageContent;
  String footerContent;
  dynamic hostname;
  dynamic logo;
  dynamic logoUrl;
  dynamic favicon;
  dynamic faviconUrl;
  DefaultLocale defaultLocale;
  int rootCategoryId;
  RootCategory rootCategory;
  dynamic createdAt;
  dynamic updatedAt;

  Channel({
    this.id,
    this.code,
    this.name,
    this.description,
    this.timezone,
    this.theme,
    this.homePageContent,
    this.footerContent,
    this.hostname,
    this.logo,
    this.logoUrl,
    this.favicon,
    this.faviconUrl,
    this.defaultLocale,
    this.rootCategoryId,
    this.rootCategory,
    this.createdAt,
    this.updatedAt,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        timezone: json["timezone"],
        theme: json["theme"],
        homePageContent: json["home_page_content"],
        footerContent: json["footer_content"],
        hostname: json["hostname"],
        logo: json["logo"],
        logoUrl: json["logo_url"],
        favicon: json["favicon"],
        faviconUrl: json["favicon_url"],
        defaultLocale: DefaultLocale.fromJson(json["default_locale"]),
        rootCategoryId: json["root_category_id"],
        rootCategory: RootCategory.fromJson(json["root_category"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "description": description,
        "timezone": timezone,
        "theme": theme,
        "home_page_content": homePageContent,
        "footer_content": footerContent,
        "hostname": hostname,
        "logo": logo,
        "logo_url": logoUrl,
        "favicon": favicon,
        "favicon_url": faviconUrl,
        "default_locale": defaultLocale.toJson(),
        "root_category_id": rootCategoryId,
        "root_category": rootCategory.toJson(),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class DefaultLocale {
  int id;
  String code;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  DefaultLocale({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory DefaultLocale.fromJson(Map<String, dynamic> json) => DefaultLocale(
        id: json["id"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code == null ? null : code,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class RootCategory {
  int id;
  dynamic code;
  String name;
  String slug;
  String displayMode;
  String description;
  String metaTitle;
  String metaDescription;
  String metaKeywords;
  int status;
  dynamic imageUrl;
  AtedAt createdAt;
  AtedAt updatedAt;

  RootCategory({
    this.id,
    this.code,
    this.name,
    this.slug,
    this.displayMode,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.status,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory RootCategory.fromJson(Map<String, dynamic> json) => RootCategory(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        slug: json["slug"],
        displayMode: json["display_mode"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        status: json["status"],
        imageUrl: json["image_url"],
        createdAt: AtedAt.fromJson(json["created_at"]),
        updatedAt: AtedAt.fromJson(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "slug": slug,
        "display_mode": displayMode,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "status": status,
        "image_url": imageUrl,
        "created_at": createdAt.toJson(),
        "updated_at": updatedAt.toJson(),
      };
}

class Customer {
  int id;
  String email;
  String firstName;
  String lastName;
  String name;
  dynamic gender;
  dynamic dateOfBirth;
  dynamic phone;
  int status;
  DefaultLocale group;
  AtedAt createdAt;
  AtedAt updatedAt;

  Customer({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.phone,
    this.status,
    this.group,
    this.createdAt,
    this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        phone: json["phone"],
        status: json["status"],
        group: DefaultLocale.fromJson(json["group"]),
        createdAt: AtedAt.fromJson(json["created_at"]),
        updatedAt: AtedAt.fromJson(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "phone": phone,
        "status": status,
        "group": group.toJson(),
        "created_at": createdAt.toJson(),
        "updated_at": updatedAt.toJson(),
      };
}

class Item {
  int id;
  String sku;
  String type;
  String name;
  Product product;
  dynamic couponCode;
  String weight;
  String totalWeight;
  int qtyOrdered;
  int qtyCanceled;
  int qtyInvoiced;
  int qtyShipped;
  int qtyRefunded;
  String price;
  String formatedPrice;
  String basePrice;
  String formatedBasePrice;
  String total;
  String formatedTotal;
  String baseTotal;
  String formatedBaseTotal;
  String totalInvoiced;
  String formatedTotalInvoiced;
  String baseTotalInvoiced;
  String formatedBaseTotalInvoiced;
  String amountRefunded;
  String formatedAmountRefunded;
  String baseAmountRefunded;
  String formatedBaseAmountRefunded;
  String discountPercent;
  String discountAmount;
  String formatedDiscountAmount;
  String baseDiscountAmount;
  String formatedBaseDiscountAmount;
  String discountInvoiced;
  String formatedDiscountInvoiced;
  String baseDiscountInvoiced;
  String formatedBaseDiscountInvoiced;
  String discountRefunded;
  String formatedDiscountRefunded;
  String baseDiscountRefunded;
  String formatedBaseDiscountRefunded;
  String taxPercent;
  String taxAmount;
  String formatedTaxAmount;
  String baseTaxAmount;
  String formatedBaseTaxAmount;
  String taxAmountInvoiced;
  String formatedTaxAmountInvoiced;
  String baseTaxAmountInvoiced;
  String formatedBaseTaxAmountInvoiced;
  String taxAmountRefunded;
  String formatedTaxAmountRefunded;
  String baseTaxAmountRefunded;
  String formatedBaseTaxAmountRefunded;
  int grantTotal;
  String formatedGrantTotal;
  int baseGrantTotal;
  String formatedBaseGrantTotal;
  Additional additional;
  dynamic child;
  List<dynamic> children;

  Item({
    this.id,
    this.sku,
    this.type,
    this.name,
    this.product,
    this.couponCode,
    this.weight,
    this.totalWeight,
    this.qtyOrdered,
    this.qtyCanceled,
    this.qtyInvoiced,
    this.qtyShipped,
    this.qtyRefunded,
    this.price,
    this.formatedPrice,
    this.basePrice,
    this.formatedBasePrice,
    this.total,
    this.formatedTotal,
    this.baseTotal,
    this.formatedBaseTotal,
    this.totalInvoiced,
    this.formatedTotalInvoiced,
    this.baseTotalInvoiced,
    this.formatedBaseTotalInvoiced,
    this.amountRefunded,
    this.formatedAmountRefunded,
    this.baseAmountRefunded,
    this.formatedBaseAmountRefunded,
    this.discountPercent,
    this.discountAmount,
    this.formatedDiscountAmount,
    this.baseDiscountAmount,
    this.formatedBaseDiscountAmount,
    this.discountInvoiced,
    this.formatedDiscountInvoiced,
    this.baseDiscountInvoiced,
    this.formatedBaseDiscountInvoiced,
    this.discountRefunded,
    this.formatedDiscountRefunded,
    this.baseDiscountRefunded,
    this.formatedBaseDiscountRefunded,
    this.taxPercent,
    this.taxAmount,
    this.formatedTaxAmount,
    this.baseTaxAmount,
    this.formatedBaseTaxAmount,
    this.taxAmountInvoiced,
    this.formatedTaxAmountInvoiced,
    this.baseTaxAmountInvoiced,
    this.formatedBaseTaxAmountInvoiced,
    this.taxAmountRefunded,
    this.formatedTaxAmountRefunded,
    this.baseTaxAmountRefunded,
    this.formatedBaseTaxAmountRefunded,
    this.grantTotal,
    this.formatedGrantTotal,
    this.baseGrantTotal,
    this.formatedBaseGrantTotal,
    this.additional,
    this.child,
    this.children,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        sku: json["sku"],
        type: json["type"],
        name: json["name"],
        product: Product.fromJson(json["product"]),
        couponCode: json["coupon_code"],
        weight: json["weight"],
        totalWeight: json["total_weight"],
        qtyOrdered: json["qty_ordered"],
        qtyCanceled: json["qty_canceled"],
        qtyInvoiced: json["qty_invoiced"],
        qtyShipped: json["qty_shipped"],
        qtyRefunded: json["qty_refunded"],
        price: json["price"],
        formatedPrice: json["formated_price"],
        basePrice: json["base_price"],
        formatedBasePrice: json["formated_base_price"],
        total: json["total"],
        formatedTotal: json["formated_total"],
        baseTotal: json["base_total"],
        formatedBaseTotal: json["formated_base_total"],
        totalInvoiced: json["total_invoiced"],
        formatedTotalInvoiced: json["formated_total_invoiced"],
        baseTotalInvoiced: json["base_total_invoiced"],
        formatedBaseTotalInvoiced: json["formated_base_total_invoiced"],
        amountRefunded: json["amount_refunded"],
        formatedAmountRefunded: json["formated_amount_refunded"],
        baseAmountRefunded: json["base_amount_refunded"],
        formatedBaseAmountRefunded: json["formated_base_amount_refunded"],
        discountPercent: json["discount_percent"],
        discountAmount: json["discount_amount"],
        formatedDiscountAmount: json["formated_discount_amount"],
        baseDiscountAmount: json["base_discount_amount"],
        formatedBaseDiscountAmount: json["formated_base_discount_amount"],
        discountInvoiced: json["discount_invoiced"],
        formatedDiscountInvoiced: json["formated_discount_invoiced"],
        baseDiscountInvoiced: json["base_discount_invoiced"],
        formatedBaseDiscountInvoiced: json["formated_base_discount_invoiced"],
        discountRefunded: json["discount_refunded"],
        formatedDiscountRefunded: json["formated_discount_refunded"],
        baseDiscountRefunded: json["base_discount_refunded"],
        formatedBaseDiscountRefunded: json["formated_base_discount_refunded"],
        taxPercent: json["tax_percent"],
        taxAmount: json["tax_amount"],
        formatedTaxAmount: json["formated_tax_amount"],
        baseTaxAmount: json["base_tax_amount"],
        formatedBaseTaxAmount: json["formated_base_tax_amount"],
        taxAmountInvoiced: json["tax_amount_invoiced"],
        formatedTaxAmountInvoiced: json["formated_tax_amount_invoiced"],
        baseTaxAmountInvoiced: json["base_tax_amount_invoiced"],
        formatedBaseTaxAmountInvoiced:
            json["formated_base_tax_amount_invoiced"],
        taxAmountRefunded: json["tax_amount_refunded"],
        formatedTaxAmountRefunded: json["formated_tax_amount_refunded"],
        baseTaxAmountRefunded: json["base_tax_amount_refunded"],
        formatedBaseTaxAmountRefunded:
            json["formated_base_tax_amount_refunded"],
        grantTotal: json["grant_total"],
        formatedGrantTotal: json["formated_grant_total"],
        baseGrantTotal: json["base_grant_total"],
        formatedBaseGrantTotal: json["formated_base_grant_total"],
        additional: Additional.fromJson(json["additional"]),
        child: json["child"],
        children: List<dynamic>.from(json["children"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "type": type,
        "name": name,
        "product": product.toJson(),
        "coupon_code": couponCode,
        "weight": weight,
        "total_weight": totalWeight,
        "qty_ordered": qtyOrdered,
        "qty_canceled": qtyCanceled,
        "qty_invoiced": qtyInvoiced,
        "qty_shipped": qtyShipped,
        "qty_refunded": qtyRefunded,
        "price": price,
        "formated_price": formatedPrice,
        "base_price": basePrice,
        "formated_base_price": formatedBasePrice,
        "total": total,
        "formated_total": formatedTotal,
        "base_total": baseTotal,
        "formated_base_total": formatedBaseTotal,
        "total_invoiced": totalInvoiced,
        "formated_total_invoiced": formatedTotalInvoiced,
        "base_total_invoiced": baseTotalInvoiced,
        "formated_base_total_invoiced": formatedBaseTotalInvoiced,
        "amount_refunded": amountRefunded,
        "formated_amount_refunded": formatedAmountRefunded,
        "base_amount_refunded": baseAmountRefunded,
        "formated_base_amount_refunded": formatedBaseAmountRefunded,
        "discount_percent": discountPercent,
        "discount_amount": discountAmount,
        "formated_discount_amount": formatedDiscountAmount,
        "base_discount_amount": baseDiscountAmount,
        "formated_base_discount_amount": formatedBaseDiscountAmount,
        "discount_invoiced": discountInvoiced,
        "formated_discount_invoiced": formatedDiscountInvoiced,
        "base_discount_invoiced": baseDiscountInvoiced,
        "formated_base_discount_invoiced": formatedBaseDiscountInvoiced,
        "discount_refunded": discountRefunded,
        "formated_discount_refunded": formatedDiscountRefunded,
        "base_discount_refunded": baseDiscountRefunded,
        "formated_base_discount_refunded": formatedBaseDiscountRefunded,
        "tax_percent": taxPercent,
        "tax_amount": taxAmount,
        "formated_tax_amount": formatedTaxAmount,
        "base_tax_amount": baseTaxAmount,
        "formated_base_tax_amount": formatedBaseTaxAmount,
        "tax_amount_invoiced": taxAmountInvoiced,
        "formated_tax_amount_invoiced": formatedTaxAmountInvoiced,
        "base_tax_amount_invoiced": baseTaxAmountInvoiced,
        "formated_base_tax_amount_invoiced": formatedBaseTaxAmountInvoiced,
        "tax_amount_refunded": taxAmountRefunded,
        "formated_tax_amount_refunded": formatedTaxAmountRefunded,
        "base_tax_amount_refunded": baseTaxAmountRefunded,
        "formated_base_tax_amount_refunded": formatedBaseTaxAmountRefunded,
        "grant_total": grantTotal,
        "formated_grant_total": formatedGrantTotal,
        "base_grant_total": baseGrantTotal,
        "formated_base_grant_total": formatedBaseGrantTotal,
        "additional": additional.toJson(),
        "child": child,
        "children": List<dynamic>.from(children.map((x) => x)),
      };
}

class Additional {
  String productId;
  String quantity;
  String token;

  Additional({
    this.productId,
    this.quantity,
    this.token,
  });

  factory Additional.fromJson(Map<String, dynamic> json) => Additional(
        productId: json["product_id"],
        quantity: json["quantity"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "token": token,
      };
}

class Product {
  int id;
  String type;
  String name;
  String urlKey;
  int price;
  String formatedPrice;
  String shortDescription;
  String description;
  String sku;
  List<Image> images;
  BaseImage baseImage;
  List<dynamic> variants;
  bool inStock;
  int specialPrice;
  String formatedSpecialPrice;
  Reviews reviews;
  bool isSaved;
  AtedAt createdAt;
  AtedAt updatedAt;

  Product({
    this.id,
    this.type,
    this.name,
    this.urlKey,
    this.price,
    this.formatedPrice,
    this.shortDescription,
    this.description,
    this.sku,
    this.images,
    this.baseImage,
    this.variants,
    this.inStock,
    this.specialPrice,
    this.formatedSpecialPrice,
    this.reviews,
    this.isSaved,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        urlKey: json["url_key"],
        price: json["price"],
        formatedPrice: json["formated_price"],
        shortDescription: json["short_description"],
        description: json["description"],
        sku: json["sku"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        baseImage: BaseImage.fromJson(json["base_image"]),
        variants: List<dynamic>.from(json["variants"].map((x) => x)),
        inStock: json["in_stock"],
        specialPrice:
            json["special_price"] == null ? null : json["special_price"],
        formatedSpecialPrice: json["formated_special_price"] == null
            ? null
            : json["formated_special_price"],
        reviews: Reviews.fromJson(json["reviews"]),
        isSaved: json["is_saved"],
        createdAt: AtedAt.fromJson(json["created_at"]),
        updatedAt: AtedAt.fromJson(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "url_key": urlKey,
        "price": price,
        "formated_price": formatedPrice,
        "short_description": shortDescription,
        "description": description,
        "sku": sku,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "base_image": baseImage.toJson(),
        "variants": List<dynamic>.from(variants.map((x) => x)),
        "in_stock": inStock,
        "special_price": specialPrice == null ? null : specialPrice,
        "formated_special_price":
            formatedSpecialPrice == null ? null : formatedSpecialPrice,
        "reviews": reviews.toJson(),
        "is_saved": isSaved,
        "created_at": createdAt.toJson(),
        "updated_at": updatedAt.toJson(),
      };
}

class BaseImage {
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  BaseImage({
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.originalImageUrl,
  });

  factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        originalImageUrl: json["original_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "original_image_url": originalImageUrl,
      };
}

class Image {
  int id;
  String path;
  String url;
  String originalImageUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;

  Image({
    this.id,
    this.path,
    this.url,
    this.originalImageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        path: json["path"],
        url: json["url"],
        originalImageUrl: json["original_image_url"],
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "url": url,
        "original_image_url": originalImageUrl,
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class Reviews {
  int total;
  int totalRating;
  int averageRating;
  List<dynamic> percentage;

  Reviews({
    this.total,
    this.totalRating,
    this.averageRating,
    this.percentage,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        total: json["total"],
        totalRating: json["total_rating"],
        averageRating: json["average_rating"],
        percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_rating": totalRating,
        "average_rating": averageRating,
        "percentage": List<dynamic>.from(percentage.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
