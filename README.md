# elm-newtonian

[![A solar system](https://imgur.com/sIuj0OM.png)](https://arinal.github.io/elm-newtonian/)

Finally, a solar system animation in your browser! Every planet movement is calculated using Newtonian gravity equation.

This application is simple, meant to be an ideal case study if you want to start learning elm with enjoyment!

## Getting started

If elm hasn't been installed in your system, install it [here](https://guide.elm-lang.org/install.html)

Afterwards, type this in your terminal:
``` shellsession
$ git clone https://github.com/arinal/elm-newtonian.git
$ cd elm-newtonian
$ elm-reactor
elm-reactor 0.18.0
Listening on http://localhost:8000
```

Browse to [http://localhost:8000/Main.elm](http://localhost:8000/Main.elm) and witness a realtime calculation of the greatest fundamental nature law ever invented in classical physics!

The planets don't have a nice fixed orbital track, you're free to edit their locations and initial velocities.
Take a look at `init` inside `Main.elm` and play around with each planet's initial parameters (mass, velocity, position, etc).
