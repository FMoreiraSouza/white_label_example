import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrandConfig {
  final String appName;
  final String logoPath;
  final ThemeData theme;

  BrandConfig({
    required this.appName,
    required this.logoPath,
    required this.theme,
  });

  static Future<BrandConfig> loadBrandConfig(String brand) async {
    final jsonString = await rootBundle.loadString('assets/brands/$brand/config.json');
    final jsonMap = json.decode(jsonString);

    return BrandConfig(
      appName: jsonMap['appName'],
      logoPath: jsonMap['logoPath'],
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
