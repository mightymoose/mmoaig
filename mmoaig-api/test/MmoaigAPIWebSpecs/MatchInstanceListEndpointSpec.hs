{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module MmoaigAPIWebSpecs.MatchInstanceListEndpointSpec (spec) where

import Test.Hspec (Spec, parallel, describe, it)
import Test.Hspec.Wai (with, pending, shouldRespondWith, get, matchHeaders, (<:>))
import Test.Hspec.Wai.JSON (json)
    
import TestUtilities (testApp)

spec :: Spec
spec = parallel $ with testApp $
  describe "MmoaigAPIWeb.MatchInstanceListEndpoint" $ do
    describe "with no page number query parameter" $
      it "has a bunch of tests" pending
    describe "with no page number query parameter" $ do
      it "responds with a 200" $
        get "v1/match-instances" `shouldRespondWith` 200
      it "responds with Content-Type: application/json" $
        get "v1/match-instances" `shouldRespondWith` 200 {matchHeaders = ["Content-Type" <:> "application/json;charset=utf-8"]}
      it "responds with the first page of match instances" $
        get "v1/match-instances" `shouldRespondWith` [json|{
          data: [ { id: 1 , type: "match_instances", attributes: {createdAt: "1707-04-16T00:00:00", updatedAt: "1707-04-16T00:00:00", matchId: 3} }
                , { id: 2 , type: "match_instances", attributes: {createdAt: "1707-04-17T00:00:00", updatedAt: "1707-04-17T00:00:00", matchId: 4} }
                , { id: 3 , type: "match_instances", attributes: {createdAt: "1707-04-18T00:00:00", updatedAt: "1707-04-18T00:00:00", matchId: 2} }
                , { id: 4 , type: "match_instances", attributes: {createdAt: "1707-04-19T00:00:00", updatedAt: "1707-04-19T00:00:00", matchId: 3} }
                , { id: 5 , type: "match_instances", attributes: {createdAt: "1707-04-20T00:00:00", updatedAt: "1707-04-20T00:00:00", matchId: 4} }
                , { id: 6 , type: "match_instances", attributes: {createdAt: "1707-04-21T00:00:00", updatedAt: "1707-04-21T00:00:00", matchId: 2} }
                , { id: 7 , type: "match_instances", attributes: {createdAt: "1707-04-22T00:00:00", updatedAt: "1707-04-22T00:00:00", matchId: 3} }
                , { id: 8 , type: "match_instances", attributes: {createdAt: "1707-04-23T00:00:00", updatedAt: "1707-04-23T00:00:00", matchId: 4} }
                , { id: 9 , type: "match_instances", attributes: {createdAt: "1707-04-24T00:00:00", updatedAt: "1707-04-24T00:00:00", matchId: 2} }
                , { id: 10, type: "match_instances", attributes: {createdAt: "1707-04-25T00:00:00", updatedAt: "1707-04-25T00:00:00", matchId: 3} }
                , { id: 11, type: "match_instances", attributes: {createdAt: "1707-04-26T00:00:00", updatedAt: "1707-04-26T00:00:00", matchId: 4} }
                , { id: 12, type: "match_instances", attributes: {createdAt: "1707-04-27T00:00:00", updatedAt: "1707-04-27T00:00:00", matchId: 2} }
                , { id: 13, type: "match_instances", attributes: {createdAt: "1707-04-28T00:00:00", updatedAt: "1707-04-28T00:00:00", matchId: 3} }
                , { id: 14, type: "match_instances", attributes: {createdAt: "1707-04-29T00:00:00", updatedAt: "1707-04-29T00:00:00", matchId: 4} }
                , { id: 15, type: "match_instances", attributes: {createdAt: "1707-04-30T00:00:00", updatedAt: "1707-04-30T00:00:00", matchId: 2} }
                , { id: 16, type: "match_instances", attributes: {createdAt: "1707-05-01T00:00:00", updatedAt: "1707-05-01T00:00:00", matchId: 3} }
                , { id: 17, type: "match_instances", attributes: {createdAt: "1707-05-02T00:00:00", updatedAt: "1707-05-02T00:00:00", matchId: 4} }
                , { id: 18, type: "match_instances", attributes: {createdAt: "1707-05-03T00:00:00", updatedAt: "1707-05-03T00:00:00", matchId: 2} }
                , { id: 19, type: "match_instances", attributes: {createdAt: "1707-05-04T00:00:00", updatedAt: "1707-05-04T00:00:00", matchId: 3} }
                , { id: 20, type: "match_instances", attributes: {createdAt: "1707-05-05T00:00:00", updatedAt: "1707-05-05T00:00:00", matchId: 4} }
                , { id: 21, type: "match_instances", attributes: {createdAt: "1707-05-06T00:00:00", updatedAt: "1707-05-06T00:00:00", matchId: 2} }
                , { id: 22, type: "match_instances", attributes: {createdAt: "1707-05-07T00:00:00", updatedAt: "1707-05-07T00:00:00", matchId: 3} }
                , { id: 23, type: "match_instances", attributes: {createdAt: "1707-05-08T00:00:00", updatedAt: "1707-05-08T00:00:00", matchId: 4} }
                , { id: 24, type: "match_instances", attributes: {createdAt: "1707-05-09T00:00:00", updatedAt: "1707-05-09T00:00:00", matchId: 2} }
                , { id: 25, type: "match_instances", attributes: {createdAt: "1707-05-10T00:00:00", updatedAt: "1707-05-10T00:00:00", matchId: 3} }
                ]
        }|]
      it "includes the total number of match instances in the response" pending
    describe "with a negative page number query parameter" $ do
      it "responds with an error code" pending
      it "responds with Content-Type: application/json" pending
      it "responds with an error description" pending
    describe "with a page number query parameter of 0" $ do
      it "responds with an error code" pending
      it "responds with Content-Type: application/json" pending
      it "responds with an error description" pending
    describe "with a page number query parameter which is too large" $ do
      it "responds with an error code" pending
      it "responds with Content-Type: application/json" pending
      it "responds with an error description" pending
    describe "with a valid page number query parameter" $ do
      it "responds with a 200" pending
      it "responds with Content-Type: application/json" pending
      it "responds with the requested page of match instances" pending
    describe "with no page size query parameter" $ do
      it "responds with a 200" pending
      it "responds with Content-Type: application/json" pending
      it "responds with 25 match instances" pending
      it "includes the total number of match instances in the response" pending
    describe "with a negative page size query parameter" $ do
      it "responds with an error code" pending
      it "responds with Content-Type: application/json" pending
      it "responds with an error description" pending
    describe "with a page size query parameter of 0" $ do
      it "responds with an error code" pending
      it "responds with Content-Type: application/json" pending
      it "responds with an error description" pending
    describe "with a page size query parameter which is too large" $ do
      it "responds with an error code" pending
      it "responds with Content-Type: application/json" pending
      it "responds with an error description" pending
    describe "with a valid page size query parameter" $ do
      it "responds with a 200" pending
      it "responds with Content-Type: application/json" pending
      it "responds with the requested number of match instances" pending
      it "includes the total number of match instances in the response" pending

