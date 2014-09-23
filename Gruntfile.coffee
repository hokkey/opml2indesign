'use strict'

module.exports = (grunt) ->
  # import package.json
  pkg = grunt.file.readJSON('package.json')

  # initConfig Settings
  grunt.initConfig
    dir:
      xsl: 'src/opml2indesign.xsl'

    # grunt-xsltproc
    xsltproc:
      compile:
        options:
          stylesheet: '<%= dir.xsl %>'
        files: [{
          expand: true
          cwd: 'src/opml'
          src: ['**/*.opml']
          dest: 'build'
          ext: '.xml'
        }]

  # grunt-contrib-copy
    copy:
      xsl:
        src: '<%= dir.xsl_build %>'
        dest: '<%= dir.deploy %>'

    # grunt-contrib-watch
    watch:
      opml:
        files: 'src/opml/*.opml'
        tasks: [
          'xsltproc:compile'
        ]

  # registerTask
  grunt.registerTask('default', [
    # Set Default Tasks
    'xsltproc'
    'watch:opml'
  ])

  # loadNpmTasks
  for taskName of pkg.devDependencies when taskName.substring(0, 6) is 'grunt-'
    grunt.loadNpmTasks(taskName)
