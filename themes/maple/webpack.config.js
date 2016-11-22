var webpack = require('webpack');

var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  entry: {
    js: './webpack/entry.js',
    css: './webpack/entry.sass'
  },
  plugins: [
    new ExtractTextPlugin('[name].css', {allChunks: true})
  ],
  output: {
    path: __dirname + '/assets/',
    filename: "app.[type]"
  },
  module: {
    loaders: [
      {
        test: /\.js?$/,
        exclude: /(node_modules)/,
        loader: 'babel',
        query: {
          presets: ['es2015']
        }
      },
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader')
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract('style-loader', 'sass-loader')
      },
      {
        test: /\.woff(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url?limit=10000&mimetype=application/font-woff&name=fonts/[name].[ext]'
      },
      {
        test: /\.woff2(\?\S*)?$/,
        loader: 'url?limit=10000&mimetype=application/font-woff2&name=fonts/[name].[ext]'
      },
      {
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url?limit=10000&mimetype=application/font-tff&name=fonts/[name].[ext]'
      },
      {
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file?name=fonts/[name].[ext]'
      },
      {
        test: /\.png(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file?name=img/[name].[ext]'
      },
      {
        test: /\.gif(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'file?name=img/[name].[ext]'
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        loader: 'url?limit=10000&mimetype=image/svg+xml&name=img/[name].[ext]'
      }
    ]
  },
};
