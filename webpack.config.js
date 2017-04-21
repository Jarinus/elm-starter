const ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  context: __dirname + "/src",
  entry: "./assets/js/entry.js",
  output: {
    path: __dirname + "/static/js",
    filename: "app.js"
  },
  module: {
    rules: [
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: ["css-loader", "sass-loader" ],
          publicPath: "static"
        })
      },
      {
        test: /\.woff[0-9]?$/,
        loader: "url-loader?limit=10000&minetype=application/font-woff"
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "file-loader"
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-hot-loader!elm-webpack-loader'
      }
    ],
    noParse: /\.elm$/,
  },
  plugins: [
    new ExtractTextPlugin("../css/app.css")
  ]
}
