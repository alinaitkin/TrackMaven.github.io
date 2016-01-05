Title: Python Asynchronous Programming with async/await
Date: 2015-10-27
Category: Python
Tags: programming
Slug: python-asynchronous-programming-with-async-await
Author: Salar Rahmanian
Avatar: salar-rahmanian

Last month [Python 3.5](https://docs.python.org/3/whatsnew/3.5.html)was released adding [PEP-492](https://www.python.org/dev/peps/pep-0492/)to its feature set. This makes asynchronous programming using Python possible and today we are going to demonstrate how to use this new syntax.

### What is Asynchronous Programming

In a normal Python application, in a single thread or process tasks are normally executed synchronously one after another. Sometimes a task may have a delay in finishing and this will delay the next task in the sequence being executed slowing down the whole application from completing.

Asynchronous programming adds the ability to multitask in a single thread or process. What this means is that we can have tasks running in parallel to each other instead of them being executed sequentially. There maybe situations where you need to wait for parallel tasks to complete before continuing.

The new syntax in Python 3.5 makes it possible to run your tasks in parallel and wait for them to complete when needed.

### Overview


To illustrate this new feature we are going to develop a simple python app which receives a JSON post request

