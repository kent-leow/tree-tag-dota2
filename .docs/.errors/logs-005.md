Loading custom game "tree_tag_xxvi" with map "template_map"
CHostStateMgr::QueueNewRequest( Loading (template_map), 2 )
HostStateRequest::Start(HSR_GAME):  loop(levelload) id(2) addons(tree_tag_xxvi) desc(Loading (template_map))
SwitchToLoop levelload requested:  id [2] addons [tree_tag_xxvi]
CL:  IGameSystem::LoopDeactivateAllSystems {
WriteSteamRemoteStorageFileAsync( "scripts/control_groups.txt" ) -> at 70.226
WriteSteamRemoteStorageFileAsync( "scripts/item_suggest_preference.txt" ) -> at 70.226
CL:  } IGameSystem::LoopDeactivateAllSystems done
Disconnecting from server: NETWORK_DISCONNECT_LOOPDEACTIVATE
Closing Steam Net Connection on socket 'client' to loopback:1, handle #300089814 (2055 NETWORK_DISCONNECT_LOOPDEACTIVATE)
CloseSteamNetConnection handle #300089814 (userdata 1)
Disassociating NetChan server @  (unknown) from Steam Net Connection handle #300089814 (userdata 1)
[#300089814 pipe 'server'] closed by app, linger requested but not needed (2055) NETWORK_DISCONNECT_LOOPDEACTIVATE
[#1774098256 pipe '“衣角微脏”の卡皮君'] closed by peer (2055): NETWORK_DISCONNECT_LOOPDEACTIVATE
Removing Steam Net Connection for loopback:1, handle #300089814
Closing 'client' poll group
SV:  IGameSystem::LoopDeactivateAllSystems {
HO:  IGameSystem::LoopDeactivateAllSystems {
HO:  } IGameSystem::LoopDeactivateAllSystems done
SV:  } IGameSystem::LoopDeactivateAllSystems done
SV:  Server shutting down: NETWORK_DISCONNECT_LOOPDEACTIVATE (55)
CNetworkGameServerBase::SetServerState (ss_active -> ss_dead)
Disconnect client '“衣角微脏”の卡皮君' from server: NETWORK_DISCONNECT_SHUTDOWN (Server shutdown)
Client 0 '“衣角微脏”の卡皮君' signon state SIGNONSTATE_FULL -> SIGNONSTATE_NONE
Closing Steam Net Connection on socket 'server' to loopback:0, handle #1774098256 (1001 NETWORK_DISCONNECT_SHUTDOWN)
CloseSteamNetConnection handle #1774098256 (userdata 0)
Disassociating NetChan “衣角微 @  (unknown) from Steam Net Connection handle #1774098256 (userdata 0)
Removing Steam Net Connection for loopback:0, handle #1774098256
CPlayerVoiceListener::PostSpawnGroupUnload()
Closing 'server' poll group
SV: CNetworkStringTableContainer::RemoveAllTables:  removing 20 tables
CL: CNetworkStringTableContainer::RemoveAllTables:  removing 20 tables
WriteSteamRemoteStorageFileAsync( "voice_ban.dt" ) -> at 70.302
CPlayerVoiceListener::GameShutdown()
ResetBreakpadAppId: Universe is 1 (k_EUniversePublic)
ResetBreakpadAppId: Setting non standard break pad app id: 375360
Mounting addon 'tree_tag_xxvi'
ILocalize::AddFile() failed to load file "panorama/localization/addon_english.txt".
ChangeGameUIState: DOTA_GAME_UI_STATE_DASHBOARD -> DOTA_GAME_UI_STATE_LOADING_SCREEN
LoadingDisplay changed from NONE to LOADING (map="")
CAsyncWriteInProgress::OnComplete( "scripts/control_groups.txt" ) -> Success at 70.353
CAsyncWriteInProgress::OnComplete( "scripts/item_suggest_preference.txt" ) -> Success at 70.353
CAsyncWriteInProgress::OnComplete( "voice_ban.dt" ) -> Success at 70.353
Steam Net connection #1774098256 pipe '“衣角微脏”の卡皮君' closed by peer, reason 2055: NETWORK_DISCONNECT_LOOPDEACTIVATE
CloseSteamNetConnection handle #1774098256 (userdata -1)
CL:  CLoopModeLevelLoad::MaybeSwitchToGameLoop switching to "game" loopmode with addons (tree_tag_xxvi)
SwitchToLoop game requested:  id [2] addons [tree_tag_xxvi]
Failed loading resource "panorama/images/players/0_png.vtex_c" (ERROR_FILEOPEN: File not found)
Cannot open C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota_addons\tree_tag_xxvi to calculate addon CRC!
SteamGameServer_Init()
ResetBreakpadAppId: Universe is 1 (k_EUniversePublic)
ResetBreakpadAppId: Setting non standard break pad app id: 375360
SteamGameServer_Init() OK, logging on to Steam
CNetworkSystem::InitGameServer: SteamGameServerNetworking() OK
src\steamnetworkingsockets\clientlib\steam\csteamnetworkingsockets_steam.cpp(344): Assertion Failed: m_hSteamPipe == 0
CNetworkGameServerBase::SetServerState (ss_dead -> ss_waitingforgamesessionmanifest)
SV:  maxplayers set to 64
Created poll group for socket 'server'
AuthStatus (invalid):  Waiting  (Waiting for Steam login)
Network socket 'server' opened on port 27015
Failed to load. pName='DOTANeutralItems', bIncrementVersion=true, list: 
scripts/npc/npc_neutral_items_custom.txt
[Ability Schema]: Next 10 available ids are: 264,276,314,315,341,342,345,373,410,415,
Found
Initializing script VM...
...done
SV:  Executing server defaults
SV:  Executing listen server config file
Failed to load. pName='DOTANeutralItems', bIncrementVersion=true, list: 
scripts/npc/npc_neutral_items_custom.txt
[Ability Schema]: Next 10 available ids are: 264,276,314,315,341,342,345,373,410,415,
Found
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_INIT'
SV:  CGameRulesGameSystem::GameInit installed game rules
CSceneManager::AddCaptionFile( resource/subtitles/closecaption_english.dat )
CPlayerVoiceListener::GameInit()
Failed loading resource "materials/sprites/blueglow1.vmat_c" (ERROR_FILEOPEN: File not found)
CResponseSystem:  failed to load scripts/talker/response_rules_custom.txt
Failed loading resource "particles/neutral_fx/miniboss_damage_reflect_explosion.vpcf_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "materials/models/heroes/statuseffects/electric_detail2_psd_23fa1fb3.vtex_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "materials/models/items/meepo/diggers_divining_rod/diggers_divining_rod_gems.vmat_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "materials/particle/particle_ring_blurry_generic_projected.vmat_c" (ERROR_FILEOPEN: File not found)
SV:  Connection to Steam servers successful.
SV:  ServerSteamID=[A:1:3892167701:50050] (90286959552742421).
[STARTUP] {72.268} logged on to Steam
Logged on to Steam, set GC connection state to NO_SESSION
Send msg 4007 (k_EMsgGCServerHello), 22 bytes
Gameserver logged on to Steam, assigned identity steamid:90286959552742421
AuthStatus (steamid:90286959552742421):  Attempting  (Requesting cert)
OnSteamServersConnected()
WriteSteamRemoteStorageFileAsync( "cfg/fantasy_crafting.lst" ) -> at 72.534
CAsyncWriteInProgress::OnComplete( "cfg/fantasy_crafting.lst" ) -> Success at 72.543
 models/particle/explosion/fx_explosion_capped_sphere.vmdl : Animations loaded but no animation data found
 models/props_structures/xp_shrine/xp_shrine_stones.vmdl : Animations loaded but no animation data found
SV:  VAC secure mode disabled.
AuthStatus (steamid:90286959552742421):  OK  (OK)
Certificate expires in 48h00m at 1781519607 (current time 1781346806), will renew in 46h00m
Recv msg 4005 (k_EMsgGCServerWelcome), 26 bytes
Received server welcome from GC.
CMsgClientWelcome subscribed: 0 up-to-date, 0 out-of-date
GC Connection established for server version 6806
SV:  Spawn Server: template_map
CNetworkGameServerBase::SetServerState (ss_waitingforgamesessionmanifest -> ss_loading)
CNetworkGameServerBase::SetServerState (ss_loading -> ss_active)
Server:  Running [172.21.144.1:27015]
Client:  Disconnected
----- Status -----
  Queued   :  game
@ Current  :  levelload
CL:  CGameClientConnectPrerequisite status
CL:  sequential     :  'CGameClientConnectPrerequisite'
CL:  pending        :  1/7 [2079.078 msec]
CL:  prerequisite   :  .'CWaitForGameServerStartupPrerequisite'
CL:  pending        :  2/7 [not started]
CL:  prerequisite   :  .'CCreateGameClientPrerequisite'
CL:  pending        :  3/7 [not started]
CL:  prerequisite   :  .'CConnectGameClientPrerequisite'
CL:  pending        :  4/7 [not started]
CL:                 :  .'CLoadStartupResourcePrerequisite'
CL:  waiting        :  ..waiting for startup resource list
CL:  pending        :  5/7 [not started]
CL:  prerequisite   :  .'CLoadSpawnGroupsPrerequisite'
CL:  firstspawngroup:  ..waiting for first spawn group
CL:  pending        :  6/7 [not started]
CL:  prerequisite   :  .'CAsyncShaderCompilePrerequisite'
CL:  pending        :  7/7 [not started]
CL:  prerequisite   :  .'CFinalizeConnectionPrerequisite'
---
source   : console
hostname : “衣角微脏”の卡皮君
spawn    : 2
version  : 48/48 10757 insecure  public
steamid  : [A:1:3892167701:50050] (90286959552742421)
udp/ip   : 172.21.144.1:27015 (public 104.28.254.47:27015)
os/type  : Windows listen
players  : 0 humans, 0 bots (0 max) (not hibernating) (unreserved)
---------spawngroups----
loaded spawngroup(  1)  : SV:  [1: template_map | main lump | mapload]
---------players--------
  id     time ping loss      state   rate adr name
GameState: DOTA_GAMERULES_STATE_INIT Times: Transition=0.00 Current=1.03
#end
CL:  CWaitForGameServerStartupPrerequisite done waiting for server
CL:  CCreateGameClientJob creating client connection to 'loopback'
[#1981930754 pipe] connected
[#1873201290 pipe] connected
Created poll group for socket 'client'
Connected loopback client=7621dd02@loopback:1 <-> server=6fa6c88a@loopback:0
Tick packet desired receive margin now 35.0ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
Associating NetChan “衣角微 @ loopback:0 (loopback:0) with Steam Net Connection handle #1873201290 (userdata 0)
Associating NetChan server @ loopback:1 (loopback:1) with Steam Net Connection handle #1981930754 (userdata 1)
CL:  Connected to 'loopback:1'
ClientPutInServer create new player controller [“衣角微脏”の卡皮君]
Client 0 '“衣角微脏”の卡皮君' setting rate to 80000
Game: "Dota 2"
Map: "template_map"
Players: 1 (0 bots) / 64 humans
Build: 10757 (revision 10735821)
Server Number: 2
CL:  CNetworkGameClient::ProcessServerInfo
Failed to load. pName='DOTANeutralItems', bIncrementVersion=true, list: 
scripts/npc/npc_neutral_items_custom.txt
[Ability Schema]: Next 10 available ids are: 264,276,314,315,341,342,345,373,410,415,
Found
Initializing script VM...
...done
Failed to load. pName='DOTANeutralItems', bIncrementVersion=true, list: 
scripts/npc/npc_neutral_items_custom.txt
[Ability Schema]: Next 10 available ids are: 264,276,314,315,341,342,345,373,410,415,
Found
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_INIT'
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_INIT
CDOTA_Hud_Main::DeleteGameEndScreen deleted GameEndContainer
CL:  CGameRulesGameSystem::GameInit installed game rules
ReadSteamRemoteStorageFile( bufOut, "voice_ban.dt" ) -> 0.001104 seconds
Loading Game State Integration: gamestate_integration_announcer.cfg
gamestate_integration_announcer.cfg: integrating data for 'map' v1
gamestate_integration_announcer.cfg: integrating data for 'player' v1
gamestate_integration_announcer.cfg: integrating data for 'hero' v1
Tick packet desired receive margin now 71.7ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
C_DOTAGamerules::PrecacheMinimapResources: couldn't load file resource/overviews/template_map.txt.
CNetworkGameClient::ProcessClassInfo: create on client true
CNetworkGameClient::ProcessClassInfo: creating client serializers from local server serializers (crc 0, server api exists)
Client missing networkable entity class CPhysMagnet
Client missing networkable entity class CSpotlightEnd
CNetworkGameClientBase::LinkClasses took 61.468 msec
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ -1453894464 ]
Shader spring_meteor.vfx attribute "DepthPassBatchID" has inconsistent value or type across multiple shaders of a feature combo! [ 1 ]
Failed loading resource "panorama/images/heroes/icons/npc_dota_hero_announcer_killing_spree_png.vtex_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "panorama/images/heroes/icons/npc_dota_hero_announcer_png.vtex_c" (ERROR_FILEOPEN: File not found)
CL:  CGameClientConnectPrerequisite connection succeeded
ChangeGameUIState: DOTA_GAME_UI_STATE_LOADING_SCREEN -> DOTA_GAME_UI_DOTA_INGAME
SV:  IGameSystem::LoopActivateAllSystems {
HO:  IGameSystem::LoopActivateAllSystems {
HO:  } IGameSystem::LoopActivateAllSystems done
CRecipientFilter::AddAllPlayers - no recipients for this message, but 1 player in process of connecting was not included.
CRecipientFilter::AddAllPlayers - no recipients for this message, but 1 player in process of connecting was not included.
CRecipientFilter::AddAllPlayers - no recipients for this message, but 1 player in process of connecting was not included.
CRecipientFilter::AddAllPlayers - no recipients for this message, but 1 player in process of connecting was not included.
CRecipientFilter::AddAllPlayers - no recipients for this message, but 1 player in process of connecting was not included.
CRecipientFilter::AddAllPlayers - no recipients for this message, but 1 player in process of connecting was not included.
SV:  } IGameSystem::LoopActivateAllSystems done
Created physics for template_map
CRecipientFilter::AddAllPlayers - no recipients for this message, but 1 player in process of connecting was not included.
Bot ward spot ward_spot_radiant_above_mid not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_radiant_jungle_above_mid not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_radiant_high_point_top not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_radiant_high_point_mid not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_radiant_high_point_bottom not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_dire_rune_bottom not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_dire_high_point_top not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_dire_high_point_bottom not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_dire_secret_shop not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_dire_jungle_above_mid not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_dire_jungle_below_mid not found in map; falling back to hardcoded location.
Bot ward spot ward_spot_dire_jungle_top not found in map; falling back to hardcoded location.
SV:  64 player server started
SV:  addon='tree_tag_xxvi'
CSource2Server::GameServerSteamAPIActivated()
--- Sent CMsgGameServerInfo to GC
server_public_ip_addr: 1746730543
server_private_ip_addr: 2887094273
server_port: 27015
server_tv_port: 0
server_key: ""
server_hibernation: false
server_type: GAME
server_region: 0
server_loadavg: 0.134836808
server_tv_broadcast_time: -120
server_game_time: 0
relay_slots_max: 0
relays_connected: 0
relay_clients_connected: 0
tv_secret_code: 15596887215724692747
server_version: 6806
server_cluster: 0
assigned_server_tv_port: 27020
allow_custom_games: BOTH
build_version: 6806

---
CL:  IGameSystem::LoopActivateAllSystems {
ReadSteamRemoteStorageFile( bufOut, "scripts/control_groups.txt" ) -> 0.000607 seconds
ReadSteamRemoteStorageFile( bufOut, "scripts/item_suggest_preference.txt" ) -> 0.000340 seconds
CL:  } IGameSystem::LoopActivateAllSystems done
Host activate: Loading (template_map)
CL:  CNetworkGameClient::OnSwitchLoopModeFinished( game : success )
Send msg 4508 (k_EMsgGCGameServerInfo), 82 bytes
SV:  Sending full update to client “衣角微脏”の卡皮君 (reason:  initial update)
47. Msg_HltvReplay real-time->real-time
1.53 OnHltvReplay END
CNetworkGameClientBase::OnReceivedUncompressedPacket(), received full update
Resetting prediction state because we received a full update
Receiving 0.6K non-incremental update from server
Created physics for template_map
DOTABaseGameMode::Spawn()
Failed to load. pName='DOTANeutralItems', bIncrementVersion=true, list: 
scripts/npc/npc_neutral_items_custom.txt
[Ability Schema]: Next 10 available ids are: 264,276,314,315,341,342,345,373,410,415,
Found
   93: 269.618500 msec change 'OnGameModeEntityChanged()' on field m_hGameModeEntity(path=0/28) for ent dota_gamerules(C_DOTAGamerulesProxy) name=''
server @ loopback:1:  NetChan Setting Timeout to 30.00 seconds
CL:  Signon traffic "server":  incoming 126.251 KB [14 netframes], outgoing 1.272 KB [13 netframes]
Added prediction for player slot 0 ()
SV:  "“衣角微脏”の卡皮君<0><[U:1:104194549]><>" STEAM USERID validated
“衣角微 @ loopback:0:  NetChan Setting Timeout to 20.00 seconds
CDOTA_PlayerResource: Adding player SteamID 76561198064460277 to PlayerID 0 FakeClient=0, preferred PlayerID = -1
PR:OnFullyJoinedServer 0:[U:1:104194549]
PR:SetLeaverStatus 0:[U:1:104194549] DOTA_LEAVER_NONE
PR:SetConnectionState 0:[U:1:104194549] DOTA_CONNECTION_STATE_CONNECTED NETWORK_DISCONNECT_INVALID
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP'
--- Sent CMsgGameServerInfo to GC
server_public_ip_addr: 1746730543
server_private_ip_addr: 2887094273
server_port: 27015
server_tv_port: 0
server_key: ""
server_hibernation: false
server_type: GAME
server_region: 0
server_loadavg: 0.0724638104
server_tv_broadcast_time: -120
server_game_time: 2.60000014
relay_slots_max: 0
relays_connected: 0
relay_clients_connected: 0
tv_secret_code: 15596887215724692747
server_version: 6806
server_cluster: 0
assigned_server_tv_port: 27020
allow_custom_games: BOTH
build_version: 6806

---
PR:SetPlusSubscriptionStatus 0:[U:1:104194549] IsPlusSubscriber:No
PR:SetWasMVPLastGame 0:[U:1:104194549] WasMVPLastGame:No
PR:SetFavoriteTeamPacked 0:[U:1:104194549] unFavTeamPacked:0
CLocalize::FindSafe failed to localize: 'invalid index'
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP'
LoadingDisplay changed from LOADING to CUSTOM_GAME_SETUP (map="template_map")
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP
Send msg 4508 (k_EMsgGCGameServerInfo), 82 bytes
   80: 0.340900 msec change 'OnPlayerTeamDataTeamChanged()' on field m_iTeamSlot(path=0/0/27) for ent (C_DOTA_PlayerResource) name=''
Too many non-culled draws (alloc 0, need 14), resizing!
Recv msg 24 (k_ESOMsg_CacheSubscribed), 42 bytes
Recv msg 24 (k_ESOMsg_CacheSubscribed), 47523 bytes
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_HERO_SELECTION'
Muted Players: 
Send msg 8870 (k_EMsgServerToGCLobbyInitialized), 8 bytes
PR:SetSelectedHero 0:[U:1:104194549] npc_dota_hero_doom_bringer(69)
Cannot create an entity because entity class is NULL -1
Cannot create an entity because entity class is NULL -1
Cannot create an entity because entity class is NULL -1
Cannot create an entity because entity class is NULL -1
CGameParticleManager::SetParticleControlEnt: Unable to lookup attachment "attach_hitloc" on model "" for entity "npc_dota_hero_doom_bringer"
   80: 0.351100 msec change 'OnPlayerDataTeamChanged()' on field m_iPlayerTeam(path=1/0/2) for ent (C_DOTA_PlayerResource) name=''
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/incantations_weapon_style2/incantations_weapon_style2.vmdl' (740FB0A2108705C1) requested is not loaded and may have been deleted.
Attempting to set nonresident model 'models/items/doom/incantations_weapon_style2/incantations_weapon_style2.vmdl' for item ID 12322919298 item Def 6277 (#DOTA_Item_Head_Opener_of_Incantations) owner 104194549
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/incantations_weapon_style2/incantations_weapon_style2.vmdl' (740FB0A2108705C1) requested is not loaded and may have been deleted.
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/abysshelm/abysshelm.vmdl' (52BD081E050D0541) requested is not loaded and may have been deleted.
Attempting to set nonresident model 'models/items/doom/abysshelm/abysshelm.vmdl' for item ID 13606133285 item Def 4738 (#DOTA_Item_Steel_Horns_of_Apocalyptic_Fire) owner 104194549
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/abysshelm/abysshelm.vmdl' (52BD081E050D0541) requested is not loaded and may have been deleted.
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/doom_ti8_immortal_arms/doom_ti8_immortal_arms.vmdl' (D2EFBD906F58CA78) requested is not loaded and may have been deleted.
Attempting to set nonresident model 'models/items/doom/doom_ti8_immortal_arms/doom_ti8_immortal_arms.vmdl' for item ID 14253611831 item Def 9741 (#DOTA_Item_Zeal_of_Omoz_Arkosh) owner 104194549
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/doom_ti8_immortal_arms/doom_ti8_immortal_arms.vmdl' (D2EFBD906F58CA78) requested is not loaded and may have been deleted.
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/the_smoldering_tyrant_shoulder/the_smoldering_tyrant_shoulder.vmdl' (CE588B0FC9859B50) requested is not loaded and may have been deleted.
Attempting to set nonresident model 'models/items/doom/the_smoldering_tyrant_shoulder/the_smoldering_tyrant_shoulder.vmdl' for item ID 24484649453 item Def 13864 (#DOTA_Item_Heat_of_the_Sixth_Hell__Shoulder) owner 104194549
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/the_smoldering_tyrant_shoulder/the_smoldering_tyrant_shoulder.vmdl' (CE588B0FC9859B50) requested is not loaded and may have been deleted.
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/the_smoldering_tyrant_back/the_smoldering_tyrant_back.vmdl' (313F82379679FECE) requested is not loaded and may have been deleted.
Attempting to set nonresident model 'models/items/doom/the_smoldering_tyrant_back/the_smoldering_tyrant_back.vmdl' for item ID 24484649469 item Def 13862 (#DOTA_Item_Heat_of_the_Sixth_Hell__Back) owner 104194549
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/the_smoldering_tyrant_back/the_smoldering_tyrant_back.vmdl' (313F82379679FECE) requested is not loaded and may have been deleted.
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/the_smoldering_tyrant_belt/the_smoldering_tyrant_belt.vmdl' (1B6D1D498D46947B) requested is not loaded and may have been deleted.
Attempting to set nonresident model 'models/items/doom/the_smoldering_tyrant_belt/the_smoldering_tyrant_belt.vmdl' for item ID 24484649501 item Def 13858 (#DOTA_Item_Heat_of_the_Sixth_Hell__Belt) owner 104194549
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/the_smoldering_tyrant_belt/the_smoldering_tyrant_belt.vmdl' (1B6D1D498D46947B) requested is not loaded and may have been deleted.
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/the_smoldering_tyrant_tail/the_smoldering_tyrant_tail.vmdl' (1D523E8C935386A5) requested is not loaded and may have been deleted.
Attempting to set nonresident model 'models/items/doom/the_smoldering_tyrant_tail/the_smoldering_tyrant_tail.vmdl' for item ID 24484649493 item Def 13859 (#DOTA_Item_Heat_of_the_Sixth_Hell__Tail) owner 104194549
ERROR: RESOURCE_TYPE_MODEL resource 'models/items/doom/the_smoldering_tyrant_tail/the_smoldering_tyrant_tail.vmdl' (1D523E8C935386A5) requested is not loaded and may have been deleted.
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_HERO_SELECTION'
LoadingDisplay changed from CUSTOM_GAME_SETUP to NONE (map="template_map")
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_HERO_SELECTION
PregameHud - eGameState is now DOTA_GAMERULES_STATE_HERO_SELECTION
PregameHud - SetPreGameVisible 1
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_STRATEGY_TIME'
--- Sent CMsgGameServerInfo to GC
server_public_ip_addr: 1746730543
server_private_ip_addr: 2887094273
server_port: 27015
server_tv_port: 0
server_key: ""
server_hibernation: false
server_type: GAME
server_region: 0
server_loadavg: 0.0447627231
server_tv_broadcast_time: -120
server_game_time: -30
relay_slots_max: 0
relays_connected: 0
relay_clients_connected: 0
tv_secret_code: 15596887215724692747
server_version: 6806
server_cluster: 0
assigned_server_tv_port: 27020
allow_custom_games: BOTH
build_version: 6806

---
   83: 0.226000 msec change 'OnDataTeamPlayerPlayerSteamIDsChanged()' on field m_iPlayerSteamID(path=1/0/84) for ent dota_data_dire(C_DOTA_DataDire) name=''
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_STRATEGY_TIME'
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_STRATEGY_TIME
PregameHud - eGameState is now DOTA_GAMERULES_STATE_STRATEGY_TIME
Send msg 8330 (k_EMsgServerToGCRequestPlayerRecentAccomplishments), 24 bytes
Send msg 4508 (k_EMsgGCGameServerInfo), 82 bytes
Job EconItemSearch has spent >3.000ms without yielding: 10.019ms
Job EconItemSearch has spent >3.000ms without yielding: 10.002ms
Send msg 8729 (k_EMsgClientToGCRequestAccountGuildPersonaInfoBatch), 203 bytes
Entity hero_camera [point_camera]: unrecognized parent "loadout_camera_model"
Recv msg 8331 (k_EMsgServerToGCRequestPlayerRecentAccomplishmentsResponse), 19 bytes
Recv msg 8730 (k_EMsgClientToGCRequestAccountGuildPersonaInfoBatchResponse), 511 bytes
CLocalize::FindSafe failed to localize: '#DOTA_Tooltip_Ability_infernal_bulwark'
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_infernal_bulwark_SummaryDescription'
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_doom_bringer_doom_SummaryDescription'
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_doom_bringer_doom_SummaryDescription'
CLocalize::FindSafe failed to localize: '#DOTA_Tooltip_Ability_infernal_fire_aura'
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_infernal_fire_aura_SummaryDescription'
CLocalize::FindSafe failed to localize: '#DOTA_Tooltip_Ability_infernal_cleave'
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_infernal_cleave_SummaryDescription'
PR:SetSelectedHeroFacet 0:[U:1:104194549] (npc_dota_hero_doom_bringer:(null))
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_WAIT_FOR_MAP_TO_LOAD'
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_PRE_GAME'
m_flPreGameStartTime set to 34.23
m_flStateTransitionTime set to 49.23
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_PRE_GAME'
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_PRE_GAME
PregameHud - eGameState is now DOTA_GAMERULES_STATE_PRE_GAME
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
Cannot create an entity because entity class is NULL -1
Cannot create an entity because entity class is NULL -1
Cannot create an entity because entity class is NULL -1
Cannot create an entity because entity class is NULL -1
CGameParticleManager::SetParticleControlEnt: Unable to lookup attachment "attach_hitloc" on model "" for entity "npc_dota_hero_doom_bringer"
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
PregameHud - SetPreGameVisible 0
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_doom_bringer_doom_SummaryDescription'
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_doom_bringer_empty2_SummaryDescription'
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_GAME_IN_PROGRESS'
m_flGameStartTime set to 49.23
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_GAME_IN_PROGRESS'
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_GAME_IN_PROGRESS
CDOTA_Hud_Main::DeleteGameEndScreen deleted GameEndContainer
--- Sent CMsgGameServerInfo to GC
server_public_ip_addr: 1746730543
server_private_ip_addr: 2887094273
server_port: 27015
server_tv_port: 0
server_key: ""
server_hibernation: false
server_type: GAME
server_region: 0
server_loadavg: 0.0147486692
server_tv_broadcast_time: -120
server_game_time: 0.0333328247
relay_slots_max: 0
relays_connected: 0
relay_clients_connected: 0
tv_secret_code: 15596887215724692747
server_version: 6806
server_cluster: 0
assigned_server_tv_port: 27020
allow_custom_games: BOTH
build_version: 6806

---
Send msg 4508 (k_EMsgGCGameServerInfo), 82 bytes
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_doom_bringer_doom_SummaryDescription'
PR:IncrementIdleTime 0:[U:1:104194549] 3.70
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_doom_bringer_doom_SummaryDescription'
CLocalize::ConstructString failed to localize: '#DOTA_Tooltip_Ability_doom_bringer_empty2_SummaryDescription'