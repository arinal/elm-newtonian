module Physics exposing (..)

import Vector exposing (..)


-- v0 + ∮v.dt


smallIntegral : Vector -> Float -> Vector -> Vector
smallIntegral vo dt v =
    vo <+> (v <* dt)


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
            original
        else
            (gravityConstant * body1.mass / distance) *> unitDirection


nextBodyAccel : List PointBody -> PointBody -> PointBody
nextBodyAccel bodies body =
    let
        resultant =
            bodies
                |> List.map (gravityAccel body)
                |> List.foldl (<+>) Vector.original
    in
        { body | acceleration = resultant }


nextBodyFrame : Float -> PointBody -> PointBody
nextBodyFrame dt body =
    let
        pos =
            smallIntegral
                body.position
                dt
                body.velocity

        v =
            smallIntegral
                body.velocity
                dt
                body.acceleration
    in
        { body | position = pos, velocity = v }


nextFrame : Float -> InertialFrame -> InertialFrame
nextFrame dt frame =
    { frame
        | bodies =
            frame.bodies
                |> List.map (nextBodyAccel frame.bodies)
                |> List.map (nextBodyFrame dt)
    }
