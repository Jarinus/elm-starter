module App exposing (main)

import Html exposing (..)
import UserOverView.Model exposing (User)
import UserOverView.Controller exposing (update, Action)
import UserOverView.View exposing (view)


model : List User
model =
    [ { id = 0
      , name = "Some person"
      , value = 0
      }
    , { id = 1
      , name = "Another person"
      , value = 0
      }
    ]


main : Program Never (List User) Action
main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }
