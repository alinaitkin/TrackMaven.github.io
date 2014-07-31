gulp = require 'gulp'
gutil = require 'gulp-util'

sass = require 'gulp-ruby-sass'
plumber = require 'gulp-plumber'
shell = require 'gulp-shell'

connect = require 'connect'
http = require 'http'

# Serves the site on port 8080
gulp.task 'serve', ->
    app = connect()
        .use(connect.logger('dev'))
        .use(connect.static('./output'))
    http.createServer(app).listen(8080)

# Styles for the site. Turns .scss files into a single main.css
gulp.task 'scss', ->
    gulp.src("theme/styles/main.scss")
        .pipe(plumber())
        .pipe(sass())
        .pipe(gulp.dest("theme/static/css"))
        #.pipe(shell('fab preview'))

# Watch for any changes and run the required tasks.
gulp.task 'watch', ->
    gulp.watch('theme/styles/*.scss', ['scss'])

gulp.task('default', ['watch', 'serve', 'scss'])