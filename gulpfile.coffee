gulp = require "gulp"
gutil = require "gulp-util"

sass = require "gulp-ruby-sass"
plumber = require "gulp-plumber"
autoprefixer = require "gulp-autoprefixer"
minifyCSS = require "gulp-minify-css"
run = require "gulp-shell"

# Styles for the site. Turns .scss files into a single main.css
gulp.task "scss", ->
    gulp.src("theme/styles/main.scss")
        .pipe(plumber())
        .pipe(sass())
        .pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
        .pipe(minifyCSS())
        .pipe(gulp.dest("theme/static/css"))

# Rebuild the html.
gulp.task "html", run.task(["fab build"])

# Watch for any changes and run the required tasks.
gulp.task "watch", ->
    gulp.watch("theme/styles/**/*.scss", ["scss"])
    gulp.watch("theme/templates/**/*.html", ["html"])
    gulp.watch("theme/static/**/*.css", ["html"])
    gulp.watch("content/*.md", ["html"])

gulp.task("default", ["watch"])
