module App exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.Notification as Notification exposing (..)


type alias Model =
    { notifications : List Notification }


type Msg
    = NotificationMsg Notification.Msg


init : ( Model, Cmd Msg )
init =
    let
        ( notifications_, notificationsCmd ) =
            Notification.init
    in
        ( { notifications = notifications_ }
        , Cmd.map
            (\msg -> NotificationMsg msg)
            notificationsCmd
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        NotificationMsg msg ->
            let
                ( notifications_, notificationsCmd ) =
                    Notification.update msg model.notifications
            in
                ( { model | notifications = notifications_ }
                , Cmd.map
                    (\msg -> NotificationMsg msg)
                    notificationsCmd
                )


view : Model -> Html Msg
view model =
    div [ id "app" ]
        [ div [ id "notifications" ]
            [ h3 []
                [ text "Notifications" ]
            , Html.map
                (\msg -> NotificationMsg msg)
                (Notification.view model.notifications)
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
