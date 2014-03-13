path    = require 'path'
glob    = require 'glob'
path    = require 'path'
nodefn  = require 'when/node/function'

module.exports = (options={}) ->
  opts             = options
  opts.root       ||= "/"
  opts.attributes ||= {}

  getAttributes = ->
    Object.keys(opts.attributes).map((k) ->
      "#{k}='#{opts.attributes[k]}'"
    ).join(" ")

  class assetExpand
    constructor: (roots) ->
      lookupPath  = path.join(roots.root, opts.root)
      nodefn.call(glob, lookupPath + "/#{opts.lookup}").then (files) =>
        @assetPaths = files.map (f) =>
          path.relative(roots.root, f)

    fs: ->
      category: 'asset-expanded'
      extract: true
      detect: (f) ->
        path.extname(f.relative) is '.jade'

    compile_hooks: ->
      category: 'asset-expanded'
      after_file: (ctx) =>
        _lookup = "<!-- assets(#{opts.lookup})-->"

        index = ctx.content.indexOf(_lookup)
        insert = @assetPaths.map((v) =>
          "<#{opts.tagName} src='#{v}' #{getAttributes()} ></#{opts.tagName}>"
        ).join("\n")

        if (~index)
          ctx.content = ctx.content.replace(_lookup, insert)
