import 'package:white_label_example/config/brand_config.dart';

class FlavorConfig {
  static late BrandConfig _brandConfig;

  static void setBrand(BrandConfig config) {
    _brandConfig = config;
  }

  static BrandConfig get brand => _brandConfig;
}
