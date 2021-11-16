import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/providers/task_manager_provider.dart';
import 'package:language_learning_ui/providers/socket_provider.dart';
import 'package:language_learning_ui/widgets/expansion_tile_card_demo.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:language_learning_ui/providers/file_location_provider.dart';
import 'package:language_learning_ui/providers/folder_location_provider.dart';
import 'package:language_learning_ui/providers/file_location_controller_provider.dart';
import 'package:language_learning_ui/providers/folder_location_controller_provider.dart';


class TaskManager extends StatelessWidget {
  //final getLocationSource;

  //const FileSystem({Key key}) : super(key: key);

  Widget build(BuildContext context) {

        //'341;System Idle Process,0,8;System,4,20;Registry,124,69584;smss.exe,540,412;csrss.exe,844,2892;wininit.exe,948,1628;csrss.exe,972,5132;services.exe,1020,8276;lsass.exe,448,21660;svchost.exe,1044,29056;fontdrvhost.exe,1080,1136;winlogon.exe,1112,4204;fontdrvhost.exe,1180,7892;WUDFHost.exe,1228,7816;svchost.exe,1280,20848;svchost.exe,1324,6520;svchost.exe,1500,4912;svchost.exe,1540,4332;svchost.exe,1548,5296;svchost.exe,1556,7088;svchost.exe,1804,5428;svchost.exe,1812,4484;svchost.exe,1820,5040;svchost.exe,1836,9928;svchost.exe,1876,2660;IntelCpHDCPSvc.exe,1996,2164;svchost.exe,2008,3900;svchost.exe,976,7028;svchost.exe,572,2252;svchost.exe,1320,4364;svchost.exe,2076,2300;svchost.exe,2100,2912;svchost.exe,2156,13112;svchost.exe,2328,5828;TeraCopyService.exe,2416,1196;IntelCpHeciSvc.exe,2504,2316;igfxCUIService.exe,2556,1932;svchost.exe,2584,7768;svchost.exe,2640,2180;svchost.exe,2700,3620;svchost.exe,2836,6952;svchost.exe,2900,6256;svchost.exe,2932,2776;svchost.exe,2992,6472;dasHost.exe,3024,9000;svchost.exe,2728,8132;svchost.exe,1372,3864;svchost.exe,3152,16004;svchost.exe,3248,28072;OmenCap.exe,3256,2296;SysInfoCap.exe,3264,10516;AppHelperCap.exe,3272,2388;DiagsCap.exe,3280,2432;NetworkCap.exe,3288,4360;TouchpointAnalyticsClientService.exe,3420,35736;svchost.exe,3460,11816;svchost.exe,3544,4324;svchost.exe,3620,6188;svchost.exe,3664,3328;svchost.exe,3756,2696;svchost.exe,3948,4136;NVDisplay.Container.exe,4012,9276;svchost.exe,4076,2040;svchost.exe,4084,7068;svchost.exe,3860,5424;svchost.exe,3876,5264;Memory Compression,3436,769240;NVDisplay.Container.exe,4236,42184;WmiPrvSE.exe,4392,23724;WmiPrvSE.exe,4436,6380;unsecapp.exe,4560,3684;svchost.exe,4828,49400;SbieSvc.exe,4984,1712;svchost.exe,4992,4052;svchost.exe,5232,11556;svchost.exe,5264,10188;svchost.exe,5372,4316;svchost.exe,5504,5432;svchost.exe,5512,3240;svchost.exe,5572,4460;svchost.exe,5832,4916;svchost.exe,5956,14480;svchost.exe,6044,4364;spoolsv.exe,6136,8288;wlanext.exe,5252,2372;svchost.exe,2740,57060;armsvc.exe,5888,3152;mDNSResponder.exe,6148,2828;ETDService.exe,6156,1692;svchost.exe,6164,26832;svchost.exe,6188,4104;svchost.exe,6196,4052;ibtsiva.exe,6204,1932;svchost.exe,6212,2056;OneApp.IGCC.WinService.exe,6220,13124;svchost.exe,6236,3736;nssm.exe,6228,2864;Everything.exe,6244,2028;nvcontainer.exe,6252,20336;SMSvcHost.exe,6260,5540;SECOMN64.exe,6268,3176;FNPLicensingService64.exe,6276,2992;jhi_service.exe,6284,1444;MsMpEng.exe,6300,231484;RtkAudUService64.exe,6308,6132;RstMwService.exe,6316,2400;WTabletServicePro.exe,6324,4772;svchost.exe,6332,2264;XtuService.exe,6348,19184;tmGAInstall.exe,6356,1932;svchost.exe,6368,11988;lghub_updater.exe,6376,6372;NvTelemetryContainer.exe,6392,11544;esif_uf.exe,6420,2776;svchost.exe,6428,2116;conhost.exe,6440,1640;svchost.exe,6584,1760;expressvpnd.exe,6696,52024;conhost.exe,7232,2500;svchost.exe,7636,6164;svchost.exe,7196,3960;svchost.exe,8084,6224;svchost.exe,8688,7880;svchost.exe,9368,6568;svchost.exe,9376,14756;ETDCtrl.exe,9924,7692;svchost.exe,9988,6860;nvcontainer.exe,10092,29344;nvcontainer.exe,10100,56432;sihost.exe,10204,29756;svchost.exe,5444,165072;svchost.exe,3236,4368;PresentationFontCache.exe,8768,11240;svchost.exe,2896,53208;taskhostw.exe,9816,12312;ThrottleStop.exe,9800,2700;svchost.exe,9944,16236;svchost.exe,10428,2460;ctfmon.exe,10560,15020;explorer.exe,10736,224400;svchost.exe,10840,13464;igfxEM.exe,10992,15812;Wacom_TabletUser.exe,11032,3512;nvsphelper64.exe,11168,6656;NVIDIA Share.exe,11176,31572;WacomHost.exe,11208,8212;dllhost.exe,11216,6276;svchost.exe,10268,18296;Wacom_Tablet.exe,8044,16928;Wacom_TouchUser.exe,11160,7700;svchost.exe,9908,39324;NVIDIA Share.exe,11408,15044;NVIDIA Web Helper.exe,11968,27044;conhost.exe,11996,2076;StartMenuExperienceHost.exe,11300,52688;RuntimeBroker.exe,11820,10992;SearchApp.exe,9840,81100;PowerToys.exe,12104,5676;RuntimeBroker.exe,12380,44464;RuntimeBroker.exe,13456,25160;NVIDIA Share.exe,14084,70032;SettingSyncHost.exe,14264,3648;dllhost.exe,5144,23240;TextInputHost.exe,14332,49840;lghub.exe,12840,49224;lghub_agent.exe,7688,25876;lghub.exe,7136,79268;lghub.exe,13100,26724;unsecapp.exe,14736,4364;IDMan.exe,14920,38364;ExpressVPN.exe,15200,113032;IEMonitor.exe,14964,5972;ModernFlyoutsHost.exe,2948,89156;RuntimeBroker.exe,13684,3860;kdeconnect-indicator.exe,4268,41980;dbus-daemon.exe,15292,2092;conhost.exe,15264,1780;kdeconnectd.exe,13028,42192;msedge.exe,9360,471924;msedge.exe,1028,3632;msedge.exe,15336,102960;msedge.exe,15128,51480;msedge.exe,14960,12008;msedge.exe,15420,86144;msedge.exe,15432,23572;msedge.exe,15440,73272;msedge.exe,15656,76000;msedge.exe,15700,92592;msedge.exe,15768,28920;msedge.exe,15932,45172;msedge.exe,16040,12232;msedge.exe,16084,42004;msedge.exe,16096,23000;msedge.exe,16136,39364;msedge.exe,16200,168740;msedge.exe,11480,293808;msedge.exe,11976,368648;msedge.exe,18340,12652;ExpressVPNNotificationService.exe,1944,56236;msedge.exe,13768,302156;msedge.exe,18132,212692;msedge.exe,1628,112832;msedge.exe,1960,204760;dllhost.exe,6900,9328;Discord.exe,18648,73396;Discord.exe,18788,13844;Discord.exe,18908,42976;Discord.exe,18952,27608;msedge.exe,19292,108620;Discord.exe,19300,345596;HPAudioSwitch.exe,7432,58756;Discord.exe,19124,25816;svchost.exe,18568,2492;svchost.exe,6508,13812;ShellExperienceHost.exe,4608,54804;svchost.exe,10764,5280;dllhost.exe,19144,3744;RuntimeBroker.exe,9984,19032;dasHost.exe,9396,1632;svchost.exe,16932,11764;svchost.exe,13212,15088;HPCommRecovery.exe,2452,9552;SgrmBroker.exe,13648,6968;svchost.exe,19180,4716;SecurityHealthService.exe,17976,7992;msedge.exe,10612,11204;cmd.exe,2664,1116;conhost.exe,12024,3008;IDMMsgHost.exe,17552,2868;svchost.exe,7760,5244;taskhostw.exe,6736,10528;msedge.exe,19676,20900;ApplicationFrameHost.exe,9612,9772;dasHost.exe,16128,2412;svchost.exe,3728,3004;svchost.exe,8272,2772;svchost.exe,692,3428;rundll32.exe,8736,2776;Spotify.exe,11692,91452;Spotify.exe,12220,9484;Spotify.exe,16984,31964;Spotify.exe,14308,10780;Spotify.exe,20592,21612;Spotify.exe,20112,249704;svchost.exe,21680,5220;svchost.exe,19420,2832;msedge.exe,12260,55388;msedge.exe,18964,28300;svchost.exe,12752,2272;SystemSettingsBroker.exe,17788,20276;TrustedInstaller.exe,8552,4176;TiWorker.exe,13616,5812;fodhelper.exe,11296,1896;MoUsoCoreWorker.exe,16488,19248;RTSS.exe,15032,17728;EncoderServer.exe,8376,61696;RTSSHooksLoader64.exe,10976,6264;msedge.exe,22932,10168;msedge.exe,12860,78260;msedge.exe,17820,23728;msedge.exe,17880,95572;cmd.exe,6644,1476;conhost.exe,20668,3452;expressvpn-browser-helper.exe,23216,12584;svchost.exe,22800,13324;svchost.exe,6800,3220;OfficeClickToRun.exe,6572,30476;AppVShNotify.exe,12988,2472;AppVShNotify.exe,3644,2880;ONENOTEM.EXE,15216,1980;SearchIndexer.exe,7732,74412;msedge.exe,7188,208460;msedge.exe,24160,30780;msedge.exe,22556,59316;msedge.exe,21152,69052;msedge.exe,15376,188084;msedge.exe,7436,73716;msedge.exe,14228,46240;svchost.exe,19804,2612;AdobeIPCBroker.exe,8292,7836;CCLibrary.exe,9556,1204;node.exe,20772,37384;conhost.exe,6128,2924;svchost.exe,8124,3408;dwm.exe,20076,146552;LockApp.exe,16968,18340;RuntimeBroker.exe,14548,17296;svchost.exe,23836,2516;TaskbarX.exe,21700,19320;NisSrv.exe,20016,5556;svchost.exe,20404,3168;svchost.exe,7668,3524;svchost.exe,17380,5808;svchost.exe,2412,5684;CompPkgSrv.exe,15040,5708;msedge.exe,25292,95380;msedge.exe,16064,103444;Code.exe,13048,85032;Code.exe,21196,25480;Code.exe,20072,515168;Code.exe,27604,37332;Code.exe,7004,91480;Code.exe,10696,85004;conhost.exe,4140,10868;vsls-agent.exe,16760,50888;Code.exe,27392,221772;Code.exe,20344,292824;Code.exe,26092,74516;conhost.exe,20104,6920;powershell.exe,13976,71576;Code.exe,7984,172096;msedge.exe,2356,86368;msedge.exe,26996,139864;msedge.exe,23116,142836;msedge.exe,17684,102240;dllhost.exe,12152,8008;sublime_text.exe,14744,47988;plugin_host-3.3.exe,16820,16960;plugin_host-3.8.exe,2572,21572;msedge.exe,24852,119444;msedge.exe,4600,104732;msedge.exe,14804,103488;svchost.exe,23004,13272;conhost.exe,7424,7012;powershell.exe,18200,83476;msedge.exe,23980,138576;msedge.exe,21044,104896;msedge.exe,26548,135372;Ditto.exe,9428,18748;msedge.exe,8344,99952;msedge.exe,3168,118844;msedge.exe,27580,96372;msedge.exe,3528,130460;msedge.exe,22752,219396;msedge.exe,2712,31212;audiodg.exe,15300,19660;svchost.exe,25068,7548;msedge.exe,16380,46220;python.exe,21740,4608;python.exe,25580,10024;tasklist.exe,23144,9680;';
    //int sze = 9;
    return Scaffold(
      body: ListDemo(dir: Provider.of<Sockett>(context,listen:false).taskManagerOutput),
    );
  }
}

