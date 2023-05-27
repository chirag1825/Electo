import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

class StorageSecured {
  // Create storage
  static final box = new GetStorage();
  static final storage = new FlutterSecureStorage();

// Read value
  static read(dynamic key) async {
    if (!kIsWeb) {
      return await storage.read(key: key);
    }
    return await box.read(key);
  }

// Read all values
//Map<String, String> allValues = await storage.readAll();

// Delete value
  static delete(dynamic key) async {
    if (!kIsWeb) {
      await storage.delete(key: key);
    }
    return await box.remove(key);
  }

// Delete all
//await storage.deleteAll();

// Write value
  static write(dynamic key, dynamic value) async {
    if (!kIsWeb) {
      await storage.write(key: key, value: value);
    }
    return await box.write(key, value);
  }
}
