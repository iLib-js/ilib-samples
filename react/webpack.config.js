const path = require("path");
const HtmlWebpackPlugin = require('html-webpack-plugin');
const IlibWebpackPlugin = require("ilib-webpack-plugin");
const port = process.env.PORT || 3000;

// this goes outside the module.export
let options = {
    locales: ["en-US", "de-DE", "fr-FR", "it-IT", "ja-JP", "ko-KR", "zh-Hans-CN"],
    assembly: "dynamicdata",
    compilation: 'compiled',
    size: 'custom',
    tempDir: 'assets'
};

module.exports = {
  mode: 'development',
  entry: './src/index.js',
  output: {
    filename: 'bundle.[hash].js',
  },
  entry: path.resolve("./ilib-metafile.js"),
  output: {
    filename: 'ilib-custom.js',
        chunkFilename: 'ilib.[name].js',  // to name the locale bundles
        path: path.resolve("./output"), // choose an appropriate output dir
        publicPath: "output/",              // add the corresponding URL
        library: 'ilib',
        libraryTarget: 'umd'
    },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
        },
      },
      {
        test: /\.html$/,
        use: [
          {
            loader: 'html-loader',
            options: {
              minimize: true,
            },
          },
        ],
      },
      {
        test: /\.(js|html)$/,
        use: {
          loader: "ilib-webpack-loader",
          options: options
        }
      }
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'public/index.html',
    }),
    new IlibWebpackPlugin(options)
  ],
  devServer: {
    host: 'localhost',
    port: port,
    open: true, // open page when start
  },
};