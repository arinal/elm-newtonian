module Physics exposing (..)

import Vector exposing (..)


gravityConstant : Float
gravityConstant =
    2.0


gravityAccel : Float -> Float -> Float
gravityAccel m r =
    gravityConstant * m / r ^ 2


type alias PointBody =
    { position : Vector
    , velocity : Vector
    , acceleration : Vector
    , mass : Float
    }


smallIntegral : Float -> Vector -> Vector -> Vector
smallIntegral deltaX fx y0 =
    y0 <+> (fx <* deltaX)
