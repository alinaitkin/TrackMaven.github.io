Title: Django Compressor and s3
Date: 2014-12-10
Category: Development
Tags: Django, Django Compressor, s3, static files
Author: Josh Finnie
Avatar: josh-finnie

Here at [TrackMaven](http://trackmaven.com) we have recently reviewed how we were dealing with static files within our application and felt there was a lot of room for improvement. We were running a `collectstatic` command on each box that ran Django and begrudgingly taking the productivity hit. This couldn't go on forever, so we went to only running that command on a "manager" box. This allowed us to reintroduce [Django-Compressor](http://django-compressor.readthedocs.org/en/latest/), which we used briefly, but ran into issues when we moved our app to a seamless deployment strategy.

