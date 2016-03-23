'use strict';

import gulp from 'gulp';

import autoprefixer from 'gulp-autoprefixer';
import connect from 'gulp-connect';
import minifyCSS from 'gulp-minify-css';
import plumber from 'gulp-plumber';
import run from 'gulp-shell';
import sass from 'gulp-ruby-sass';

// Serve the generated html on local(host|docker):8080
gulp.task("connect", () => {
    connect.server({
        root: ['output'],
        port: 8080,
        livereload: true
    });
});

// Styles for the site. Turns .scss files into a single main.css file.
gulp.task("scss", () => {
    sass("theme/styles/main.scss", { style: 'expanded' })
        .pipe(plumber())
        .pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
        .pipe(minifyCSS())
        .pipe(gulp.dest("theme/static/css"))
        .pipe(connect.reload())
});

// Rebuild the html.
gulp.task("html", () => {
    gulp.src("")
        .pipe(run("rm -fr output"))
        .pipe(run("make html"))
        .pipe(run("cp -r images/ output/images/"))
        .pipe(connect.reload())
});

// Watch for any changes and run the required tasks.
gulp.task("watch", () => {
    gulp.watch("content/**/*.md", ["html"])
    gulp.watch("theme/static/css/**/*.css", ["html"])
    gulp.watch("theme/styles/**/*.scss", ["scss"])
    gulp.watch("theme/templates/**/*.html", ["html"])
});

gulp.task("default", ["html", "scss", "watch", "connect"])