class ListDemo extends StatefulWidget {
  final String dir;

  //final getLocationSource;

  @override
  const ListDemo({Key key, this.dir}) : super(key: key);

  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
   @override
  void initState() {
      // //ToDo : use this k string for display
      // String k = Provider.of<Sockett>(context,listen:false).task_manager();
      // print(k);

      super.initState();
  }


  int _selectedIndex = -1;
  String dir = 'empty';
  String Loc = 'empty';
  String LocFile = 'empty';
  String LocDir = 'empty';
  String name = 'None';
  int sze;
  var dirArr;
  int _currentTabIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];
  Map<int, bool> countToValue = <int, bool>{};

  void dirArrayMaker() {
    int e = sze;
    int f = 4;
    dirArr = List.generate(e, (i) => List(f), growable: false);
    int i = 0;
    int j = 0;
    String tmp = "";
    for (int s = 0; s < dir.length; s++) {
      if (dir[s] == ',') {
        dirArr[i][j] = tmp;
        tmp = "";
        j++;
      } else if (dir[s] == ';') {
        dirArr[i][j] = tmp;
        tmp = "";
        j = 0;
        i++;
      } else
        tmp = tmp + dir[s];
    }
  }

  void getSize()
  {
    sze=0;
    String ret='';
    for(int s=0;s<dir.length;s++)
    {
      if(dir[s]!=';') {
        ret = ret+ dir[s];
      }
      else{
        sze = int.parse(ret);
        dir = dir.substring(s+1);
        break;
      }
    }
    print(dir.length);
    print('size is');
    print(sze);
  }

  Widget build(BuildContext context) {

    //while(dir=='1;./root,0,0;')
    //{
      dir = Provider.of<Sockett>(context,listen:false).taskManagerOutput;
      print(dir);
      //}
    //dir = Provider.of<Sockett>(context,listen:false).taskManagerOutput;
    //print(dir);
    //sze = widget.sze;
    getSize();
    dirArrayMaker();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //title: Text("Task Manager"),
        backgroundColor: Constants.backColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: new BoxDecoration(
          color: Constants.backColor,
        ),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: InkWell(
                  onTap: (){
                    setState(() {
                      dir = Provider.of<Sockett>(context,listen:false).taskManagerOutput;
                    });
                  },
                  child: Container(
                    child: Icon(
                      Icons.airplay,
                      color: Constants.cardColor8,
                      size: 100.0,
                    ),

                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            //for (int i=0,a=dirArr[i][0],b=dirArr[i][1],c=dirArr[i][2],d=dirArr[i][3] ; (i< dir.length);i++,a=dirArr[i][0],b=dirArr[i][1],c=dirArr[i][2],d=dirArr[i][3])
            for (int i = 0; (i < sze); i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('${dirArr[i][0]}',style: TextStyle(
                    fontSize: 20.0,
                    color: Constants.fontColor,
                    fontWeight: FontWeight.w200,
                  ),),
                  isThreeLine: true,
                  subtitle: Text(
                      'PID: ${dirArr[i][1]} \nRam Occupied:${dirArr[i][2]}K',style: TextStyle(
                    fontSize: 15.0,
                    color: Constants.fontColor,
                    fontWeight: FontWeight.w200,
                  ),),
                  leading: Icon(Icons.settings_rounded,color: Constants.cardColor8,),
                  selected: countToValue[i] ?? false,
                  trailing: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = i;
                        name = dirArr[i][0];
                        Provider.of<TaskManagerProvider>(context,listen:false).reset(dirArr[_selectedIndex][0]);
                        print(name);
                        //await Future.delayed(const Duration(seconds: 2), (){});
                        //showDialog<void>(context: context, builder: (context) => dialog);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return MyDialog();
                            });

                        print(name);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:
                          Icon(
                        Icons.close_outlined,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.0, color: Constants.fontColor),
                    ),
                  ),

                  // Checkbox(
                  //   value: _selectedIndex == i,
                  //   onChanged: (bool value) {
                  //     setState(() {
                  //       //countToValue[i] = value;
                  //       _selectedIndex = i;
                  //       LocFile = (dirArr[_selectedIndex][1]=='Folder')?('empty'):dirArr[_selectedIndex][3];
                  //     });
                  //   },
                  // ),
                  onTap: () {

                  },
                ),
              ),
          ],
        ),
      ),
    );

  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Color _c = Colors.redAccent;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constants.backColor,
      contentPadding: EdgeInsets.zero,
      title: Text('End Task ?',style: TextStyle(
        fontSize: 25.0,
        color: Colors.red,
        fontWeight: FontWeight.w200,
      ),),
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),
            Text('This will end the process ${Provider.of<TaskManagerProvider>(context,listen:false).task}.',style: TextStyle(
              fontSize: 15.0,
              color: Constants.fontColor,
              fontWeight: FontWeight.w200,
            ),),
          ],
        ),
      ),
      actions: <Widget>[
        // FlatButton(
        //     child: Text('Switch'),
        //     onPressed: () => setState(() {
        //       _c == Colors.redAccent
        //           ? _c = Colors.blueAccent
        //           : _c = Colors.redAccent;
        //     }))
        FlatButton(
          textColor: Constants.fontColor,
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        FlatButton(
          textColor: Colors.red,
          onPressed: () => Navigator.pop(context),
          child: Text('END PROCESS'),
        ),
      ],
    );
  }
}