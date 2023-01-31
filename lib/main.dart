import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'di/get_it.dart' as get_it;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(get_it.init());
}
