#!/bin/bash

# goes in ~/Ark/servers/server_TheIsland_1/ShooterGame/Binaries/Linux

./ShooterGameServer TheIsland?listen?MultiHome=192.168.0.37?Port=7777?QueryPort=27015?MaxPlayers=70?AllowCrateSpawnsOnTopOfStructures=True -ForceAllowCaveFlyers -clusterid=48d6gjdo84t345984h0f843c7h20f4387hcsdf -ClusterDirOverride="/home/soulivore/Ark/cluster" -NoBattlEye -nosteamclient -game -server -log
