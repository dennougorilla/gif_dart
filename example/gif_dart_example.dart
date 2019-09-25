import 'dart:html';
import 'dart:js';

import 'package:gif_dart/gif_dart.dart';

main() {
  final canvas = CanvasElement();
  var gif = GIF(Options(workers: 10, quality: 10));
  gif.addFrame(canvas, AddFrameOptions(copy: true));
  gif.addFrame(canvas, AddFrameOptions(copy: true));
  gif.on('finished', allowInterop((blob, tmp) {
    window.open(Url.createObjectUrl(blob), 'gif');
  }));
  gif.render();
  querySelector('#output').text = 'Your Dart app is running.';
}
