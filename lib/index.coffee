path    = require 'path'
glob    = require 'glob'
path    = require 'path'
nodefn  = require 'when/node/function'

module.exports = (options={}) ->
  root    = options.root || "/"
  lookup  = options.lookup

  class assetExpand
    constructor: (roots) ->
      lookupPath  = path.join(roots.root, root)
      nodefn.call(glob, lookupPath + "/#{lookup}").then (files) =>
        @assetPaths = files.map (f) =>
          path.join(path.basename(f))

    fs: ->
      category: 'asset-expanded'
      extract: true
      detect: (f) ->
        path.extname(f.relative) is '.jade'

    compile_hooks: ->
      category: 'asset-expanded'
      after_file: (ctx) =>
        _lookup = "<!-- assets(#{lookup})-->"

        index = ctx.content.indexOf(_lookup)
        insert = @assetPaths.map((v) ->
          "<script src='#{v}', type='text/javascript'></script>"
        ).join("\n")

        if (~index)
          ctx.content = ctx.content.replace(_lookup, insert)
