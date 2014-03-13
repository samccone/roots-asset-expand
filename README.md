Roots Asset Expand - WIP
============

[![Build Status](https://travis-ci.org/samccone/roots-asset-expand.png)](https://travis-ci.org/samccone/roots-asset-expand)

## Installing

`npm install roots-asset-expand --save`


## Using
> in your app.coffee file

```coffeescript
  module.exports =
    extensions: [assetExpand({lookup: "*.js"})]
```

> in a jade file

```jade
  // assets(*.js)
  h1 hi
```
