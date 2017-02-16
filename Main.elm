module Main exposing (..)

import Html exposing (Html, text)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)
import Vector exposing (..)
import Physics exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { frame : InertialFrame
    , height : String
    , width : String
    }


type Msg
    = Tick Time


init : ( Model, Cmd Msg )
init =
    { frame =
        { bodies =
            [ { position = Vector 500 200
              , velocity = Vector 0 0
              , acceleration = Vector 0 0
              , mass = 8
              , tag = "orange"
              }
            , { position = Vector 500 100
              , velocity = Vector 3 0
              , acceleration = Vector 0 0
              , mass = 1
              , tag = "brown"
              }
            , { position = Vector 300 200
              , velocity = Vector 0 4
              , acceleration = Vector 0 0
              , mass = 1.5
              , tag = "gray"
              }
            , { position = Vector 500 500
              , velocity = Vector 5 0
              , acceleration = Vector 0 0
              , mass = 2
              , tag = "blue"
              }
            , { position = Vector 500 530
              , velocity = Vector 3 0
              , acceleration = Vector 0 0
              , mass = 0.4
              , tag = "gray"
              }
            ]
        }
    , width = "1300"
    , height = "700"
    }
        ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every Time.millisecond Tick


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick _ ->
            { model | frame = nextFrame 0.1 model.frame } ! []


drawBody : PointBody -> Html Msg
drawBody body =
    let
        ( x, y, m ) =
            ( toString body.position.x
            , toString body.position.y
            , toString (body.mass * 10)
            )
    in
        circle [ cx x, cy y, r m, fill body.tag ] []


view : Model -> Html Msg
view model =
    svg [ viewBox ("0 0 " ++ model.width ++ " " ++ model.height), width model.width ]
        (rect
            [ cx "0"
            , cy "0"
            , width model.width
            , height model.height
            , fill "#5"
            ]
            []
            :: (model.frame.bodies |> List.map drawBody)
        )
