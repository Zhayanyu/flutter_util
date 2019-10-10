import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_util/utils.dart';
enum TextStyleType {
  /// none.
  none,
  solid,
}


void main() {
  test('adds one to input values', () {
    NRConvert.enumValuesToMap(TextStyleType.values);
  });
}
