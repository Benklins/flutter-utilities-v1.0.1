import 'dart:typed_data';

import 'package:dio/dio.dart';

class DioFileHelper {
  DioFileHelper._();

  static FormData getFormData(Map<String, dynamic> map) {
    return FormData.fromMap(map);
  }

  static Future<MultipartFile> getMultipartFile(
      String path, String fileName) async {
    return await MultipartFile.fromFile(
      path,
      filename: fileName,
    );
  }

  static MultipartFile getMultipartByte(Uint8List byte, String fileName) {
    return MultipartFile.fromBytes(
      byte,
      filename: fileName,
    );
  }

  /// This method helps to replace the [imageKey] in [map]
  /// with a [MultipartFile] as such [imageKey] must be a
  /// value in [map]
  static Future<Map<String, dynamic>> getMultipartFileMap(
      Map<String, dynamic> map, String imageKey) async {
    String? path = map[imageKey];
    if (path == null)
      throw Exception(
          'image path with key ::$imageKey must be contained in map');
    map[imageKey] = await MultipartFile.fromFile(
      path,
    );

    return map;
  }

  /// This method helps to replace the [imageKey] in [map]
  /// with a [MultipartFile] as such [imageKey] must be a
  /// [Uint8List] in [map]
  static Map<String, dynamic> getMultipartByteMap(
      Map<String, dynamic> map, String imageKey, String fileName) {
    Uint8List? byte = map[imageKey];
    if (byte == null)
      throw Exception(
          'image byte with key ::$imageKey must be contained in map');
    map[imageKey] = getMultipartByte(byte, fileName);

    return map;
  }
}
