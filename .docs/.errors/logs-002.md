CL:  disconnect
Disconnected from server: NETWORK_DISCONNECT_DISCONNECT_BY_USER
SV:  Server shutting down: NETWORK_DISCONNECT_DISCONNECT_BY_USER (2)
CNetworkGameServerBase::SetServerState (ss_active -> ss_dead)
Disconnect client '“衣角微脏”の卡皮君' from server: NETWORK_DISCONNECT_SHUTDOWN (Server shutdown)
Client 0 '“衣角微脏”の卡皮君' signon state SIGNONSTATE_FULL -> SIGNONSTATE_NONE
Closing Steam Net Connection on socket 'server' to loopback:0, handle #465375764 (1001 NETWORK_DISCONNECT_SHUTDOWN)
CloseSteamNetConnection handle #465375764 (userdata 0)
Disassociating NetChan “衣角微 @  (unknown) from Steam Net Connection handle #465375764 (userdata 0)
[#465375764 pipe '“衣角微脏”の卡皮君'] closed by app, linger requested but not needed (1001) NETWORK_DISCONNECT_SHUTDOWN
[#2555339664 pipe 'server'] closed by peer (1001): NETWORK_DISCONNECT_SHUTDOWN
Removing Steam Net Connection for loopback:0, handle #465375764
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CPlayerVoiceListener::PostSpawnGroupUnload()
CSteam3ServerS1::ShutdownGameServer
CNetworkSystem::ShutdownGameServer
Closing 'server' UDP listen socket
Closing 'server' P2P listen socket
Closing 'server' poll group
CSource2Server::GameServerSteamAPIDeactivated()
Disconnecting from server: NETWORK_DISCONNECT_DISCONNECT_BY_USER
Closing Steam Net Connection on socket 'client' to loopback:1, handle #2555339664 (1002 NETWORK_DISCONNECT_DISCONNECT_BY_USER)
CloseSteamNetConnection handle #2555339664 (userdata 1)
Disassociating NetChan server @  (unknown) from Steam Net Connection handle #2555339664 (userdata 1)
Removing Steam Net Connection for loopback:1, handle #2555339664
Closing 'client' poll group
CHostStateMgr::QueueNewRequest( Idle (levelload), 7 )
HostStateRequest::Start(HSR_IDLE):  loop(levelload) id(7) addons() desc(Idle (levelload))
SwitchToLoop levelload requested:  id [7] addons []
CL:  IGameSystem::LoopDeactivateAllSystems {
WriteSteamRemoteStorageFileAsync( "scripts/control_groups.txt" ) -> at 975.012
WriteSteamRemoteStorageFileAsync( "scripts/item_suggest_preference.txt" ) -> at 975.012
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
WriteSteamRemoteStorageFileAsync( "voice_ban.dt" ) -> at 975.344
CPlayerVoiceListener::GameShutdown()
SV:  CGameRulesGameSystem::GameShutdown uninstalled game rules
SV:  CGameRules::CGameRules destructed
Can't CEngineServiceMgr::UpdateAddons to multiple addons in tools mode, tools restricting to tree_tag_xxvi
ChangeGameUIState: DOTA_GAME_UI_DOTA_INGAME -> DOTA_GAME_UI_STATE_LOADING_SCREEN
LoadingDisplay changed from NONE to LOADING (map="")
Host activate: Idle (levelload)
CAsyncWriteInProgress::OnComplete( "scripts/control_groups.txt" ) -> Success at 975.385
CAsyncWriteInProgress::OnComplete( "scripts/item_suggest_preference.txt" ) -> Success at 975.385
CAsyncWriteInProgress::OnComplete( "voice_ban.dt" ) -> Success at 975.386
Steam Net connection #2555339664 pipe 'server' closed by peer, reason 1001: NETWORK_DISCONNECT_SHUTDOWN
CloseSteamNetConnection handle #2555339664 (userdata -1)
CL:  CLoopModeLevelLoad::MaybeSwitchToGameLoop switching to "game" loopmode with addons ()
SwitchToLoop game requested:  id [7] addons []
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
[#560795183 pipe] connected
[#956124167 pipe] connected
Created poll group for socket 'client'
Created poll group for socket 'server'
Connected loopback client=216d0e2f@loopback:1 <-> server=38fd4c07@loopback:0
Tick packet desired receive margin now 35.0ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
Associating NetChan “衣角微 @ loopback:0 (loopback:0) with Steam Net Connection handle #956124167 (userdata 1)
Associating NetChan server @ loopback:1 (loopback:1) with Steam Net Connection handle #560795183 (userdata 0)
CL:  Connected to 'loopback:1'
Client 0 '“衣角微脏”の卡皮君' setting rate to 80000
Game: "Dota 2"
Map: "<empty>"
Players: 1 (0 bots) / 1 humans
Build: 10757 (revision 10735821)
Server Number: 7
CL:  CNetworkGameClient::ProcessServerInfo
ReadSteamRemoteStorageFile( bufOut, "voice_ban.dt" ) -> 0.000729 seconds
Tick packet desired receive margin now 71.7ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
CNetworkGameClient::ProcessClassInfo: create on client true
CNetworkGameClient::ProcessClassInfo: creating client serializers from local server serializers (crc 0, server api exists)
Client missing networkable entity class CPhysMagnet
Client missing networkable entity class CSpotlightEnd
CNetworkGameClientBase::LinkClasses took 68.933 msec
CL:  CGameClientConnectPrerequisite connection succeeded
ChangeGameUIState: DOTA_GAME_UI_STATE_LOADING_SCREEN -> DOTA_GAME_UI_STATE_DASHBOARD
LoadingDisplay changed from LOADING to NONE (map="<empty>")
SV:  IGameSystem::LoopActivateAllSystems {
HO:  IGameSystem::LoopActivateAllSystems {
HO:  } IGameSystem::LoopActivateAllSystems done
SV:  } IGameSystem::LoopActivateAllSystems done
SV:  Game started
CL:  IGameSystem::LoopActivateAllSystems {
ReadSteamRemoteStorageFile( bufOut, "scripts/control_groups.txt" ) -> 0.000393 seconds
ReadSteamRemoteStorageFile( bufOut, "scripts/item_suggest_preference.txt" ) -> 0.000313 seconds
CL:  } IGameSystem::LoopActivateAllSystems done
CL:  CNetworkGameClient::OnSwitchLoopModeFinished( game : success )
Send msg 7197 (k_EMsgGCMatchmakingStatsRequest), 8 bytes
Recv msg 26 (k_ESOMsg_UpdateMultiple), 412 bytes
Recv msg 2570 (k_EMsgClientToGCEquipItemsResponse), 26 bytes
SV:  Sending full update to client “衣角微脏”の卡皮君 (reason:  initial update)
39. Msg_HltvReplay real-time->real-time
1.27 OnHltvReplay END
CNetworkGameClientBase::OnReceivedUncompressedPacket(), received full update
Resetting prediction state because we received a full update
Receiving 0.0K non-incremental update from server
server @ loopback:1:  NetChan Setting Timeout to 30.00 seconds
CL:  Signon traffic "server":  incoming 12.821 KB [6 netframes], outgoing 1.200 KB [5 netframes]
“衣角微 @ loopback:0:  NetChan Setting Timeout to 20.00 seconds
can't solve quadratic for light 0.000000 0.000000
can't solve quadratic for light 0.000000 0.000000
Failed loading resource "panorama/images/heroes/icons/npc_dota_broodmother_spiderling_png.vtex_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "materials/default/tight_fresnelwarprim_psd_2b857599.vtex_c" (ERROR_FILEOPEN: File not found)
Loading custom game "tree_tag_xxvi" with map "template_map"
CHostStateMgr::QueueNewRequest( Loading (template_map), 8 )
HostStateRequest::Start(HSR_GAME):  loop(levelload) id(8) addons(tree_tag_xxvi) desc(Loading (template_map))
SwitchToLoop levelload requested:  id [8] addons [tree_tag_xxvi]
Failed loading resource "materials/models/heroes/morphling/morphling_fresnelwarprim_tga_fa826e4b.vtex_c" (ERROR_FILEOPEN: File not found)
CL:  IGameSystem::LoopDeactivateAllSystems {
WriteSteamRemoteStorageFileAsync( "scripts/control_groups.txt" ) -> at 976.078
WriteSteamRemoteStorageFileAsync( "scripts/item_suggest_preference.txt" ) -> at 976.078
CL:  } IGameSystem::LoopDeactivateAllSystems done
Disconnecting from server: NETWORK_DISCONNECT_LOOPDEACTIVATE
Discarding abandoned streaming texture load for materials/particle/lava/lava_splats/lava_splat.vtex
Deleting texture with outstanding streaming request (materials/particle/lava/lava_splats/lava_splat.vtex)
Discarding abandoned streaming texture load for models/heroes/venomancer/venomancer/venomancer_base_vmorf.vtex
Deleting texture with outstanding streaming request (models/heroes/venomancer/venomancer/venomancer_base_vmorf.vtex)
Discarding abandoned streaming texture load for materials/particle/particle_ring_cloud.vtex
Deleting texture with outstanding streaming request (materials/particle/particle_ring_cloud.vtex)
Discarding abandoned streaming texture load for materials/particle/lens_flare/pro_flares/pro_flares.vtex
Deleting texture with outstanding streaming request (materials/particle/lens_flare/pro_flares/pro_flares.vtex)
Closing Steam Net Connection on socket 'client' to loopback:1, handle #560795183 (2055 NETWORK_DISCONNECT_LOOPDEACTIVATE)
CloseSteamNetConnection handle #560795183 (userdata 0)
Disassociating NetChan server @  (unknown) from Steam Net Connection handle #560795183 (userdata 0)
[#560795183 pipe 'server'] closed by app, linger requested but not needed (2055) NETWORK_DISCONNECT_LOOPDEACTIVATE
[#956124167 pipe '“衣角微脏”の卡皮君'] closed by peer (2055): NETWORK_DISCONNECT_LOOPDEACTIVATE
Removing Steam Net Connection for loopback:1, handle #560795183
Closing 'client' poll group
SV:  IGameSystem::LoopDeactivateAllSystems {
HO:  IGameSystem::LoopDeactivateAllSystems {
HO:  } IGameSystem::LoopDeactivateAllSystems done
SV:  } IGameSystem::LoopDeactivateAllSystems done
SV:  Server shutting down: NETWORK_DISCONNECT_LOOPDEACTIVATE (55)
CNetworkGameServerBase::SetServerState (ss_active -> ss_dead)
Disconnect client '“衣角微脏”の卡皮君' from server: NETWORK_DISCONNECT_SHUTDOWN (Server shutdown)
Client 0 '“衣角微脏”の卡皮君' signon state SIGNONSTATE_FULL -> SIGNONSTATE_NONE
Closing Steam Net Connection on socket 'server' to loopback:0, handle #956124167 (1001 NETWORK_DISCONNECT_SHUTDOWN)
CloseSteamNetConnection handle #956124167 (userdata 1)
Disassociating NetChan “衣角微 @  (unknown) from Steam Net Connection handle #956124167 (userdata 1)
Removing Steam Net Connection for loopback:0, handle #956124167
CPlayerVoiceListener::PostSpawnGroupUnload()
Closing 'server' poll group
SV: CNetworkStringTableContainer::RemoveAllTables:  removing 20 tables
CL: CNetworkStringTableContainer::RemoveAllTables:  removing 20 tables
WriteSteamRemoteStorageFileAsync( "voice_ban.dt" ) -> at 976.190
CPlayerVoiceListener::GameShutdown()
Unmounting addon 'tree_tag_xxvi'
ResetBreakpadAppId: Universe is 1 (k_EUniversePublic)
ResetBreakpadAppId: Setting non standard break pad app id: 375360
Mounting addon 'tree_tag_xxvi'
ILocalize::AddFile() failed to load file "panorama/localization/addon_english.txt".
ChangeGameUIState: DOTA_GAME_UI_STATE_DASHBOARD -> DOTA_GAME_UI_STATE_LOADING_SCREEN
LoadingDisplay changed from NONE to LOADING (map="")
CAsyncWriteInProgress::OnComplete( "scripts/control_groups.txt" ) -> Success at 976.229
CAsyncWriteInProgress::OnComplete( "scripts/item_suggest_preference.txt" ) -> Success at 976.229
Recv msg 7198 (k_EMsgGCMatchmakingStatsResponse), 323 bytes
CAsyncWriteInProgress::OnComplete( "voice_ban.dt" ) -> Success at 976.230
Steam Net connection #956124167 pipe '“衣角微脏”の卡皮君' closed by peer, reason 2055: NETWORK_DISCONNECT_LOOPDEACTIVATE
CloseSteamNetConnection handle #956124167 (userdata -1)
CL:  CLoopModeLevelLoad::MaybeSwitchToGameLoop switching to "game" loopmode with addons (tree_tag_xxvi)
SwitchToLoop game requested:  id [8] addons [tree_tag_xxvi]
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
SV:  ServerSteamID=[A:1:3553312789:50050] (90286959213887509).
Logged on to Steam, set GC connection state to NO_SESSION
Send msg 4007 (k_EMsgGCServerHello), 74 bytes
Gameserver logged on to Steam, assigned identity steamid:90286959213887509
AuthStatus (steamid:90286959213887509):  Attempting  (Requesting cert)
OnSteamServersConnected()
Failed loading resource "materials/sprites/blueglow1.vmat_c" (ERROR_FILEOPEN: File not found)
 models/particle/explosion/fx_explosion_capped_sphere.vmdl : Animations loaded but no animation data found
 models/props_structures/xp_shrine/xp_shrine_stones.vmdl : Animations loaded but no animation data found
SV:  VAC secure mode disabled.
AuthStatus (steamid:90286959213887509):  OK  (OK)
Certificate expires in 47h59m at 1781518538 (current time 1781345739), will renew in 45h59m
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
CL:  pending        :  1/7 [2614.116 msec]
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
spawn    : 8
version  : 48/48 10757 insecure  public
steamid  : [A:1:3553312789:50050] (90286959213887509)
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
[#3907905557 pipe] connected
[#3944795853 pipe] connected
Created poll group for socket 'client'
Connected loopback client=e8ede815@loopback:1 <-> server=eb20cecd@loopback:0
Tick packet desired receive margin now 35.0ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
Associating NetChan “衣角微 @ loopback:0 (loopback:0) with Steam Net Connection handle #3944795853 (userdata 1)
Associating NetChan server @ loopback:1 (loopback:1) with Steam Net Connection handle #3907905557 (userdata 0)
CL:  Connected to 'loopback:1'
ClientPutInServer create new player controller [“衣角微脏”の卡皮君]
Client 0 '“衣角微脏”の卡皮君' setting rate to 80000
Game: "Dota 2"
Map: "template_map"
Players: 1 (0 bots) / 64 humans
Build: 10757 (revision 10735821)
Server Number: 8
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
ReadSteamRemoteStorageFile( bufOut, "voice_ban.dt" ) -> 0.000504 seconds
Tick packet desired receive margin now 71.7ms.  cl_tickpacket_recvmargin_desired=5  cl_tickpacket_desired_queuelength=0.  engine_frametime_warnings_enable=0, cl_async_usercmd_send=1
C_DOTAGamerules::PrecacheMinimapResources: couldn't load file resource/overviews/template_map.txt.
CNetworkGameClient::ProcessClassInfo: create on client true
CNetworkGameClient::ProcessClassInfo: creating client serializers from local server serializers (crc 0, server api exists)
Client missing networkable entity class CPhysMagnet
Client missing networkable entity class CSpotlightEnd
CNetworkGameClientBase::LinkClasses took 58.751 msec
Failed loading resource "panorama/images/heroes/icons/npc_dota_hero_announcer_killing_spree_png.vtex_c" (ERROR_FILEOPEN: File not found)
Failed loading resource "panorama/images/heroes/icons/npc_dota_hero_announcer_png.vtex_c" (ERROR_FILEOPEN: File not found)
CL:  CGameClientConnectPrerequisite connection succeeded
ChangeGameUIState: DOTA_GAME_UI_STATE_LOADING_SCREEN -> DOTA_GAME_UI_DOTA_INGAME
SV:  IGameSystem::LoopActivateAllSystems {
HO:  IGameSystem::LoopActivateAllSystems {
HO:  } IGameSystem::LoopActivateAllSystems done
CResponseSystem:  failed to load scripts/talker/response_rules_custom.txt
SV:  } IGameSystem::LoopActivateAllSystems done
Created physics for template_map
...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:39: attempt to call method 'SetGameTime' (a nil value)
stack traceback:
	...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:39: in function 'InitGameMode'
	...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:24: in function <...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:22>
Script Runtime Error: ...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:39: attempt to call method 'SetGameTime' (a nil value)
stack traceback:
	...ddons\tree_tag_xxvi\scripts\vscripts\addon_game_mode.lua:39: in function 'InitGameMode'
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
ReadSteamRemoteStorageFile( bufOut, "scripts/control_groups.txt" ) -> 0.000514 seconds
ReadSteamRemoteStorageFile( bufOut, "scripts/item_suggest_preference.txt" ) -> 0.000263 seconds
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
  285: 326.795200 msec change 'OnGameModeEntityChanged()' on field m_hGameModeEntity(path=0/28) for ent dota_gamerules(C_DOTAGamerulesProxy) name=''
server @ loopback:1:  NetChan Setting Timeout to 30.00 seconds
CL:  Signon traffic "server":  incoming 120.321 KB [13 netframes], outgoing 1.265 KB [12 netframes]
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
server_loadavg: 0.110362284
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
  272: 0.322800 msec change 'OnPlayerTeamDataTeamChanged()' on field m_iTeamSlot(path=0/0/27) for ent (C_DOTA_PlayerResource) name=''
Recv msg 24 (k_ESOMsg_CacheSubscribed), 47551 bytes
Recv msg 24 (k_ESOMsg_CacheSubscribed), 42 bytes
  272: 0.338800 msec change 'OnPlayerDataTeamChanged()' on field m_iPlayerTeam(path=1/0/2) for ent (C_DOTA_PlayerResource) name=''
  272: 0.265300 msec change 'OnPlayerDataTeamChanged()' on field m_iPlayerTeam(path=1/0/2) for ent (C_DOTA_PlayerResource) name=''
Recv msg 8689 (k_EMsgGCToClientAccountGuildEventDataUpdated), 22 bytes
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_HERO_SELECTION'
Muted Players: 
Send msg 8870 (k_EMsgServerToGCLobbyInitialized), 8 bytes
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_HERO_SELECTION'
LoadingDisplay changed from CUSTOM_GAME_SETUP to NONE (map="template_map")
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_HERO_SELECTION
PregameHud - eGameState is now DOTA_GAMERULES_STATE_HERO_SELECTION
PregameHud - SetPreGameVisible 1
Job EconItemSearch has spent >3.000ms without yielding: 10.017ms
Job EconItemSearch has spent >3.000ms without yielding: 10.003ms
CLocalize::FindSafe failed to localize: '#npc_dota_hero_ember_spirit_npedesc2'
PR:SetPossibleHeroSelection 0:[U:1:104194549] npc_dota_hero_ember_spirit(106)
PR:SetSelectedHero 0:[U:1:104194549] npc_dota_hero_ember_spirit(106)
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_STRATEGY_TIME'
  274: 0.250600 msec change 'OnDataTeamPlayerPlayerSteamIDsChanged()' on field m_iPlayerSteamID(path=1/0/84) for ent dota_data_radiant(C_DOTA_DataRadiant) name=''
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_STRATEGY_TIME'
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_STRATEGY_TIME
PregameHud - eGameState is now DOTA_GAMERULES_STATE_STRATEGY_TIME
Send msg 8330 (k_EMsgServerToGCRequestPlayerRecentAccomplishments), 24 bytes
Entity hero_camera [point_camera]: unrecognized parent "loadout_camera_model"
Recv msg 8331 (k_EMsgServerToGCRequestPlayerRecentAccomplishmentsResponse), 19 bytes
Send msg 8729 (k_EMsgClientToGCRequestAccountGuildPersonaInfoBatch), 191 bytes
Recv msg 8730 (k_EMsgClientToGCRequestAccountGuildPersonaInfoBatchResponse), 421 bytes
PR:SetSelectedHeroFacet 0:[U:1:104194549] (npc_dota_hero_ember_spirit:(null))
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_WAIT_FOR_MAP_TO_LOAD'
S:Gamerules: entering state 'DOTA_GAMERULES_STATE_PRE_GAME'
m_flPreGameStartTime set to 45.63
m_flStateTransitionTime set to 135.63
C:Gamerules: entering state 'DOTA_GAMERULES_STATE_PRE_GAME'
CDOTA_Hud_Main::EventGameRulesStateChanged DOTA_GAMERULES_STATE_PRE_GAME
PregameHud - eGameState is now DOTA_GAMERULES_STATE_PRE_GAME
**** Panel Hint has fill-parent-flow for width, but isn't in a flowing right layout
CGameParticleManager::SetParticleControlEnt: Unable to lookup attachment "attach_hitloc" on model "" for entity "npc_dota_hero_ember_spirit"
CGameParticleManager::SetParticleControlEnt: Unable to lookup attachment "attach_hitloc" on model "" for entity "npc_dota_hero_ember_spirit"
PregameHud - SetPreGameVisible 0