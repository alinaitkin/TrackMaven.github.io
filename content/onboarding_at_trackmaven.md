Title: Onboarding at TrackMaven
Date: 12-10/2014
Category: Being Awesome
Tags: Docker, Pair Programing
Slug: onboarding-at-trackmaven
Author: Farhan Syed
Avatar: farhan-syed
Summary: In this post, I'll talk why Onboarding a new engineer is so important, and how it went during my first month at TrackMaven


Today I will be talking about Onboarding! Things we are going to cover are what the heck does onboarding mean anyway, why its important, and then **gasp** i'll attempt to grade how well my new coworkers onboraded me with my first month. Keep in mind that this will be engineer focused.

And with that lets start....


## What is Onboarding?

>
Onboarding is the mechanism in which you take new employees and turn them into **autonomous**, **confident** and **productive** members of the company. 

Let's dive a little deeper into these three tenants and how they specifically apply to engineering onboarding.

### Productivity
This is the measure on how quickly you can get someone ramped up and into productive member of the team. 

Key factors include: setup local dev environment, how easy it to deploy code, run tests, and basically any other ways in which an engineer can possibly contribute to a codebase. 

What really shines in this department is how automated are all the processes, documentation not on just the codebase but on convention, and how quickly is it to get access to this information.

### Autonomy

This tenant is not really specific to engineer at all but exist as a human universal. We are people and to have some form of autonomy goes a long way for keeping engineers satisfied.

Key Factors in this category include: how much supervision do they need, are they able to choose what types of problems they want to take on

### Confidence

This is probably the most important metric of them all is it ties into the other two. Its all about creating engineers who believe they are valuable and feel that they can actually enact change. Also confident engineers are more likely to learn and pick up new skills that are required for the job. It's important to note that this measure is only important for the individual but for the entire team as it helps create the space for emergent leaders.



## Teams should onboard together!

I think we all can agree that software is not written by single person ([...Well sometimes it is....](http://motherboard.vice.com/read/gods-lonely-programmer)), but in teams. And teams matter, teams are responsible for building great features throughout history, and onboarding is no different. Onboarding is a team endeavor, and team onboarding spread some of the builtin institutional knowledge that is inherent in engineering.




## Knowledge Transfer!

There are 3 kinds of things that people need learn when onboarding.

- Technical Knowledge: This is one the most obvious, this is just how the application architected, how parts of the application work, and ops.

- Company Knowledge & Process: This includes the companies history, what is the point of the company, how product ideation happens and all the process tools(Bug-tracking, user stories, etc)

- Personal Development: Again this is pretty obvious, this how the new engineer see what areas they would be interested in pursuing, what concepts, and expertise do they really want to develop


Those are generally the basics when it comes to onboarding. In the current tech landscape, getting an engineer produdctive cost the company some serious $$, and helps establish a companies culutre. And with that, tt's time to share my experiences at TrackMaven.


## My experience at TrackMaven
----


### Productivity

I was completely blown away at the level of automation that I was introduced to during my first week at TrackMaven. My local dev environment took a mere hour and half. So much of that is due to the awesome tooling we have. **Docker** and + **Fig** makes setting up isolated services a breeze, not to mention having a hand-rolled cli for all stages of the application life cycle(start, update, destroy). Another thing that impressed was the amount of testing that has been written for the application. Lastly the deployment strategy was just as impressive. We use **Ansible** and **Fabric** to deploy to our different environments. Yes, we love python!

Because of the of how well documented and automated our process was for shipping code I was able to push code out within the first couple of days. It was just a great way for me to feel that I was contributing to a team very quickly. I didn't understand how the entire application worked but being able to have such a streamlined and automated process really helped me feel confident.


### Autonomy
---

TrackMaven has a Onboarding checklist that really grounded me when I first started. Instead of taking a passive stance, I played an active role on what thigns I wanted to learn that day. Not only did it satisfied my curousity, but it made me feel like I was acutally learning. Also there is just somehting magical about crossing things off a large list. And by the end of the month I had a only a few tasks left (one of them being write a blog post). The checklist items ranged form local devops to scaling boxes on production. The full gamut of full-stack.



### Confidence
---
I had the ability to push code on day two and by the end of my fourth day, I had developed a feature, pushed it through all the steps of our process (git strategy, QA, PR, environment deploy), and merged into master! It was exciting to be able to fee like I was part of the team in a mere 96 hours. How was I able to do this so quickly?

**Pair programing**. In my first week I paired with 5/7 of the engineers on our team. This was great opportunity not only to see a ton of awesome tools(chrome extensions, keyboard shortcuts, shell-scripts) that my co workers were using, but to also understand how the codebase was architected.

**Testing**. I am a bit of a testing nerd myself, and the tooling around testing at TrackMaven is really impressive. Great use of mocks, great separation of tests (unit, api, integration). I was able to know if I broke something , in my opinion there is no way better way understand how "it "works other then just reading the tests.


**Monitoring**

Much of these won't be a surpise but we use Sentry, New Relic and librato for alot of our monitoring. Again, it was really easy for me to get the information I needed to solve problems that were happening anywhere in the stack. 



### TrackMaven Culture

>
Using data, we iterate and work to improve. In order to do that, we focus on opportunities to learn. This means learning internally and also externally through events and participation in our community. It also means being willing to try things that fail in order to succeed.

After experiencing this first hand I can say that is most defiantly true. There are tons of great feedback mechanism built into the team that allows use to try things out, experiment and fail quickly. The team strucutre is flat, and everyone is encouraged to improve the process and not shy away form having open communication with in regards to uncommon experiences.

###  Great pLace to work

Overall I would say that the onboarding in TrackMaven is pretty impressive. I have some ideas of on own to make the onboarding process even better. So far its been great and I am looking forward to take on harder problems, and building an awesome product. Did I mention that we are [hiring](http://trackmaven.theresumator.com/apply/EzkTn4/Software-Maven.html)?





















