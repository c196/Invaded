# Invaded World

Invaded World is a proof of concept application for a final project, written in ruby on rails with no prior knowledge of the language or the framework.

The goal was to create a dynamic self managing game plattform based on the street art-works placed arround the world by the artist Invader. http://www.space-invaders.com/home/

Based on a concept similar to Nianticlabs Ingress, the Invaders placed world wide can be hunted based on maps and hints created by other users. Since everyone can register an Invader a credibility system has been created that allows for community management without requiring administrators. If a user finds an Invader the server verifies the authenticy thanks to the location and image recognition.

## Installation

Ruby, rails, imagemagick and their dependencies must be installed. Then create the database and run the migrations.

```
bundle install

rake db:create

rake db:migrate

rails s

```

### Deploying

Invaded World was built to be deployed with Capistrano.

https://github.com/capistrano/capistrano
