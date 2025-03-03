class UserData {
/*
{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
} 
*/

  int? id;
  String? name;
  String? username;
  String? email;
  AddressData? address;
  String? phone;
  String? website;
  CompanyData? company;

  UserData({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    address = (json['address'] != null)
        ? AddressData.fromJson(json['address'])
        : null;
    phone = json['phone']?.toString();
    website = json['website']?.toString();
    company = (json['company'] != null)
        ? CompanyData.fromJson(json['company'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class AddressData {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  AddressDataGeo? geo;

  AddressData({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });
  AddressData.fromJson(Map<String, dynamic> json) {
    street = json['street']?.toString();
    suite = json['suite']?.toString();
    city = json['city']?.toString();
    zipcode = json['zipcode']?.toString();
    geo = (json['geo'] != null) ? AddressDataGeo.fromJson(json['geo']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }
}

class AddressDataGeo {
  String? lat;
  String? lng;

  AddressDataGeo({
    this.lat,
    this.lng,
  });
  AddressDataGeo.fromJson(Map<String, dynamic> json) {
    lat = json['lat']?.toString();
    lng = json['lng']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class CompanyData {
  String? name;
  String? catchPhrase;
  String? bs;

  CompanyData({
    this.name,
    this.catchPhrase,
    this.bs,
  });
  CompanyData.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    catchPhrase = json['catchPhrase']?.toString();
    bs = json['bs']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}
