module Main exposing (..)

import Html.App
import Html exposing (text, Html, div)
import Html.Attributes exposing (class)

import Components.ArticleList as ArticleList

type alias Model = { articleListModel: ArticleList.Model }

initialModel : Model
initialModel = 
  { articleListModel = ArticleList.initialModel }

init : (Model, Cmd Msg)
init = 
  ( initialModel, Cmd.none )

type Msg
  = ArticleListMsg ArticleList.Msg

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ArticleListMsg articleMsg ->
      let (updatedModel, cmd) = ArticleList.update articleMsg model.articleListModel
      in ( { model | articleListModel = updatedModel }, Cmd.map ArticleListMsg cmd )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : Model -> Html Msg
view model =
  div [ class "elm-app" ]
    [ Html.App.map ArticleListMsg (ArticleList.view model.articleListModel) ]

main : Program Never
main =
  Html.App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
