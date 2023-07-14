import 'dart:convert';
import 'dart:io';

Map<String, dynamic> readJsonFixture(String filePath) {
  final String rawJsonData = File(filePath).readAsStringSync();

  // Decode the raw json data.
  final Map<String, dynamic> JsonMap = jsonDecode(rawJsonData);

  return JsonMap;
}
