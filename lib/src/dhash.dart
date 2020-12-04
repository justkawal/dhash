part of dhash;

class DHASH {
  ///
  /// calculate Hamming of `hash1` and `hash2`
  ///
  static int hamming(String hash1, String hash2) {
    var distance = 0;
    if (hash1 == null || hash2 == null) return null;
    final len = hash1.length < hash2.length ? hash1.length : hash2.length;
    for (var i = 0; i < len; i++) {
      if (hash1[i] != hash2[i]) {
        distance++;
      }
    }
    return distance;
  }

  ///
  /// calculate Hash of image
  ///
  static String calculateHash(Uint8List bytes, [int hashSize]) {
    final height = hashSize ?? 8;

    ///
    /// width is +1 greator than height. (God knows why ?)
    ///
    final width = height + 1;

    ///
    /// grayScale the image then
    /// resize the image
    ///
    final resizedGrayScaleImage =
        copyResize(grayscale(decodeImage(bytes)), width: width, height: height);
    final pixels = resizedGrayScaleImage.getBytes();
    var difference = '';

    ///
    /// iterate over the pixels of the image row-wise and
    /// compare every pixel with one on it's right in a row
    ///
    for (var row = 0; row < height; row++) {
      for (var col = 0; col < height; col++)

        ///var left_pixel = _px(pixels, width, col, row);
        ///var right_pixel = _px(pixels, width, col + 1, row);
        ///
        /// I loves to use less variables
        difference += _getPixel(pixels, width, col, row) <
                _getPixel(pixels, width, col + 1, row)
            ? '1'
            : '0';
    }
    return binaryToHex(difference);
  }

  /// Convert `Binary string` to `Hexa-Decimal`
  static String binaryToHex(String s) {
    var output = '';
    for (var i = 0; i < (s?.length ?? 0); i += 4) {
      // convert from binary to decimal first and then convert it to hexa-decimal
      output += int.tryParse(
              int.tryParse(s.substring(i, i + 4), radix: 2).toString(),
              radix: 16)
          .toString();
    }
    return output;
  }

  static int _getPixel(pixels, int width, int x, int y) {
    return pixels[width * y + x];
  }
}
