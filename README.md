# elm-newtonian

### [Live Demo](https://arinal.github.io/elm-newtonian/)
Finally, solar system animation in your browser! Every planet movement is calculated using Newtonian gravity equation.

This application is simple, mean to be an ideal case study if you want to start learning elm with enjoyment :)

## Getting started

If elm isn't installed in your system, install it [here](https://guide.elm-lang.org/install.html)

Afterwards, type this in your terminal.
``` shellsession
$ git clone https://github.com/arinal/elm-newtonian.git
$ cd elm-newtonian
$ elm-reactor
elm-reactor 0.18.0
Listening on http://localhost:8000
```

Browse to [http://localhost:8000/Main.elm](http://localhost:8000/Main.elm) and witness realtime calculation of the greatest fundamental nature law ever invented in classical physics :)

Yes, the planet doesn't have fixed orbital track because I don't have time to place it correctly at the beginning.
To change or add objects, take a look at `init` inside `Main.elm` and play around with planet's initial parameters (mass, velocity, position, etc)
