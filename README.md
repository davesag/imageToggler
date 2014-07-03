imageToggler
============

A jQuery Plugin to manage the toggling of staff images in the Maxwell Forest website

### First

Assuming you have `Node.js` installed.

```bash
npm install
```

### Ensure Grunt is Installed
```bash
npm install grunt
```

## To Test

```bash
grunt test
```

Note that by default this will supress any console.log output.  To get that output as well you need to add the `--debug` flag, which also generates a lot of `phantomjs` noise.

### To Build

```bash
grunt
```

This will output the final distribution files into the `dist/` folder, prefixed with `jquery` and suffixed with the version number you specify in `package.json`.

Files created are:

* `jquery-imageToggler.1.0.0.js` - the 'developer' version.
* `jquery-imageToggler.1.0.0.min.js` The minified version for production use.
* `jquery-imageToggler.1.0.0.min.map` The `sourcemap` file for debugging using the minified version.

### To Use

Simply create a container such as a `div` that holds an element for your
quote to appear in. A `q` or `blockquote`, or even a plain old `p` tag will be fine.

Then create a set of `img`s wrapped in `a` tags.

The `a` tags need the following data attributes

  * `data-quote-target` : The selector of the element that will be injected with your quote
  * `data-quote` : The quote to inject.  Quotes are injected using `jQuery`'s `text()` method.

You should define styles for `imageToggler-bright` and `imageToggler-dim` - for example:

    .imageToggler-bright img {
      -webkit-filter: drop-shadow(4px 4px 4px rgba(0,0,0,0.5));
      -ms-filter: "progid:DXImageTransform.Microsoft.Dropshadow(OffX=4, OffY=4, Color='#444')";
      filter: "progid:DXImageTransform.Microsoft.Dropshadow(OffX=4, OffY=4, Color='#444')";
    }

    .imageToggler-dim {
      opacity:0.5;
    }

These styles are automatically applied to the closest parent `div` and its siblings.

See [the example](/example/example.html).

### License

Released under the [MIT License](/LICENSE).
