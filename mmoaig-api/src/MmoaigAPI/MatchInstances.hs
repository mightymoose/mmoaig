module MmoaigAPI.MatchInstances (loadMatchInstancesForMatch, createMatchInstanceForMatch) where

import Database.PostgreSQL.Simple (Connection)
import Control.Monad.IO.Class (liftIO)
import Database.Beam.Postgres (runBeamPostgres)
import Database.Beam (default_, runSelectReturningList, select, all_, limit_, guard_, (==.), val_, insertExpressions)
import Database.Beam.Backend.SQL.BeamExtensions (runInsertReturningList)

import MmoaigAPI.Schema (MatchInstanceTable, PrimaryKey(MatchTableId), MatchInstanceTableT(MatchInstanceTable), dbMatchInstances, mmoaigAPIDatabase, dbMatchInstanceMatchId)

loadMatchInstancesForMatch :: Int -> Connection -> IO [MatchInstanceTable]
loadMatchInstancesForMatch matchId connection =
  liftIO $ runBeamPostgres connection $
  runSelectReturningList $ select $ limit_ 25 $ do
    instances <- all_ (dbMatchInstances mmoaigAPIDatabase)
    guard_ (dbMatchInstanceMatchId instances ==. val_ (MatchTableId matchId))
    pure instances

createMatchInstanceForMatch :: Int -> Connection -> IO MatchInstanceTable
createMatchInstanceForMatch matchId connection = liftIO $ do
  [newMatchInstance] <- runBeamPostgres connection $ runInsertReturningList (dbMatchInstances mmoaigAPIDatabase) $
    insertExpressions [MatchInstanceTable default_ (val_ "test") (val_ (MatchTableId matchId))]
  return newMatchInstance