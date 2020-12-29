import 'package:flutter/widgets.dart';

class Repos {
  String name, html_url;

  Repos({
    @required this.name,
    @required this.html_url,
  });

  static Repos fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Repos(
      name: map['name'],
      html_url: map['html_url'],
    );
  }

  Repos.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    html_url = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['html_url'] = this.html_url;
    return data;
  }
}
