module UserOverView.Controller exposing (Action(..), update)

import UserOverView.Model exposing (User)


type Action
    = IncrementUsers
    | DecrementUsers


update : Action -> List User -> List User
update action users =
    case action of
        IncrementUsers ->
            List.map incrementValue users

        DecrementUsers ->
            List.map decrementValue users


incrementValue : User -> User
incrementValue user =
    { user
        | value = user.value + 1
    }


decrementValue : User -> User
decrementValue user =
    { user
        | value = user.value - 1
    }
