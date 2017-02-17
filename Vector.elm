module Vector exposing (..)


type alias Vector =
    { x : Float
    , y : Float
    }


origin : Vector
origin =
    Vector 0 0


magnitude : Vector -> Float
magnitude v =
    sqrt (v.x ^ 2 + v.y ^ 2)


neg : Vector -> Vector
neg v =
    Vector -v.x -v.y


(<+>) : Vector -> Vector -> Vector
(<+>) v1 v2 =
    Vector (v1.x + v2.x) (v1.y + v2.y)


add : Vector -> Vector -> Vector
add =
    (<+>)


(<->) : Vector -> Vector -> Vector
(<->) v1 v2 =
    v1 <+> (neg v2)


sub : Vector -> Vector -> Vector
sub =
    (<->)


(<.>) : Vector -> Vector -> Float
(<.>) v1 v2 =
    v1.x * v2.x + v1.y * v2.y


dot : Vector -> Vector -> Float
dot =
    (<.>)


(<*>) : Vector -> Vector -> Vector
(<*>) v1 v2 =
    Vector (v1.x * v2.x) (v1.y * v2.y)


cross : Vector -> Vector -> Vector
cross =
    (<*>)


(*>) : Float -> Vector -> Vector
(*>) c v =
    Vector (v.x * c) (v.y * c)


(<*) : Vector -> Float -> Vector
(<*) v c =
    c *> v


(/>) : Float -> Vector -> Vector
(/>) c v =
    Vector (v.x / c) (v.y / c)


(</) : Vector -> Float -> Vector
(</) v c =
    c /> v


unit : Vector -> Vector
unit v =
    v </ (magnitude v)
