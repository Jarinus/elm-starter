module UserOverView.View exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import UserOverView.Model exposing (User)
import UserOverView.Controller exposing (Action(..))


view : List User -> Html Action
view users =
    div [ class "row" ]
        [ div [ class "col-md-6" ]
            [ div [ class "btn-group" ]
                [ button
                    [ classList
                        [ ( "btn", True )
                        , ( "btn-primary", True )
                        ]
                    , onClick IncrementUsers
                    ]
                    [ text "Increment all" ]
                , button
                    [ classList
                        [ ( "btn", True )
                        , ( "btn-primary", True )
                        ]
                    , onClick DecrementUsers
                    ]
                    [ text "Decrement all" ]
                ]
            ]
        , div [ class "col-md-6" ]
            [ (renderUsers users) ]
        ]


renderUsers : List User -> Html Action
renderUsers users =
    table [ class "table" ]
        [ thead []
            [ tr []
                [ th [] [ text "Id" ]
                , th [] [ text "Name" ]
                , th [] [ text "Value" ]
                , th [] []
                ]
            ]
        , tbody [] (List.map renderUserRow users)
        ]


renderUserRow : User -> Html Action
renderUserRow user =
    tr []
        [ td [] [ text (toString user.id) ]
        , td [] [ text user.name ]
        , td [] [ text (toString user.value) ]
        ]


getControls : User -> Html Action
getControls user =
    div [ class "btn-group" ]
        [ button
            [ classList
                [ ( "btn", True )
                , ( "btn-primary", True )
                ]
            ]
            [ text "Increment all" ]
        , button
            [ classList
                [ ( "btn", True )
                , ( "btn-primary", True )
                ]
            ]
            [ text "Decrement all" ]
        ]
