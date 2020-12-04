import 'dart:io';
import 'package:dhash/dhash.dart';
import 'package:test/test.dart';

const path = '/Users/kawal/Desktop/dhash/test/images';
void main() {
  /// reading image bytes
  final faceHigh = File('$path/face-high.jpg').readAsBytesSync();
  final faceLow = File('$path/face-low.jpg').readAsBytesSync();
  final faceWithNose = File('$path/face-with-nose.jpg').readAsBytesSync();

  /// Test 1
  group('Group of dhash tests:\n\t\t', () {
    /// Sub-Test-1
    test('Should get 64 bit hash by default with face-high image', () {
      var hash = DHASH.calculateHash(faceHigh);
      expect(hash.length, (64 / 4).round()); // 4 bits to a byte
    });

    /// Sub-Test-2
    test('Should get 256 bit hash if asked for', () {
      var hash = DHASH.calculateHash(faceHigh, 16);
      expect(hash.length, (256 / 4).round()); // 4 bits to a byte
    });
  });

  /// Test 2
  group('Group of hamming dhash tests:\n\t\t', () {
    /// Sub-Test-1
    test('Should have similar hashes for low/high of same image', () {
      final highHash = DHASH.calculateHash(faceHigh);
      final lowHash = DHASH.calculateHash(faceLow);

      final hammingIsBelow2 = DHASH.hamming(highHash, lowHash) < 2;
      expect(hammingIsBelow2, isTrue);
    });

    /// Sub-Test-2
    test('Should have similar hashes for similar images', () {
      final highHash = DHASH.calculateHash(faceHigh);
      final lowHash = DHASH.calculateHash(faceWithNose);

      final hammingIsBelow3 = DHASH.hamming(highHash, lowHash) < 3;
      expect(hammingIsBelow3, isTrue);
    });
  });
}
