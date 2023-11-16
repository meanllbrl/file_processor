import 'dart:io';
import 'package:file_processor/file_processor.dart';
import 'package:flutter_test/flutter_test.dart';


// Mock class for FlutterNativeImage
class MockFlutterNativeImage {
  static Future<File> compressImage(String path, {int quality = 75}) async {
    // Simulate the behavior of compressImage method without actually compressing
    return File(path);
  }
}



void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  // Run all tests in a fake async zone to work with fake asynchronous calls
  group('getFile', () {
    FileProcessor processor = FileProcessor(photoName: "test.png",compress: true);
    setUp(() {
      // Clear any existing stubs between tests
      processor = FileProcessor(photoName: 'test.png');
    });

    test('select files successfully', () async {
      // Mocking the FilePicker result to return null
     await FileProcessor.getFile().then((value) {
        expect(value, isA<File>());
      });
    });

    test('compress test', () async {
    
      // Mocking the FilePicker result to return null
    await FileProcessor.getFile(maxSizeAsMB: 5).then((value) async{
       await processor.compressFile(value, 75, IPtype.image, 0.2).then((value) {
          int size = value.lengthSync();
          expect(size, 0.2 * 1024 * 1024);
        });
       
      });
    });
  });
}
