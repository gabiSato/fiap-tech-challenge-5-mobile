enum AreaUnit { hectares, metersSquared }

extension AreaUnitExtension on AreaUnit {
  String get value {
    switch (this) {
      case AreaUnit.hectares:
        return 'hectare';
      case AreaUnit.metersSquared:
        return 'm²';
    }
  }
}
