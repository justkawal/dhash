# dhash
  
  <a href="https://flutter.io">  
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"  
      alt="Platform" />  
  </a> 
   <a href="https://pub.dartlang.org/packages/dhash">  
    <img src="https://img.shields.io/pub/v/dhash.svg"  
      alt="Pub Package" />  
  </a>
   <a href="https://opensource.org/licenses/MIT">  
    <img src="https://img.shields.io/badge/License-MIT-red.svg"  
      alt="License: MIT" />  
  </a>  
   <a href="https://www.paypal.me/kawal7415">  
    <img src="https://img.shields.io/badge/Donate-PayPal-green.svg"  
      alt="Donate" />  
  </a>
   <a href="https://github.com/justkawal/dhash/issues">  
    <img src="https://img.shields.io/github/issues/justkawal/dhash"  
      alt="Issue" />  
  </a> 
   <a href="https://github.com/justkawal/dhash/network">  
    <img src="https://img.shields.io/github/forks/justkawal/dhash"  
      alt="Forks" />  
  </a> 
   <a href="https://github.com/justkawal/dhash/stargazers">  
    <img src="https://img.shields.io/github/stars/justkawal/dhash"  
      alt="Stars" />  
  </a>
  <br>
  <br>
 
 [dhash](https://www.pub.dev/packages/dhash) is a dart library which is used to calculate similarity between images based on dhash algorithm.


# Lets Get Started

### 1. Depend on it
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  dhash:
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```css
$  pub get
```

with `Flutter`:

```css
$  flutter packages get
```

### 3. Import it

Now in your `Dart` code, you can use: 

````dart
    import 'package:dhash/dhash.dart';

````

# Usage

### Imports

````dart
    import 'dart:io';
    import 'package:dhash/dhash.dart';

````

### Read image File

````dart
    var imageBytes = File('path_to_image_file.jpg').readAsBytesSync();

````

### Calculate dhash of the image

````dart
    var dhashOfImage = DHASH.calculateHash(imageBytes);
    
````

### Create Hamming between two images
    
````dart
    /// Image 1 bytes
    var imageBytes1 = File('path_to_image_file1.jpg').readAsBytesSync();
    
    /// Image 2 bytes
    var imageBytes2 = File('path_to_image_file2.jpg').readAsBytesSync();
    
    /// dhash of Image 1
    var hashOfImage1 = DHASH.calculateHash(imageBytes1);
    
    /// dhash of Image 2
    var hashOfImage2 = DHASH.calculateHash(imageBytes2);
    
    /// Hamming between image 1 and image 2
    var hamming = DHASH.hamming(hashOfImage1, hashOfImage2);
    
````

### Donate (How much ?. It's upto you !!)

  - [Paypal](https://www.paypal.me/kawal7415)
