import 'dart:html';

import 'package:gif_dart/gif_dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    GIF gif;

    setUp(() {
      gif = GIF(Options());
    });

    test('First Test', () {
      expect(gif.addFrame(CanvasElement(),AddFrameOptions()), isEmpty);
    });
  });
}
