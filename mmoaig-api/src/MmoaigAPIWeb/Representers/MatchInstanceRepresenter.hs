{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE OverloadedStrings #-}
module MmoaigAPIWeb.Representers.MatchInstanceRepresenter (createMatchInstanceIdentifier, createMatchInstanceObject, MatchInstanceAttributes) where

import Data.Aeson (ToJSON, toJSON, FromJSON, parseJSON, object, (.=), withObject, (.:))
import Data.Time (LocalTime)

import MmoaigAPI.Schema (MatchInstanceTable, MatchInstanceTableT(MatchInstanceTable), dbMatchInstanceId, PrimaryKey(MatchTableId), dbMatchInstanceMatchId, dbMatchInstanceCreatedAt, dbMatchInstanceUpdatedAt)
import MmoaigAPIWeb.Representers.JSONApi(ResourceIdentifier(ResourceIdentifier), ResourceObject(ResourceObject))

-- TODO: Move the token down
data MatchInstanceAttributes = MatchInstanceAttributes
  { matchInstanceMatchId   :: Int
  , matchInstanceCreatedAt :: LocalTime
  , matchInstanceUpdatedAt :: LocalTime
  }

-- TODO: Test this
instance ToJSON MatchInstanceAttributes where
  toJSON MatchInstanceAttributes{..} = object [ "createdAt"          .= matchInstanceCreatedAt
                                              , "updatedAt"          .= matchInstanceUpdatedAt
                                              , "matchId"            .= matchInstanceMatchId
                                              ]

-- TODO: Test this
instance FromJSON MatchInstanceAttributes where
  parseJSON = withObject "MatchInstanceAttributes" $ \o -> do
    matchInstanceMatchId   <- o .: "matchId"
    matchInstanceCreatedAt <- o .: "createdAt"
    matchInstanceUpdatedAt <- o .: "updatedAt"
    return MatchInstanceAttributes{..}

-- TODO: Test this
createMatchInstanceIdentifier :: MatchInstanceTable -> ResourceIdentifier
createMatchInstanceIdentifier MatchInstanceTable{..} = ResourceIdentifier dbMatchInstanceId "match_instances"

-- TODO: Test this
createMatchInstanceObject :: MatchInstanceTable -> ResourceObject MatchInstanceAttributes ()
createMatchInstanceObject matchInstance@MatchInstanceTable{..} = ResourceObject identifier (Just attributes) Nothing
  where
    attributes = MatchInstanceAttributes matchID dbMatchInstanceCreatedAt dbMatchInstanceUpdatedAt
    identifier = createMatchInstanceIdentifier matchInstance
    (MatchTableId matchID) = dbMatchInstanceMatchId
