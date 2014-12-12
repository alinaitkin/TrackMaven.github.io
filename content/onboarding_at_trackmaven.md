Title: Onboarding at TrackMaven
Date: 12-10/2014
Category: Being Awesome
Tags: Docker, Pair Programing
Slug: onboarding-at-trackmaven
Author: Farhan Syed
Avatar: farhan-syed
Summary: In this post, I'll talk about why onboarding a new engineer is so important and discuss my first month at TrackMaven


Today I will be talking about onboarding! We will cover what the heck does onboarding mean anyway, why it is important, and then **gasp** I'll attempt to grade how well my new coworkers onboarded me in my first month. Bear in mind that this will be focused on engineering only.

With that, let us begin!


## What is onboarding?

---

>
Onboarding is the mechanism with which you take new employees and turn them into **autonomous**, **confident**, and **productive** members of the company. 



#### Autonomy

As people, having autonomy goes a long way towards being professionaly satisfied. Two critical measures of autonomy are how much supervision is necessary and is one able to choose which types of problems they want to work on.


#### Confidence

Is your onboarding process creating engineers who believe they are valuable and feel that they can actually enact change? Confident engineers are more likely to learn and pick up new skills that are required for the job because they are willing to fail in the short term. Confidence is important not only for the individual but also the entire team as it helps to create the space for emergent leaders.


#### Productivity
How quickly can you take a stranger and turn them into a productive member of the team?

Time to productivity can be measured by gauging how long it takes to setup a local development environment, how easy it to deploy code and run tests, and basically any other ways in which an engineer can possibly contribute to a codebase. 

At TrackMaven, I was impressed with the automation of these processes, the documentation not on just the codebase but on convention, and how easy it is to access to this information.

## Why is it important?

---

>
Onboarding is important because it encourages **team bonding** and **knowledge transfer**.



### Team bonding!

The best software is not written by single person but by teams. Given that teams have been responsible for building great features throughout history, onboarding should be a team endeavor with the goal of disseminating the institutional knowledge of a company's engineers.



### Knowledge transfer!

In my opinion there are three primary areas of knowledge that should be conveyed when onboarding: technical knowlege, company & process knowlegde, and personal development process knowledge.


- Technical knowledge: How is the application architected? How do the pieces of the application work? How are devops handled?
- 
- Company knowledge & process: What is the history of the company? What is the point of the company? How is the how product ideation process handled? What process tools do we use (bug-tracking, user stories, etc)?

- Personal development: How should the new engineer figure out which capabilities they might be interested in pursuing, i.e. is there an area of expertise or the product they want to focus on?

Those are the onboarding basics. While they may seem simple, because in today's technology landscape getting an engineer to be productive is not cheap and establishing a company culture is difficult, the basics should be taken seriously

With that, it is time to share my TrackMaven onboarding experience.


## My experience at TrackMaven
----


### Productivity

I was completely blown away at the level of automation that I was introduced to during my first week at TrackMaven. Setting up my local development environment took an hour and half. So much of that is due to the awesome tooling we have: **Docker** and **Fig** make setting up isolated services a breeze and TrackMaven has a hand-rolled cli for all stages of the application life cycle (start, update, destroy). I was also impressed by the amount of testing code that has been written for the application. Finally, our deployment strategy was straightforward: we use **Ansible** and **Fabric** to deploy to our different environments. Yes, we love python!

Because of how well documented and automated our process is for shipping code I was able to push code out on the second day and it was great to feel that I was contributing to a team so quickly. While I did not immediately understand how the entire application worked, being able to operate within a streamlined and automated process helped me to feel confident.


### Autonomy


One of the most helpful aspects of TrackMaven's onboarding was their  onboarding checklist, which covers everything from local devops to scaling production boxes. Instead of having to wait passively for the next person with free time to come and show me something I was able to play an active role and decide what I wanted to learn that day. Not only did this give me an outlet for my curousity but it also gave me that warm fuzzy feeling that only self-directed learing can elicit. Also, there is just something magical about crossing things off a large list. By the end of the month I had only a few tasks left (one of them being write a/this blog post). 


### Confidence

I was able to push code on day two and by the end of my fourth day I had developed a feature, pushed it through all the steps of our process (git strategy, QA, PR, testing environment deploy), and merged into master! It was exciting to to feel like part of the team in less than 96 hours. I would not have been able to do this without:

**Pair programing**. In my first week I paired with five of the seven engineers on our team. This was great opportunity not only to see many awesome tools ([chrome extensions](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc?hl=en-US), keyboard shortcuts, scripts) that my co workers were using but to also understand the codebase architecture.

**Testing**. The tooling around testing (great use of mocks and separation of unit, api, and integration tests) at TrackMaven is impressive even to a testing nerd like me. In my opinion there is no way better way understand how "it" works than by reading well-written tests.

**Monitoring**. We (unsurprisingly) use Sentry, New Relic and Librato for the majority of our monitoring. Such extensive logs, combined with testing, enabled me to get the information I needed to solve problems that were happening anywhere in the stack. 


### TrackMaven culture

>
Using data, we iterate and work to improve. In order to do that, we focus on opportunities to learn. This means learning internally and also externally through events and participation in our community. It also means being willing to try things that fail in order to succeed.

After my firsthand experience I will attest that is true. Our team's  feedback mechanisms allow us to… try things out, experiment, and fail quickly. Our team structure is flat and everyone is encouraged to improve the process and not shy away from open communication.

###  Great place to work

Overall, I was impressed with the TrackMaven onboarding. I have ideas of my own to make the onboarding process even better. So far it has been great and I am looking forward to tackling even harder problems and improving an awesome product. 

Did I mention that we are [hiring](http://trackmaven.theresumator.com/apply/EzkTn4/Software-Maven.html)?





















