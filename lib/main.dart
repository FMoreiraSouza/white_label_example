import 'package:flutter/material.dart';
import 'package:white_label_example/config/brand_config.dart';
import 'package:white_label_example/config/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String flavor = String.fromEnvironment('FLAVOR', defaultValue: 'flutter');

  final brandConfig = await BrandConfig.loadBrandConfig(flavor);

  FlavorConfig.setBrand(brandConfig);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlavorConfig.brand.appName,
      theme: FlavorConfig.brand.theme,
      home: MyHomePage(title: FlavorConfig.brand.appName),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Image.asset(
          FlavorConfig.brand.logoPath,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
