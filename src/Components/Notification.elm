module Components.Notification exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


-- Types


type alias Notification =
    { id : Int
    , category : Category
    , title : String
    , message : String
    }


type Category
    = Success
    | Warning
    | Info
    | Error


type Msg
    = Close Int



-- Init


init : ( List Notification, Cmd Msg )
init =
    ( [ { id = 0
        , category = Success
        , title = "Success!"
        , message = "You've successfully set up Elm Starter!"
        }
      ]
    , Cmd.none
    )



-- Update


update : Msg -> List Notification -> ( List Notification, Cmd Msg )
update action notifications =
    case action of
        Close index ->
            let
                notIndexedBy : Int -> Notification -> Maybe Notification
                notIndexedBy index notification =
                    if notification.id == index then
                        Nothing
                    else
                        Just notification
            in
                ( List.filterMap (notIndexedBy index) notifications
                , Cmd.none
                )



-- View


view : List Notification -> Html Msg
view notifications =
    div [ class "notification-container" ] <|
        List.map viewNotification notifications


viewNotification : Notification -> Html Msg
viewNotification notification =
    div
        [ class ("alert " ++ (getAlertClass notification.category))
        , onClick (Close notification.id)
        ]
        [ viewNotificationTitle notification
        , text notification.message
        ]


viewNotificationTitle : Notification -> Html Msg
viewNotificationTitle notification =
    if notification.title == "" then
        text ""
    else
        strong []
            [ text (notification.title ++ " ") ]



-- Misc


getAlertClass : Category -> String
getAlertClass category =
    case category of
        Success ->
            "alert-success"

        Warning ->
            "alert-warning"

        Info ->
            "alert-info"

        Error ->
            "alert-danger"
