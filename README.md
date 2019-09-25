A library for Dart developers.
This library wrap gif.js(https://github.com/jnordberg/gif.js).

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage
You must include the right gif.js JavaScript libraries into your .html file to be able to use this package. Usually this means including `gif.js` `gif.worker.js`. https://github.com/jnordberg/gif.js
```
  <script type="text/javascript" src="gif.js"></script>
  <script type="text/javascript" src="gif.worker.js"></script>
```

A simple usage example:

```dart
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
