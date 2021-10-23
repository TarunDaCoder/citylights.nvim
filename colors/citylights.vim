lua << EOF
-- Source Config
-- local plugin_path = vim.fn.stdpath('config')
-- require(plugin_path .. '/init.lua')

package.loaded['citylights'] = nil
package.loaded['citylights.util'] = nil
package.loaded['citylights.colors'] = nil
package.loaded['citylights.theme'] = nil
package.loaded['citylights.functions'] = nil

vim.g.citylights_transparentbg = false
require('citylights').set()
EOF
