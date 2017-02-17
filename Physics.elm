module Physics exposing (..)

import Vector exposing (..)


{-| Equivalent to ` v0 + ∮v.dt `
    Assuming dt is small, v(t) become constant and integration is reduced into multiplication
-}
smallIntegral : Vector -> Vector -> Float -> Vector
smallIntegral vo v dt =
    vo <+> (v <* dt)


(∮) : Vector -> Vector -> Float -> Vector
(∮) =
    smallIntegral


type alias PointBody =
    { position : Vector
    , velocity : Vector
    , acceleration : Vector
    , mass : Float
    , tag : String
    }


type alias InertialFrame =
    { bodies : List PointBody
    }


gravityConstant : Float
gravityConstant =
    2


gravityAccel : PointBody -> PointBody -> Vector
gravityAccel body body1 =
    let
        distanceVect =
            body1.position <-> body.position

        distance =
            magnitude distanceVect

        unitDirection =
            unit distanceVect
    in
        if distance < 0.1 then
            Vector.origin
        else
            (gravityConstant * body1.mass / distance) *> unitDirection


applyForce : List PointBody -> PointBody -> PointBody
applyForce bodies body =
    let
        resultant =
            bodies
                |> List.map (gravityAccel body)
                |> List.foldl (<+>) Vector.origin
    in
        { body | acceleration = resultant }


nextPosition : Float -> PointBody -> PointBody
nextPosition dt body =
    let
        nextPos =
            smallIntegral
                body.position
                body.velocity
                dt

        nextV =
            smallIntegral
                body.velocity
                body.acceleration
                dt
    in
        { body | position = nextPos, velocity = nextV }


nextFrame : Float -> InertialFrame -> InertialFrame
nextFrame dt frame =
    { frame
        | bodies =
            frame.bodies
                |> List.map (applyForce frame.bodies)
                |> List.map (nextPosition dt)
    }
