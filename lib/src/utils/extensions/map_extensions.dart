import 'dart:convert';

extension MapExtensions on Map<String, dynamic> {
  String toPrettyJson() {
    const encoder = JsonEncoder.withIndent('  ');

    return encoder.convert(this);
  }
}
