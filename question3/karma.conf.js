// Karma configuration
// Generated on Sun Aug 16 2015 15:09:12 GMT-0400 (EDT)

module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['browserify','jasmine'],
    files: [
      'lib/**/*.js',
      'spec/**/*.js'
    ],
    plugins: [
      'karma-browserify',
      'karma-jasmine',
      'karma-phantomjs-launcher'
    ],
    exclude: [],
    preprocessors: {
      'lib/**/*.js': ['browserify'],
      'spec/**/*.js': ['browserify']
    },
    browserify: {
      debug: true,
      transform: ['babelify'],
    },
    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['PhantomJS'],
    singleRun: false
  })
}
