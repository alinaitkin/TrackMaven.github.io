Title: Using Bower
Date: 2014-06-30
Category: javascript
Tags: javascript, bower, how-to
Slug: using-bower
Author: Josh Finnie
Avatar: josh-finnie

Using [Bower](http://bower.io) can save you a lot of time installing and keeping track of your third-party javascript libraries. It can be difficult to keep track of which version of what library you or your team uses, that's why we use it here at TrackMaven. Below I will go into how and why we use it.

## What is Bower
So what is Bower? Bower is the "package manager for the web." It allows you to install and track third-party javascript libraries easily. At TrackMaven we use it to install and keep track of all the libraries we use. Below is just a small excerpt from our `bower.json` file:

```
"dependencies": {
    "jquery": "1.11.0",
    "angular": "1.2.15",
    "angular-ui-router": "0.2.10",
    "d3": "3.3.11",
    ...
}
```

Bower allows for us to not only keep track of what third-party javascript libraries we are using, but it also allows us to pin these libraries to certain versions. The ability to pin the versions have become invaluable to us as we grow our engineering team; it allows us to keep our development environment consistent across all our engineers.

## Initial Setup
Installing Bower is simple if you already have Node.js installed. (If you do not have Node.js installed, you can simply follow the directions [here](http://nodejs.org/download/).) Let's walk through the steps required to install Bower:

```
npm install -g bower
```

That's it! The above command installs Bower globally on your machine; this allows you to use Bower for all your projects. If you want to use Bower to install a javascript library, all you need to do is run the following command:

```
bower install angular
```

And this installs angular.js in your `bower_components` folder.

### Customizations

The defaults that come with Bower are pretty sane, but I always feel like the default folder `bower_components` just a bit too clunky. Luckily Bower allows for an easy way to change some defaults. This is done via the `.bowerrc` file. Here at TrackMaven, we have three lines to ease our time with Bower:

```
{
    "directory": ".bower-cache",
    "json": "bower.json",
    "interactive": false
}
```

Those three line do as followed:

* **directory** - Changes the default directory in which Bower installs the libraries.
* **json** - Tells Bowser where your init file is (we will discuss this later.)
* **interactive** - Makes Bower interactive, prompting whenever necessary. We turn this off since we use [Docker](http://www.docker.com/), and interactions break our install. This defaults to `null` which means `auto`, and is likely what you'd want to keep unless you run into issues like us.

The entire `.bowerrc` configuration options can be found [here](http://bower.io/docs/config/).

## Benefits
The benefits of Bower for TrackMaven were seen immediately. After setting up Bower we had a simple way to keep track of not only what third-party libraries we use for our app, but even what versions of the library. This has cut down the time it takes us to spin up our development environments and cut down on the bugs we see when using slightly different versions of third-party libraries. Bower also allowed us to easily integrate our third-party libraries into our build process which allowed us to concatenate and minify them all seamlessly.

## Drawbacks
The drawbacks of Bower are few and far between but one of the major issues we had in using Bower was the lack of adoption with some third-party libraries. It takes a non-trivial effort to make your library compatible with Bower and some just haven't taken the time. Adding these libraries to our automated build process took quite the effort, but in the long run it was worth it.

## Conclusion
In conclusion, if you have not looked into using Bower I highly recommend it. Integration into our workflow took a little bit of time, but the benefits we are seeing from it are quite amazing!
