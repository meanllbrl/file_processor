# File Processor

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Dart](https://img.shields.io/badge/Dart-2.15.0-blue.svg)](https://dart.dev)
[![Flutter](https://img.shields.io/badge/Flutter-2.15.0-blue.svg)](https://flutter.dev)

File Processor is a Dart package designed to process files, including uploading them to Firebase Cloud Storage with optional compression. It supports error handling callbacks and provides utility methods for file operations.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Installation

To use this package, add 
```yaml

```
as a dependency in your `pubspec.yaml` file.


Then, run:

```yaml
$ flutter pub get
```

## Usage

```dart
import 'package:file_processor/file_processor.dart';

// Example usage
final processor = FileProcessor(
  firebaseCloudFunctionsRootUrl: 'your_firebase_url',
  maxSizeAsMB: 1,
  compress: true,
  compressQuality: 75,
  photoName: 'example_photo.jpg',
);

// ... (continue with your code)

```

## Features

* Pick single or multiple files from device storage.
* Upload files to Firebase Storage.
* Optional file compression with quality control.
* Error handling callbacks for different scenarios.
* Utility methods for file size, deletion, and more.

## Examples

# Picking a Sinlge File

```dart
final file = await FileProcessor.getFile();
```

# Uploading a File to Firebase

```dart
final file = await FileProcessor.getFile();
final downloadUrl = await processor.uploadFiletoFirebase(file);
print('File uploaded successfully. Download URL: $downloadUrl');
```

# Compressing a File

```dart
final file = await FileProcessor.getFile();
final compressedFile = await processor.compressFile(file, 75, IPtype.image, 0.2);
```

