const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery', //  $: 'jquery', does not work!
        jQuery: 'jquery/src/jquery', // jQuery: 'jquery', does not work!
        Popper: ['popper.js', 'default']
    })
)
module.exports = environment
