import 'dart:io';

import 'package:aula07_bloc/app/android_app.dart';
import 'package:aula07_bloc/app/ios_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(kIsWeb || Platform.isAndroid ? AndroidApp() : IosApp());
}