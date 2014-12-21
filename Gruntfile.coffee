module.exports= (grunt)->

  config=
    # coffee:
    #   compileBare:
    #     options:
    #       bare: true
    #     files:
    #       'public/assets/js/dist.js': [
    #         'public/assets/js/helpers/*.coffee',
    #         'public/assets/js/plugins/*.coffee',
    #         'public/assets/js/controllers/*.coffee'
    #       ]
    concat:
      javascript:
        src: [
          'bower_components/jquery/dist/jquery.min.js'
          'bower_components/magnific-popup/dist/jquery.magnific-popup.min.js'
          'assets/scripts/app.js'
        ]
        dest: 'js/app.js'
      styles:
        src: [
          'bower_components/magnific-popup/dist/magnific-popup.css'
          'css/dist.css'
        ]
        dest: 'css/dist.css'
    uglify:
      dist:
        files:
          'js/dist.js': 'js/dist.js'
      options:
        mangle: false
    watch:
      watchJS:
        files: 'assets/**/*.js'
        tasks: ['compileScripts']
      watchStylus:
        files: 'assets/**/*.styl'
        tasks: ['compileStyles']
      watchJade:
        files: 'assets/**/*.jade'
        tasks: ['jade']
    stylus: 
      dist:
        files:
          'css/dist.css': 'assets/styles/*.styl'
        options:
          style: 'compressed'
    jade: 
      dist:
        files:
          'index.html': 'assets/index.jade'
    imagemin:
      jpg:
        options:
          progressive: true
        files: [{
          expand: true
          cwd: 'assets/photos/'
          src: ['**/*.{png,jpg,gif,JPG}']
          dest: 'photos/'
        }]

  grunt.initConfig config
  
  # grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'

  grunt.registerTask 'compileScripts', ['concat:javascript','uglify']
  grunt.registerTask 'compileStyles', ['stylus','concat:styles']
  grunt.registerTask 'images', ['imagemin']
  grunt.registerTask 'default', ['compileScripts', 'compileStyles', 'jade', 'watch']


