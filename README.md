Roots Asset Expand - WIP
============

[![Build Status](https://travis-ci.org/samccone/roots-asset-expand.png)](https://travis-ci.org/samccone/roots-asset-expand)

## Installing

`npm install roots-asset-expand --save`


## Using
> in your app.coffee file

```coffeescript
  extensions: [assetExpand({
    lookup: "nested/*.js"
    tagName: "script"
    attributes: {
      "type": "text/javascript"
    }
  })]
```

> in a jade file

```jade
  // assets(nested/*.js)
  h1 hi
```

> gives you

```html
<script src='nested/foo.js' type='text/javascript' ></script>
<script src='nested/foo1.js' type='text/javascript' ></script>
<script src='nested/foo2.js' type='text/javascript' ></script>
<h1> hi </h1>
```
