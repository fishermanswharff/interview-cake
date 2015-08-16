// Karma configuration
// Generated on Sat Aug 15 2015 12:15:19 GMT-0400 (EDT)

module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine'],
    files: [
      'node_modules/karma-babel-preprocessor/node_modules/babel-core/browser-polyfill.js',
      'spec/**/*.js',
      'spec/**/*.es6',
      'lib/**/*.js',
      'lib/**/*.es6',
    ],
    plugins: [
      'karma-babel-preprocessor',
      'karma-jasmine',
      'karma-chrome-launcher',
    ],
    exclude: [],
    preprocessors: {
      'spec/**/*.es6': ['babel'],
      'test/**/*.es6': ['babel']
    },
    'babelPreprocessor': {
      options: {
        sourceMap: 'inline'
      },
      filename: function(file){
        return file.originalPath.replace(/\.js$/, '.es5.js');
      },
      sourceFileName: function(file){
        return file.originalPath;
      }
    },
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['Chrome'],
    singleRun: false
  });
};
