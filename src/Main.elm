module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
-- import Css exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

-- Model
type alias Model =
    { title : String
    , menu1 : String
    , menu2 : String
    , menu3 : String
    , menu4 : String
    , menu5 : String
    }

init : ( Model, Cmd Msg )
init =
    Model "テスト　タイトル"
          "メニュー　一"
          "メニュー　二"
          "メニュー　三"
          "メニュー　四"
          "メニュー　五" ! []



-- Update
type Msg
    = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []



-- View
type alias Style = List ( String, String )

backdrop : Style
backdrop =
    [ ("width", "100%")
    , ("height", "100%")
    ]

banner : Style
banner =
    [ ("background-image", ("url(/resources/city.jpeg)"))
    , ("width", "100%")
    , ("height", "250px")
    , ("border-bottom", "lightgray 3px solid")
    , ("bdackground-repeat", "no-repeat")
    , ("background-size", "cover")
    , ("background-position", "0.0")
    ]

copy : Style
copy =
    [ ("font-family", "Roboto,sans-serif")
    , ("font-weight", "lighter")
    , ("color", "#fff")
    ]

title : Style
title = List.append [ ("padding-top", "90px")
                    , ("padding-left", "7%")
                    , ("font-size", "40px")
                    , ("margin", "0")
                    ] copy


menu : Style
menu =
     [ ("background", "#00bcd4")
     , ("height", "50px")
     , ("width", "100%")
     , ("top", "200px")
     , ("position", "absolute")
     ]


menuItem : Style
menuItem =
    List.append [ ("font-size", "16px")
                , ("display", "inline-block")
                , ("width", "140px")
                , ("cursor", "pointer")
                , ("height", "50px")
                ] copy

menuLabel : Style
menuLabel =
    [ ("vertical-align", "middle")
    , ("padding-left", "20px")
    ]

view :  Model -> Html Msg
view model =
  div [ style backdrop ]
      [ div [ style banner ]
            [ h1 [ style title ]
                 [ text model.title ]

            , div [style menu]
                  [ a [ style menuItem ]
                      [ p [style menuLabel]
                          [text model.menu1 ]
                      ]
                  , a [style menuItem]
                      [ p [style menuLabel]
                          [text model.menu2 ]
                      ]
                  , a [style menuItem]
                      [ p [style menuLabel]
                          [text model.menu3 ]
                      ]
                  , a [style menuItem]
                      [ p [style menuLabel]
                          [text model.menu4 ]
                      ]
                  , a [style menuItem]
                      [ p [style menuLabel]
                          [text model.menu5]
                      ]
                  ]
           ]
      ]

-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
