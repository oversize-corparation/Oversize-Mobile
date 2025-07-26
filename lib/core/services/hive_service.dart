import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveLocalServices {
  static Box? hive;

  static Future<void> getInstance(String box) async {
    await Hive.initFlutter();
    await Hive.openBox(box);
    hive = Hive.box(box);
  }

  static Future<void> insertData(Map<String, dynamic> json) async {
    await hive?.add(json);
  }

  static List<Map<dynamic, dynamic>> readAllData() {
    List<Map<dynamic, dynamic>> list = [];
    // list = List.generate(hive?.length ?? 0, (index) => hive?.getAt(index));
    list = hive?.values.map((e) => e as Map<dynamic, dynamic>).toList() ?? list;
    return list;
  }

  static readOneData(int index) {
    return hive?.getAt(index);
  }

  static updateData(int index, Map<dynamic, dynamic> json) async {
    await hive?.putAt(index, json);
  }

  static clear() async {
    await hive?.clear();
  }

  static close() async {
    await hive?.close();
  }
}
