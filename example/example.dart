import 'dart:io';
import 'package:dhash/dhash.dart';

const path = '/Users/kawal/Desktop/dhash/test/images';

void main() {
  var list = [
    'face-high',
    'face-low',
    'face-with-nose',
  ];

  ///
  /// Print dhashes of test images
  ///
  print('Printing dHashes of images');
  list.forEach((image) {
    var fileBytes = File('$path/$image.jpg').readAsBytesSync();
    print('$image dhash: ${DHASH.calculateHash(fileBytes)}');
  });

  ///
  /// Print hamming value between two images
  ///

  print('\nPrinting `Hamming` value between images');
  for (var i = 0; i < list.length - 1; i++) {
    for (var j = i + 1; j < list.length; j++) {
      var image1 = list[i];
      var image2 = list[j];

      var dhashImage1 =
          DHASH.calculateHash(File('$path/$image1.jpg').readAsBytesSync());
      var dhashImage2 =
          DHASH.calculateHash(File('$path/$image2.jpg').readAsBytesSync());
      print('$image1 : $image2 = ${DHASH.hamming(dhashImage1, dhashImage2)}');
    }
  }
}
