Dart GIF encoder. A library for Dart developers.
This library wrap gif.js(https://github.com/jnordberg/gif.js).


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

To use dart2js instead of dartdevc, add the --release flag:
```
$  webdev serve --release  # uses dart2js
```
To run this web app with web worker correctly in the browser during development, instead of the common webdev serve, we need to use webdev serve -r. Which indicate a release version, in other word, use dart2js instead of dartdevc. This hinder debugging by lot.

## Caution
```
  gif.on('finished', allowInterop((blob, tmp) {
    window.open(Url.createObjectUrl(blob), 'gif');
  }));
  gif.render();
```
Difference in JS interop callback behaviour between DDC and dart2js(https://github.com/dart-lang/sdk/issues/33134)

```
  gif.on 'finished', (blob, data) ->
    if blobURLSupport
      renderimg.src = URL.createObjectURL(blob)
    else
      renderimg.src = buildDataURL(data)
    delta = now() - startTime
    logel.set 'text', "Rendered #{ images.length } frame(s) at q#{ gif.options.quality } in #{ delta.toFixed(2) }ms"
```
https://github.com/jnordberg/gif.js/blob/a2201f123ed9e5582e57c3d15f5df00c0b8367bd/site/contents/scripts/main.coffee#L50-L56
`gif.on('finish')` need two argument.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

## License
MIT
