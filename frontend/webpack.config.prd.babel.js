const path = require('path')
const glob = require('glob')
const webpack = require('webpack')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const ManifestPlugin = require('webpack-manifest-plugin')
const AutoPrefixerPlugin = require('autoprefixer')
const WebpackS3Plugin = require('webpack-s3-plugin');
const AWS = require('aws-sdk');

const targetDirectory = path.join(__dirname, 'packs');
const targets = glob.sync(
  path.join(targetDirectory, '**/*.{js,jsx,ts,tsx,ico}')
);

const entries = targets.reduce((entries, targetPath) => {
  const targetFileName = path.relative(targetDirectory, targetPath);
  const targetFileExtention = path.extname(targetFileName);

  return {
    ...entries,
    [targetFileName.replace(
      targetFileExtention,
      ''
    )]: `./frontend/packs/${targetFileName}`
  };
}, {});

const urlLoaderPublicPath = `https://s3-hugeman-statics.s3-ap-northeast-1.amazonaws.com`;
const outputPublicPath = '/';
const outputFileName = `[name]-bundle-[hash]`;

export default {
  entry: entries,
  mode: 'production',
  module: {
    rules: [
      {
        test: /\.ts(x?)$/,
        exclude: /node_modules/,
        use: {
          loader: 'ts-loader'
        }
      },
      {
        test: /\.js?$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            cacheDirectory: true,
            presets: ['@babel/preset-env']
          }
        }
      },
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            cacheDirectory: true
          }
        }
      },
      {
        test: /\.(css|scss)$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              publicPath: '/'
            }
          },
          {
            loader: 'css-loader',
            options: {
              url: true,
              sourceMap: true
            }
          },
          {
            loader: 'postcss-loader',
            options: {
              sourceMap: true,
              ident: 'postcss',
              plugins: [
                require('tailwindcss'),
                require('autoprefixer'),
              ],
            }
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: true
            }
          }
        ]
      },
      {
        // url-loader embeds assets smaller than specified limit in bytes as data URLs to avoid requests.
        test: /\.(gif|png|jpg|eot|wof|woff|woff2|ttf|svg|ico)$/,
        loader: 'url-loader',
        options: {
          limit: 5000,
          publicPath: `${urlLoaderPublicPath}`,
          name: `${outputFileName}.[ext]`
        }
      }
    ]
  },
  output: {
    path: path.join(__dirname, '../', 'public/assets'),
    filename: `${outputFileName}.js`,
    publicPath: `${outputPublicPath}`
  },
  resolve: {
    extensions: ['.js', '.jsx', '.ts', '.tsx', 'scss'],
    alias: {
      images: path.join(__dirname, 'src/assets/images'),
      vue$: 'vue/dist/vue.esm.js'
    }
  },
  plugins: [
    new MiniCssExtractPlugin({
      path: path.join(__dirname, '../', 'public/assets'),
      filename: `${outputFileName}.css`
    }),
    new ManifestPlugin({
      fileName: 'manifest.json',
      writeToFileEmit: true
    }),
    new WebpackS3Plugin({
      s3Options: {
        credentials: new AWS.SharedIniFileCredentials({
          profile: 'hugeman'
        }),
        region: 'ap-northeast-1',
      },
      s3UploadOptions: {
        Bucket: 's3-hugeman-statics',
        ContentEncoding: 'gzip',
      },
    }),
  ]
};
