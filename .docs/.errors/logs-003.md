CL:  disconnect
Disconnected from server: NETWORK_DISCONNECT_DISCONNECT_BY_USER
SV:  Server shutting down: NETWORK_DISCONNECT_DISCONNECT_BY_USER (2)
CNetworkGameServerBase::SetServerState (ss_active -> ss_dead)
Disconnect client '“衣角微脏”の卡皮君' from server: NETWORK_DISCONNECT_SHUTDOWN (Server shutdown)
Client 0 '“衣角微脏”の卡皮君' signon state SIGNONSTATE_FULL -> SIGNONSTATE_NONE
Closing Steam Net Connection on socket 'server' to loopback:0, handle #1591120964 (1001 NETWORK_DISCONNECT_SHUTDOWN)
CloseSteamNetConnection handle #1591120964 (userdata 0)
Disassociating NetChan “衣角微 @  (unknown) from Steam Net Connection handle #1591120964 (userdata 0)
[#1591120964 pipe '“衣角微脏”の卡皮君'] closed by app, linger requested but not needed (1001) NETWORK_DISCONNECT_SHUTDOWN
[#1119553081 pipe 'server'] closed by peer (1001): NETWORK_DISCONNECT_SHUTDOWN
Removing Steam Net Connection for loopback:0, handle #1591120964
CPlayerVoiceListener::PostSpawnGroupUnload()
CSteam3ServerS1::ShutdownGameServer
CNetworkSystem::ShutdownGameServer
Closing 'server' UDP listen socket
Closing 'server' P2P listen socket
Closing 'server' poll group
CSource2Server::GameServerSteamAPIDeactivated()
Disconnecting from server: NETWORK_DISCONNECT_DISCONNECT_BY_USER
Closing Steam Net Connection on socket 'client' to loopback:1, handle #1119553081 (1002 NETWORK_DISCONNECT_DISCONNECT_BY_USER)
CloseSteamNetConnection handle #1119553081 (userdata 1)
Disassociating NetChan server @  (unknown) from Steam Net Connection handle #1119553081 (userdata 1)
Removing Steam Net Connection for loopback:1, handle #1119553081
Closing 'client' poll group
CHostStateMgr::QueueNewRequest( Idle (levelload), 11 )
HostStateRequest::Start(HSR_IDLE):  loop(levelload) id(11) addons() desc(Idle (levelload))
SwitchToLoop levelload requested:  id [11] addons []
CL:  IGameSystem::LoopDeactivateAllSystems {
WriteSteamRemoteStorageFileAsync( "scripts/control_groups.txt" ) -> at 1253.997
WriteSteamRemoteStorageFileAsync( "scripts/item_suggest_preference.txt" ) -> at 1253.997
CL:  } IGameSystem::LoopDeactivateAllSystems done
CL: CNetworkStringTableContainer::RemoveAllTables:  removing 20 tables
SV:  IGameSystem::LoopDeactivateAllSystems {
HO:  IGameSystem::LoopDeactivateAllSystems {
HO:  } IGameSystem::LoopDeactivateAllSystems done
SV:  } IGameSystem::LoopDeactivateAllSystems done
SV: CNetworkStringTableContainer::RemoveAllTables:  removing 20 tables
ILocalize::AddFile() failed to load file "resource/localization/broadcastfacts_english.txt".
CLocalize::CompileString failed to localize: '#DOTA_DeityBlessing_ChooseTitle'
CL:  CGameRulesGameSystem::GameShutdown uninstalled game rules
CL:  CGameRules::CGameRules destructed
WriteSteamRemoteStorageFileAsync( "voice_ban.dt" ) -> at 1254.335
CPlayerVoiceListener::GameShutdown()
SV:  CGameRulesGameSystem::GameShutdown uninstalled game rules
SV:  CGameRules::CGameRules destructed
Can't CEngineServiceMgr::UpdateAddons to multiple addons in tools mode, tools restricting to tree_tag_xxvi
ChangeGameUIState: DOTA_GAME_UI_DOTA_INGAME -> DOTA_GAME_UI_STATE_LOADING_SCREEN
LoadingDisplay changed from NONE to LOADING (map="")
Host activate: Idle (levelload)
CAsyncWriteInProgress::OnComplete( "scripts/control_groups.txt" ) -> Success at 1254.381
CAsyncWriteInProgress::OnComplete( "scripts/item_suggest_preference.txt" ) -> Success at 1254.381
CAsyncWriteInProgress::OnComplete( "voice_ban.dt" ) -> Success at 1254.381
Steam Net connection #1119553081 pipe 'server' closed by peer, reason 1001: NETWORK_DISCONNECT_SHUTDOWN
CloseSteamNetConnection handle #1119553081 (userdata -1)
CL:  CLoopModeLevelLoad::MaybeSwitchToGameLoop switching to "game" loopmode with addons ()
SwitchToLoop game requested:  id [11] addons []
Send msg 2569 (k_EMsgClientToGCEquipItems), 113 bytes
**** Panel MainObjectivesTitle has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel SideObjectivesTitle has fill-parent-flow for width, but isn't in a flowing right layout
CNetworkGameServerBase::SetServerState (ss_dead -> ss_waitingforgamesessionmanifest)
SV:  maxplayers set to 1
Initializing script VM...
...done
CSceneManager::AddCaptionFile( resource/subtitles/closecaption_english.dat )
CPlayerVoiceListener::GameInit()
**** Panel TimeRangeSlider has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel TimeScrubSlider has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel SliderAndMarkers has fill-parent-flow for width, but isn't in a flowing right layout
**** Panel TimeScrubSlider has fill-parent-flow for width, but isn't in a flowing right layout
Failed loading resource "materials/sprites/blueglow1.vmat_c" (ERROR_FILEOPEN: File not found)
SV:  Spawn Server: <empty>
CNetworkGameServerBase::SetServerState (ss_waitingforgamesessionmanifest -> ss_loading)
CNetworkGameServerBase::SetServerState (ss_loading -> ss_active)
CL:  CWaitForGameServerStartupPrerequisite done waiting for server
CL:  CCreateGameClientJob creating client connection to 'loopback'
[#2127033889 pipe] connected
[#3955947911 pipe] connected
Created poll group for socket 'client'
Created poll group for socket 'server'
Connected loopback client=7ec7f621@loopback:1 <-> server=ebcaf987@loopback:0
Tick packet desired receive margin now 35.0ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
Associating NetChan “衣角微 @ loopback:0 (loopback:0) with Steam Net Connection handle #3955947911 (userdata 1)
Associating NetChan server @ loopback:1 (loopback:1) with Steam Net Connection handle #2127033889 (userdata 0)
CL:  Connected to 'loopback:1'
Client 0 '“衣角微脏”の卡皮君' setting rate to 80000
Game: "Dota 2"
Map: "<empty>"
Players: 1 (0 bots) / 1 humans
Build: 10757 (revision 10735821)
Server Number: 11
CL:  CNetworkGameClient::ProcessServerInfo
ReadSteamRemoteStorageFile( bufOut, "voice_ban.dt" ) -> 0.000613 seconds
Tick packet desired receive margin now 71.7ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
CNetworkGameClient::ProcessClassInfo: create on client true
CNetworkGameClient::ProcessClassInfo: creating client serializers from local server serializers (crc 0, server api exists)
Client missing networkable entity class CPhysMagnet
Client missing networkable entity class CSpotlightEnd
CNetworkGameClientBase::LinkClasses took 64.542 msec
CL:  CGameClientConnectPrerequisite connection succeeded
ChangeGameUIState: DOTA_GAME_UI_STATE_LOADING_SCREEN -> DOTA_GAME_UI_STATE_DASHBOARD
LoadingDisplay changed from LOADING to NONE (map="<empty>")
SV:  IGameSystem::LoopActivateAllSystems {
HO:  IGameSystem::LoopActivateAllSystems {
HO:  } IGameSystem::LoopActivateAllSystems done
SV:  } IGameSystem::LoopActivateAllSystems done
SV:  Game started
CL:  IGameSystem::LoopActivateAllSystems {
ReadSteamRemoteStorageFile( bufOut, "scripts/control_groups.txt" ) -> 0.000389 seconds
ReadSteamRemoteStorageFile( bufOut, "scripts/item_suggest_preference.txt" ) -> 0.000330 seconds
CL:  } IGameSystem::LoopActivateAllSystems done
CL:  CNetworkGameClient::OnSwitchLoopModeFinished( game : success )
Recv msg 26 (k_ESOMsg_UpdateMultiple), 328 bytes
Recv msg 2570 (k_EMsgClientToGCEquipItemsResponse), 26 bytes
SV:  Sending full update to client “衣角微脏”の卡皮君 (reason:  initial update)
39. Msg_HltvReplay real-time->real-time
1.27 OnHltvReplay END
CNetworkGameClientBase::OnReceivedUncompressedPacket(), received full update
Resetting prediction state because we received a full update
Receiving 0.0K non-incremental update from server
server @ loopback:1:  NetChan Setting Timeout to 30.00 seconds
CL:  Signon traffic "server":  incoming 12.824 KB [6 netframes], outgoing 1.200 KB [5 netframes]
“衣角微 @ loopback:0:  NetChan Setting Timeout to 20.00 seconds
can't solve quadratic for light 0.000000 0.000000
can't solve quadratic for light 0.000000 0.000000
Failed loading resource "panorama/images/heroes/icons/npc_dota_broodmother_spiderling_png.vtex_c" (ERROR_FILEOPEN: File not found)
Loading custom game "tree_tag_xxvi" with map "template_map"
CHostStateMgr::QueueNewRequest( Loading (template_map), 12 )
HostStateRequest::Start(HSR_GAME):  loop(levelload) id(12) addons(tree_tag_xxvi) desc(Loading (template_map))
SwitchToLoop levelload requested:  id [12] addons [tree_tag_xxvi]
CL:  IGameSystem::LoopDeactivateAllSystems {
WriteSteamRemoteStorageFileAsync( "scripts/control_groups.txt" ) -> at 1255.040
WriteSteamRemoteStorageFileAsync( "scripts/item_suggest_preference.txt" ) -> at 1255.040
CL:  } IGameSystem::LoopDeactivateAllSystems done
Disconnecting from server: NETWORK_DISCONNECT_LOOPDEACTIVATE
Discarding abandoned streaming texture load for materials/models/heroes/venomancer/venomancer_normal_psd_c0ae46a.vtex
Deleting texture with outstanding streaming request (materials/models/heroes/venomancer/venomancer_normal_psd_c0ae46a.vtex)
Discarding abandoned streaming texture load for materials/models/heroes/venomancer/venomancer_specmask_tga_7db73206.vtex
Deleting texture with outstanding streaming request (materials/models/heroes/venomancer/venomancer_specmask_tga_7db73206.vtex)
Discarding abandoned streaming texture load for materials/models/heroes/venomancer/venomancer_color_psd_f6c3d32.vtex
Deleting texture with outstanding streaming request (materials/models/heroes/venomancer/venomancer_color_psd_f6c3d32.vtex)
Discarding abandoned streaming texture load for materials/models/items/faceless_void/faceless_void_arcana/fv_arcana_base_metalnessmask_tga_bb480468.vtex
Deleting texture with outstanding streaming request (materials/models/items/faceless_void/faceless_void_arcana/fv_arcana_base_metalnessmask_tga_bb480468.vtex)
Discarding abandoned streaming texture load for materials/models/items/faceless_void/bracers_of_aeons/bracers_of_aeons_v2_detailmask_psd_fc6e2d9b.vtex
Deleting texture with outstanding streaming request (materials/models/items/faceless_void/bracers_of_aeons/bracers_of_aeons_v2_detailmask_psd_fc6e2d9b.vtex)
Discarding abandoned streaming texture load for materials/models/items/faceless_void/bracers_of_aeons/bracers_of_aeons_v2_color_psd_fd966c22.vtex
Deleting texture with outstanding streaming request (materials/models/items/faceless_void/bracers_of_aeons/bracers_of_aeons_v2_color_psd_fd966c22.vtex)
Discarding abandoned streaming texture load for materials/models/cubemaps/glossy_blue_cube_tga_bee8895f.vtex
Deleting texture with outstanding streaming request (materials/models/cubemaps/glossy_blue_cube_tga_bee8895f.vtex)
Discarding abandoned streaming texture load for materials/particle/tile/tile_noise_gaussian.vtex
Deleting texture with outstanding streaming request (materials/particle/tile/tile_noise_gaussian.vtex)
Discarding abandoned streaming texture load for materials/particle/dust/dust_01.vtex
Deleting texture with outstanding streaming request (materials/particle/dust/dust_01.vtex)
Discarding abandoned streaming texture load for materials/particle/smoke3/smoke3b.vtex
Deleting texture with outstanding streaming request (materials/particle/smoke3/smoke3b.vtex)
Closing Steam Net Connection on socket 'client' to loopback:1, handle #2127033889 (2055 NETWORK_DISCONNECT_LOOPDEACTIVATE)
CloseSteamNetConnection handle #2127033889 (userdata 0)
Disassociating NetChan server @  (unknown) from Steam Net Connection handle #2127033889 (userdata 0)
[#2127033889 pipe 'server'] closed by app, linger requested but not needed (2055) NETWORK_DISCONNECT_LOOPDEACTIVATE
[#3955947911 pipe '“衣角微脏”の卡皮君'] closed by peer (2055): NETWORK_DISCONNECT_LOOPDEACTIVATE
Removing Steam Net Connection for loopback:1, handle #2127033889
Closing 'client' poll group
SV:  IGameSystem::LoopDeactivateAllSystems {
HO:  IGameSystem::LoopDeactivateAllSystems {
HO:  } IGameSystem::LoopDeactivateAllSystems done
SV:  } IGameSystem::LoopDeactivateAllSystems done
SV:  Server shutting down: NETWORK_DISCONNECT_LOOPDEACTIVATE (55)
CNetworkGameServerBase::SetServerState (ss_active -> ss_dead)
Disconnect client '“衣角微脏”の卡皮君' from server: NETWORK_DISCONNECT_SHUTDOWN (Server shutdown)
Client 0 '“衣角微脏”の卡皮君' signon state SIGNONSTATE_FULL -> SIGNONSTATE_NONE
Closing Steam Net Connection on socket 'server' to loopback:0, handle #3955947911 (1001 NETWORK_DISCONNECT_SHUTDOWN)
CloseSteamNetConnection handle #3955947911 (userdata 1)
Disassociating NetChan “衣角微 @  (unknown) from Steam Net Connection handle #3955947911 (userdata 1)
Removing Steam Net Connection for loopback:0, handle #3955947911
CPlayerVoiceListener::PostSpawnGroupUnload()
Closing 'server' poll group
SV: CNetworkStringTableContainer::RemoveAllTables:  removing 20 tables
CL: CNetworkStringTableContainer::RemoveAllTables:  removing 20 tables
WriteSteamRemoteStorageFileAsync( "voice_ban.dt" ) -> at 1255.154
CPlayerVoiceListener::GameShutdown()
Unmounting addon 'tree_tag_xxvi'
ResetBreakpadAppId: Universe is 1 (k_EUniversePublic)
ResetBreakpadAppId: Setting non standard break pad app id: 375360
Mounting addon 'tree_tag_xxvi'
ILocalize::AddFile() failed to load file "panorama/localization/addon_english.txt".
ChangeGameUIState: DOTA_GAME_UI_STATE_DASHBOARD -> DOTA_GAME_UI_STATE_LOADING_SCREEN
LoadingDisplay changed from NONE to LOADING (map="")
CAsyncWriteInProgress::OnComplete( "scripts/control_groups.txt" ) -> Success at 1255.184
CAsyncWriteInProgress::OnComplete( "scripts/item_suggest_preference.txt" ) -> Success at 1255.184
CAsyncWriteInProgress::OnComplete( "voice_ban.dt" ) -> Success at 1255.184
Steam Net connection #3955947911 pipe '“衣角微脏”の卡皮君' closed by peer, reason 2055: NETWORK_DISCONNECT_LOOPDEACTIVATE
CloseSteamNetConnection handle #3955947911 (userdata -1)
CL:  CLoopModeLevelLoad::MaybeSwitchToGameLoop switching to "game" loopmode with addons (tree_tag_xxvi)
SwitchToLoop game requested:  id [12] addons [tree_tag_xxvi]
Failed loading resource "panorama/images/players/0_png.vtex_c" (ERROR_FILEOPEN: File not found)
Cannot open C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota_addons\tree_tag_xxvi to calculate addon CRC!
SteamGameServer_Init()
ResetBreakpadAppId: Universe is 1 (k_EUniversePublic)
ResetBreakpadAppId: Setting non standard break pad app id: 375360
SteamGameServer_Init() OK, logging on to Steam
CNetworkSystem::InitGameServer: SteamGameServerNetworking() OK
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
Failed loading resource "particles/neutral_fx/miniboss_damage_reflect_explosion.vpcf_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "materials/models/heroes/statuseffects/electric_detail2_psd_23fa1fb3.vtex_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "materials/models/items/meepo/diggers_divining_rod/diggers_divining_rod_gems.vmat_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "materials/particle/particle_ring_blurry_generic_projected.vmat_c" (ERROR_FILEOPEN: File not found)
SV:  Connection to Steam servers successful.
SV:  ServerSteamID=[A:1:3556197397:50050] (90286959216772117).
Logged on to Steam, set GC connection state to NO_SESSION
Send msg 4007 (k_EMsgGCServerHello), 74 bytes
Gameserver logged on to Steam, assigned identity steamid:90286959216772117
AuthStatus (steamid:90286959216772117):  Attempting  (Requesting cert)
OnSteamServersConnected()
SV:  VAC secure mode disabled.
AuthStatus (steamid:90286959216772117):  OK  (OK)
Certificate expires in 48h00m at 1781518817 (current time 1781346016), will renew in 46h00m
Failed loading resource "materials/sprites/blueglow1.vmat_c" (ERROR_FILEOPEN: File not found)
Recv msg 4005 (k_EMsgGCServerWelcome), 26 bytes
Received server welcome from GC.
CMsgClientWelcome subscribed: 0 up-to-date, 0 out-of-date
GC Connection established for server version 6806
Server:  Inactive
Client:  Disconnected
----- Status -----
  Queued   :  game
@ Current  :  levelload
CL:  CGameClientConnectPrerequisite status
CL:  sequential     :  'CGameClientConnectPrerequisite'
CL:  pending        :  1/7 [1165.735 msec]
CL:  prerequisite   :  .'CWaitForGameServerStartupPrerequisite'
CL:  waiting        :  ..waiting for IsServerRunning()
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
 models/particle/explosion/fx_explosion_capped_sphere.vmdl : Animations loaded but no animation data found
 models/props_structures/xp_shrine/xp_shrine_stones.vmdl : Animations loaded but no animation data found
SV:  Spawn Server: template_map
CNetworkGameServerBase::SetServerState (ss_waitingforgamesessionmanifest -> ss_loading)
CNetworkGameServerBase::SetServerState (ss_loading -> ss_active)
CL:  CWaitForGameServerStartupPrerequisite done waiting for server
CL:  CCreateGameClientJob creating client connection to 'loopback'
[#1807826644 pipe] connected
[#1756634154 pipe] connected
Created poll group for socket 'client'
Connected loopback client=6bc13ed4@loopback:1 <-> server=68b41c2a@loopback:0
Tick packet desired receive margin now 35.0ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
Associating NetChan “衣角微 @ loopback:0 (loopback:0) with Steam Net Connection handle #1756634154 (userdata 1)
Associating NetChan server @ loopback:1 (loopback:1) with Steam Net Connection handle #1807826644 (userdata 0)
CL:  Connected to 'loopback:1'
ClientPutInServer create new player controller [“衣角微脏”の卡皮君]
Client 0 '“衣角微脏”の卡皮君' setting rate to 80000
Game: "Dota 2"
Map: "template_map"
Players: 1 (0 bots) / 64 humans
Build: 10757 (revision 10735821)
Server Number: 12
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
ReadSteamRemoteStorageFile( bufOut, "voice_ban.dt" ) -> 0.000541 seconds
Tick packet desired receive margin now 71.7ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
C_DOTAGamerules::PrecacheMinimapResources: couldn't load file resource/overviews/template_map.txt.
CNetworkGameClient::ProcessClassInfo: create on client true
CNetworkGameClient::ProcessClassInfo: creating client serializers from local server serializers (crc 0, server api exists)
Client missing networkable entity class CPhysMagnet
Client missing networkable entity class CSpotlightEnd
CNetworkGameClientBase::LinkClasses took 61.958 msec
Failed loading resource "panorama/images/heroes/icons/npc_dota_hero_announcer_png.vtex_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "panorama/images/heroes/icons/npc_dota_hero_announcer_killing_spree_png.vtex_c" (ERROR_FILEOPEN: File not found)
CL:  CGameClientConnectPrerequisite connection succeeded
ChangeGameUIState: DOTA_GAME_UI_STATE_LOADING_SCREEN -> DOTA_GAME_UI_DOTA_INGAME
SV:  IGameSystem::LoopActivateAllSystems {
HO:  IGameSystem::LoopActivateAllSystems {
HO:  } IGameSystem::LoopActivateAllSystems done
CResponseSystem:  failed to load scripts/talker/response_rules_custom.txt
SV:  } IGameSystem::LoopActivateAllSystems done
Created physics for template_map
...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:47: attempt to call method 'SetHeroSelectionFilter' (a nil value)
stack traceback:
	...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:47: in function 'InitGameMode'
	...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:24: in function <...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:22>
Script Runtime Error: ...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:47: attempt to call method 'SetHeroSelectionFilter' (a nil value)
stack traceback:
	...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:47: in function 'InitGameMode'
	...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:24: in function <...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:22>
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
CL:  IGameSystem::LoopActivateAllSystems {
ReadSteamRemoteStorageFile( bufOut, "scripts/control_groups.txt" ) -> 0.000554 seconds
ReadSteamRemoteStorageFile( bufOut, "scripts/item_suggest_preference.txt" ) -> 0.000280 seconds
CL:  } IGameSystem::LoopActivateAllSystems done
Host activate: Loading (template_map)
CL:  CNetworkGameClient::OnSwitchLoopModeFinished( game : success )
SV:  Sending full update to client “衣角微脏”の卡皮君 (reason:  initial update)
46. Msg_HltvReplay real-time->real-time
1.50 OnHltvReplay END
CNetworkGameClientBase::OnReceivedUncompressedPacket(), received full update
Resetting prediction state because we received a full update
Receiving 0.6K non-incremental update from server
Created physics for template_map
DOTABaseGameMode::Spawn()
Failed to load. pName='DOTANeutralItems', bIncrementVersion=true, list: 
scripts/npc/npc_neutral_items_custom.txt
[Ability Schema]: Next 10 available ids are: 264,276,314,315,341,342,345,373,410,415,
Found
  420: 349.600700 msec change 'OnGameModeEntityChanged()' on field m_hGameModeEntity(path=0/28) for ent dota_gamerules(C_DOTAGamerulesProxy) name=''
server @ loopback:1:  NetChan Setting Timeout to 30.00 seconds
CL:  Signon traffic "server":  incoming 120.370 KB [13 netframes], outgoing 1.265 KB [12 netframes]
Added prediction for player slot 0 ()
SV:  "“衣角微脏”の卡皮君<0><[U:1:104194549]><>" STEAM USERID validated
Send msg 7534 (k_EMsgClientToGCGetProfileCard), 22 bytes
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
server_loadavg: 0.0827616528
server_tv_broadcast_time: -120
server_game_time: 2.5666666
relay_slots_max: 0
relays_connected: 0
relay_clients_connected: 0
tv_secret_code: 7916620872073457296
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
  407: 0.335200 msec change 'OnPlayerTeamDataTeamChanged()' on field m_iTeamSlot(path=0/0/27) for ent (C_DOTA_PlayerResource) name=''
Recv msg 24 (k_ESOMsg_CacheSubscribed), 42 bytes
Recv msg 24 (k_ESOMsg_CacheSubscribed), 47552 bytes
Recv msg 7535 (k_EMsgClientToGCGetProfileCardResponse), 50 bytes
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_HERO_SELECTION'
Muted Players: 
Send msg 8870 (k_EMsgServerToGCLobbyInitialized), 8 bytes
--- Sent CMsgGameServerInfo to GC
server_public_ip_addr: 1746730543
server_private_ip_addr: 2887094273
server_port: 27015
server_tv_port: 0
server_key: ""
server_hibernation: false
server_type: GAME
server_region: 0
server_loadavg: 0.091065295
server_tv_broadcast_time: -120
server_game_time: -30
relay_slots_max: 0
relays_connected: 0
relay_clients_connected: 0
tv_secret_code: 7916620872073457296
server_version: 6806
server_cluster: 0
assigned_server_tv_port: 27020
allow_custom_games: BOTH
build_version: 6806

---
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_HERO_SELECTION'
LoadingDisplay changed from CUSTOM_GAME_SETUP to NONE (map="template_map")
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_HERO_SELECTION
PregameHud - eGameState is now DOTA_GAMERULES_STATE_HERO_SELECTION
PregameHud - SetPreGameVisible 1
Send msg 4508 (k_EMsgGCGameServerInfo), 82 bytes
Job EconItemSearch has spent >3.000ms without yielding: 10.014ms
Job EconItemSearch has spent >3.000ms without yielding: 10.003ms
CLocalize::FindSafe failed to localize: '#npc_dota_hero_pudge_npedesc2'
PR:SetPossibleHeroSelection 0:[U:1:104194549] npc_dota_hero_pudge(14)
PR:SetSelectedHero 0:[U:1:104194549] npc_dota_hero_pudge(14)
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_STRATEGY_TIME'
  409: 0.222400 msec change 'OnDataTeamPlayerPlayerSteamIDsChanged()' on field m_iPlayerSteamID(path=1/0/84) for ent dota_data_radiant(C_DOTA_DataRadiant) name=''
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_STRATEGY_TIME'
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_STRATEGY_TIME
PregameHud - eGameState is now DOTA_GAMERULES_STATE_STRATEGY_TIME
Send msg 8330 (k_EMsgServerToGCRequestPlayerRecentAccomplishments), 24 bytes
Recv msg 8331 (k_EMsgServerToGCRequestPlayerRecentAccomplishmentsResponse), 19 bytes
Encountered entity that cannot be used in portrait maps - info_player_start_dota
Encountered unrecognized client entity in portrait map - ent_dota_game_events
Send msg 8729 (k_EMsgClientToGCRequestAccountGuildPersonaInfoBatch), 168 bytes
Entity hero_camera [point_camera]: unrecognized parent "loadout_camera_model"
Recv msg 8730 (k_EMsgClientToGCRequestAccountGuildPersonaInfoBatchResponse), 389 bytes
PR:SetSelectedHeroFacet 0:[U:1:104194549] (npc_dota_hero_pudge:(null))
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_WAIT_FOR_MAP_TO_LOAD'
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_PRE_GAME'
m_flPreGameStartTime set to 13.83
m_flStateTransitionTime set to 28.83
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_PRE_GAME'
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_PRE_GAME
PregameHud - eGameState is now DOTA_GAMERULES_STATE_PRE_GAME
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
Entity hero_camera [point_camera]: unrecognized parent "loadout_camera_model"
CGameParticleManager::SetParticleControlEnt: Unable to lookup attachment "attach_hitloc" on model "" for entity "npc_dota_hero_pudge"
PregameHud - SetPreGameVisible 0