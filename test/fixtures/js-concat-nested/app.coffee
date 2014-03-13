require 'coffee-script/register'
assetExpand = module.require('../../..')

module.exports =
  extensions: [assetExpand({
    lookup: "nested/*.js"
    tagName: "script"
    attributes: {
      "type": "text/javascript"
    }
  })]
