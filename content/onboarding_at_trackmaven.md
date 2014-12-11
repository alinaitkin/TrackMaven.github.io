Title: Onboarding at TrackMaven
Date: 12-10/2014
Category: Being Awesome
Tags: Docker, Pair Programing
Slug: onboarding-at-trackmaven
Author: Farhan Syed
Avatar: farhan-syed
Summary: In this post, I'll talk why Onboarding a new engineer is so important, and how it went during my first month at TrackMaven


Today I will be talking about Onboarding! Things we are going to cover are what the heck does onboarding mean anyway, why its important, and then **gasp** i'll attempt to grade how well my new cowokers onboraded me with my first month. Keep in mind that this will stay as much as possible in the relam of onboaridng an engineer.

And with that lets start....


## What is Onboarding?

>
Onboarding is the mechanism in which you take new employees and turn them into **autuonmous**, **confident** and **productive** members of the company. These are the basic teants onboarding so to judge

Let's dive a little deeper into these three tenants and how they specfically apply to engineering onboarding.

### Productivity
This is the measure on how quickly you can get someone ramped up and into productive member of the team. 

Key factors include: setup local dev environment, how easy it to deploy code, run tests, and basically any other ways in which an engineer can possibily contribute to a codebase. 

What really shines in this department is how automated are all the proceses, documentation not on just the codbase but on convention, and are these sorts of resources easily accessible.

### Autonomy

This tenant is not really specific to engineer at all but exist as a human universal. We are people and to have some form of autonmy goes a long way for keeping engineers satisfied.

Key Factores in this category include: how much supervision do they need, are they able to choose what types of problems they want to workon, and resource permissions.

### Confidence

This is probably the most imporant metric of them all is it ties into the other two. Its all about creating engineers who believe they are valuable and feel that they can actually enact change. Also confident engineers are more likely to learn and pick up new skills that are required for the job. It's important to note that this measure is only imporant for the indivudal but for the entire team as it helps create the space for emergent leaders.



## Teams should onboard togeather!

I think we all can agree that software is not written by single person ([...Well sometimes it is....](http://motherboard.vice.com/read/gods-lonely-programmer)), but in teams. And teams matter, teams are resonsible for building great features throughout history, and onboarding is no different. Onboarding is a team endeavor, and helps spread some of the builtin insitutioal knowledge that is inherent in engineering.




## Knowledge Transfer!

There are 3 kinds of things that people need learn when onboarding.

- Technical Knowledge: This is one the most obvious, this is just how the application architectured, how parts of the application work, and production and other environments are deployed to.

- Company Knowledge & Process: This includes the companies history, what is the point of the company, how product ideation happens and all the process tools(Bugtracking, user stories, etc)

- Personal Development: This how the new engineer see what areas he would be interested in purusing.


Now that we have gotten that out of the way. It's time to share my exeriences at TrackMaven.


## My experience at TrackMaven
----


### Productivity

I was completely blown away at the level of automation that I was introduced to during my first week at trackmaven. My local dev environment took a mere hour and half. So much of that is due to the awesome tooling we have. **Docker** and + **Fig** makes setting up isolated services a breeze, not to mention having a hand-rolled CLi for all stages of the application life cyce(start, update, destroy). Another thing that impressed was the amount of testing that has been written for the applcaiton. There is seriously no way to better onboard someone then to have a grea suite of tests to help an engineer know when he broke something. Lastly out deoployment starget was just as impressive. We use **Ansible** and **Fabri** to deploy to our different environments. Yes, we love python!

Because of the of how well documented and autmated our process was for shipping code I was able to push code out within the first couple of days. It was just a great way for me to feel that I was contributing to a team very quicly. I didn't understand how the entire application worked but being able to have such a streamlined and automated process really helped me feel confident.

Grade: A 

### Autonomy
---

TrackMaven has a Onboarding checklist that really grounded me when I first started. Instead being waiting to be told what the tod I was given progressivly more autonmy to cross things off my list and in wthin my first month, I have a only a few tasks left (one of them being write a blog post). The checklist items ranged form local devops to, scaling boxes on production. 



### Confidence
---
I had the ability to push code on day two and by the end of my third week, I had developed a feature, pushed it through all the steps of our process (git stragety, QA, PR, envionrment deploy), and merged into master! It was exciting to be able to fee like I was part of the team in a mere 72 hours. How was I able to do this so quickly?

**Pair programing**. In my first week I paired with 6/7 of the engineers on our team. This was great oppurtunity not only to see a ton of awesome tools that my co workers were using, but to also understand how the codebase was architected. 

**Testing**. I am a bit of a testing nerd myself, and the tooling around testing at TrackMaven is really impressive. Great use of mocks, great sepeartion of tests (unit, api, integration). I was able to know if I broke something , in my opinion there is no way better way understand how  "it "works other then just reading the tests.


### TrackMaven Culture

>
Using data, we iterate and work to improve. In order to do that, we focus on opportunities to learn. This means learning internally and also externally through events and participation in our community. It also means being willing to try things that fail in order to succeed.

After expereincing this first hand I can say that is most definlty true. There are tons of great feedback mechanism built into the team that allows use to try things out, experiement and fail quickly. The team is extemely flat,and everyone is encouraged to improve process and not shy away form haing open communitcaiton with in regards to uncommon expreinces.

###  Great pLace to work

Overall I would say that the onboarding in TrackMaven is pretty impressive. I have some ideas of on own to make the onboarding process even better. So far its been great and I am looking forward to take on harder problems, and building an awesome product. Did I mention that we are [hiring](http://trackmaven.theresumator.com/apply/EzkTn4/Software-Maven.html)?





















