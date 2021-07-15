#include <a_samp>
#include <streamer>
#include <sscanf2>
#include <mxINI>
#include <utils>
enum pInfo {
    pMoney,
    pAdmin,
    pBan

};
new PlayerInfo[MAX_PLAYERS][pInfo];
#define DIALOG_LOGIN 998
#define DIALOG_REGISTER 999
#define AccauntBD "users/%s.ini"
#define COLOR_ORANGE 0xFF8000AA
#define COLOR_RED 0xFF0000AA

forward OnPlayerRegistered(playerid, password[]);
forward OnPlayerLogged(playerid, password[]);
forward OnPlayerSave(playerid);
forward ShowPlayerRegisterDialog(playerid);
forward ShowPlayerLoginDialog(playerid);

#include <AntiMoneyCheat>
#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1
forward SpecHArefresh(playerid, specplayerid);
#define COLOR_SYSTEM -1
#define COLOR_BLUE -1
#define COLOR_LIGHTRED -1
#define COLOR_GREY -1
#define COLOR_GRAD1 -1
#define green 0x33FF33AA
#define COLOR_GRAD2 -1
#define ADMIN_SPEC_TYPE_VEHICLE 2
#define ADMIN_SPEC_TYPE_PLAYER 1
#define ADMIN_SPEC_TYPE_NONE 0
#define COLOR_GREEN 0x33AA33FF
//Дрифт очки
        #define DRIFT_MINKAT 10.0
        #define DRIFT_MAXKAT 90.0
        #define COLOR_LIGHTRED 0xFF0000FF
        #define COLOR_LIGHTBLUE 0x33CCFFAA
        #define COLOR_GREENISHGOLD 0xCCFFDD56
        #define DRIFT_SPEED 30.0
        #pragma tabsize 0
        #pragma unused GetPlayerTheoreticAngle
new Float:ppos[200][3];
enum Float:Pos { Float:sX, Float:sY, Float:sZ };
new Float:SavedPos[MAX_PLAYERS][Pos];
new DriftPointsNow[200];
new PunktyDriftuGracza[200];
new Text:DriftTD[200];
new Text:DriftTD2[200];
new Text:Textdraw0;
forward LicznikDriftu();
forward clock();
forward PodsumowanieDriftu(playerid);
//Дрифт очки
new Logged[MAX_PLAYERS] = 0;
new gSpectateID[MAX_PLAYERS];
new gSpectateType[MAX_PLAYERS];
new Text:SM_HA[MAX_PLAYERS];
new SpecHATimer[MAX_PLAYERS];
new Spectate[MAX_PLAYERS];
forward SendAdminMessage(color, string[]);
new rules;
#define MAX_GANGS 1000
new tgang[MAX_PLAYERS], Scoress[MAX_PLAYERS], name[MAX_GANGS][256], col[MAX_GANGS][256], gangskin[MAX_PLAYERS], id[MAX_PLAYERS] = -1;
new GangName[MAX_GANGS][256], Gang[MAX_GANGS],
    GangLvl[MAX_PLAYERS], GName[MAX_GANGS][256],
    GColor[MAX_GANGS][100], PGang[MAX_PLAYERS],
    Float:GSpawnX[MAX_GANGS], Float:GSpawnY[MAX_GANGS],
    Float:GSpawnZ[MAX_GANGS], GSkin[MAX_GANGS][7];
new Adm[][] = {
    { "                                     {ffffcc}Admin 1 lvl: \n" },
    { "{66ff00}/freeze [id] - заморозить\n" },
    { "{66ff00}/unfreeze [id] - разморозить\n" },
    { "{66ff00}/get [id] - телепортировать игрока к себе\n" },
    { "{66ff00}/goto [id] - телепортироватся к игроку\n" },
    { "{66ff00}/cc - очистить чат\n" },
    { "{66ff00}/a - админ чат(игрокам он не виден)\n" },
    { "                                     {ffffcc}Admin 2 lvl:\n" },
    { "{66ff00}/spec [id] - следить за игроком \n" },
    { "{66ff00}/specoff [id] - перестать следить за игроком \n" },
    { "{66ff00}/akill [id] - убить игрока\n" },
    { "{66ff00}/gm [id] - выдать игроку GM\n" },
    { "{66ff00}/disarm [id] - разоружить игрока\n" },
    { "{66ff00}/slap [id] - пнуть игрока\n" },
    { "{66ff00}/kick [id] [причина] - кикнуть игрока\n" },
    { "\n" },
    { "                                     {ffffcc}Admin 3 lvl:\n" },
    { "{66ff00}/time - изменить время на сервере \n" },
    { "{66ff00}/ban [id] [дни] [причина] - забанить игрока\n" },
    { "{66ff00}/healall - дать всем полное здоровье\n" },
    { "{66ff00}/armourall - дать всем полную броню\n" },
    { "\n" }
};

#define ADMIN_SPEC_TYPE_VEHICLE 2
#define ADMIN_SPEC_TYPE_PLAYER 3
#define ADMIN_SPEC_TYPE_NONE 4
/*new gSpectateID[MAX_PLAYERS];
new gSpectateType[MAX_PLAYERS];
new Spectate[MAX_PLAYERS];
*/
//Регистрация

#define COLOR_SYSTEM -1
stock GetMoney(playerid) return PlayerInfo[playerid][pMoney];
//Конец регистрации
//Дрифт очки
#define COLOR_GREEN 0x33AA33FF
#define COLOR_GREEN 0x33AA33FF
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_RED 0xFF0000AA
#define COLOR_WHITE 0xFF33FFAA
#define COLOR_YELLOW 0x66FFFFAA
#define COLOR_ORANGE 0xFF9900AA
#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1


#pragma tabsize 0

bool: tunings(playerid); //античит на тюнинг
stock bool: tunings(playerid) //античит на тюнинг
{
    if (IsPlayerInRangeOfPoint(playerid, 10, 615.2878, -124.2391, 997.5602)) return true;
    if (IsPlayerInRangeOfPoint(playerid, 10, 617.5355, -1.9899, 1000.6155)) return true;
    if (IsPlayerInRangeOfPoint(playerid, 10, 616.7834, -74.8151, 997.7726)) return true;
    return false;
}
new RandomRadio[][] = {
    { "http://nation-rp.do.am/zagruz1.mp3" },
    { "http://nation-rp.do.am/zagruz2.mp3" },
    { "http://nation-rp.do.am/zagruz3.mp3" },
    { "http://nation-rp.do.am/zagruz4.mp3" },
    { "http://nation-rp.do.am/zagruz5.mp3" },
    { "http://nation-rp.do.am/zagruz6.mp3" },
    { "http://nation-rp.do.am/zagruz7.mp3" },
    { "http://nation-rp.do.am/zagruz8.mp3" },
    { "http://nation-rp.do.am/zagruz9.mp3" },
    { "http://nation-rp.do.am/zagruz10.mp3" }
};
new Float:VehPos[MAX_VEHICLES][4]; //антифлудкар
new bool: BanCar[MAX_VEHICLES]; //антифлудкар
new TimeUpdate[MAX_PLAYERS]; //антифлудкар
new ta4ka[MAX_PLAYERS];
new ta4katest[MAX_PLAYERS];
new neon[MAX_PLAYERS][2];
new countdown[MAX_PLAYERS];
new h[MAX_PLAYERS], m[MAX_PLAYERS];
new Float:RandomSpawn[][4] = {
    { 2540.6499, -1460.9518, 24.0276 },
    { 2180.6038, -2272.9414, 13.4850 },
    { 1775.5583, -1909.0343, 13.3861 },
    {-1945.7518, 487.0891, 31.9688 },
    {-1921.0516, 716.1599, 46.5625 }
};
new Text:nameddd;
new Text:mod;

//Переменные для телепортов по пикапу в квартиры админов
new teleport;
new teleport2;
new teleport3;
new teleport4;
new teleport5;
new teleport6;
//------------------------------------------------------
new CrashCars1[] = { //двуместный транспорт
    401,
    402,
    403,
    407,
    408,
    410,
    411,
    412,
    413,
    414,
    415,
    416,
    417,
    419,
    422,
    423,
    424,
    427,
    428,
    429,
    433,
    434,
    436,
    440,
    443,
    444,
    447,
    451,
    455,
    456,
    457,
    459,
    461,
    462,
    463,
    468,
    469,
    471,
    474,
    475,
    477,
    478,
    480,
    482,
    483,
    489,
    491,
    494,
    495,
    496,
    498,
    499,
    500,
    502,
    503,
    504,
    505,
    506,
    508,
    511,
    514,
    515,
    517,
    518,
    521,
    522,
    523,
    524,
    525,
    526,
    527528,
    533,
    534,
    535,
    537,
    538,
    541,
    542,
    543,
    544,
    545,
    548,
    549,
    552,
    554,
    556,
    557,
    558,
    559,
    562,
    563,
    565,
    573,
    574,
    575,
    576,
    578,
    581,
    582,
    586,
    587,
    588,
    589,
    599,
    600,
    601,
    602,
    603,
    605,
    609
};
new CrashCars2[] = { //одноместный транспорт
    406,
    425,
    430,
    432,
    441,
    446,
    448,
    452,
    453,
    454,
    460,
    464,
    465,
    472,
    473,
    476,
    481,
    484,
    485,
    486,
    493,
    501,
    509,
    510,
    512,
    513,
    519,
    520,
    530,
    531,
    532,
    539,
    553,
    564,
    568,
    571,
    572,
    577,
    583,
    592,
    593,
    594,
    595
};



//Ворота баз
new gates;
new gates2;
//Форварды
forward OnVehicleMod(playerid, vehicleid, componentid); //античит на тюнинг
forward Countdown();
forward Check();
forward AutoRepair();
forward AutoFlip();
forward Nation();
forward TOP();
forward SetRealTime(); //автоматическая смена времени
forward Favorit();
forward lsnewsClose(); //
forward ConnectedPlayers();
forward UpdateVehiclePos(vehicleid, type); //антифлудкар
bool: UseCar(carid); //антифлудкар
//bool: StopCar(carid);//антифлудкар
forward OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat); //антифлудкар
static


main() {
    print("\n----------------------------------");
    print("Nation Drift Server от Nation World Project загружен на 100% успешно\n\n.");
    print("----------------------------------\n");
}
public AutoRepair() {
    for (new playerid = 0; playerid < MAX_PLAYERS; playerid++) {
        if (IsPlayerInAnyVehicle(playerid)) {
            new Float:CarHP;
            GetVehicleHealth(GetPlayerVehicleID(playerid), CarHP);
            if (CarHP < 999) {
                RepairVehicle(GetPlayerVehicleID(playerid));
            }
        }
    }
    return 1;

}


public OnGameModeInit() {
    SetGameModeText("Russia/Drift/Race/DM/RP/RPG/Stun/Stunt"); //game mode name
    UsePlayerPedAnims();
    SetTimer("Loshadka", 2000, 1);
    SetTimer("Check", 1000, -1); //таймер для проверки
    SetTimer("Countdown", 1000, -1); //таймер отсчёта
    SetTimer("AutoRepair", 2000, -1);
    SetTimer("Nation", 1000 * 60 * 5, -1);
    SetTimer("BitHost", 1000 * 60 * 6, -1);
    SetTimer("Favorit", 1000 * 60 * 3, -1);
    SetTimer("SetRealTime", 1000 * 60 * 60, -1); //автоматическая смена времени
    SendRconCommand("mapname Russia/RACE/Stun/DM/RP/RPG/DRIFT");
    AllowAdminTeleport(1);
    new rand = random(sizeof(RandomSpawn)); //скины
    //Дрифт очки
    for (new x = 0; x < 200; x++) {
        DriftTD2[x] = TextDrawCreate(301.000000, 431.000000, " ");
        TextDrawBackgroundColor(DriftTD2[x], 255);
        TextDrawFont(DriftTD2[x], 3);
        TextDrawLetterSize(DriftTD2[x], 0.549999, 1.700000);
        TextDrawColor(DriftTD2[x], -16776961);
        TextDrawSetOutline(DriftTD2[x], 1);
        TextDrawSetProportional(DriftTD2[x], 1);
    }
    SetTimer("AngleUpdate", 700, true);
    SetTimer("LicznikDriftu", 500, true);
    //Дрифт очки
    AddPlayerClass(19, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(21, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(23, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(28, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(29, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(41, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(47, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(63, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(64, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(83, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(93, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(91, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(101, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(102, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(103, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(104, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(105, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(106, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(107, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(108, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(109, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(110, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(113, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(114, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(115, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(116, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(117, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(118, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(119, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(120, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(121, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(134, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(135, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(136, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(137, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(141, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(143, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(147, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(150, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(151, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(152, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(156, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(169, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(170, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(176, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(177, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(178, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(179, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(180, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(185, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(186, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(187, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(188, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(189, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(190, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(191, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(192, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(193, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(194, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(195, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(203, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(204, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(228, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(229, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(233, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(240, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(241, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(242, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(249, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(250, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(251, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(252, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(258, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(259, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(269, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(270, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(271, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(285, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(292, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    AddPlayerClass(295, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2], RandomSpawn[rand][3], 0, -1, 46, -1, 43, 40);
    //3д тексты
    //Ухо
    Create3DTextLabel("Старт!!!", 0x00CC00AA, -302.3200, 1508.5829, 75.3594, 50.0, 0, 1);
    Create3DTextLabel("Финиш!!!", 0x00CC00AA, -1138.7115, 1801.2386, 40.8996, 50.0, 0, 1);
    Create3DTextLabel("Элитное сообщество", 0x00CC00AA, 2567.5100, 1482.4451, 12.2500, 50.0, 0, 1);
    //Окружность WangCars
    Create3DTextLabel("Wang Cars", 0x00CC00AA, -1968.1075, 284.5377, 35.1719, 50.0, 0, 1);
    Create3DTextLabel("Ж/Д Вокзал SF", 0x00CC00AA, -1999.9341, 185.3953, 27.5391, 50.0, 0, 1);
    Create3DTextLabel("Ж/Д Вокзал SF", 0x00CC00AA, -1998.4413, 106.8353, 27.5391, 50.0, 0, 1);
    //==================================================АВТО=======МОДА==========================================================================
    //Авто
    AddStaticVehicle(477, -925.0754, 2038.5060, 60.5663, 321.8107, 0, 0); //
    AddStaticVehicle(477, -913.6642, 2025.7542, 60.5692, 154.9631, 0, 0); //
    AddStaticVehicle(562, -906.3292, 1985.3114, 60.5445, 307.3272, 0, 0); //
    AddStaticVehicle(562, -913.6943, 1994.6311, 60.5714, 107.9377, 0, 0); //
    AddStaticVehicle(477, 1702.0532, 959.9387, 10.4761, 107.1873, 0, 0); //
    AddStaticVehicle(562, 1703.1053, 955.0209, 10.4786, 109.4362, 101, 1); //
    AddStaticVehicle(560, 1702.0918, 948.8908, 10.5258, 112.5750, 0, 0); //
    AddStaticVehicle(560, 1702.6346, 943.8699, 10.5260, 112.7191, 0, 0); //
    AddStaticVehicle(402, 1702.1183, 938.4609, 10.6520, 113.3426, 30, 30); //
    AddStaticVehicle(487, 1660.9608, 912.6890, 10.8752, 148.2303, 29, 42); //
    AddStaticVehicle(562, -135.1569, 558.1448, 5.0844, 31.3349, 92, 1); //
    AddStaticVehicle(562, -141.8329, 574.3738, 3.0261, 12.6657, 92, 1); //
    AddStaticVehicle(562, -142.4115, 591.7170, 1.9687, 353.4959, 92, 1); //
    AddStaticVehicle(429, -122.7295, 594.8285, 2.1453, 16.9793, 13, 13); //
    AddStaticVehicle(522, -114.2337, 577.1959, 3.0691, 149.8825, 3, 8); //
    AddStaticVehicle(560, -86.0547, 591.9104, 3.0759, 110.7379, 33, 0); //
    AddStaticVehicle(560, -83.9277, 586.4962, 3.4753, 86.6729, 33, 0); //
    AddStaticVehicle(477, 1556.2999, -2361.5598, 13.2097, 180.4930, 92, 1); //
    AddStaticVehicle(477, 1552.7448, -2360.7405, 13.2104, 180.2323, 92, 1); //
    AddStaticVehicle(477, 1549.4838, -2361.3350, 13.2076, 180.0160, 92, 1); //
    AddStaticVehicle(477, 1546.2588, -2360.9417, 13.2100, 180.8791, 92, 1); //
    AddStaticVehicle(415, 1536.2202, -2362.1646, 13.3256, 355.1609, 25, 1); //
    AddStaticVehicle(415, 1533.0386, -2360.9082, 13.3268, 0.0126, 25, 1); //
    AddStaticVehicle(415, 1529.7476, -2361.5215, 13.3254, 0.1173, 25, 1); //
    AddStaticVehicle(415, 1526.5555, -2361.0671, 13.3251, 359.2457, 25, 1); //
    AddStaticVehicle(475, 1518.8190, -2360.9778, 13.3585, 2.9921, 9, 39); //
    AddStaticVehicle(496, 1515.7090, -2362.0547, 13.2709, 359.2595, 66, 72); //
    AddStaticVehicle(491, 1512.3341, -2361.7317, 13.3256, 0.4908, 71, 72); //
    AddStaticVehicle(487, 1543.9042, -1353.4443, 329.6893, 78.4036, 26, 57); //
    AddStaticVehicle(477, 2297.8022, -1631.7189, 14.3331, 54.3846, 101, 1); //
    AddStaticVehicle(411, 2297.2310, -1636.7601, 14.4488, 235.7990, 116, 1); //
    AddStaticVehicle(560, 2291.7346, -1682.1617, 13.6757, 182.2019, 37, 0); //
    AddStaticVehicle(541, 2328.0857, -1677.2399, 14.0445, 91.3346, 58, 8); //
    AddStaticVehicle(415, 2375.1653, -1638.4719, 13.2612, 323.0109, 36, 1); //
    AddStaticVehicle(603, 2403.7468, -1645.1284, 13.3849, 358.2154, 18, 1); //
    AddStaticVehicle(506, 2443.1047, -1644.4661, 13.1721, 355.2797, 3, 3); //
    AddStaticVehicle(542, 2505.5872, -1650.7620, 13.4271, 307.1016, 24, 118); //
    AddStaticVehicle(491, 2473.4758, -1692.7922, 13.2708, 173.4240, 52, 66); //
    AddStaticVehicle(429, 2511.0830, -1686.2892, 13.3172, 60.0713, 14, 14); //
    AddStaticVehicle(451, 2509.4792, -1670.8865, 13.1057, 345.2837, 16, 16); //
    AddStaticVehicle(568, 2527.9500, -1668.0070, 15.0310, 88.8348, 9, 39); //
    AddStaticVehicle(568, 2235.8992, -1638.8726, 15.4345, 152.1177, 9, 39); //
    AddStaticVehicle(402, 2251.1873, -1752.4283, 13.2141, 270.2969, 39, 39); //
    AddStaticVehicle(603, 2394.6570, -1752.2788, 13.2210, 89.6541, 32, 1); //
    AddStaticVehicle(429, 2159.4775, -1807.7446, 13.1273, 355.1286, 1, 2); //
    AddStaticVehicle(411, 2158.3252, -1793.4124, 13.0846, 270.7520, 112, 1); //
    AddStaticVehicle(562, 2122.2949, -1783.7631, 13.0473, 0.1872, 36, 1); //
    AddStaticVehicle(579, 2104.8713, -1782.7990, 13.3174, 350.4269, 53, 53); //
    AddStaticVehicle(542, 2094.6943, -1798.6136, 13.1253, 260.1261, 31, 93); //
    AddStaticVehicle(489, 2062.0945, -1903.5488, 13.6901, 359.5305, 14, 123); //
    AddStaticVehicle(468, 1920.3698, -1926.5054, 13.2149, 69.6827, 46, 46); //
    AddStaticVehicle(402, 1839.9572, -1871.3585, 13.2211, 190.0670, 90, 90); //
    AddStaticVehicle(429, 1776.4178, -1933.2634, 13.1381, 3.0364, 2, 1); //
    AddStaticVehicle(411, 1781.0385, -1932.8647, 13.1133, 357.3422, 106, 1); //
    AddStaticVehicle(562, 1786.9377, -1932.5112, 13.0435, 184.5307, 35, 1); //
    AddStaticVehicle(477, 1806.6699, -1924.5897, 13.1290, 1.4099, 0, 0); //
    AddStaticVehicle(477, 1806.3844, -1909.2515, 13.1349, 0.7795, 0, 0); //
    AddStaticVehicle(477, 1796.3351, -1886.4745, 13.0560, 270.1986, 0, 0); //
    AddStaticVehicle(477, -873.6520, 557.4113, 2.7026, 0.0980, 0, 0); //
    AddStaticVehicle(562, -885.6334, 575.5275, 2.7059, 270.8133, 17, 1); //
    AddStaticVehicle(487, -316.5714, 1304.5455, 57.7795, 77.3283, 29, 42); //
    AddStaticVehicle(579, -289.2281, 1317.6139, 54.2303, 81.6192, 0, 0); //
    AddStaticVehicle(415, -291.4761, 1303.7041, 53.7227, 250.7942, 25, 1); //
    AddStaticVehicle(411, -1712.0343, -206.4479, 13.8789, 335.6590, 0, 0); //
    AddStaticVehicle(411, -1703.3148, -191.2572, 13.8710, 328.0265, 0, 0); //
    AddStaticVehicle(411, -1690.3344, -174.6188, 13.8755, 318.7479, 0, 0); //
    AddStaticVehicle(562, -1653.1930, -182.7685, 13.8054, 224.6218, 116, 1); //
    AddStaticVehicle(562, -1650.5330, -179.7535, 13.8061, 223.6880, 116, 1); //
    AddStaticVehicle(562, -1647.7700, -177.2140, 13.8056, 224.2576, 116, 1); //
    //Авто расставленые через Map Editor
    AddStaticVehicle(549, 1617.59997559, -1123.90002441, 23.79999924, 90.00000000, -1, -1); //Tampa
    AddStaticVehicle(565, 1617.50000000, -1119.19995117, 23.60000038, 90.00000000, -1, -1); //Flash
    AddStaticVehicle(555, 1657.00000000, -1107.00000000, 23.70000076, 90.00000000, -1, -1); //Windsor
    AddStaticVehicle(541, 1657.09997559, -1098.19995117, 23.60000038, 90.00000000, -1, -1); //Bullet
    AddStaticVehicle(477, 1657.40002441, -1089.19995117, 23.70000076, 90.00000000, -1, -1); //ZR-350
    AddStaticVehicle(451, 1657.80004883, -1080.40002441, 23.70000076, 90.00000000, -1, -1); //Turismo
    AddStaticVehicle(402, 1629.69995117, -1102.30004883, 23.79999924, 90.00000000, -1, -1); //Buffalo
    AddStaticVehicle(415, 1649.09997559, -1084.59997559, 23.79999924, 270.00000000, -1, -1); //Cheetah
    AddStaticVehicle(578, 1678.19995117, -1120.40002441, 24.70000076, 0.00000000, -1, -1); //DFT-30
    AddStaticVehicle(578, 1678.19995117, -1100.40002441, 24.70000076, 0.00000000, -1, -1); //DFT-30
    AddStaticVehicle(558, 1691.50000000, -1069.00000000, 23.60000038, 0.00000000, -1, -1); //Uranus
    AddStaticVehicle(602, 1705.09997559, -1069.09997559, 23.79999924, 0.00000000, -1, -1); //Alpha
    AddStaticVehicle(602, 1699.50000000, -1044.00000000, 23.79999924, 0.00000000, -1, -1); //Alpha
    AddStaticVehicle(527, 1703.59997559, -1044.19995117, 23.70000076, 0.00000000, -1, -1); //Cadrona
    AddStaticVehicle(603, 1649.69995117, -1047.19995117, 23.89999962, 0.00000000, -1, -1); //Phoenix
    AddStaticVehicle(603, 1645.19995117, -1047.50000000, 23.89999962, 0.00000000, -1, -1); //Phoenix
    AddStaticVehicle(603, 1640.30004883, -1047.19995117, 23.89999962, 0.00000000, -1, -1); //Phoenix
    AddStaticVehicle(603, 1635.90002441, -1047.19995117, 23.89999962, 0.00000000, -1, -1); //Phoenix
    AddStaticVehicle(557, 1661.40002441, -1136.00000000, 24.89999962, 0.00000000, -1, -1); //Monster B
    AddStaticVehicle(557, 1657.40002441, -1136.00000000, 24.89999962, 0.00000000, -1, -1); //Monster B
    AddStaticVehicle(557, 1652.40002441, -1135.50000000, 24.89999962, 0.00000000, -1, -1); //Monster B
    AddStaticVehicle(581, 1609.09997559, -1112.90002441, 23.60000038, 10.00000000, -1, -1); //BF-400
    AddStaticVehicle(581, 1609.59997559, -1117.80004883, 23.60000038, 9.99755859, -1, -1); //BF-400
    AddStaticVehicle(581, 1608.40002441, -1108.30004883, 23.60000038, 9.99755859, -1, -1); //BF-400
    AddStaticVehicle(417, 1607.19995117, -1085.00000000, 22.89999962, 314.00000000, -1, -1); //Leviathan
    AddStaticVehicle(487, 1613.09997559, -1054.90002441, 24.20000076, 0.00000000, -1, -1); //Maverick
    AddStaticVehicle(487, 1624.09997559, -1054.69995117, 24.20000076, 0.00000000, -1, -1); //Maverick
    AddStaticVehicle(551, 2039.80004883, 994.90002441, 10.50000000, 0.00000000, -1, -1); //Merit
    AddStaticVehicle(551, 2026.80004883, 1042.40002441, 10.69999981, 267.99499512, -1, -1); //Merit
    AddStaticVehicle(551, 2132.60009766, 1022.29998779, 10.69999981, 267.99499512, -1, -1); //Merit
    AddStaticVehicle(567, 2141.69995117, 1016.09997559, 10.80000019, 92.00000000, -1, -1); //Savanna
    AddStaticVehicle(400, 2075.10009766, 1003.40002441, 10.80000019, 0.00000000, -1, -1); //Landstalker
    AddStaticVehicle(409, 2039.69995117, 1010.79998779, 10.60000038, 0.00000000, -1, -1); //Stretch
    AddStaticVehicle(409, 2039.59997559, 1021.20001221, 10.60000038, 0.00000000, -1, -1); //Stretch
    AddStaticVehicle(598, 2256.30004883, 2458.10009766, 10.69999981, 178.00000000, -1, -1); //Police Car (LVPD)
    AddStaticVehicle(598, 2256.10009766, 2444.10009766, 10.69999981, 0.00000000, -1, -1); //Police Car (LVPD)
    AddStaticVehicle(598, 2260.19995117, 2444.00000000, 10.69999981, 0.00000000, -1, -1); //Police Car (LVPD)
    AddStaticVehicle(477, 2273.30004883, 2476.39990234, 10.60000038, 0.00000000, -1, 1); //ZR-350
    AddStaticVehicle(477, 2277.50000000, 2476.60009766, 10.60000038, 0.00000000, -1, 1); //ZR-350
    AddStaticVehicle(477, 2269.19995117, 2476.19995117, 10.60000038, 0.00000000, -1, 1); //ZR-350
    AddStaticVehicle(477, 2102.89990234, 2066.39990234, 10.60000038, 90.00000000, -1, -1); //ZR-350
    AddStaticVehicle(451, 2089.69995117, 2056.89990234, 10.60000038, 0.00000000, -1, -1); //Turismo
    AddStaticVehicle(506, 2089.60009766, 2067.50000000, 10.60000038, 0.00000000, -1, -1); //Super GT
    AddStaticVehicle(601, 2241.19995117, 2435.30004883, 10.80000019, 0.00000000, -1, -1); //S.W.A.T. Van
    AddStaticVehicle(596, 1535.69995117, -1676.90002441, 13.19999981, 0.00000000, -1, -1); //Police Car (LSPD)
    AddStaticVehicle(596, 1535.59997559, -1667.90002441, 13.19999981, 0.00000000, -1, -1); //Police Car (LSPD)
    AddStaticVehicle(528, 1515.00000000, -1661.19995117, 13.69999981, 270.00000000, -1, -1); //FBI Truck
    AddStaticVehicle(490, 1524.90002441, -1651.69995117, 13.69999981, 180.00000000, -1, -1); //FBI Rancher
    AddStaticVehicle(427, 1538.09997559, -1697.30004883, 13.80000019, 90.00000000, -1, -1); //Enforcer
    AddStaticVehicle(427, 1538.00000000, -1693.19995117, 13.80000019, 90.00000000, 3, 6); //Enforcer
    AddStaticVehicle(427, 1538.09997559, -1688.50000000, 13.80000019, 90.00000000, 3, 6); //Enforcer
    AddStaticVehicle(433, 1554.19995117, -1609.40002441, 14.00000000, 0.00000000, -1, -1); //Barracks
    AddStaticVehicle(433, 1560.50000000, -1609.50000000, 14.00000000, 0.00000000, -1, -1); //Barracks
    AddStaticVehicle(490, 1567.00000000, -1610.09997559, 13.69999981, 0.00000000, -1, -1); //FBI Rancher
    AddStaticVehicle(601, 1567.19995117, -1632.90002441, 13.50000000, 88.00000000, -1, -1); //S.W.A.T. Van
    AddStaticVehicle(601, 1556.59997559, -1632.40002441, 13.30000019, 87.99499512, -1, -1); //S.W.A.T. Van
    AddStaticVehicle(537, 1734.80004883, -1954.00000000, 15.10000038, 90.00000000, -1, -1); //Freight
    AddStaticVehicle(537, 2289.00000000, -1223.19995117, 25.60000038, 0.00000000, -1, -1); //Freight
    AddStaticVehicle(538, 1459.69995117, 2632.39990234, 12.30000019, 90.00000000, -1, -1); //Streak
    AddStaticVehicle(538, 1444.40002441, 2636.30004883, 12.30000019, 90.00000000, -1, -1); //Streak
    AddStaticVehicle(538, -1947.09997559, 163.30000305, 27.20000076, 358.00000000, -1, -1); //Streak
    AddStaticVehicle(449, -2006.40002441, 150.10000610, 29.00000000, 0.00000000, -1, -1); //Tram
    AddStaticVehicle(449, -1763.80004883, 1344.40002441, 8.50000000, 56.00000000, -1, -1); //Tram
    AddStaticVehicle(411, -1658.40002441, 1206.80004883, 21.00000000, 332.00000000, -1, -1); //Infernus
    AddStaticVehicle(451, -1663.69995117, 1221.59997559, 20.89999962, 230.00000000, -1, -1); //Turismo
    AddStaticVehicle(541, -1657.00000000, 1211.19995117, 13.39999962, 270.00000000, -1, -1); //Bullet
    AddStaticVehicle(562, -1664.50000000, 1221.40002441, 13.39999962, 266.00000000, -1, -1); //Elegy
    AddStaticVehicle(603, -1660.00000000, 1214.09997559, 7.30000019, 268.00000000, -1, -1); //Phoenix
    AddStaticVehicle(477, -1593.30004883, 652.00000000, 7.00000000, 0.00000000, -1, -1); //ZR-350
    AddStaticVehicle(541, -1605.30004883, 651.50000000, 6.90000010, 0.00000000, -1, -1); //Bullet
    AddStaticVehicle(597, -1616.59997559, 651.90002441, 7.09999990, 0.00000000, -1, -1); //Police Car (SFPD)
    AddStaticVehicle(597, -1610.59997559, 652.09997559, 7.09999990, 0.00000000, -1, -1); //Police Car (SFPD)
    AddStaticVehicle(597, -1622.40002441, 652.00000000, 7.09999990, 0.00000000, -1, -1); //Police Car (SFPD)
    AddStaticVehicle(597, -1628.50000000, 651.90002441, 7.09999990, 0.00000000, -1, -1); //Police Car (SFPD)
    AddStaticVehicle(597, -1634.09997559, 652.00000000, 7.09999990, 0.00000000, -1, -1); //Police Car (SFPD)
    AddStaticVehicle(477, -1612.09997559, 673.70001221, 7.00000000, 180.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, -1600.09997559, 672.90002441, 7.00000000, 180.00000000, -1, -1); //ZR-350
    AddStaticVehicle(528, -1593.50000000, 672.79998779, 7.40000010, 0.00000000, -1, -1); //FBI Truck
    AddStaticVehicle(528, -1588.50000000, 672.90002441, 7.40000010, 0.00000000, -1, -1); //FBI Truck
    AddStaticVehicle(528, -1583.00000000, 673.09997559, 7.40000010, 0.00000000, -1, -1); //FBI Truck
    AddStaticVehicle(597, -1574.19995117, 727.00000000, -5.40000010, 90.00000000, -1, -1); //Police Car (SFPD)
    AddStaticVehicle(497, -1680.59997559, 704.70001221, 30.89999962, 94.00000000, -1, -1); //Police Maverick
    AddStaticVehicle(585, -1929.09997559, 585.29998779, 34.79999924, 0.00000000, -1, -1); //Emperor
    AddStaticVehicle(547, -1941.50000000, 585.50000000, 35.00000000, 180.00000000, -1, -1); //Primo
    AddStaticVehicle(438, -1987.80004883, 132.00000000, 27.70000076, 0.00000000, 6, 6); //Cabbie
    AddStaticVehicle(438, -1987.80004883, 113.09999847, 27.70000076, 0.00000000, -1, -1); //Cabbie
    AddStaticVehicle(551, -1995.09997559, 150.10000610, 27.39999962, 0.00000000, 6, 6); //Merit
    AddStaticVehicle(561, -1992.59997559, 243.19999695, 35.09999847, 308.00000000, -1, -1); //Stratum
    AddStaticVehicle(561, -1992.30004883, 248.19999695, 35.09999847, 307.99621582, -1, -1); //Stratum
    AddStaticVehicle(500, -1992.59997559, 257.60000610, 35.40000153, 354.00000000, -1, -1); //Mesa
    AddStaticVehicle(500, -1992.00000000, 265.29998779, 35.40000153, 356.00000000, -1, -1); //Mesa
    AddStaticVehicle(562, -1949.00000000, 260.00000000, 40.79999924, 68.00000000, -1, -1); //Elegy
    AddStaticVehicle(565, -1950.19995117, 268.79998779, 40.70000076, 110.00000000, -1, -1); //Flash
    AddStaticVehicle(477, -1948.69995117, 259.79998779, 35.20000076, 60.00000000, -1, -1); //ZR-350
    AddStaticVehicle(429, -1948.09997559, 271.39999390, 35.29999924, 118.00000000, -1, -1); //Banshee
    AddStaticVehicle(451, -1946.90002441, 265.70001221, 35.20000076, 90.00000000, -1, -1); //Turismo
    AddStaticVehicle(551, -1988.40002441, 303.29998779, 35.00000000, 270.00000000, 1, 3); //Merit
    AddStaticVehicle(402, -1955.59997559, 297.50000000, 35.40000153, 116.00000000, -1, -1); //Buffalo
    AddStaticVehicle(568, -2035.00000000, 178.60000610, 28.79999924, 272.00000000, -1, -1); //Bandito
    AddStaticVehicle(568, -2089.80004883, -83.40000153, 35.09999847, 179.99945068, -1, -1); //Bandito
    AddStaticVehicle(589, -2085.10009766, -83.59999847, 34.90000153, 0.00000000, -1, -1); //Club
    AddStaticVehicle(458, -2077.00000000, -83.40000153, 35.09999847, 0.00000000, -1, -1); //Solair
    AddStaticVehicle(412, -2064.10009766, -84.40000153, 35.09999847, 0.00000000, -1, -1); //Voodoo
    AddStaticVehicle(545, 1826.90002441, -1680.50000000, 13.50000000, 0.00000000, -1, -1); //Hustler
    AddStaticVehicle(603, 1826.50000000, -1690.50000000, 13.39999962, 0.00000000, -1, -1); //Phoenix
    AddStaticVehicle(506, 1811.00000000, -1680.69995117, 13.30000019, 268.00000000, -1, -1); //Super GT
    AddStaticVehicle(411, 1810.80004883, -1676.30004883, 13.30000019, 268.00000000, -1, -1); //Infernus
    AddStaticVehicle(477, 286.60000610, -1155.80004883, 80.69999695, 224.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, 282.60000610, -1159.80004883, 80.69999695, 224.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, 298.70001221, -1185.90002441, 80.69999695, 0.00000000, -1, -1); //ZR-350
    AddStaticVehicle(451, 295.39999390, -1182.30004883, 80.69999695, 0.00000000, -1, -1); //Turismo
    AddStaticVehicle(562, 292.39999390, -1179.09997559, 80.69999695, 0.00000000, -1, -1); //Elegy
    AddStaticVehicle(560, 289.50000000, -1176.30004883, 80.69999695, 0.00000000, -1, -1); //Sultan
    AddStaticVehicle(579, 280.79998779, -1264.69995117, 74.00000000, 304.00000000, -1, -1); //Huntley
    AddStaticVehicle(579, 293.79998779, -1148.80004883, 81.00000000, 221.99719238, -1, -1); //Huntley
    AddStaticVehicle(579, 346.10000610, -1196.50000000, 76.59999847, 221.99523926, -1, -1); //Huntley
    AddStaticVehicle(561, 404.39999390, -1155.30004883, 77.50000000, 334.00000000, -1, -1); //Stratum
    AddStaticVehicle(500, 568.20001221, -1132.80004883, 50.90000153, 0.00000000, -1, -1); //Mesa
    AddStaticVehicle(579, 405.89999390, -1263.59997559, 50.59999847, 26.00000000, -1, -1); //Huntley
    AddStaticVehicle(568, 422.20001221, -1261.09997559, 51.59999847, 24.00000000, -1, -1); //Bandito
    AddStaticVehicle(424, 763.29998779, -1033.09997559, 23.79999924, 0.00000000, -1, -1); //BF Injection
    AddStaticVehicle(536, 795.29998779, -843.00000000, 60.50000000, 0.00000000, -1, -1); //Blade
    AddStaticVehicle(562, 833.20001221, -885.59997559, 68.59999847, 78.00000000, -1, -1); //Elegy
    AddStaticVehicle(506, 830.90002441, -854.50000000, 69.69999695, 18.00000000, -1, -1); //Super GT
    AddStaticVehicle(555, 860.70001221, -850.00000000, 77.00000000, 22.00000000, -1, -1); //Windsor
    AddStaticVehicle(562, 872.79998779, -873.00000000, 77.30000305, 216.00000000, -1, -1); //Elegy
    AddStaticVehicle(587, 1243.19995117, -805.59997559, 84.00000000, 0.00000000, -1, -1); //Euros
    AddStaticVehicle(477, 1248.69995117, -805.79998779, 83.90000153, 0.00000000, -1, -1); //ZR-350
    AddStaticVehicle(545, 1254.50000000, -805.90002441, 84.09999847, 0.00000000, -1, -1); //Hustler
    AddStaticVehicle(521, 1238.19995117, -747.70001221, 94.80000305, 10.00000000, -1, -1); //FCR-900
    AddStaticVehicle(521, 1238.90002441, -751.00000000, 94.19999695, 9.99755859, -1, -1); //FCR-900
    AddStaticVehicle(521, 1449.40002441, -926.50000000, 37.09999847, 9.99755859, -1, -1); //FCR-900
    AddStaticVehicle(561, 1452.59997559, -926.59997559, 37.50000000, 0.00000000, -1, -1); //Stratum
    AddStaticVehicle(458, 1422.50000000, -922.09997559, 36.00000000, 0.00000000, -1, -1); //Solair
    AddStaticVehicle(479, 1309.50000000, -862.40002441, 39.50000000, 268.00000000, -1, -1); //Regina
    AddStaticVehicle(487, 1291.40002441, -789.20001221, 96.69999695, 0.00000000, -1, -1); //Maverick
    AddStaticVehicle(562, 1308.80004883, -868.00000000, 39.29999924, 274.00000000, -1, -1); //Elegy
    AddStaticVehicle(451, 1309.19995117, -856.50000000, 39.29999924, 268.00000000, -1, -1); //Turismo
    AddStaticVehicle(480, 1088.00000000, -640.29998779, 113.00000000, 294.00000000, -1, -1); //Comet
    //=====================================================Конец автомобилей=========================================================================
    //Респавны
    //3d тексты на респавнах
    //Create3DTextLabel("Добро пожаловать к нам на сервер!\nСвязь с нами:\nСкайп: live:skype_1983\nГл. Админ LOD",0x00FFFFAA,-1958.9290,489.5305,31.9688,50.0,0,1);
    //Create3DTextLabel("Добро пожаловать к нам на сервер!\nСвязь с нами:\nСкайп: live:skype_1983\nГл. Админ LOD",0x00FFFFAA,2528.6631,-1468.9531,23.9502,50.0,0,1);
    //Create3DTextLabel("Добро пожаловать к нам на сервер!\nСвязь с нами:\nСкайп: live:skype_1983\nГл. Админ LOD",0x00FFFFAA,2185.8113,-2270.0659,13.5049,50.0,0,1);
    Create3DTextLabel("База клана LSNews", 0x00FFFFAA, 1163.4313, -1743.5536, 19.6676, 50.0, 0, 1);
    Create3DTextLabel("База клана Grassy_Fox", 0x00FFFFAA, 2438.84, -1659.16, 16.73, 50.0, 0, 1);
    Create3DTextLabel("Heroes Roads", 0x00FFFFAA, -1038.62, -587.90, 34.61, 50.0, 0, 1);
    Create3DTextLabel("Street Racing Club", 0x00FFFFAA, 1066.5708, 1358.9037, 14.0711, 50.0, 0, 1);
    //sharik
    CreateObject(90, 1478.47, -1638.80, 14.60, 90.00, 0.00, 180.00);
    CreateObject(138, 1478.42, -1638.13, 14.66, 91.00, 11.00, 0.00);
    CreateObject(139, 1478.00, -1638.57, 14.67, 93.00, 0.00, 80.65);
    CreateObject(140, 1478.77, -1638.39, 14.67, 90.00, 0.00, 270.00);
    CreateObject(192, 1478.47, -1652.57, 14.08, 86.00, 193.00, 0.00);
    CreateObject(116, 1478.44, -1638.44, 14.68, 90.00, 0.00, 0.00);

    //Авто на респах
    AddStaticVehicle(562, 2510.10009766, -1470.09997559, 23.70000076, 308.00000000, 6, 6); //Elegy
    AddStaticVehicle(451, 2515.89990234, -1471.69995117, 23.79999924, 0.00000000, -1, -1); //Turismo
    AddStaticVehicle(562, 2509.39990234, -1466.40002441, 23.70000076, 307.99621582, 6, 6); //Elegy
    AddStaticVehicle(562, 2160.80004883, -2281.10009766, 13.10000038, 228.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2185.39990234, -2294.19995117, 13.30000019, 45.99914551, -1, -1); //Elegy
    AddStaticVehicle(603, 2188.89990234, -2279.80004883, 13.50000000, 316.00000000, -1, -1); //Phoenix
    AddStaticVehicle(527, 2175.30004883, -2265.89990234, 13.19999981, 223.99981689, -1, -1); //Cadrona
    AddStaticVehicle(545, 2172.80004883, -2268.89990234, 13.30000019, 226.00000000, -1, -1); //Hustler
    AddStaticVehicle(477, 2168.19995117, -2274.89990234, 13.19999981, 226.00000000, -1, -1); //ZR-350
    AddStaticVehicle(541, 2193.19995117, -2246.30004883, 13.19999981, 224.00000000, -1, -1); //Bullet
    AddStaticVehicle(560, 2195.39990234, -2238.80004883, 13.39999962, 314.00000000, -1, -1); //Sultan
    AddStaticVehicle(560, 2199.39990234, -2242.80004883, 13.39999962, 313.99475098, -1, -1); //Sultan
    AddStaticVehicle(451, 2170.60009766, -2312.80004883, 13.30000019, 44.00000000, -1, -1); //Turismo
    AddStaticVehicle(403, 2222.80004883, -2210.30004883, 14.19999981, 226.00000000, -1, -1); //Linerunner
    AddStaticVehicle(562, 2200.00000000, -2275.89990234, 13.30000019, 45.99914551, -1, -1); //Elegy
    AddStaticVehicle(429, -2179.00000000, 713.59997559, 53.59999847, 0.00000000, -1, -1); //Banshee
    AddStaticVehicle(541, -2184.50000000, 713.00000000, 53.59999847, 0.00000000, -1, -1); //Bullet
    AddStaticVehicle(562, -2185.10009766, 696.59997559, 53.59999847, 272.00000000, -1, -1); //Elegy
    AddStaticVehicle(410, -2174.89990234, 635.29998779, 49.20000076, 52.00000000, -1, -1); //Manana
    AddStaticVehicle(526, -2206.80004883, 718.09997559, 49.29999924, 0.00000000, -1, -1); //Fortune
    AddStaticVehicle(445, 2153.39990234, 2486.80004883, 10.80000019, 270.00000000, -1, -1); //Admiral
    AddStaticVehicle(517, 2153.39990234, 2494.39990234, 10.80000019, 90.00000000, -1, -1); //Majestic
    AddStaticVehicle(439, 2080.10009766, 2469.10009766, 10.80000019, 0.00000000, -1, -1); //Stallion
    AddStaticVehicle(436, 2073.80004883, 2479.89990234, 10.69999981, 180.00000000, -1, -1); //Previon
    AddStaticVehicle(587, 2082.19995117, 2479.89990234, 10.60000038, 0.00000000, -1, -1); //Euros
    AddStaticVehicle(477, 2122.39990234, 2469.00000000, 10.60000038, 0.00000000, -1, -1); //ZR-350
    AddStaticVehicle(429, 2130.89990234, 2468.89990234, 10.60000038, 180.00000000, -1, -1); //Banshee
    AddStaticVehicle(402, 2143.30004883, 2468.89990234, 10.80000019, 0.00000000, -1, -1); //Buffalo
    AddStaticVehicle(562, 2181.80004883, 2515.30004883, 10.50000000, 50.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2177.89990234, 2515.10009766, 10.50000000, 49.99877930, -1, -1); //Elegy
    AddStaticVehicle(562, 2174.39990234, 2514.80004883, 10.50000000, 49.99877930, -1, -1); //Elegy
    AddStaticVehicle(562, 2170.39990234, 2514.89990234, 10.50000000, 49.99877930, -1, -1); //Elegy
    AddStaticVehicle(562, 2166.50000000, 2514.80004883, 10.50000000, 49.99877930, -1, -1); //Elegy
    AddStaticVehicle(560, 2042.69995117, 2468.50000000, 10.60000038, 180.00000000, -1, -1); //Sultan
    AddStaticVehicle(560, 2163.10009766, 2469.80004883, 10.60000038, 0.00000000, -1, -1); //Sultan
    AddStaticVehicle(559, 2194.19995117, 2472.19995117, 10.60000038, 180.00000000, -1, -1); //Jester
    AddStaticVehicle(451, 2202.10009766, 2475.00000000, 10.60000038, 178.00000000, -1, -1); //Turismo
    AddStaticVehicle(555, 2188.89990234, 2502.50000000, 10.60000038, 0.00000000, -1, -1); //Windsor
    AddStaticVehicle(429, 2192.10009766, 2502.60009766, 10.60000038, 0.00000000, -1, -1); //Banshee
    AddStaticVehicle(415, 2195.30004883, 2502.69995117, 10.69999981, 0.00000000, -1, -1); //Cheetah
    AddStaticVehicle(506, 2201.00000000, 2529.10009766, 10.60000038, 180.00000000, -1, -1); //Super GT
    //Квартиры в LS

    //3d Тексты
    Create3DTextLabel("==ВХОД==", 0xFF0000AA, 326.5465, -1514.2834, 36.0325, 50.0, 0, 1);
    Create3DTextLabel("==ВЫХОД==", 0xFF0000AA, 350.0683, -1506.3142, 265.8616, 50.0, 0, 1);
    //Объекты
    AddStaticVehicleEx(560, 306.20800781, -1482.28503418, 24.44000053, 54.00000000, -1, -1, 15); //Sultan
    AddStaticVehicleEx(560, 303.84500122, -1486.18005371, 24.44000053, 55.99731445, -1, -1, 15); //Sultan
    AddStaticVehicleEx(560, 300.67999268, -1490.40295410, 24.44000053, 57.99731445, -1, -1, 15); //Sultan

    //Квартиры админов (Объекты)
    CreateDynamicObject(1505, 325.39599609, -1514.39001465, 35.00299835, 0.00000000, 0.00000000, 52.00000000); //object(gen_doorext07)(1)
    CreateDynamicObject(1364, 340.13299561, -1519.33398438, 32.99100113, 0.00000000, 0.00000000, 54.00000000); //object(cj_bush_prop)(1)
    CreateDynamicObject(1364, 334.73001099, -1526.87902832, 32.99399948, 0.00000000, 0.00000000, 53.99780273); //object(cj_bush_prop)(2)
    CreateDynamicObject(14771, 328.17599487, -1502.92102051, 266.88500977, 0.00000000, 0.00000000, 0.00000000); //object(int3int_brothel)(1)
    CreateDynamicObject(1502, 335.26898193, -1502.22399902, 264.87298584, 0.00000000, 0.00000000, 0.00000000); //object(gen_doorint04)(1)
    //Шарик
    CreateVehicle(411, 875.5090, -2735.5605, 12.6055, 180.0000, -1, -1, 100); //машина у дома
    CreateVehicle(411, 880.8924, -2735.6992, 12.6055, 180.0000, -1, -1, 100); //машина у дома


    //Сами пикапы с телепортами
    //Входной пикап
    teleport = CreatePickup(1318, 23, 326.5465, -1514.2834, 36.0325, 0);
    //Выход через пикап
    teleport2 = CreatePickup(1318, 23, 350.0683, -1506.3142, 265.8616, 0);
    teleport3 = CreatePickup(19198, 23, 280.5131, -1867.8292, 9.1464, 0);
    teleport4 = CreatePickup(19198, 23, 276.8664, -1867.6174, 9.0619, 0);
    teleport5 = CreatePickup(19198, 23, -2623.8250, 1412.7120, 6.0951, 0);
    teleport6 = CreatePickup(19198, 23, -2637.46, 1402.24, 906.46, 0);
    //Драг 3
    CreateDynamicObject(16092, -1128.64599609, 1099.66894531, 37.20600128, 0.00000000, 0.00000000, 46.00000000); //object(des_pipestrut05) (1)
    CreateDynamicObject(16092, -1140.47497559, 1110.98706055, 37.20399857, 0.00000000, 0.00000000, 45.99975586); //object(des_pipestrut05) (2)
    CreateDynamicObject(16092, -1657.93701172, 542.82202148, 37.24200058, 0.00000000, 0.00000000, 45.99975586); //object(des_pipestrut05) (3)
    CreateDynamicObject(16092, -1669.26403809, 553.67297363, 37.24599838, 0.00000000, 0.00000000, 45.99975586); //object(des_pipestrut05) (4)
    CreateDynamicObject(1263, -1664.99597168, 548.50897217, 41.49700165, 0.00000000, 0.00000000, 48.00000000); //object(mtraffic3) (1)
    CreateDynamicObject(1263, -1663.31604004, 546.97399902, 41.57099915, 0.00000000, 0.00000000, 44.00000000); //object(mtraffic3) (2)
    CreateDynamicObject(1263, -1653.63000488, 537.61999512, 41.53900146, 0.00000000, 0.00000000, 48.00000000); //object(mtraffic3) (3)
    CreateDynamicObject(1263, -1674.64697266, 557.82800293, 41.79399872, 0.00000000, 0.00000000, 50.00000000); //object(mtraffic3) (4)
    CreateDynamicObject(1263, -1135.17102051, 1106.90795898, 42.14300156, 0.00000000, 0.00000000, 228.00000000); //object(mtraffic3) (5)
    CreateDynamicObject(1263, -1133.03894043, 1104.95397949, 42.13100052, 0.00000000, 0.00000000, 224.00000000); //object(mtraffic3) (6)
    CreateDynamicObject(1263, -1123.18603516, 1095.43896484, 42.16899872, 0.00000000, 0.00000000, 220.00000000); //object(mtraffic3) (7)
    CreateDynamicObject(1263, -1144.84594727, 1116.25000000, 41.66299820, 0.00000000, 0.00000000, 228.00000000); //object(mtraffic3) (8)
    CreateDynamicObject(3463, -1152.23400879, 1087.03601074, 38.73600006, 0.00000000, 0.00000000, 316.00000000); //object(vegaslampost2) (1)
    CreateDynamicObject(3463, -1139.08300781, 1100.85302734, 37.89699936, 0.00000000, 0.00000000, 315.99975586); //object(vegaslampost2) (2)
    CreateDynamicObject(3463, -1219.69299316, 1015.89202881, 42.24300003, 0.00000000, 0.00000000, 315.99975586); //object(vegaslampost2) (3)
    CreateDynamicObject(3463, -1247.41003418, 986.90802002, 43.48699951, 0.00000000, 0.00000000, 315.99975586); //object(vegaslampost2) (4)
    CreateDynamicObject(3463, -1299.94104004, 931.60302734, 45.23099899, 0.00000000, 0.00000000, 315.99975586); //object(vegaslampost2) (5)
    CreateDynamicObject(3463, -1362.08496094, 865.69299316, 46.42900085, 0.00000000, 0.00000000, 315.99975586); //object(vegaslampost2) (6)
    CreateDynamicObject(3463, -1433.83105469, 790.16302490, 46.45500183, 0.00000000, 0.00000000, 315.99975586); //object(vegaslampost2) (7)
    CreateDynamicObject(3463, -1561.75305176, 655.60699463, 42.99000168, 0.00000000, 0.00000000, 315.99975586); //object(vegaslampost2) (8)

    //Пляж LS
    AddStaticVehicle(521, 341.36199951, -1873.28601074, 2.48200011, 180.00000000, -1, -1); //FCR-900
    AddStaticVehicle(521, 356.76400757, -1810.03100586, 4.17199993, 0.00000000, -1, -1); //FCR-900
    AddStaticVehicle(579, 328.11035156, -1789.03515625, 4.92700005, 182.00000000, -1, -1); //Huntley
    AddStaticVehicle(493, 344.23098755, -1912.72802734, 0.00000000, 179.99493408, -1, -1); //Jetmax
    AddStaticVehicle(484, 322.88000488, -1941.89904785, 0.00000000, 178.00000000, -1, -1); //Marquis
    AddStaticVehicle(484, 323.10000610, -1918.03796387, 0.00000000, 180.00000000, -1, -1); //Marquis
    AddStaticVehicle(493, 343.76199341, -1929.69201660, 0.00000000, 177.99499512, -1, -1); //Jetmax
    AddStaticVehicle(493, 344.02700806, -1948.96997070, 0.00000000, 177.99499512, -1, -1); //Jetmax
    AddStaticVehicle(579, 317.74301147, -1809.72900391, 4.55900002, 0.00000000, -1, -1); //Huntley
    AddStaticVehicle(579, 340.66900635, -1809.30603027, 4.60699987, 0.00000000, -1, -1); //Huntley
    CreateDynamicObject(10830, 333.85351562, -1925.48730469, 5.27400017, 0.00000000, 0.00000000, 41.99523926); //object(drydock2_sfse) (1)
    CreateDynamicObject(6417, 335.71777344, -1945.96191406, -16.39000130, 0.00000000, 0.00000000, 0.00000000); //object(lawborder2c_law2) (1)
    CreateDynamicObject(984, 308.90701294, -1792.21594238, 4.15100002, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit2) (1)
    CreateDynamicObject(984, 308.82199097, -1805.00305176, 4.09299994, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit2) (2)
    CreateDynamicObject(984, 315.78100586, -1812.52795410, 4.04199982, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (3)
    CreateDynamicObject(984, 323.80200195, -1812.52502441, 4.04600000, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (4)
    CreateDynamicObject(984, 343.73199463, -1812.22595215, 4.07100010, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (5)
    CreateDynamicObject(984, 356.52999878, -1812.25598145, 4.08300018, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (6)
    CreateDynamicObject(707, 311.36599731, -1812.72094727, 2.39800000, 0.00000000, 0.00000000, 354.57824707); //object(sm_bushvbig) (1)
    CreateDynamicObject(707, 310.80801392, -1785.73596191, 2.57399988, 0.00000000, 0.00000000, 354.57824707); //object(sm_bushvbig) (2)
    CreateDynamicObject(6295, 333.87597656, -1991.40332031, 23.80299950, 0.00000000, 0.00000000, 0.00000000); //object(sanpedlithus_law2) (1)
    CreateDynamicObject(669, 351.26599121, -1708.96594238, 5.85900021, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (1)
    CreateDynamicObject(669, 338.12100220, -1708.08996582, 5.75600004, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (2)
    CreateDynamicObject(669, 326.24899292, -1707.16796875, 5.65600014, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (3)
    CreateDynamicObject(669, 314.93301392, -1705.03796387, 5.83400011, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (4)
    CreateDynamicObject(669, 303.00698853, -1702.58801270, 6.03599977, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (5)
    CreateDynamicObject(669, 291.76400757, -1700.08398438, 6.29699993, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (6)
    CreateDynamicObject(669, 282.31799316, -1696.66296387, 6.71199989, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (7)
    CreateDynamicObject(669, 273.09899902, -1693.51599121, 7.09700012, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (8)
    CreateDynamicObject(669, 263.88699341, -1688.98498535, 7.65899992, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (9)
    CreateDynamicObject(669, 256.20300293, -1684.74804688, 8.20499992, 0.00000000, 0.00000000, 199.99511719); //object(sm_veg_tree4) (10)
    CreateDynamicObject(1232, 330.21798706, -1812.54003906, 6.04899979, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (1)
    CreateDynamicObject(1232, 337.29400635, -1812.23400879, 6.06400013, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (2)
    CreateDynamicObject(1257, 357.35598755, -1765.90295410, 5.69099998, 0.00000000, 0.00000000, 90.00000000); //object(bustopm) (1)
    CreateDynamicObject(1232, 326.69299316, -1901.85498047, 2.70799994, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (3)
    CreateDynamicObject(1232, 341.21798706, -1902.40295410, 2.70799994, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (4)


    //Драг 4
    AddStaticVehicle(562, 400.93899536, 2527.28002930, 16.24600029, 180.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 403.82598877, 2527.27099609, 16.24600029, 180.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 422.38198853, 2436.53906250, 16.22100067, 42.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 418.56298828, 2436.28808594, 16.22100067, 41.99523926, -1, -1); //Elegy
    AddStaticVehicle(562, 414.90798950, 2436.02392578, 16.22100067, 41.99523926, -1, -1); //Elegy
    AddStaticVehicle(560, 429.92599487, 2480.45288086, 16.33099937, 0.00000000, -1, -1); //Sultan
    AddStaticVehicle(560, 426.63101196, 2480.39404297, 16.33099937, 0.00000000, -1, -1); //Sultan
    AddStaticVehicle(560, 423.44601440, 2480.31811523, 16.33099937, 0.00000000, -1, -1); //Sultan
    AddStaticVehicle(560, 420.19601440, 2480.21997070, 16.33099937, 0.00000000, -1, -1); //Sultan
    CreateDynamicObject(10830, -52.41699982, 2502.26806641, 23.69099998, 0.00000000, 0.00000000, 314.50000000); //object(drydock2_sfse) (1)
    CreateDynamicObject(10830, -5.46199989, 2501.85107422, 23.69099998, 0.00000000, 0.00000000, 314.59460449); //object(drydock2_sfse) (11)
    CreateDynamicObject(10830, 42.17800140, 2501.45898438, 23.69099998, 0.00000000, 0.00000000, 314.59350586); //object(drydock2_sfse) (12)
    CreateDynamicObject(10830, 90.13099670, 2501.25390625, 23.69099998, 0.00000000, 0.00000000, 314.69354248); //object(drydock2_sfse) (13)
    CreateDynamicObject(10830, 137.96299744, 2500.99291992, 23.69099998, 0.00000000, 0.00000000, 314.69238281); //object(drydock2_sfse) (14)
    CreateDynamicObject(10830, 185.66200256, 2500.80004883, 23.69099998, 0.00000000, 0.00000000, 314.69238281); //object(drydock2_sfse) (15)
    CreateDynamicObject(10830, 233.20799255, 2500.64892578, 23.69099998, 0.00000000, 0.00000000, 314.69238281); //object(drydock2_sfse) (20)
    CreateDynamicObject(10830, 280.84698486, 2500.31396484, 23.69099998, 0.00000000, 0.00000000, 314.69238281); //object(drydock2_sfse) (21)
    CreateDynamicObject(10830, 327.90499878, 2500.08007812, 23.69099998, 0.00000000, 0.00000000, 314.69238281); //object(drydock2_sfse) (22)
    CreateDynamicObject(10830, 375.08999634, 2499.87402344, 23.69099998, 0.00000000, 0.00000000, 314.69238281); //object(drydock2_sfse) (23)
    CreateDynamicObject(16092, -75.17099762, 2486.09008789, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(des_pipestrut05) (1)
    CreateDynamicObject(16092, -75.25900269, 2502.64990234, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(des_pipestrut05) (2)
    CreateDynamicObject(16092, -75.26399994, 2519.14794922, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(des_pipestrut05) (3)
    CreateDynamicObject(16092, 398.23300171, 2516.68798828, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(des_pipestrut05) (4)
    CreateDynamicObject(16092, 398.19100952, 2500.29492188, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(des_pipestrut05) (5)
    CreateDynamicObject(16092, 398.29199219, 2484.27197266, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(des_pipestrut05) (7)
    CreateDynamicObject(705, 398.17401123, 2508.72607422, 15.48400021, 0.00000000, 0.00000000, 119.99813843); //object(sm_veg_tree7vbig) (1)
    CreateDynamicObject(705, 399.55599976, 2492.31689453, 15.48400021, 0.00000000, 0.00000000, 119.99813843); //object(sm_veg_tree7vbig) (2)
    CreateDynamicObject(705, -75.08300018, 2494.62011719, 15.48400021, 0.00000000, 0.00000000, 119.99813843); //object(sm_veg_tree7vbig) (3)
    CreateDynamicObject(705, -75.29900360, 2510.83300781, 15.48400021, 0.00000000, 0.00000000, 119.99813843); //object(sm_veg_tree7vbig) (4)
    CreateDynamicObject(1237, -76.21399689, 2478.40795898, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (1)
    CreateDynamicObject(1237, -76.00599670, 2526.62109375, 15.53800011, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (2)
    CreateDynamicObject(1237, 398.99398804, 2523.96289062, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (3)
    CreateDynamicObject(1237, 399.03399658, 2476.88696289, 15.51299953, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (4)
    CreateDynamicObject(994, 399.04400635, 2524.45605469, 15.48400021, 0.00000000, 0.00000000, 88.00000000); //object(lhouse_barrier2) (1)
    CreateDynamicObject(994, 399.55099487, 2530.67602539, 15.45599937, 0.00000000, 0.00000000, 357.99499512); //object(lhouse_barrier2) (2)
    CreateDynamicObject(1237, 399.38198853, 2530.67089844, 15.55000019, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (5)
    CreateDynamicObject(1237, 406.04199219, 2530.44091797, 15.57699966, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (6)
    CreateDynamicObject(994, 431.68099976, 2476.54809570, 15.51599979, 0.00000000, 0.00000000, 87.99499512); //object(lhouse_barrier2) (3)
    CreateDynamicObject(994, 431.92999268, 2483.31689453, 15.48400021, 0.00000000, 0.00000000, 87.99499512); //object(lhouse_barrier2) (4)
    CreateDynamicObject(994, 432.11401367, 2490.10791016, 15.49199963, 0.00000000, 0.00000000, 87.99499512); //object(lhouse_barrier2) (5)
    CreateDynamicObject(994, 432.27999878, 2496.82788086, 15.49199963, 0.00000000, 0.00000000, 87.99499512); //object(lhouse_barrier2) (6)
    CreateDynamicObject(994, 432.50201416, 2503.45605469, 15.49199963, 0.00000000, 0.00000000, 87.99499512); //object(lhouse_barrier2) (7)
    CreateDynamicObject(994, 432.68301392, 2510.13305664, 15.48400021, 0.00000000, 0.00000000, 87.99499512); //object(lhouse_barrier2) (8)
    CreateDynamicObject(994, 432.92300415, 2516.84106445, 15.48400021, 0.00000000, 0.00000000, 87.99499512); //object(lhouse_barrier2) (9)
    CreateDynamicObject(994, 432.79501343, 2523.39697266, 15.56700039, 0.00000000, 0.00000000, 147.99499512); //object(lhouse_barrier2) (10)
    CreateDynamicObject(994, 427.14999390, 2526.83105469, 15.57400036, 0.00000000, 0.00000000, 179.99133301); //object(lhouse_barrier2) (11)
    CreateDynamicObject(994, 420.55599976, 2526.84594727, 15.55599976, 0.00000000, 0.00000000, 179.98901367); //object(lhouse_barrier2) (12)
    CreateDynamicObject(994, 414.00201416, 2526.79003906, 15.53400040, 0.00000000, 0.00000000, 145.98901367); //object(lhouse_barrier2) (13)
    CreateDynamicObject(1237, 414.13400269, 2526.96704102, 15.52000046, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (7)
    CreateDynamicObject(1237, 420.76199341, 2526.96997070, 15.56200027, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (8)
    CreateDynamicObject(1237, 427.30999756, 2526.83593750, 15.57499981, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (9)
    CreateDynamicObject(1237, 432.94500732, 2523.30004883, 15.57400036, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (10)
    CreateDynamicObject(1237, 432.98901367, 2516.61694336, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (11)
    CreateDynamicObject(1237, 432.76300049, 2509.95288086, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (12)
    CreateDynamicObject(1237, 432.57800293, 2503.30908203, 15.49199963, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (13)
    CreateDynamicObject(1237, 432.36401367, 2496.62890625, 15.49199963, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (14)
    CreateDynamicObject(1237, 432.13000488, 2489.85791016, 15.49199963, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (15)
    CreateDynamicObject(1237, 431.95901489, 2483.09497070, 15.48400021, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (16)
    CreateDynamicObject(1237, 431.58898926, 2476.34497070, 15.53999996, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (17)
    CreateDynamicObject(1262, -76.01399994, 2525.89892578, 20.83900070, 0.00000000, 0.00000000, 92.00000000); //object(mtraffic4) (1)
    CreateDynamicObject(1262, -76.01399994, 2512.44799805, 20.41200066, 0.00000000, 0.00000000, 92.00000000); //object(mtraffic4) (2)
    CreateDynamicObject(1262, -76.00900269, 2496.03491211, 20.79700089, 0.00000000, 0.00000000, 92.00000000); //object(mtraffic4) (3)
    CreateDynamicObject(1262, -75.92099762, 2492.74291992, 20.77099991, 0.00000000, 0.00000000, 96.00000000); //object(mtraffic4) (4)
    CreateDynamicObject(1262, -75.92099762, 2479.52001953, 20.44099998, 0.00000000, 0.00000000, 96.00000000); //object(mtraffic4) (5)
    CreateDynamicObject(1262, 398.98300171, 2523.55004883, 20.67300034, 0.00000000, 0.00000000, 264.00000000); //object(mtraffic4) (6)
    CreateDynamicObject(1262, 398.98300171, 2510.16308594, 20.60799980, 0.00000000, 0.00000000, 268.00000000); //object(mtraffic4) (7)
    CreateDynamicObject(1262, 398.94100952, 2506.88793945, 20.59399986, 0.00000000, 0.00000000, 268.00000000); //object(mtraffic4) (8)
    CreateDynamicObject(1262, 398.94100952, 2493.82202148, 20.45800018, 0.00000000, 0.00000000, 262.00000000); //object(mtraffic4) (9)
    CreateDynamicObject(1262, 399.04199219, 2477.80102539, 20.26700020, 0.00000000, 0.00000000, 266.00000000); //object(mtraffic4) (10)
    //Военная база
    AddStaticVehicle(461, 287.8559875, 1976.7740479, 17.3150005, 0.0000000, -1, -1); //PCJ-600
    AddStaticVehicle(433, 290.0790100, 1917.9389648, 18.2110004, 234.0000000, -1, -1); //Barracks
    AddStaticVehicle(433, 298.1889954, 1902.5200195, 18.2110004, 180.0000000, -1, -1); //Barracks
    AddStaticVehicle(490, 281.0322266, 1980.2011719, 17.9610004, 309.9957275, -1, -1); //FBI Rancher
    AddStaticVehicle(490, 273.5620117, 1979.6450195, 17.9610004, 309.9957275, -1, -1); //FBI Rancher
    AddStaticVehicle(490, 282.6570129, 1998.0500488, 17.9610004, 221.9957275, -1, -1); //FBI Rancher
    AddStaticVehicle(490, 275.6910095, 1998.3389893, 17.9610004, 221.9952393, -1, -1); //FBI Rancher
    AddStaticVehicle(427, 281.1199951, 2015.5889893, 17.8889999, 312.0000000, -1, -1); //Enforcer
    AddStaticVehicle(427, 274.5039978, 2015.5059814, 17.8889999, 311.9952393, -1, -1); //Enforcer
    AddStaticVehicle(427, 281.6270142, 2032.9470215, 17.8889999, 221.9952393, -1, -1); //Enforcer
    AddStaticVehicle(427, 274.9079895, 2031.1999512, 17.8889999, 221.9952393, -1, -1); //Enforcer
    AddStaticVehicle(586, 287.7120056, 1969.2259521, 17.2380009, 359.9987793, -1, -1); //Wayfarer
    AddStaticVehicle(497, 356.5750122, 1921.8759766, 19.7929993, 90.0000000, -1, -1); //Police Maverick
    AddStaticVehicle(599, 283.0360107, 1945.8879395, 18.0259991, 310.0000000, -1, -1); //Police Ranger
    AddStaticVehicle(599, 277.4779968, 1946.6590576, 18.0259991, 309.9957275, -1, -1); //Police Ranger
    AddStaticVehicle(599, 282.1780090, 1965.9639893, 18.0259991, 221.9957275, -1, -1); //Police Ranger
    AddStaticVehicle(599, 276.0979919, 1965.4399414, 18.0259991, 221.9952393, -1, -1); //Police Ranger
    CreateDynamicObject(817, 289.8229980, 1904.9079590, 17.0830002, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers01) (1)
    CreateDynamicObject(980, 292.4159851, 1942.5679932, 19.4139996, 0.0000000, 0.0000000, 358.0000000); //object(airportgate) (1)
    CreateDynamicObject(3279, 293.9349976, 1938.2840576, 16.6410007, 0.0000000, 0.0000000, 268.0000000); //object(a51_spottower) (1)
    CreateDynamicObject(980, 326.8469849, 1941.3439941, 19.4139996, 0.0000000, 0.0000000, 357.9949951); //object(airportgate) (5)
    CreateDynamicObject(980, 338.3399963, 1940.9189453, 19.4139996, 0.0000000, 0.0000000, 357.9949951); //object(airportgate) (6)
    CreateDynamicObject(980, 349.7909851, 1940.5150146, 19.4139996, 0.0000000, 0.0000000, 357.9949951); //object(airportgate) (7)
    CreateDynamicObject(980, 361.3089905, 1940.1130371, 19.4139996, 0.0000000, 0.0000000, 357.9949951); //object(airportgate) (8)
    CreateDynamicObject(980, 372.8299866, 1939.6800537, 19.4139996, 0.0000000, 0.0000000, 357.9949951); //object(airportgate) (9)
    CreateDynamicObject(980, 384.3139954, 1939.2609863, 19.4139996, 0.0000000, 0.0000000, 357.9949951); //object(airportgate) (10)
    CreateDynamicObject(3268, 307.4089966, 2056.9880371, 16.6410007, 0.0000000, 0.0000000, 89.9945068); //object(mil_hangar1_) (1)
    CreateDynamicObject(3279, 326.5230103, 1937.1009521, 16.6410007, 0.0000000, 0.0000000, 267.9949951); //object(a51_spottower) (2)
    CreateDynamicObject(982, 294.9890137, 1898.1829834, 17.3239994, 0.0000000, 0.0000000, 0.0000000); //object(fenceshit) (1)
    CreateDynamicObject(982, 294.9769897, 1872.5760498, 17.3239994, 0.0000000, 0.0000000, 0.0000000); //object(fenceshit) (2)
    CreateDynamicObject(982, 294.9559937, 1846.9959717, 17.3239994, 0.0000000, 0.0000000, 0.0000000); //object(fenceshit) (3)
    CreateDynamicObject(983, 294.9379883, 1831.0140381, 17.3239994, 0.0000000, 0.0000000, 0.0000000); //object(fenceshit3) (1)
    CreateDynamicObject(983, 291.7460022, 1827.8189697, 17.3320007, 0.0000000, 0.0000000, 270.0000000); //object(fenceshit3) (2)
    CreateDynamicObject(983, 289.2439880, 1827.8120117, 17.3320007, 0.0000000, 0.0000000, 270.0000000); //object(fenceshit3) (3)
    CreateDynamicObject(982, 284.3399963, 1918.1359863, 17.3239994, 0.0000000, 0.0000000, 56.0000000); //object(fenceshit) (4)
    CreateDynamicObject(983, 271.1329956, 1923.4050293, 17.3239994, 0.0000000, 0.0000000, 306.0000000); //object(fenceshit3) (5)
    CreateDynamicObject(980, 266.4039917, 1935.0939941, 19.4139996, 0.0000000, 0.0000000, 87.9949951); //object(airportgate) (11)
    CreateDynamicObject(980, 266.1589966, 1928.8459473, 19.4139996, 0.0000000, 0.0000000, 87.9895020); //object(airportgate) (12)
    CreateDynamicObject(877, 290.0090027, 1904.5439453, 18.4340000, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers04) (1)
    CreateDynamicObject(877, 290.3500061, 1894.6309814, 18.4340000, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers04) (2)
    CreateDynamicObject(877, 290.2770081, 1884.1739502, 18.4340000, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers04) (3)
    CreateDynamicObject(877, 290.5409851, 1873.9680176, 18.4340000, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers04) (4)
    CreateDynamicObject(877, 290.3670044, 1864.4940186, 18.4340000, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers04) (5)
    CreateDynamicObject(877, 290.5969849, 1854.1199951, 18.4340000, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers04) (6)
    CreateDynamicObject(877, 289.9779968, 1844.1860352, 18.4340000, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers04) (7)
    CreateDynamicObject(877, 290.5029907, 1834.3740234, 18.4419994, 0.0000000, 0.0000000, 0.0000000); //object(veg_pflowers04) (8)
    CreateDynamicObject(700, 290.2520142, 1906.0729980, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (1)
    CreateDynamicObject(700, 290.1319885, 1892.2139893, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (2)
    CreateDynamicObject(700, 290.0409851, 1875.9909668, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (3)
    CreateDynamicObject(700, 290.3569946, 1859.4530029, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (4)
    CreateDynamicObject(700, 290.0520020, 1846.2919922, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (5)
    CreateDynamicObject(700, 290.1099854, 1831.7209473, 16.6480007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (6)
    CreateDynamicObject(700, 335.1499939, 1939.3229980, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (8)
    CreateDynamicObject(700, 346.7430115, 1939.5510254, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (9)
    CreateDynamicObject(700, 360.1499939, 1939.2110596, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (10)
    CreateDynamicObject(700, 372.0329895, 1939.0460205, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (11)
    CreateDynamicObject(700, 384.8940125, 1938.1209717, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (12)
    CreateDynamicObject(700, 385.1229858, 1941.5649414, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (13)
    CreateDynamicObject(700, 372.1059875, 1941.6369629, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (14)
    CreateDynamicObject(700, 360.2210083, 1942.0169678, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (15)
    CreateDynamicObject(700, 346.7489929, 1942.3919678, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (16)
    CreateDynamicObject(700, 335.2890015, 1942.9599609, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (17)
    CreateDynamicObject(700, 322.8800049, 1944.3840332, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_veg_tree6) (18)
    CreateDynamicObject(4832, 350.9599915, 1969.8780518, 48.6599998, 0.0000000, 0.0000000, 180.0000000); //object(airtwer_las) (1)
    CreateDynamicObject(698, 339.9840088, 1994.1140137, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (1)
    CreateDynamicObject(698, 371.8510132, 1999.9969482, 16.6410007, 0.0000000, 0.0000000, 16.0000000); //object(sm_firtbshg) (2)
    CreateDynamicObject(698, 339.7869873, 1883.7349854, 16.6830006, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (3)
    CreateDynamicObject(698, 332.9240112, 1865.3499756, 16.8680000, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (4)
    CreateDynamicObject(698, 333.9819946, 1844.7750244, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (5)
    CreateDynamicObject(698, 334.8880005, 1825.3299561, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (6)
    CreateDynamicObject(698, 384.7968750, 1796.2314453, 19.0009995, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 394.6119995, 1817.3289795, 19.7240009, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (9)
    CreateDynamicObject(698, 397.9209900, 1852.2259521, 19.3810005, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (10)
    CreateDynamicObject(698, 415.0079956, 1859.9859619, 18.9209995, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (11)
    CreateDynamicObject(698, 420.2749939, 1830.5489502, 18.9939995, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (12)
    CreateDynamicObject(698, 434.2900085, 1869.0600586, 19.5410004, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (13)
    CreateDynamicObject(698, 441.5650024, 1891.7519531, 20.8230000, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (14)
    CreateDynamicObject(698, 441.0090027, 1915.5920410, 20.6889992, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (15)
    CreateDynamicObject(698, 439.6440125, 1936.7380371, 20.3770008, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (16)
    CreateDynamicObject(698, 439.7489929, 1965.9399414, 20.4300003, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (17)
    CreateDynamicObject(698, 439.9949951, 1987.4449463, 20.9139996, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (18)
    CreateDynamicObject(698, 442.0710144, 2014.2010498, 21.0079994, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (19)
    CreateDynamicObject(698, 439.7929993, 2039.9100342, 20.4969997, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (20)
    CreateDynamicObject(698, 439.2749939, 2069.8601074, 20.4290009, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (21)
    CreateDynamicObject(698, 434.9440002, 2093.4289551, 19.3950005, 0.0000000, 0.0000000, 40.0000000); //object(sm_firtbshg) (22)
    CreateDynamicObject(698, 407.5880127, 1910.5930176, 16.6410007, 0.0000000, 0.0000000, 39.9957275); //object(sm_firtbshg) (23)
    CreateDynamicObject(698, 409.0750122, 1935.4479980, 16.6410007, 0.0000000, 0.0000000, 39.9957275); //object(sm_firtbshg) (24)
    CreateDynamicObject(698, 407.6189880, 1960.6440430, 16.6410007, 0.0000000, 0.0000000, 39.9957275); //object(sm_firtbshg) (25)
    CreateDynamicObject(698, 403.2709961, 1986.2120361, 16.6410007, 0.0000000, 0.0000000, 39.9957275); //object(sm_firtbshg) (26)
    CreateDynamicObject(698, 404.7349854, 2009.6240234, 16.6410007, 0.0000000, 0.0000000, 39.9957275); //object(sm_firtbshg) (27)
    CreateDynamicObject(698, 405.4920044, 2034.5970459, 16.6410007, 0.0000000, 0.0000000, 39.9957275); //object(sm_firtbshg) (28)
    CreateDynamicObject(698, 405.5459900, 2061.4279785, 16.6410007, 0.0000000, 0.0000000, 39.9957275); //object(sm_firtbshg) (29)
    CreateDynamicObject(698, 394.0849915, 2084.6359863, 16.6410007, 0.0000000, 0.0000000, 17.9957275); //object(sm_firtbshg) (30)
    CreateDynamicObject(698, 402.1950073, 2089.2438965, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (31)
    CreateDynamicObject(698, 419.8269958, 2108.7229004, 18.3190002, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (32)
    CreateDynamicObject(698, 376.2579956, 2064.1479492, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (33)
    CreateDynamicObject(698, 350.3110046, 2066.6530762, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (34)
    CreateDynamicObject(698, 339.2170105, 2058.6860352, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (35)
    CreateDynamicObject(698, 335.6419983, 2043.7600098, 18.8810005, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (36)
    CreateDynamicObject(698, 332.8701172, 2029.7138672, 19.8910007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (37)
    CreateDynamicObject(698, 336.1619873, 2015.4060059, 19.5809994, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (38)
    CreateDynamicObject(698, 269.7880859, 2057.2382812, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (39)
    CreateDynamicObject(698, 253.9640045, 2047.0899658, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (40)
    CreateDynamicObject(698, 244.7500000, 2066.0319824, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (41)
    CreateDynamicObject(698, 234.5469971, 2057.3630371, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (42)
    CreateDynamicObject(698, 212.7960052, 2054.9609375, 17.4440002, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (43)
    CreateDynamicObject(698, 231.4720001, 2038.7810059, 16.6410007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (44)
    CreateDynamicObject(698, 248.5966797, 2023.6386719, 18.3980007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (45)
    CreateDynamicObject(698, 247.8350067, 2007.7559814, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (46)
    CreateDynamicObject(698, 226.4060059, 2022.8840332, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (47)
    CreateDynamicObject(698, 214.8110046, 2008.1330566, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (48)
    CreateDynamicObject(698, 236.7619934, 1997.0300293, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (49)
    CreateDynamicObject(698, 252.8639984, 1983.6080322, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (50)
    CreateDynamicObject(698, 252.4320068, 1965.1390381, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (51)
    CreateDynamicObject(698, 256.8460083, 1943.7879639, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (52)
    CreateDynamicObject(698, 230.4680023, 1953.6440430, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (53)
    CreateDynamicObject(698, 211.6450043, 1976.8950195, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (54)
    CreateDynamicObject(698, 206.1710052, 1953.3850098, 16.6410007, 0.0000000, 0.0000000, 29.9926758); //object(sm_firtbshg) (55)
    CreateDynamicObject(698, 225.4839935, 2107.5109863, 18.5440006, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (39)
    CreateDynamicObject(698, 254.4709930, 2106.3100586, 16.4850006, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (39)
    CreateDynamicObject(698, 287.4490051, 2111.5410156, 16.3540001, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (39)
    CreateDynamicObject(698, 318.9200134, 2110.2570801, 16.5370007, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (39)
    CreateDynamicObject(698, 352.3949890, 2108.0520020, 16.6650009, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (39)
    CreateDynamicObject(698, 371.2160034, 2108.8090820, 16.6529999, 0.0000000, 0.0000000, 17.9956055); //object(sm_firtbshg) (39)
    CreateDynamicObject(698, 338.7919922, 1772.0450439, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 374.7239990, 1770.9659424, 18.2570000, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 353.3169861, 1751.0179443, 18.6910000, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 376.1629944, 1740.4420166, 19.6690006, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 365.5020142, 1726.0460205, 21.9340000, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 346.3980103, 1726.9250488, 20.3999996, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 338.3290100, 1705.0250244, 19.9209995, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 285.0799866, 1759.7089844, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 331.9609985, 1728.4429932, 18.5930004, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 261.3120117, 1770.6400146, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 264.9570007, 1743.2900391, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 286.5809937, 1724.8220215, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 289.4941406, 1701.3173828, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 333.4309998, 1684.6979980, 18.6219997, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(7981, 277.2340088, 2046.3330078, 21.6389999, 0.0000000, 0.0000000, 179.9949951); //object(smallradar02_lvs) (1)
    CreateDynamicObject(1682, 274.5570068, 2045.4069824, 33.0929985, 0.0000000, 0.0000000, 243.9953613); //object(ap_radar1_01) (1)
    CreateDynamicObject(698, 402.0130005, 1891.7989502, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (10)
    CreateDynamicObject(698, 386.1390076, 1877.5019531, 16.6480007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (10)
    CreateDynamicObject(698, 370.1480103, 1869.7709961, 16.6660004, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (10)
    CreateDynamicObject(698, 350.9779968, 1816.0340576, 17.2679996, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (10)
    CreateDynamicObject(698, 350.0780029, 1848.1500244, 17.2240009, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (10)
    CreateDynamicObject(698, 361.7510071, 1887.9649658, 16.6550007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (10)
    CreateDynamicObject(18802, 308.1870117, 1791.0980225, 17.9660015, 0.0000000, 0.0000000, 268.0000000); //object(mbridgeramp1) (1)
    CreateDynamicObject(18802, 307.5093079, 1771.3220215, 17.9559994, 0.0000000, 0.0000000, 87.9949951); //object(mbridgeramp1) (2)
    CreateDynamicObject(698, 342.9010010, 1658.9780273, 20.8899994, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 311.0429993, 1646.7449951, 18.6569996, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 341.1289978, 1628.4310303, 21.3260002, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 284.9769897, 1669.1590576, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 263.2860107, 1681.4809570, 19.5359993, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 240.2899933, 1661.2569580, 15.5050001, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 260.2789917, 1660.4489746, 15.3780003, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 284.1839905, 1622.4160156, 18.6609993, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 257.9660034, 1616.8039551, 18.4769993, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 276.3070068, 1599.2769775, 21.2049999, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 305.1830139, 1593.7449951, 23.5799999, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 227.3950043, 1775.0360107, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 225.9450073, 1746.5799561, 16.6480007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 207.4270020, 1772.5179443, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 205.5319977, 1730.7170410, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 193.4320068, 1757.7729492, 16.6480007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 166.1640015, 1736.9079590, 19.7409992, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 165.9230042, 1715.1739502, 19.2119999, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 159.2180023, 1688.6569824, 20.6529999, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 141.0260010, 1716.4709473, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 134.0549927, 1744.8559570, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 148.8930054, 1772.5279541, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(698, 189.7030029, 1693.0009766, 16.6410007, 0.0000000, 0.0000000, 0.0000000); //object(sm_firtbshg) (8)
    CreateDynamicObject(9241, 356.1799927, 1921.7170410, 17.7000008, 0.0000000, 0.0000000, 0.0000000); //object(copbits_sfn) (1)
    //Остров
    AddStaticVehicle(562, -2075.90307617, 2035.20202637, 6.79500008, 24.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, -2073.48291016, 2030.02905273, 6.79500008, 23.99963379, -1, -1); //Elegy
    AddStaticVehicle(562, -2084.14208984, 2053.81909180, 6.79500008, 205.99938965, -1, -1); //Elegy
    AddStaticVehicle(562, -2086.64990234, 2059.05297852, 6.79500008, 205.99914551, -1, -1); //Elegy
    AddStaticVehicle(439, -2034.05505371, 2038.57202148, 7.07700014, 203.99975586, -1, -1); //Stallion
    AddStaticVehicle(439, -2037.41394043, 2037.09997559, 7.07700014, 203.99975586, -1, -1); //Stallion
    AddStaticVehicle(439, -2040.95996094, 2035.51403809, 7.07700014, 203.99975586, -1, -1); //Stallion
    AddStaticVehicle(560, -2104.79394531, 2010.82495117, 7.01000023, 22.00000000, -1, -1); //Sultan
    AddStaticVehicle(560, -2097.87500000, 2013.69396973, 7.01000023, 21.99462891, -1, -1); //Sultan
    AddStaticVehicle(560, -2125.41210938, 2001.93395996, 7.03000021, 23.99462891, -1, -1); //Sultan
    AddStaticVehicle(560, -2131.96704102, 1997.01293945, 7.03000021, 23.99414062, -1, -1); //Sultan
    AddStaticVehicle(560, -2131.18090820, 1964.69897461, 6.92399979, 71.99414062, -1, -1); //Sultan
    AddStaticVehicle(562, -2135.12890625, 1962.59204102, 6.79899979, 70.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, -2139.37695312, 1960.87304688, 6.79899979, 69.99926758, -1, -1); //Elegy
    AddStaticVehicle(562, -2143.18505859, 1959.27099609, 6.79899979, 69.99389648, -1, -1); //Elegy
    AddStaticVehicle(562, -2146.92602539, 1957.37194824, 6.79899979, 69.99389648, -1, -1); //Elegy
    AddStaticVehicle(562, -2150.75488281, 1955.31494141, 6.79899979, 69.99389648, -1, -1); //Elegy
    AddStaticVehicle(562, -2126.33007812, 2046.11303711, 6.88399982, 203.99926758, -1, -1); //Elegy
    CreateDynamicObject(16610, -1897.45300293, 2127.72607422, 9.63799953, 0.00000000, 0.00000000, 204.63574219); //object(des_nbridgebit_02) (1)
    CreateDynamicObject(16610, -1990.78503418, 2084.92211914, 9.62800026, 0.00000000, 0.00000000, 204.63134766); //object(des_nbridgebit_02) (2)
    CreateDynamicObject(8172, -2114.68408203, 2027.23400879, 6.08900023, 0.00000000, 0.00000000, 294.00000000); //object(vgssairportland07) (1)
    CreateDynamicObject(8172, -2100.95605469, 1995.52294922, 6.09299994, 0.00000000, 0.00000000, 293.99963379); //object(vgssairportland07) (2)
    CreateDynamicObject(8172, -2128.95703125, 2059.39892578, 6.07299995, 0.00000000, 0.00000000, 294.00000000); //object(vgssairportland07) (3)
    CreateDynamicObject(1238, -1844.55004883, 2161.35302734, 6.52600002, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (1)
    CreateDynamicObject(1238, -1837.84399414, 2145.21411133, 7.05399990, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (3)
    CreateDynamicObject(1238, -1844.17700195, 2162.29711914, 6.30800009, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (5)
    CreateDynamicObject(1238, -1836.26599121, 2144.81689453, 7.07800007, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (6)
    CreateDynamicObject(987, -2074.00292969, 2104.97509766, 6.05700016, 0.00000000, 0.00000000, 24.00000000); //object(elecfence_bar) (1)
    CreateDynamicObject(987, -2084.89794922, 2100.13110352, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (2)
    CreateDynamicObject(987, -2095.81494141, 2095.29296875, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (3)
    CreateDynamicObject(987, -2106.73291016, 2090.43090820, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (4)
    CreateDynamicObject(987, -2117.70190430, 2085.59204102, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (5)
    CreateDynamicObject(987, -2063.07104492, 2109.59497070, 6.06500006, 0.00000000, 0.00000000, 291.99963379); //object(elecfence_bar) (6)
    CreateDynamicObject(987, -2058.59912109, 2098.51098633, 6.05700016, 0.00000000, 0.00000000, 291.99462891); //object(elecfence_bar) (7)
    CreateDynamicObject(987, -2054.21997070, 2087.38403320, 6.05700016, 0.00000000, 0.00000000, 291.99462891); //object(elecfence_bar) (8)
    CreateDynamicObject(987, -2052.17089844, 2082.11499023, 6.05700016, 0.00000000, 0.00000000, 291.99462891); //object(elecfence_bar) (9)
    CreateDynamicObject(987, -2024.67102051, 2021.66003418, 6.07700014, 0.00000000, 0.00000000, 293.99462891); //object(elecfence_bar) (10)
    CreateDynamicObject(987, -2029.08203125, 2031.49499512, 6.07700014, 0.00000000, 0.00000000, 293.99414062); //object(elecfence_bar) (11)
    CreateDynamicObject(987, -2033.91601562, 2042.41894531, 6.10400009, 0.00000000, 0.00000000, 293.99414062); //object(elecfence_bar) (12)
    CreateDynamicObject(987, -2037.52404785, 2050.63305664, 6.07299995, 0.00000000, 0.00000000, 293.99414062); //object(elecfence_bar) (13)
    CreateDynamicObject(706, -2039.50500488, 2050.38305664, 6.07299995, 0.00000000, 0.00000000, 0.00000000); //object(sm_vegvbbig) (1)
    CreateDynamicObject(706, -2048.75610352, 2071.01391602, 6.07299995, 0.00000000, 0.00000000, 0.00000000); //object(sm_vegvbbig) (2)
    CreateDynamicObject(987, -2019.98400879, 2010.68200684, 6.10900021, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (14)
    CreateDynamicObject(987, -2030.84399414, 2005.82604980, 6.10300016, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (15)
    CreateDynamicObject(987, -2041.75305176, 2000.97802734, 6.09399986, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (16)
    CreateDynamicObject(987, -2052.69604492, 1996.11999512, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (17)
    CreateDynamicObject(987, -2063.62695312, 1991.30200195, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (18)
    CreateDynamicObject(987, -2074.51708984, 1986.45495605, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (19)
    CreateDynamicObject(987, -2085.46411133, 1981.58496094, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (20)
    CreateDynamicObject(987, -2096.43505859, 1976.75695801, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (21)
    CreateDynamicObject(987, -2107.37792969, 1971.89196777, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (22)
    CreateDynamicObject(987, -2118.32299805, 1967.06994629, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (23)
    CreateDynamicObject(987, -2129.30004883, 1962.24597168, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (24)
    CreateDynamicObject(987, -2140.24511719, 1957.43505859, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (25)
    CreateDynamicObject(987, -2151.17407227, 1952.66101074, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (26)
    CreateDynamicObject(987, -2154.65698242, 1951.15002441, 6.07700014, 0.00000000, 0.00000000, 203.99414062); //object(elecfence_bar) (27)
    CreateDynamicObject(987, -2128.57690430, 2080.66699219, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (28)
    CreateDynamicObject(987, -2139.49804688, 2075.80908203, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (29)
    CreateDynamicObject(987, -2150.37402344, 2070.74389648, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (30)
    CreateDynamicObject(987, -2161.28710938, 2065.66894531, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (31)
    CreateDynamicObject(987, -2172.14208984, 2060.93994141, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (32)
    CreateDynamicObject(987, -2183.04907227, 2056.12988281, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (33)
    CreateDynamicObject(987, -2193.93310547, 2051.23510742, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (34)
    CreateDynamicObject(987, -2204.82788086, 2046.44299316, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (35)
    CreateDynamicObject(987, -2209.37304688, 2044.44604492, 6.05700016, 0.00000000, 0.00000000, 23.99963379); //object(elecfence_bar) (36)
    CreateDynamicObject(987, -2165.61889648, 1946.29003906, 6.07700014, 0.00000000, 0.00000000, 113.99414062); //object(elecfence_bar) (37)
    CreateDynamicObject(987, -2170.44897461, 1957.19897461, 6.07700014, 0.00000000, 0.00000000, 113.98867798); //object(elecfence_bar) (38)
    CreateDynamicObject(987, -2175.29809570, 1968.10400391, 6.07700014, 0.00000000, 0.00000000, 113.98867798); //object(elecfence_bar) (39)
    CreateDynamicObject(987, -2180.17089844, 1979.03295898, 6.07700014, 0.00000000, 0.00000000, 113.98867798); //object(elecfence_bar) (40)
    CreateDynamicObject(987, -2185.06494141, 1989.92297363, 6.07299995, 0.00000000, 0.00000000, 113.98867798); //object(elecfence_bar) (41)
    CreateDynamicObject(987, -2189.95800781, 2000.83996582, 6.07299995, 0.00000000, 0.00000000, 113.98867798); //object(elecfence_bar) (42)
    CreateDynamicObject(987, -2194.82592773, 2011.78100586, 6.07299995, 0.00000000, 0.00000000, 113.98867798); //object(elecfence_bar) (43)
    CreateDynamicObject(987, -2199.64306641, 2022.71105957, 6.05700016, 0.00000000, 0.00000000, 113.98867798); //object(elecfence_bar) (44)
    CreateDynamicObject(987, -2204.45996094, 2033.64404297, 6.05700016, 0.00000000, 0.00000000, 113.98867798); //object(elecfence_bar) (45)
    CreateDynamicObject(705, -1863.25000000, 2180.64892578, 5.13700008, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7vbig) (1)
    CreateDynamicObject(705, -1851.63598633, 2166.73706055, 5.93699980, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7vbig) (2)
    CreateDynamicObject(705, -1836.39001465, 2138.97998047, 6.89699984, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7vbig) (3)
    CreateDynamicObject(705, -1831.11401367, 2129.98706055, 7.15299988, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7vbig) (4)
    CreateDynamicObject(705, -1827.50695801, 2123.55493164, 7.30999994, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7vbig) (5)
    CreateDynamicObject(705, -1856.21997070, 2174.27099609, 5.64599991, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7vbig) (6)
    CreateDynamicObject(17575, -2051.91210938, 2057.02905273, 9.80500031, 0.00000000, 0.00000000, 24.00000000); //object(burgho01_lae2) (1)
    CreateDynamicObject(17575, -2068.61499023, 2049.55908203, 9.80500031, 0.00000000, 0.00000000, 23.99963379); //object(burgho01_lae2) (2)
    CreateDynamicObject(1232, -2059.01489258, 2045.48706055, 8.71000004, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (1)
    CreateDynamicObject(1232, -2065.14404297, 2059.24609375, 8.71000004, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (2)
    CreateDynamicObject(3749, -2046.63598633, 2059.32495117, 11.93200016, 0.00000000, 0.00000000, 113.99996948); //object(clubgate01_lax) (1)
    CreateDynamicObject(1232, -2087.97412109, 2066.01000977, 8.69400024, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (3)
    CreateDynamicObject(1232, -2069.43505859, 2024.17602539, 8.71399975, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (4)
    CreateDynamicObject(1232, -2043.79699707, 2035.72399902, 8.71399975, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (5)
    CreateDynamicObject(1232, -2062.42895508, 2077.17993164, 8.69400024, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (6)
    CreateDynamicObject(1232, -2046.79699707, 2065.80688477, 8.87399960, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (7)
    CreateDynamicObject(1232, -2041.95703125, 2054.62304688, 8.72599983, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (8)
    CreateDynamicObject(8428, -2169.49902344, 1967.34094238, 9.32600021, 0.00000000, 0.00000000, 24.00000000); //object(villa_inn02_lvs) (1)
    CreateDynamicObject(8428, -2196.47998047, 2027.73400879, 9.29800034, 0.00000000, 0.00000000, 23.99963379); //object(villa_inn02_lvs) (2)
    CreateDynamicObject(16070, -2167.23803711, 2044.02502441, 11.92300034, 0.00000000, 0.00000000, 113.99996948); //object(des_stwnhotel1) (1)
    CreateDynamicObject(18264, -2035.42797852, 2011.39294434, 6.07700014, 0.00000000, 0.00000000, 26.00000000); //object(cw2_cinemablock) (1)
    CreateDynamicObject(11489, -2099.81909180, 2035.65600586, 6.08099985, 0.00000000, 0.00000000, 113.49624634); //object(dam_statues) (1)
    CreateDynamicObject(3484, -2092.92407227, 1998.03295898, 12.78199959, 0.00000000, 0.00000000, 203.99450684); //object(vegasxrexhse03) (1)
    CreateDynamicObject(3484, -2120.35400391, 1986.14196777, 12.80199909, 0.00000000, 0.00000000, 203.99414062); //object(vegasxrexhse03) (2)
    CreateDynamicObject(3484, -2137.78808594, 2056.99902344, 12.78200054, 0.00000000, 0.00000000, 23.99414062); //object(vegasxrexhse03) (4)
    CreateDynamicObject(1232, -2184.82104492, 2010.81896973, 8.71000004, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (9)
    //Спринт 2
    AddStaticVehicleEx(514, 1394.7832031, -1500.4160156, 9.7440004, 353.9959717, -1, -1, 15); //Tanker
    AddStaticVehicleEx(562, 1412.5009766, -1366.9439697, 8.3120003, 180.0000000, -1, -1, 15); //Elegy
    AddStaticVehicleEx(562, 1408.3879395, -1366.9449463, 8.3079996, 180.0000000, -1, -1, 15); //Elegy
    AddStaticVehicleEx(487, 2430.3039551, -2385.6330566, 6.9020000, 314.0000000, -1, -1, 15); //Maverick
    AddStaticVehicleEx(578, 2426.3430176, -2292.0090332, 5.5000000, 226.0000000, -1, -1, 15); //DFT-30
    CreateDynamicObject(910, 1400.3330078, -1434.1949463, 8.9230003, 0.0000000, 0.0000000, 79.9969482); //object(bust_cabinet_4) (1)
    CreateDynamicObject(3463, 1390.6250000, -1400.4880371, 12.3830004, 0.0000000, 0.0000000, 270.0000000); //object(vegaslampost2) (1)
    CreateDynamicObject(3463, 1381.3399658, -1400.5729980, 12.3830004, 0.0000000, 0.0000000, 270.0000000); //object(vegaslampost2) (2)
    CreateDynamicObject(3463, 1367.9899902, -1400.5839844, 12.3830004, 0.0000000, 0.0000000, 270.0000000); //object(vegaslampost2) (3)
    CreateDynamicObject(3566, 1392.2500000, -1515.4169922, 11.7550001, 356.0000000, 0.0000000, 350.0000000); //object(lasntrk1) (1)
    CreateDynamicObject(1427, 1366.2220459, -1695.8089600, 8.3999996, 0.0000000, 0.0000000, 282.0000000); //object(cj_roadbarrier) (1)
    CreateDynamicObject(1427, 1366.6429443, -1697.3449707, 8.4150000, 0.0000000, 0.0000000, 291.9976807); //object(cj_roadbarrier) (2)
    CreateDynamicObject(1427, 1367.2900391, -1698.6469727, 8.4630003, 0.0000000, 0.0000000, 295.9976807); //object(cj_roadbarrier) (4)
    CreateDynamicObject(1427, 1367.9410400, -1699.7729492, 8.5080004, 0.0000000, 0.0000000, 299.9976807); //object(cj_roadbarrier) (5)
    CreateDynamicObject(1427, 1368.9539795, -1701.2760010, 8.5190001, 0.0000000, 0.0000000, 315.9976807); //object(cj_roadbarrier) (6)
    CreateDynamicObject(1427, 1370.1860352, -1702.3459473, 8.5459995, 0.0000000, 0.0000000, 321.9976807); //object(cj_roadbarrier) (7)
    CreateDynamicObject(1423, 1362.4709473, -1716.1789551, 8.1719999, 0.0000000, 0.0000000, 0.0000000); //object(dyn_roadbarrier_4) (1)
    CreateDynamicObject(1423, 1359.0699463, -1716.0639648, 8.2329998, 0.0000000, 0.0000000, 0.0000000); //object(dyn_roadbarrier_4) (2)
    CreateDynamicObject(1423, 1355.6972656, -1715.9648438, 8.3079996, 0.0000000, 0.0000000, 0.0000000); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1422, 1394.3520508, -1492.5520020, 8.0819998, 0.0000000, 0.0000000, 0.0000000); //object(dyn_roadbarrier_5) (1)
    CreateDynamicObject(1422, 1392.3160400, -1494.4510498, 8.0819998, 0.0000000, 0.0000000, 71.9946289); //object(dyn_roadbarrier_5) (2)
    CreateDynamicObject(1422, 1391.3800049, -1497.4980469, 8.0749998, 0.0000000, 0.0000000, 71.9934082); //object(dyn_roadbarrier_5) (3)
    CreateDynamicObject(1422, 1390.4189453, -1500.6049805, 8.0799999, 0.0000000, 0.0000000, 71.9934082); //object(dyn_roadbarrier_5) (4)
    CreateDynamicObject(1422, 1390.9959717, -1502.6469727, 8.0819998, 0.0000000, 0.0000000, 163.9934082); //object(dyn_roadbarrier_5) (5)
    CreateDynamicObject(1422, 1483.9360352, -1724.4150391, 6.1459999, 0.0000000, 0.0000000, 346.0000000); //object(dyn_roadbarrier_5) (6)
    CreateDynamicObject(1422, 1488.3349609, -1725.3850098, 6.1190000, 0.0000000, 0.0000000, 345.9979248); //object(dyn_roadbarrier_5) (7)
    CreateDynamicObject(16776, 1623.5340576, -1757.2280273, 2.0000000, 4.0000000, 0.0000000, 350.0000000); //object(des_cockbody) (1)
    CreateDynamicObject(897, 1995.4890137, -1857.2359619, 4.1149998, 0.0000000, 0.0000000, 0.0000000); //object(searock01) (1)
    CreateDynamicObject(897, 1996.3699951, -1849.7650146, 4.1149998, 0.0000000, 0.0000000, 0.0000000); //object(searock01) (2)
    CreateDynamicObject(897, 1997.7469482, -1843.7850342, 4.1210003, 0.0000000, 0.0000000, 0.0000000); //object(searock01) (3)
    CreateDynamicObject(984, 2119.3000488, -2016.0959473, 7.6209998, 0.0000000, 0.0000000, 240.0000000); //object(fenceshit2) (1)
    CreateDynamicObject(984, 2129.5590820, -2023.5749512, 7.6209998, 0.0000000, 0.0000000, 227.9963379); //object(fenceshit2) (2)
    CreateDynamicObject(984, 2139.0319824, -2032.1190186, 7.6209998, 0.0000000, 0.0000000, 227.9937744); //object(fenceshit2) (3)
    CreateDynamicObject(984, 2145.7338867, -2042.4969482, 7.6209998, 0.0000000, 0.0000000, 197.9937744); //object(fenceshit2) (4)
    CreateDynamicObject(984, 2230.4570312, -2113.7590332, 7.5720000, 0.0000000, 0.0000000, 245.9937744); //object(fenceshit2) (5)
    CreateDynamicObject(984, 2220.1269531, -2106.5710449, 7.6209998, 0.0000000, 0.0000000, 223.9893799); //object(fenceshit2) (6)
    CreateDynamicObject(984, 2212.1120605, -2096.6289062, 7.6209998, 0.0000000, 0.0000000, 213.9892578); //object(fenceshit2) (7)
    CreateDynamicObject(984, 2205.3920898, -2085.8559570, 7.6469998, 0.0000000, 0.0000000, 209.9862061); //object(fenceshit2) (9)
    CreateDynamicObject(3566, 2272.7812500, -2183.3906250, 8.0070000, 0.0000000, 348.9971924, 223.9947510); //object(lasntrk1) (2)
    CreateDynamicObject(3566, 1980.4770508, -1846.0069580, 5.6910000, 0.0000000, 0.0000000, 357.9969482); //object(lasntrk1) (3)
    CreateDynamicObject(3566, 1941.5970459, -1832.2330322, 8.6920004, 0.0000000, 0.0000000, 257.9949951); //object(lasntrk1) (4)
    CreateDynamicObject(981, 1974.4639893, -1842.2010498, 4.0370002, 0.0000000, 0.0000000, 290.0000000); //object(helix_barrier) (1)
    CreateDynamicObject(1425, 1913.6910400, -1826.4919434, 3.4370000, 0.0000000, 0.0000000, 300.0000000); //object(dyn_roadbarrier_3) (1)
    CreateDynamicObject(1425, 1914.2669678, -1827.7869873, 3.4370000, 0.0000000, 0.0000000, 299.9981689); //object(dyn_roadbarrier_3) (2)
    CreateDynamicObject(1425, 1915.1049805, -1829.0749512, 3.4370000, 0.0000000, 0.0000000, 317.9981689); //object(dyn_roadbarrier_3) (3)
    CreateDynamicObject(1425, 1916.3649902, -1830.2900391, 3.4370000, 0.0000000, 0.0000000, 317.9937744); //object(dyn_roadbarrier_3) (4)
    CreateDynamicObject(19340, 2391.0937500, -2282.7187500, 0.0000000, 0.0000000, 0.0000000, 135.9997559); //object(cslab01) (1)
    CreateDynamicObject(19340, 2455.0769043, -2344.3750000, 0.0000000, 0.0000000, 0.0000000, 135.9997559); //object(cslab01) (2)
    CreateDynamicObject(19340, 2596.1884766, -2325.0761719, 0.0000000, 0.0000000, 0.0000000, 267.9949951); //object(cslab01) (3)
    CreateDynamicObject(19340, 2705.6210938, -2240.6728516, 0.0000000, 0.0000000, 0.0000000, 87.9840088); //object(cslab01) (4)
    CreateDynamicObject(3566, 2393.4609375, -2303.7780762, 6.3639998, 349.0000000, 0.0000000, 183.9947510); //object(lasntrk1) (5)
    CreateDynamicObject(3566, 2410.9257812, -2286.5097656, 6.3639998, 348.9916992, 0.0000000, 263.9904785); //object(lasntrk1) (6)
    CreateDynamicObject(984, 2408.5720215, -2273.4799805, 13.1840000, 0.0000000, 0.0000000, 225.9892578); //object(fenceshit2) (10)
    CreateDynamicObject(984, 2437.8105469, -2307.6298828, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2447.0209961, -2316.5319824, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (12)
    CreateDynamicObject(984, 2456.2189941, -2325.4150391, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (13)
    CreateDynamicObject(984, 2410.8491211, -2422.5371094, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (14)
    CreateDynamicObject(984, 2401.6750488, -2413.6459961, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (15)
    CreateDynamicObject(984, 2392.4990234, -2404.8068848, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (16)
    CreateDynamicObject(984, 2383.2958984, -2395.9418945, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (17)
    CreateDynamicObject(984, 2374.1220703, -2387.0891113, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (18)
    CreateDynamicObject(984, 2364.9489746, -2378.1960449, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (19)
    CreateDynamicObject(984, 2355.7451172, -2369.3391113, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (20)
    CreateDynamicObject(984, 2346.5239258, -2360.5061035, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (21)
    CreateDynamicObject(984, 2476.6369629, -2248.9880371, 4.3800001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2476.7089844, -2258.0490723, 4.3870001, 0.0000000, 0.0000000, 135.9887695); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2467.8339844, -2267.2490234, 4.3870001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2458.9570312, -2276.4489746, 4.3870001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2450.0900879, -2285.6259766, 4.3870001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2442.2958984, -2293.6860352, 4.3870001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2437.8540039, -2298.3000488, 4.3870001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2465.2490234, -2325.2319336, 4.3800001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2474.1369629, -2316.0249023, 4.3800001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2483.0371094, -2306.8120117, 4.3800001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2491.8989258, -2297.6088867, 4.3800001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2500.7548828, -2288.4360352, 4.3800001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2506.3020020, -2282.6860352, 4.3800001, 0.0000000, 0.0000000, 135.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2517.1069336, -2278.3278809, 4.3870001, 0.0000000, 0.0000000, 87.9832764); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2529.8559570, -2278.7648926, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2542.6320801, -2279.2019043, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2555.3869629, -2279.6379395, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2568.1799316, -2280.0749512, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2580.9641113, -2280.5310059, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2593.7529297, -2280.9880371, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2606.5471191, -2281.4169922, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2611.3439941, -2281.6149902, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2618.0061035, -2275.4370117, 4.3870001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2618.4279785, -2262.6669922, 4.3870001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2618.6870117, -2254.6889648, 4.3870001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2683.0920410, -2325.6450195, 4.3870001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2683.5290527, -2312.8510742, 4.3870001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2683.9790039, -2300.0900879, 4.3870001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2684.2949219, -2290.4899902, 4.3870001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2791.1970215, -2281.7680664, 4.3800001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2791.6479492, -2268.9799805, 4.3800001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2792.0959473, -2256.1999512, 4.3800001, 0.0000000, 0.0000000, 177.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2690.8889160, -2284.3181152, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2703.6479492, -2284.7858887, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2716.4389648, -2285.2351074, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2729.2229004, -2285.6909180, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2741.9851074, -2286.1479492, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2754.7509766, -2286.5957031, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2767.5439453, -2287.0458984, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2780.3378906, -2287.4870605, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2783.5219727, -2287.5979004, 4.3870001, 0.0000000, 0.0000000, 87.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(3566, 2786.0000000, -2249.0639648, 6.3569999, 0.0000000, 0.0000000, 223.9947510); //object(lasntrk1) (2)
    CreateDynamicObject(3566, 2773.7729492, -2248.4499512, 6.3569999, 0.0000000, 0.0000000, 259.9947510); //object(lasntrk1) (2)
    CreateDynamicObject(1423, 2392.9909668, -2293.9008789, 5.7729998, 0.0000000, 0.0000000, 310.0000000); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2391.0258789, -2291.4628906, 5.7729998, 0.0000000, 0.0000000, 309.9957275); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2401.5258789, -2286.5109863, 5.7729998, 0.0000000, 0.0000000, 309.9957275); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2399.2060547, -2283.8798828, 5.7729998, 0.0000000, 0.0000000, 309.9957275); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2397.2109375, -2281.5419922, 5.7729998, 0.0000000, 0.0000000, 309.9957275); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2397.6340332, -2279.7609863, 5.7729998, 0.0000000, 0.0000000, 221.9957275); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2399.5490723, -2278.0690918, 5.7729998, 0.0000000, 0.0000000, 221.9952393); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2389.1979980, -2289.3090820, 5.7729998, 0.0000000, 0.0000000, 309.9957275); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2387.2028809, -2289.6909180, 5.7729998, 0.0000000, 0.0000000, 221.9952393); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(1423, 2384.7690430, -2291.9350586, 5.7729998, 0.0000000, 0.0000000, 221.9952393); //object(dyn_roadbarrier_4) (3)
    CreateDynamicObject(11412, 1415.3120117, -1370.8110352, 32.4620018, 0.0000000, 0.0000000, 356.0000000); //object(nightlights03_sfse) (1)
    CreateDynamicObject(713, 2433.4221191, -2303.4829102, 3.7500000, 0.0000000, 0.0000000, 30.0000000); //object(veg_bevtree1) (2)
    CreateDynamicObject(713, 2462.0119629, -2330.2370605, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (3)
    CreateDynamicObject(713, 2420.0170898, -2290.1298828, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 2482.4050293, -2308.9160156, 3.7430000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (5)
    CreateDynamicObject(713, 2498.0910645, -2292.2890625, 3.7430000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (6)
    CreateDynamicObject(713, 2511.0668945, -2278.8679199, 3.7430000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, 2530.8249512, -2279.5471191, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (8)
    CreateDynamicObject(713, 2554.6599121, -2280.6660156, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, 2577.3359375, -2281.4528809, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (10)
    CreateDynamicObject(713, 2597.4250488, -2281.7749023, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (11)
    CreateDynamicObject(713, 2617.4870605, -2282.3469238, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (12)
    CreateDynamicObject(713, 2619.0310059, -2271.6789551, 3.7500000, 0.0000000, 0.0000000, 109.9981384); //object(veg_bevtree1) (13)
    CreateDynamicObject(713, 2619.3339844, -2259.5129395, 3.7500000, 0.0000000, 0.0000000, 109.9951477); //object(veg_bevtree1) (14)
    CreateDynamicObject(713, 2683.1779785, -2320.4599609, 3.7500000, 0.0000000, 0.0000000, 73.9951477); //object(veg_bevtree1) (15)
    CreateDynamicObject(713, 2683.7919922, -2306.1669922, 3.7500000, 0.0000000, 0.0000000, 73.9929199); //object(veg_bevtree1) (16)
    CreateDynamicObject(713, 2684.3059082, -2287.3889160, 3.7500000, 0.0000000, 0.0000000, 73.9929199); //object(veg_bevtree1) (17)
    CreateDynamicObject(713, 2447.9340820, -2318.6669922, 3.7500000, 0.0000000, 0.0000000, 329.9981689); //object(veg_bevtree1) (18)
    CreateDynamicObject(984, 2423.7438965, -2293.8249512, 4.3870001, 0.0000000, 0.0000000, 225.9887695); //object(fenceshit2) (11)
    CreateDynamicObject(713, 2444.4838867, -2291.1799316, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (19)
    CreateDynamicObject(713, 2457.8789062, -2277.5161133, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (20)
    CreateDynamicObject(713, 2468.8320312, -2266.1818848, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (21)
    CreateDynamicObject(713, 2480.7800293, -2253.8940430, 3.7500000, 0.0000000, 0.0000000, 29.9981689); //object(veg_bevtree1) (22)
    CreateDynamicObject(3707, 2398.0239258, -2347.9208984, 11.4329996, 0.0000000, 0.0000000, 44.9890137); //object(rdwarhusmed) (1)
    CreateDynamicObject(9241, 2431.3911133, -2384.8569336, 4.8090000, 0.0000000, 0.0000000, 224.0000000); //object(copbits_sfn) (1)
    CreateDynamicObject(3566, 2470.3090820, -2333.2561035, 6.3639998, 0.0000000, 0.0000000, 265.9904785); //object(lasntrk1) (6)
    CreateDynamicObject(3620, 2587.7299805, -2314.8349609, 16.8449993, 0.0000000, 0.0000000, 181.0000000); //object(redockrane_las) (1)
    CreateDynamicObject(3625, 2587.4880371, -2316.9489746, 6.5850000, 0.0000000, 0.0000000, 0.0000000); //object(crgostntrmp) (1)
    CreateDynamicObject(3625, 2587.4020996, -2306.3010254, 6.5850000, 0.0000000, 0.0000000, 0.0000000); //object(crgostntrmp) (2)
    CreateDynamicObject(3566, 2583.0480957, -2291.1279297, 6.3639998, 0.0000000, 0.0000000, 197.9880371); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2627.7680664, -2280.9431152, 6.3639998, 0.0000000, 0.0000000, 267.9846191); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2675.2219238, -2282.7800293, 6.3639998, 0.0000000, 0.0000000, 87.9840088); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2645.4340820, -2281.6210938, 6.3639998, 0.0000000, 0.0000000, 87.9840088); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2645.8469238, -2276.9689941, 6.3639998, 0.0000000, 0.0000000, 87.9785156); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2646.2170410, -2271.8449707, 6.3639998, 0.0000000, 0.0000000, 87.9785156); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2646.4589844, -2267.1159668, 6.3639998, 0.0000000, 0.0000000, 87.9785156); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2646.7910156, -2261.7351074, 6.3639998, 0.0000000, 0.0000000, 87.9785156); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2647.0449219, -2256.7800293, 6.3639998, 0.0000000, 0.0000000, 87.9785156); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2647.2880859, -2251.1430664, 6.3639998, 0.0000000, 0.0000000, 87.9785156); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2628.1669922, -2261.7919922, 6.3639998, 0.0000000, 0.0000000, 197.9846191); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2679.1918945, -2294.5810547, 6.3639998, 0.0000000, 0.0000000, 177.9785156); //object(lasntrk1) (6)
    CreateDynamicObject(3566, 2505.3579102, -2324.4619141, 6.3639998, 0.0000000, 0.0000000, 43.9899902); //object(lasntrk1) (6)
    CreateDynamicObject(16092, 2763.0029297, -2256.7270508, 3.7430000, 0.0000000, 0.0000000, 2.0000000); //object(des_pipestrut05) (1)
    CreateDynamicObject(16092, 2763.6608887, -2279.2351074, 3.7500000, 0.0000000, 0.0000000, 2.0000000); //object(des_pipestrut05) (2)
    CreateDynamicObject(984, 2762.4489746, -2270.0000000, 4.3870001, 90.0000000, 0.0000000, 359.9785156); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2762.4509277, -2264.9599609, 4.3800001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2762.4541016, -2266.2309570, 4.3800001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2762.4431152, -2267.4699707, 4.3870001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2762.4470215, -2268.7438965, 4.3870001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2764.0590820, -2264.8730469, 4.3800001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2762.4870605, -2271.1220703, 4.3870001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2764.0639648, -2266.1499023, 4.3800001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2764.0849609, -2267.3959961, 4.3800001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2764.0979004, -2268.6350098, 4.3870001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2764.0920410, -2269.8679199, 4.3870001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(984, 2764.0820312, -2270.9709473, 4.3870001, 90.0000000, 0.0000000, 359.9780273); //object(fenceshit2) (11)
    CreateDynamicObject(19122, 1410.4890137, -1370.1040039, 8.1190004, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight2) (1)
    CreateDynamicObject(18718, 1405.2259521, -1370.1259766, 8.3509998, 0.0000000, 0.0000000, 0.0000000); //object(prt_spark_2) (1)
    CreateDynamicObject(18718, 1415.4360352, -1370.2629395, 8.5139999, 0.0000000, 0.0000000, 0.0000000); //object(prt_spark_2) (2)
    CreateDynamicObject(19193, 1410.4339600, -1372.7609863, 7.5650001, 0.0000000, 0.0000000, 0.0000000); //object(mapmarkernew17) (1)
    CreateDynamicObject(18689, 1400.1400146, -1434.4329834, 7.7049999, 0.0000000, 0.0000000, 0.0000000); //object(fire_bike) (1)
    CreateDynamicObject(910, 1395.8890381, -1459.2650146, 8.9329996, 0.0000000, 0.0000000, 163.9969482); //object(bust_cabinet_4) (1)
    CreateDynamicObject(18689, 1395.6810303, -1459.3370361, 7.7150002, 0.0000000, 0.0000000, 0.0000000); //object(fire_bike) (2)
    //Дрифт Джиззи
    AddStaticVehicle(403, -2710.07397461, 1694.65405273, 5.99048996, 326.00000000, -1, -1); //Linerunner
    AddStaticVehicle(403, -2618.81689453, 1701.53100586, 5.84899998, 219.99975586, -1, -1); //Linerunner
    AddStaticVehicle(526, -2685.35595703, 1601.06701660, 8.68099976, 0.00000000, -1, -1); //Fortune
    CreateDynamicObject(10763, -2658.64599609, 1676.10803223, 36.78883743, 0.00000000, 0.00000000, 136.00000000); //object(controltower_sfse) (1)
    CreateDynamicObject(8355, -2623.07324219, 1503.87890625, 4.18100023, 0.00000000, 0.00000000, 0.00000000); //object(vgssairportland18) (1)
    CreateDynamicObject(8355, -2660.75292969, 1503.96972656, 4.18200016, 0.00000000, 0.00000000, 0.00000000); //object(vgssairportland18) (2)
    CreateDynamicObject(8355, -2699.22192383, 1503.68505859, 4.11800003, 0.00000000, 0.00000000, 0.00000000); //object(vgssairportland18) (3)
    CreateDynamicObject(8355, -2623.06591797, 1640.75500488, 4.14899969, 0.00000000, 0.00000000, 0.00000000); //object(vgssairportland18) (4)
    CreateDynamicObject(8355, -2661.68603516, 1640.74902344, 4.14899969, 0.00000000, 0.00000000, 0.00000000); //object(vgssairportland18) (5)
    CreateDynamicObject(8355, -2699.18847656, 1640.75097656, 4.14900017, 0.00000000, 0.00000000, 0.00000000); //object(vgssairportland18) (6)
    CreateDynamicObject(2935, -2645.37207031, 1664.44494629, 5.60099983, 0.00000000, 0.00000000, 340.00000000); //object(kmb_container_yel) (1)
    CreateDynamicObject(1362, -2641.64404297, 1666.81298828, 4.74700022, 0.00000000, 0.00000000, 0.00000000); //object(cj_firebin) (1)
    CreateDynamicObject(7516, -2638.10791016, 1549.26696777, 8.17099953, 0.00000000, 0.00000000, 0.00000000); //object(vegasnfrates02) (1)
    CreateDynamicObject(7516, -2640.61108398, 1521.96899414, 8.17099953, 0.00000000, 0.00000000, 90.00000000); //object(vegasnfrates02) (2)
    CreateDynamicObject(3568, -2715.01489258, 1681.68994141, 6.76300001, 0.00000000, 0.00000000, 348.00000000); //object(lasntrk2) (1)
    CreateDynamicObject(2935, -2715.64306641, 1698.98498535, 5.60099983, 0.00000000, 0.00000000, 359.99938965); //object(kmb_container_yel) (2)
    CreateDynamicObject(2935, -2712.34399414, 1705.91894531, 5.60099983, 0.00000000, 0.00000000, 307.99450684); //object(kmb_container_yel) (3)
    CreateDynamicObject(16089, -2615.61401367, 1512.90002441, 4.18100023, 0.00000000, 0.00000000, 270.00000000); //object(des_pipestrut02) (1)
    CreateDynamicObject(981, -2621.75097656, 1696.60302734, 4.39000177, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (1)
    CreateDynamicObject(979, -2608.38769531, 1525.05761719, 5.02099991, 0.00000000, 0.00000000, 93.99353027); //object(sub_roadleft) (3)
    CreateDynamicObject(18335, -2643.42187500, -2197.53906250, 45.84375000, 0.00000000, 0.00000000, 0.00000000); //object(cs_landbit_47) (1)
    CreateDynamicObject(18365, -2658.76098633, 1602.52795410, 12.77999973, 0.00000000, 0.00000000, 134.00000000); //object(sawmill) (1)
    CreateDynamicObject(7893, -2624.83691406, 1599.18103027, 4.71000004, 0.00000000, 0.00000000, 270.00000000); //object(vegascrashbar04) (2)
    CreateDynamicObject(7893, -2624.08007812, 1651.05798340, 4.71000004, 0.00000000, 0.00000000, 270.00000000); //object(vegascrashbar04) (3)
    CreateDynamicObject(979, -2618.43408203, 1604.36596680, 4.98899984, 0.00000000, 0.00000000, 359.98901367); //object(sub_roadleft) (7)
    CreateDynamicObject(979, -2609.42895508, 1606.11206055, 4.98899984, 0.00000000, 0.00000000, 21.98901367); //object(sub_roadleft) (8)
    CreateDynamicObject(979, -2617.70800781, 1656.34399414, 4.98899984, 0.00000000, 0.00000000, 359.98901367); //object(sub_roadleft) (9)
    CreateDynamicObject(979, -2608.73193359, 1657.88793945, 4.98899984, 0.00000000, 0.00000000, 19.98901367); //object(sub_roadleft) (10)
    CreateDynamicObject(979, -2617.63989258, 1645.89599609, 4.98899984, 0.00000000, 0.00000000, 179.99450684); //object(sub_roadleft) (11)
    CreateDynamicObject(979, -2609.30395508, 1644.24401855, 4.98899984, 0.00000000, 0.00000000, 155.99450684); //object(sub_roadleft) (12)
    CreateDynamicObject(979, -2618.38305664, 1593.96704102, 4.98899984, 0.00000000, 0.00000000, 179.99450684); //object(sub_roadleft) (13)
    CreateDynamicObject(979, -2609.01000977, 1593.96801758, 4.98899984, 0.00000000, 0.00000000, 179.99450684); //object(sub_roadleft) (14)
    CreateDynamicObject(979, -2605.06591797, 1612.52404785, 4.98899984, 0.00000000, 0.00000000, 89.98364258); //object(sub_roadleft) (15)
    CreateDynamicObject(979, -2605.06103516, 1621.87194824, 4.98899984, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadleft) (16)
    CreateDynamicObject(979, -2605.05493164, 1631.20996094, 4.98899984, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadleft) (17)
    CreateDynamicObject(979, -2605.04711914, 1638.17504883, 4.98899984, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadleft) (18)
    CreateDynamicObject(7893, -2620.22802734, 1623.49902344, 4.71000004, 0.00000000, 0.00000000, 90.00000000); //object(vegascrashbar04) (4)
    CreateDynamicObject(979, -2626.67211914, 1628.70605469, 4.98899984, 0.00000000, 0.00000000, 359.98901367); //object(sub_roadleft) (19)
    CreateDynamicObject(979, -2635.77587891, 1630.15405273, 4.98899984, 0.00000000, 0.00000000, 341.98901367); //object(sub_roadleft) (20)
    CreateDynamicObject(979, -2642.09106445, 1635.79296875, 4.98899984, 0.00000000, 0.00000000, 293.98901367); //object(sub_roadleft) (21)
    CreateDynamicObject(979, -2626.61499023, 1618.31494141, 4.98899984, 0.00000000, 0.00000000, 179.99450684); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -2635.69995117, 1616.72204590, 4.98899984, 0.00000000, 0.00000000, 199.99450684); //object(sub_roadleft) (23)
    CreateDynamicObject(979, -2642.43896484, 1611.08203125, 4.98899984, 0.00000000, 0.00000000, 239.98962402); //object(sub_roadleft) (24)
    CreateDynamicObject(979, -2604.37792969, 1589.31994629, 4.98899984, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadleft) (25)
    CreateDynamicObject(979, -2604.37109375, 1579.93994141, 4.98899984, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadleft) (26)
    CreateDynamicObject(979, -2604.39111328, 1570.52905273, 5.02099991, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -2604.38208008, 1561.18005371, 5.02099991, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -2604.38793945, 1551.82104492, 5.02099991, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadleft) (29)
    CreateDynamicObject(979, -2604.38793945, 1544.92004395, 5.02099991, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadleft) (30)
    CreateDynamicObject(979, -2604.35009766, 1664.16003418, 4.98899984, 0.00000000, 0.00000000, 89.98413086); //object(sub_roadleft) (31)
    CreateDynamicObject(979, -2604.34497070, 1673.29394531, 4.98899984, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadleft) (32)
    CreateDynamicObject(979, -2604.33398438, 1682.58398438, 4.98899984, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadleft) (33)
    CreateDynamicObject(979, -2607.94091797, 1690.29199219, 4.98899984, 0.00000000, 0.00000000, 139.98348999); //object(sub_roadleft) (34)
    CreateDynamicObject(979, -2616.24291992, 1693.29003906, 4.98899984, 0.00000000, 0.00000000, 179.98229980); //object(sub_roadleft) (35)
    CreateDynamicObject(979, -2625.56909180, 1693.46105957, 4.98899984, 0.00000000, 0.00000000, 177.97802734); //object(sub_roadleft) (36)
    CreateDynamicObject(979, -2634.85693359, 1694.44995117, 4.98899984, 0.00000000, 0.00000000, 169.97302246); //object(sub_roadleft) (37)
    CreateDynamicObject(3568, -2631.66088867, 1705.91296387, 6.76300001, 0.00000000, 0.00000000, 253.99743652); //object(lasntrk2) (2)
    CreateDynamicObject(979, -2662.93896484, 1698.06994629, 4.98899984, 0.00000000, 0.00000000, 139.98901367); //object(sub_roadleft) (38)
    CreateDynamicObject(979, -2670.94091797, 1702.49694824, 4.98899984, 0.00000000, 0.00000000, 161.98779297); //object(sub_roadleft) (39)
    CreateDynamicObject(979, -2679.94091797, 1703.60705566, 4.98899984, 0.00000000, 0.00000000, 183.98242188); //object(sub_roadleft) (40)
    CreateDynamicObject(979, -2689.04003906, 1702.99694824, 4.98899984, 0.00000000, 0.00000000, 183.97705078); //object(sub_roadleft) (41)
    CreateDynamicObject(979, -2698.07910156, 1701.53503418, 4.98899984, 0.00000000, 0.00000000, 193.97705078); //object(sub_roadleft) (42)
    CreateDynamicObject(979, -2704.59497070, 1696.25195312, 4.98899984, 0.00000000, 0.00000000, 243.97705078); //object(sub_roadleft) (43)
    CreateDynamicObject(979, -2707.89501953, 1687.62500000, 4.98899984, 0.00000000, 0.00000000, 253.97644043); //object(sub_roadleft) (44)
    CreateDynamicObject(7893, -2694.31298828, 1683.54101562, 4.71000004, 0.00000000, 0.00000000, 244.00000000); //object(vegascrashbar04) (5)
    CreateDynamicObject(979, -2690.54394531, 1676.69201660, 4.98899984, 0.00000000, 0.00000000, 163.97705078); //object(sub_roadleft) (45)
    CreateDynamicObject(979, -2682.31689453, 1672.68103027, 4.98899984, 0.00000000, 0.00000000, 143.97644043); //object(sub_roadleft) (46)
    CreateDynamicObject(712, -2662.98193359, 1702.60400391, 13.74800014, 0.00000000, 0.00000000, 24.99938965); //object(vgs_palm03) (1)
    CreateDynamicObject(712, -2673.91503906, 1705.97094727, 13.74800014, 0.00000000, 0.00000000, 94.99938965); //object(vgs_palm03) (2)
    CreateDynamicObject(712, -2684.94091797, 1706.19604492, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (3)
    CreateDynamicObject(712, -2696.47192383, 1705.07800293, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (4)
    CreateDynamicObject(712, -2705.04296875, 1700.65197754, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (5)
    CreateDynamicObject(712, -2710.04492188, 1688.31103516, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (6)
    CreateDynamicObject(979, -2685.79199219, 1686.94995117, 4.98899984, 0.00000000, 0.00000000, 353.97644043); //object(sub_roadleft) (47)
    CreateDynamicObject(979, -2678.65209961, 1682.65698242, 4.98899984, 0.00000000, 0.00000000, 303.97399902); //object(sub_roadleft) (48)
    CreateDynamicObject(979, -2709.51708984, 1678.51098633, 4.98899984, 0.00000000, 0.00000000, 265.97644043); //object(sub_roadleft) (49)
    CreateDynamicObject(705, -2620.51000977, 1599.34399414, 4.14900017, 0.00000000, 0.00000000, 346.99218750); //object(sm_veg_tree7vbig) (3)
    CreateDynamicObject(705, -2610.33007812, 1599.98803711, 4.14900017, 0.00000000, 0.00000000, 186.98730469); //object(sm_veg_tree7vbig) (4)
    CreateDynamicObject(705, -2608.03100586, 1651.19995117, 4.14900017, 0.00000000, 0.00000000, 186.98730469); //object(sm_veg_tree7vbig) (5)
    CreateDynamicObject(705, -2618.59912109, 1651.08605957, 4.14900017, 0.00000000, 0.00000000, 36.99218750); //object(sm_veg_tree7vbig) (6)
    CreateDynamicObject(705, -2637.81201172, 1622.38903809, 4.14900017, 0.00000000, 0.00000000, 346.99218750); //object(sm_veg_tree7vbig) (7)
    CreateDynamicObject(705, -2627.07910156, 1623.20104980, 4.14900017, 0.00000000, 0.00000000, 186.98730469); //object(sm_veg_tree7vbig) (8)
    CreateDynamicObject(979, -2606.08105469, 1507.87304688, 5.02099991, 0.00000000, 0.00000000, 113.99444580); //object(sub_roadleft) (50)
    CreateDynamicObject(979, -2604.04492188, 1496.99401855, 5.02099991, 0.00000000, 0.00000000, 89.99414062); //object(sub_roadleft) (51)
    CreateDynamicObject(979, -2604.01000977, 1485.96704102, 5.02099991, 0.00000000, 0.00000000, 89.98901367); //object(sub_roadleft) (52)
    CreateDynamicObject(979, -2603.98999023, 1475.05102539, 5.02099991, 0.00000000, 0.00000000, 89.98901367); //object(sub_roadleft) (53)
    CreateDynamicObject(979, -2603.91308594, 1464.32604980, 5.02099991, 0.00000000, 0.00000000, 89.98901367); //object(sub_roadleft) (54)
    CreateDynamicObject(979, -2609.34912109, 1460.18701172, 5.02099991, 0.00000000, 0.00000000, 355.98901367); //object(sub_roadleft) (55)
    CreateDynamicObject(979, -2619.83300781, 1461.57104492, 5.02099991, 0.00000000, 0.00000000, 347.98400879); //object(sub_roadleft) (56)
    CreateDynamicObject(979, -2629.77294922, 1465.72302246, 5.02099991, 0.00000000, 0.00000000, 325.98095703); //object(sub_roadleft) (57)
    CreateDynamicObject(979, -2636.26391602, 1474.01293945, 5.02099991, 0.00000000, 0.00000000, 291.98083496); //object(sub_roadleft) (58)
    CreateDynamicObject(979, -2639.69091797, 1483.97595215, 5.02099991, 0.00000000, 0.00000000, 285.97814941); //object(sub_roadleft) (59)
    CreateDynamicObject(712, -2604.22192383, 1502.65795898, 13.77999973, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (7)
    CreateDynamicObject(712, -2604.07031250, 1491.84863281, 13.77999973, 0.00000000, 0.00000000, 94.99328613); //object(vgs_palm03) (8)
    CreateDynamicObject(712, -2604.08911133, 1480.74304199, 13.77999973, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (9)
    CreateDynamicObject(712, -2604.13500977, 1469.72595215, 13.77999973, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (10)
    CreateDynamicObject(712, -2604.32788086, 1460.40405273, 13.77999973, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (11)
    CreateDynamicObject(712, -2641.82006836, 1487.98999023, 13.78100014, 0.00000000, 0.00000000, 344.99877930); //object(vgs_palm03) (12)
    CreateDynamicObject(712, -2638.44995117, 1478.50305176, 13.77999973, 0.00000000, 0.00000000, 344.99816895); //object(vgs_palm03) (13)
    CreateDynamicObject(712, -2634.33007812, 1468.41296387, 13.77999973, 0.00000000, 0.00000000, 344.99816895); //object(vgs_palm03) (14)
    CreateDynamicObject(712, -2625.16503906, 1462.20703125, 13.77999973, 0.00000000, 0.00000000, 344.99816895); //object(vgs_palm03) (15)
    CreateDynamicObject(712, -2614.59594727, 1460.13098145, 13.91699982, 0.00000000, 0.00000000, 344.99816895); //object(vgs_palm03) (16)
    CreateDynamicObject(705, -2609.51391602, 1704.51403809, 4.14900017, 0.00000000, 0.00000000, 186.98730469); //object(sm_veg_tree7vbig) (9)
    CreateDynamicObject(705, -2615.66992188, 1704.96704102, 4.14900017, 0.00000000, 0.00000000, 36.99096680); //object(sm_veg_tree7vbig) (10)
    CreateDynamicObject(705, -2691.04199219, 1682.01196289, 4.14900017, 0.00000000, 0.00000000, 36.99096680); //object(sm_veg_tree7vbig) (11)
    CreateDynamicObject(705, -2682.44702148, 1679.41503906, 4.14900017, 0.00000000, 0.00000000, 36.99096680); //object(sm_veg_tree7vbig) (12)
    CreateDynamicObject(3568, -2676.04589844, 1657.51904297, 6.76300001, 0.00000000, 0.00000000, 359.99743652); //object(lasntrk2) (4)
    CreateDynamicObject(979, -2709.83496094, 1669.24804688, 4.98899984, 0.00000000, 0.00000000, 269.97351074); //object(sub_roadleft) (60)
    CreateDynamicObject(979, -2709.83593750, 1659.91699219, 4.98899984, 0.00000000, 0.00000000, 269.97253418); //object(sub_roadleft) (61)
    CreateDynamicObject(979, -2709.83203125, 1650.62805176, 4.98899984, 0.00000000, 0.00000000, 269.97253418); //object(sub_roadleft) (62)
    CreateDynamicObject(7893, -2691.07104492, 1640.51293945, 4.71000004, 0.00000000, 0.00000000, 90.00000000); //object(vegascrashbar04) (6)
    CreateDynamicObject(979, -2697.49389648, 1645.76196289, 4.98899984, 0.00000000, 0.00000000, 359.98901367); //object(sub_roadleft) (63)
    CreateDynamicObject(979, -2705.22509766, 1645.76794434, 4.98899984, 0.00000000, 0.00000000, 359.98901367); //object(sub_roadleft) (64)
    CreateDynamicObject(979, -2697.48803711, 1635.32897949, 4.98899984, 0.00000000, 0.00000000, 179.99450684); //object(sub_roadleft) (65)
    CreateDynamicObject(979, -2706.58398438, 1633.92102051, 4.98899984, 0.00000000, 0.00000000, 197.99450684); //object(sub_roadleft) (66)
    CreateDynamicObject(979, -2712.30395508, 1628.02001953, 4.98899984, 0.00000000, 0.00000000, 253.99011230); //object(sub_roadleft) (67)
    CreateDynamicObject(979, -2713.76708984, 1618.81396484, 4.98899984, 0.00000000, 0.00000000, 267.98742676); //object(sub_roadleft) (68)
    CreateDynamicObject(979, -2716.08300781, 1610.06494141, 4.98899984, 0.00000000, 0.00000000, 241.98400879); //object(sub_roadleft) (69)
    CreateDynamicObject(979, -2718.24609375, 1601.25903320, 4.98899984, 0.00000000, 0.00000000, 269.97937012); //object(sub_roadleft) (70)
    CreateDynamicObject(979, -2718.24511719, 1591.88793945, 4.98899984, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (71)
    CreateDynamicObject(979, -2718.25000000, 1582.52001953, 4.98899984, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (72)
    CreateDynamicObject(7516, -2680.61791992, 1593.44494629, 8.13899994, 0.00000000, 0.00000000, 270.00000000); //object(vegasnfrates02) (3)
    CreateDynamicObject(979, -2715.23095703, 1574.20605469, 4.98899984, 0.00000000, 0.00000000, 309.97802734); //object(sub_roadleft) (73)
    CreateDynamicObject(979, -2707.53100586, 1570.10595703, 4.95800018, 0.00000000, 0.00000000, 353.97375488); //object(sub_roadleft) (74)
    CreateDynamicObject(979, -2698.19897461, 1569.44799805, 4.95800018, 0.00000000, 0.00000000, 357.96850586); //object(sub_roadleft) (75)
    CreateDynamicObject(7893, -2691.80590820, 1564.10803223, 4.67899990, 0.00000000, 0.00000000, 90.00000000); //object(vegascrashbar04) (7)
    CreateDynamicObject(705, -2694.22290039, 1639.61096191, 4.14900017, 0.00000000, 0.00000000, 36.99096680); //object(sm_veg_tree7vbig) (13)
    CreateDynamicObject(705, -2703.75610352, 1640.16296387, 4.14900017, 0.00000000, 0.00000000, 36.99096680); //object(sm_veg_tree7vbig) (14)
    CreateDynamicObject(712, -2714.32592773, 1669.89794922, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (17)
    CreateDynamicObject(712, -2714.12597656, 1657.32397461, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (18)
    CreateDynamicObject(712, -2713.96508789, 1643.00598145, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (19)
    CreateDynamicObject(712, -2714.03002930, 1630.32397461, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (20)
    CreateDynamicObject(712, -2716.59912109, 1620.78796387, 13.74800014, 0.00000000, 0.00000000, 94.99877930); //object(vgs_palm03) (21)
    CreateDynamicObject(979, -2693.65209961, 1554.16699219, 4.95800018, 0.00000000, 0.00000000, 269.99450684); //object(sub_roadleft) (76)
    CreateDynamicObject(979, -2693.64697266, 1544.82800293, 4.95800018, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadleft) (77)
    CreateDynamicObject(979, -2693.65307617, 1535.47302246, 4.95800018, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadleft) (78)
    CreateDynamicObject(979, -2693.65600586, 1526.08996582, 4.95800018, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadleft) (79)
    CreateDynamicObject(979, -2690.05297852, 1518.37304688, 4.95800018, 0.00000000, 0.00000000, 319.98901367); //object(sub_roadleft) (80)
    CreateDynamicObject(979, -2682.36499023, 1513.19299316, 4.95800018, 0.00000000, 0.00000000, 331.98779297); //object(sub_roadleft) (81)
    CreateDynamicObject(979, -2673.93994141, 1509.14501953, 5.02199984, 0.00000000, 0.00000000, 335.98486328); //object(sub_roadleft) (82)
    CreateDynamicObject(979, -2665.82299805, 1504.63500977, 5.02199984, 0.00000000, 0.00000000, 325.98388672); //object(sub_roadleft) (83)
    CreateDynamicObject(979, -2657.95800781, 1499.71301270, 5.02199984, 0.00000000, 0.00000000, 329.98083496); //object(sub_roadleft) (84)
    CreateDynamicObject(705, -2695.43994141, 1563.18798828, 4.11800003, 0.00000000, 0.00000000, 36.99096680); //object(sm_veg_tree7vbig) (15)
    CreateDynamicObject(705, -2704.98901367, 1563.54003906, 4.11800003, 0.00000000, 0.00000000, 36.99096680); //object(sm_veg_tree7vbig) (16)
    CreateDynamicObject(705, -2714.51708984, 1565.72399902, 4.11800003, 0.00000000, 0.00000000, 20.99096680); //object(sm_veg_tree7vbig) (17)
    CreateDynamicObject(705, -2699.04101562, 1549.88000488, 4.11800003, 0.00000000, 0.00000000, 270.98937988); //object(sm_veg_tree7vbig) (18)
    CreateDynamicObject(705, -2698.63110352, 1537.77404785, 4.11800003, 0.00000000, 0.00000000, 270.98876953); //object(sm_veg_tree7vbig) (19)
    CreateDynamicObject(705, -2698.09594727, 1523.51098633, 4.11800003, 0.00000000, 0.00000000, 270.98876953); //object(sm_veg_tree7vbig) (20)
    CreateDynamicObject(705, -2691.91308594, 1514.09301758, 4.11800003, 0.00000000, 0.00000000, 270.98876953); //object(sm_veg_tree7vbig) (21)
    CreateDynamicObject(705, -2679.25000000, 1506.06701660, 4.18200016, 0.00000000, 0.00000000, 270.98876953); //object(sm_veg_tree7vbig) (22)
    CreateDynamicObject(705, -2667.08203125, 1500.47302246, 4.18200016, 0.00000000, 0.00000000, 270.98876953); //object(sm_veg_tree7vbig) (23)
    CreateDynamicObject(7516, -2705.68603516, 1542.12805176, 8.10799980, 0.00000000, 0.00000000, 0.00000000); //object(vegasnfrates02) (4)
    CreateDynamicObject(7516, -2705.96508789, 1512.30297852, 8.10799980, 0.00000000, 0.00000000, 0.00000000); //object(vegasnfrates02) (5)
    CreateDynamicObject(11435, -2630.96997070, 1693.47595215, 10.11699963, 0.00000000, 0.00000000, 210.00000000); //object(des_indsign1) (1)
    CreateDynamicObject(18699, -2621.61303711, 1513.64599609, 9.24300003, 0.00000000, 0.00000000, 0.00000000); //object(jetpackp) (1)
    CreateDynamicObject(18714, -2734.89746094, 1669.93359375, -40.40229416, 0.00000000, 0.00000000, 0.00000000); //object(prt_sand) (1)
    CreateDynamicObject(19282, -2714.89990234, 1673.52404785, 8.96000004, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (1)
    CreateDynamicObject(19282, -2714.08911133, 1677.34301758, 9.05200005, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (2)
    CreateDynamicObject(19282, -2713.32104492, 1680.95202637, 9.06400013, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (3)
    CreateDynamicObject(19282, -2712.55004883, 1684.57995605, 8.98200035, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (4)
    CreateDynamicObject(19282, -2710.23706055, 1687.19604492, 8.60299969, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (5)
    CreateDynamicObject(19282, -2674.95703125, 1648.68200684, 5.70800018, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (6)
    CreateDynamicObject(19282, -2677.51293945, 1648.68200684, 5.73099995, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (7)
    CreateDynamicObject(19283, -2621.40991211, 1512.22595215, 10.91699982, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (1)
    CreateDynamicObject(19283, -2618.98291016, 1512.15002441, 10.95300007, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (2)
    CreateDynamicObject(19283, -2616.87890625, 1512.15002441, 10.93799973, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (3)
    CreateDynamicObject(19283, -2614.87597656, 1512.15002441, 10.92300034, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (4)
    CreateDynamicObject(19283, -2612.26293945, 1512.15002441, 10.91699982, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (5)
    CreateDynamicObject(19283, -2609.83789062, 1512.15002441, 10.92399979, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (6)
    CreateDynamicObject(19283, -2621.63989258, 1512.15002441, 9.15900040, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (7)
    CreateDynamicObject(19283, -2621.65698242, 1512.15002441, 6.93400002, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (8)
    CreateDynamicObject(19283, -2621.69995117, 1512.15002441, 4.71799994, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (9)
    CreateDynamicObject(19283, -2609.61108398, 1512.15795898, 8.84500027, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (10)
    CreateDynamicObject(19283, -2609.61206055, 1512.15795898, 7.04199982, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (11)
    CreateDynamicObject(19283, -2609.61401367, 1512.15795898, 5.24700022, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (12)
    CreateDynamicObject(979, -2607.76000977, 1515.98498535, 5.02099991, 0.00000000, 0.00000000, 93.99353027); //object(sub_roadleft) (87)
    CreateDynamicObject(19281, -2686.09594727, 1603.13793945, 8.17399979, 0.00000000, 0.00000000, 0.00000000); //object(pointlight1) (1)
    CreateDynamicObject(19281, -2684.60205078, 1603.04699707, 8.17399979, 0.00000000, 0.00000000, 0.00000000); //object(pointlight1) (2)
    CreateDynamicObject(19281, -2686.06201172, 1603.05895996, 8.17399979, 0.00000000, 0.00000000, 0.00000000); //object(pointlight1) (3)
    CreateDynamicObject(19281, -2684.79003906, 1603.03503418, 8.17399979, 0.00000000, 0.00000000, 0.00000000); //object(pointlight1) (4)
    CreateDynamicObject(979, -2606.65502930, 1533.82604980, 5.02099991, 0.00000000, 0.00000000, 63.99353027); //object(sub_roadleft) (3)
    CreateDynamicObject(712, -2604.49291992, 1539.16394043, 13.77999973, 0.00000000, 0.00000000, 94.99328613); //object(vgs_palm03) (8)
    //Дрифт 15
    AddStaticVehicle(562, 2812.06396484, 2120.41601562, 10.53299999, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2818.38598633, 2120.40600586, 10.53400040, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2809.05493164, 2105.23095703, 10.53899956, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2817.23193359, 2105.23291016, 10.54100037, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2825.67797852, 2105.29199219, 10.54199982, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2825.10009766, 2120.42211914, 10.54199982, 270.00000000, -1, -1); //Elegy
    CreateDynamicObject(982, 2852.77392578, 2116.31103516, 10.50399971, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (7)
    CreateDynamicObject(982, 2852.78002930, 2090.60400391, 10.50399971, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (8)
    CreateDynamicObject(982, 2852.80810547, 2065.01489258, 10.50399971, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (9)
    CreateDynamicObject(982, 2852.81396484, 2039.44799805, 10.50399971, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (10)
    CreateDynamicObject(978, 2852.54492188, 2021.96105957, 10.66100025, 0.00000000, 0.00000000, 86.00000000); //object(sub_roadright) (2)
    CreateDynamicObject(978, 2851.73608398, 2012.64001465, 10.66100025, 0.00000000, 0.00000000, 83.99548340); //object(sub_roadright) (3)
    CreateDynamicObject(978, 2850.14990234, 2003.48400879, 10.65299988, 0.00000000, 0.00000000, 75.99047852); //object(sub_roadright) (4)
    CreateDynamicObject(978, 2847.42993164, 1994.66796875, 10.66100025, 0.00000000, 0.00000000, 69.98693848); //object(sub_roadright) (5)
    CreateDynamicObject(978, 2843.69091797, 1986.25402832, 10.66100025, 0.00000000, 0.00000000, 61.98291016); //object(sub_roadright) (6)
    CreateDynamicObject(978, 2838.60888672, 1978.44396973, 10.66100025, 0.00000000, 0.00000000, 51.97937012); //object(sub_roadright) (7)
    CreateDynamicObject(978, 2832.52905273, 1971.48706055, 10.66100025, 0.00000000, 0.00000000, 45.97631836); //object(sub_roadright) (8)
    CreateDynamicObject(978, 2825.72412109, 1965.16101074, 10.66100025, 0.00000000, 0.00000000, 39.97229004); //object(sub_roadright) (9)
    CreateDynamicObject(978, 2818.39599609, 1959.65002441, 10.66100025, 0.00000000, 0.00000000, 33.96826172); //object(sub_roadright) (10)
    CreateDynamicObject(978, 2810.45288086, 1954.88598633, 10.66100025, 0.00000000, 0.00000000, 27.96423340); //object(sub_roadright) (11)
    CreateDynamicObject(978, 2802.01196289, 1950.98803711, 10.66100025, 0.00000000, 0.00000000, 21.96020508); //object(sub_roadright) (12)
    CreateDynamicObject(978, 2793.17089844, 1948.30505371, 10.66100025, 0.00000000, 0.00000000, 11.95617676); //object(sub_roadright) (13)
    CreateDynamicObject(978, 2784.20190430, 1946.89904785, 10.66100025, 0.00000000, 0.00000000, 5.95312500); //object(sub_roadright) (14)
    CreateDynamicObject(978, 2611.62402344, 1965.41296387, 10.51200008, 0.00000000, 0.00000000, 179.94909668); //object(sub_roadright) (16)
    CreateDynamicObject(978, 2604.62988281, 1965.43005371, 10.51200008, 0.00000000, 0.00000000, 179.94506836); //object(sub_roadright) (17)
    CreateDynamicObject(978, 2559.53295898, 1947.83398438, 10.66100025, 0.00000000, 0.00000000, 267.94506836); //object(sub_roadright) (18)
    CreateDynamicObject(978, 2559.90893555, 1960.67797852, 10.66100025, 0.00000000, 0.00000000, 267.94006348); //object(sub_roadright) (19)
    CreateDynamicObject(978, 2555.52490234, 1965.29797363, 10.66100025, 0.00000000, 0.00000000, 359.94006348); //object(sub_roadright) (20)
    CreateDynamicObject(978, 2546.19897461, 1965.31494141, 10.66100025, 0.00000000, 0.00000000, 359.93957520); //object(sub_roadright) (21)
    CreateDynamicObject(978, 2539.82299805, 1965.34704590, 10.66100025, 0.00000000, 0.00000000, 359.94006348); //object(sub_roadright) (22)
    CreateDynamicObject(978, 2532.98388672, 1959.02600098, 10.61699963, 0.00000000, 0.00000000, 91.93957520); //object(sub_roadright) (23)
    CreateDynamicObject(978, 2533.30395508, 1947.72705078, 10.66100025, 0.00000000, 0.00000000, 91.93908691); //object(sub_roadright) (24)
    CreateDynamicObject(713, 2533.33911133, 1953.77197266, 9.79699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (1)
    CreateDynamicObject(713, 2560.06005859, 1954.67895508, 9.73299980, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (2)
    CreateDynamicObject(713, 2534.50390625, 1964.46301270, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (3)
    CreateDynamicObject(713, 2598.56201172, 1966.22900391, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 2617.04199219, 1966.00305176, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (5)
    CreateDynamicObject(713, 2776.66699219, 1946.02099609, 9.86499977, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (6)
    CreateDynamicObject(713, 2771.08911133, 1945.78894043, 10.26099968, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, 2765.74194336, 1945.62902832, 10.64799976, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (8)
    CreateDynamicObject(713, 2760.68188477, 1945.55004883, 11.00699997, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, 2760.56811523, 1962.84802246, 11.01500034, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (10)
    CreateDynamicObject(713, 2765.62792969, 1962.69396973, 10.65600014, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (11)
    CreateDynamicObject(713, 2770.67211914, 1962.59204102, 10.29800034, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (12)
    CreateDynamicObject(713, 2775.55200195, 1962.59802246, 9.94400024, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (13)
    CreateDynamicObject(978, 2829.43798828, 1993.91796875, 10.65299988, 0.00000000, 0.00000000, 241.97937012); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2824.53100586, 1986.11303711, 10.66100025, 0.00000000, 0.00000000, 233.97387695); //object(sub_roadright) (26)
    CreateDynamicObject(978, 2818.56811523, 1979.01904297, 10.65299988, 0.00000000, 0.00000000, 225.97033691); //object(sub_roadright) (27)
    CreateDynamicObject(978, 2811.56811523, 1972.91894531, 10.66100025, 0.00000000, 0.00000000, 215.96679688); //object(sub_roadright) (28)
    CreateDynamicObject(978, 2803.58911133, 1968.12194824, 10.66100025, 0.00000000, 0.00000000, 205.96374512); //object(sub_roadright) (29)
    CreateDynamicObject(978, 2794.79809570, 1965.56994629, 10.66100025, 0.00000000, 0.00000000, 185.96069336); //object(sub_roadright) (30)
    CreateDynamicObject(713, 2525.44091797, 1973.72399902, 10.16399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (14)
    CreateDynamicObject(713, 2520.29199219, 1974.54394531, 10.17099953, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (15)
    CreateDynamicObject(713, 2520.01098633, 1965.91394043, 10.16399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (16)
    CreateDynamicObject(713, 2520.75292969, 1970.75000000, 10.16399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (17)
    CreateDynamicObject(3666, 2560.05395508, 1955.55297852, 10.24800014, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (1)
    CreateDynamicObject(3666, 2559.92993164, 1952.92102051, 10.25000000, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (2)
    CreateDynamicObject(3666, 2535.03491211, 1964.96801758, 10.33399963, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (3)
    CreateDynamicObject(3666, 2532.98706055, 1963.76293945, 10.34200001, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (4)
    CreateDynamicObject(3666, 2599.57788086, 1965.19604492, 10.33399963, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (5)
    CreateDynamicObject(3666, 2618.22290039, 1965.47900391, 10.53600025, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (6)
    CreateDynamicObject(3666, 2758.40893555, 1944.66101074, 11.68200016, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (7)
    CreateDynamicObject(3666, 2763.09790039, 1945.08703613, 11.34899998, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (8)
    CreateDynamicObject(3666, 2768.44311523, 1945.30102539, 10.97000027, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (9)
    CreateDynamicObject(3666, 2773.80395508, 1945.41296387, 10.58199978, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (10)
    CreateDynamicObject(3666, 2778.74194336, 1945.76196289, 10.33399963, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (11)
    CreateDynamicObject(3666, 2758.35693359, 1962.26599121, 11.68599987, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (12)
    CreateDynamicObject(3666, 2762.73901367, 1962.20104980, 11.37500000, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (13)
    CreateDynamicObject(3666, 2767.79589844, 1962.22595215, 11.01599979, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (14)
    CreateDynamicObject(3666, 2772.83203125, 1962.33203125, 10.65799999, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (15)
    CreateDynamicObject(3666, 2777.15087891, 1962.44897461, 10.34399986, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (16)
    CreateDynamicObject(3666, 2532.39111328, 1954.15100098, 10.33699989, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (17)
    CreateDynamicObject(3666, 2532.43090820, 1952.40002441, 10.33600044, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (18)
    CreateDynamicObject(3666, 2521.28808594, 1963.53100586, 10.67800045, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (19)
    CreateDynamicObject(3666, 2522.47802734, 1967.00500488, 10.67800045, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (20)
    CreateDynamicObject(3666, 2526.08007812, 1970.35705566, 10.67800045, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (21)
    CreateDynamicObject(3666, 2530.77587891, 1972.31494141, 10.67800045, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (22)
    CreateDynamicObject(978, 2512.21704102, 1943.18298340, 10.51200008, 0.00000000, 0.00000000, 357.93908691); //object(sub_roadright) (35)
    CreateDynamicObject(978, 2502.89501953, 1943.53698730, 10.51799965, 0.00000000, 0.00000000, 357.93457031); //object(sub_roadright) (36)
    CreateDynamicObject(713, 2514.83593750, 1940.65100098, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (18)
    CreateDynamicObject(713, 2507.63598633, 1940.14904785, 9.67199993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (19)
    CreateDynamicObject(713, 2500.19091797, 1940.25097656, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (20)
    CreateDynamicObject(978, 2513.56811523, 1984.53100586, 10.51200008, 0.00000000, 0.00000000, 179.93457031); //object(sub_roadright) (37)
    CreateDynamicObject(978, 2501.56811523, 1984.36499023, 10.66100025, 0.00000000, 0.00000000, 179.93408203); //object(sub_roadright) (38)
    CreateDynamicObject(3666, 2517.59301758, 1963.48498535, 10.67800045, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (23)
    CreateDynamicObject(3666, 2506.37988281, 1984.54394531, 10.18599987, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (24)
    CreateDynamicObject(3666, 2508.71606445, 1984.62402344, 10.18599987, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (25)
    CreateDynamicObject(713, 2507.69995117, 1985.30297852, 9.67199993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (21)
    CreateDynamicObject(978, 2486.52294922, 1962.94299316, 10.64999962, 0.00000000, 0.00000000, 359.93457031); //object(sub_roadright) (39)
    CreateDynamicObject(978, 2463.68701172, 1962.96997070, 10.65799999, 0.00000000, 0.00000000, 359.93408203); //object(sub_roadright) (40)
    CreateDynamicObject(978, 2407.90087891, 1978.53503418, 10.65299988, 0.00000000, 0.00000000, 269.93408203); //object(sub_roadright) (41)
    CreateDynamicObject(978, 2407.90307617, 1968.12902832, 10.65299988, 0.00000000, 0.00000000, 269.92858887); //object(sub_roadright) (42)
    CreateDynamicObject(3666, 2408.22509766, 1963.51293945, 10.33399963, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (26)
    CreateDynamicObject(3666, 2408.23095703, 1983.14904785, 10.33399963, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (27)
    CreateDynamicObject(713, 2408.00805664, 1973.75903320, 9.67199993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (22)
    CreateDynamicObject(978, 2409.02807617, 2047.16296387, 10.61100006, 0.00000000, 0.00000000, 249.92858887); //object(sub_roadright) (43)
    CreateDynamicObject(978, 2412.47192383, 2055.63696289, 10.60499954, 0.00000000, 0.00000000, 245.92797852); //object(sub_roadright) (44)
    CreateDynamicObject(978, 2418.46411133, 2062.08398438, 10.61299992, 0.00000000, 0.00000000, 207.92346191); //object(sub_roadright) (45)
    CreateDynamicObject(978, 2424.15405273, 2065.04101562, 10.66100025, 0.00000000, 0.00000000, 207.92175293); //object(sub_roadright) (46)
    CreateDynamicObject(713, 2405.26708984, 2046.80895996, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (23)
    CreateDynamicObject(713, 2407.61596680, 2053.01000977, 9.68000031, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (24)
    CreateDynamicObject(713, 2410.47192383, 2059.76611328, 9.81299973, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (25)
    CreateDynamicObject(713, 2415.03002930, 2063.21289062, 9.81299973, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (26)
    CreateDynamicObject(978, 2444.94311523, 2042.97802734, 10.66100025, 0.00000000, 0.00000000, 359.93408203); //object(sub_roadright) (47)
    CreateDynamicObject(978, 2451.76098633, 2042.98205566, 10.66100025, 0.00000000, 0.00000000, 359.93408203); //object(sub_roadright) (48)
    CreateDynamicObject(982, 2840.80102539, 2133.50488281, 10.50399971, 0.00000000, 0.00000000, 70.00000000); //object(fenceshit) (12)
    CreateDynamicObject(978, 2502.08398438, 2042.87194824, 10.66100025, 0.00000000, 0.00000000, 359.93408203); //object(sub_roadright) (49)
    CreateDynamicObject(978, 2512.92700195, 2042.76794434, 10.66100025, 0.00000000, 0.00000000, 359.93408203); //object(sub_roadright) (50)
    CreateDynamicObject(978, 2535.08300781, 2047.12402344, 10.51099968, 0.00000000, 0.00000000, 59.93408203); //object(sub_roadright) (51)
    CreateDynamicObject(978, 2538.28295898, 2055.51293945, 10.51000023, 0.00000000, 0.00000000, 77.93041992); //object(sub_roadright) (52)
    CreateDynamicObject(978, 2539.78198242, 2062.50488281, 10.47499943, 0.00000000, 0.00000000, 77.92602539); //object(sub_roadright) (53)
    CreateDynamicObject(713, 2507.66601562, 2043.40905762, 9.66699982, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (27)
    CreateDynamicObject(713, 2543.22705078, 2063.61791992, 10.10000038, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (28)
    CreateDynamicObject(713, 2542.16796875, 2057.85302734, 9.80799961, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (29)
    CreateDynamicObject(713, 2541.12109375, 2051.62597656, 9.67800045, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (30)
    CreateDynamicObject(713, 2538.34204102, 2045.02294922, 9.82499981, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (31)
    CreateDynamicObject(978, 2521.78588867, 2122.97802734, 10.51099968, 0.00000000, 0.00000000, 179.94506836); //object(sub_roadright) (54)
    CreateDynamicObject(978, 2529.41308594, 2122.94409180, 10.51099968, 0.00000000, 0.00000000, 179.94506836); //object(sub_roadright) (55)
    CreateDynamicObject(978, 2538.38598633, 2124.68212891, 10.51100063, 0.00000000, 0.00000000, 201.94506836); //object(sub_roadright) (56)
    CreateDynamicObject(978, 2589.25488281, 2125.37402344, 10.66100025, 0.00000000, 0.00000000, 179.94506836); //object(sub_roadright) (57)
    CreateDynamicObject(978, 2596.11206055, 2125.33789062, 10.66100025, 0.00000000, 0.00000000, 179.94506836); //object(sub_roadright) (58)
    CreateDynamicObject(978, 2632.17089844, 2125.33398438, 10.48999977, 0.00000000, 0.00000000, 179.94506836); //object(sub_roadright) (59)
    CreateDynamicObject(978, 2641.50000000, 2125.30688477, 10.49400043, 0.00000000, 0.00000000, 179.94506836); //object(sub_roadright) (60)
    CreateDynamicObject(978, 2649.95190430, 2124.15307617, 10.51900005, 0.00000000, 0.00000000, 165.94506836); //object(sub_roadright) (61)
    CreateDynamicObject(978, 2604.12304688, 2102.96191406, 10.65499973, 0.00000000, 0.00000000, 359.93408203); //object(sub_roadright) (62)
    CreateDynamicObject(978, 2644.04003906, 2103.09008789, 10.66199970, 0.00000000, 0.00000000, 359.93408203); //object(sub_roadright) (65)
    CreateDynamicObject(978, 2653.33203125, 2103.08105469, 10.64299965, 0.00000000, 0.00000000, 359.93408203); //object(sub_roadright) (66)
    CreateDynamicObject(978, 2662.74511719, 2103.20703125, 11.02600002, 0.00000000, 357.00000000, 359.93408203); //object(sub_roadright) (67)
    CreateDynamicObject(978, 2671.91088867, 2103.20092773, 11.50299931, 0.00000000, 356.99523926, 359.93408203); //object(sub_roadright) (68)
    CreateDynamicObject(713, 2599.01489258, 2102.09497070, 9.81499958, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (32)
    CreateDynamicObject(713, 2656.77807617, 2122.50097656, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (33)
    CreateDynamicObject(713, 2662.29296875, 2122.45898438, 10.15299988, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (34)
    CreateDynamicObject(713, 2668.51391602, 2122.55395508, 10.59899998, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (35)
    CreateDynamicObject(713, 2675.05200195, 2122.79296875, 11.06799984, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (36)
    CreateDynamicObject(713, 2677.23095703, 2103.96411133, 11.22500038, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (37)
    CreateDynamicObject(713, 2638.12988281, 2103.38403320, 9.65799999, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (38)
    CreateDynamicObject(713, 2633.75097656, 2103.34204102, 9.64599991, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (39)
    CreateDynamicObject(713, 2629.88696289, 2103.59301758, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (40)
    CreateDynamicObject(713, 2760.10693359, 2122.89208984, 11.04800034, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (41)
    CreateDynamicObject(713, 2766.44604492, 2122.99609375, 10.59799957, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (42)
    CreateDynamicObject(713, 2772.82006836, 2122.98999023, 10.14500046, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (43)
    CreateDynamicObject(713, 2779.65087891, 2122.94311523, 9.81299973, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (44)
    CreateDynamicObject(713, 2785.77099609, 2122.81298828, 9.81200027, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (45)
    CreateDynamicObject(713, 2791.10888672, 2122.75805664, 9.80099964, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (46)
    CreateDynamicObject(713, 2796.54394531, 2122.70703125, 9.65799999, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (47)
    CreateDynamicObject(713, 2801.72509766, 2122.84912109, 9.63700008, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (48)
    CreateDynamicObject(713, 2807.74707031, 2122.82299805, 9.81400013, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (49)
    CreateDynamicObject(713, 2760.44702148, 2104.70288086, 11.02400017, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (50)
    CreateDynamicObject(713, 2766.20190430, 2104.67504883, 10.61499977, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (51)
    CreateDynamicObject(713, 2772.66088867, 2104.84399414, 10.14900017, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (52)
    CreateDynamicObject(713, 2779.14697266, 2104.70996094, 9.81400013, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (53)
    CreateDynamicObject(713, 2784.44409180, 2104.58203125, 9.81700039, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (54)
    CreateDynamicObject(713, 2790.79907227, 2104.58789062, 9.80099964, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (55)
    CreateDynamicObject(713, 2796.40209961, 2105.02709961, 9.74600029, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (56)
    CreateDynamicObject(713, 2801.55493164, 2104.76098633, 9.72299957, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (57)
    CreateDynamicObject(713, 2806.07910156, 2102.56689453, 9.76500034, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (58)
    CreateDynamicObject(713, 2856.25903320, 2122.36303711, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (59)
    CreateDynamicObject(713, 2856.64501953, 2104.06201172, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (60)
    CreateDynamicObject(713, 2856.13110352, 2083.31005859, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (61)
    CreateDynamicObject(713, 2856.17309570, 2063.38305664, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (62)
    CreateDynamicObject(713, 2856.41796875, 2043.34399414, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (63)
    CreateDynamicObject(713, 2856.31201172, 2023.38696289, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (64)
    CreateDynamicObject(713, 2853.18505859, 2000.69799805, 9.81299973, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (65)
    CreateDynamicObject(713, 2841.59790039, 2137.49389648, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (66)
    CreateDynamicObject(713, 2847.72900391, 2135.27587891, 9.67199993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (67)
    CreateDynamicObject(713, 2856.38696289, 2132.21508789, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (68)
    CreateDynamicObject(713, 2843.57202148, 1980.27600098, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (69)
    CreateDynamicObject(713, 2829.32910156, 1963.86804199, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (70)
    CreateDynamicObject(713, 2810.27905273, 1951.83300781, 9.81999969, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (71)
    CreateDynamicObject(713, 2788.95605469, 1944.93005371, 9.81299973, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (72)
    CreateDynamicObject(3666, 2762.99707031, 2122.32495117, 11.35700035, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (28)
    CreateDynamicObject(3666, 2769.31591797, 2122.37988281, 10.90799999, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (29)
    CreateDynamicObject(3666, 2775.89794922, 2122.51293945, 10.43299961, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (30)
    CreateDynamicObject(3666, 2782.52099609, 2122.46191406, 10.32600021, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (31)
    CreateDynamicObject(3666, 2788.18603516, 2122.35400391, 10.32199955, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (32)
    CreateDynamicObject(3666, 2793.62207031, 2122.67407227, 10.17300034, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (33)
    CreateDynamicObject(3666, 2798.65795898, 2122.65087891, 10.17000008, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (34)
    CreateDynamicObject(3666, 2804.48706055, 2122.30102539, 10.31400013, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (35)
    CreateDynamicObject(3666, 2803.84301758, 2103.20605469, 10.31599998, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (36)
    CreateDynamicObject(3666, 2798.76611328, 2104.13989258, 10.21599960, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (37)
    CreateDynamicObject(3666, 2793.66992188, 2104.12011719, 10.21300030, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (38)
    CreateDynamicObject(3666, 2787.34008789, 2104.27587891, 10.33100033, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (39)
    CreateDynamicObject(3666, 2781.81811523, 2104.43408203, 10.33100033, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (40)
    CreateDynamicObject(3666, 2775.88305664, 2104.41308594, 10.43400002, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (41)
    CreateDynamicObject(3666, 2769.34301758, 2104.56201172, 10.90600014, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (42)
    CreateDynamicObject(3666, 2763.34692383, 2104.51611328, 11.33199978, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (43)
    CreateDynamicObject(3666, 2758.12207031, 2104.28100586, 11.70300007, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las) (44)
    CreateDynamicObject(4828, 2889.30297852, 2037.94201660, 22.92399979, 0.00000000, 0.00000000, 0.00000000); //object(lasairprt5) (1)
    CreateDynamicObject(14467, 2832.81298828, 2122.23388672, 12.55399990, 0.00000000, 0.00000000, 272.00000000); //object(carter_statue) (1)
    CreateDynamicObject(14467, 2833.31909180, 2103.72290039, 12.55399990, 0.00000000, 0.00000000, 271.99951172); //object(carter_statue) (2)
    CreateDynamicObject(3524, 2833.43701172, 2105.21801758, 12.70600033, 0.00000000, 0.00000000, 288.00000000); //object(skullpillar01_lvs) (1)
    CreateDynamicObject(3524, 2833.04101562, 2121.49804688, 12.70600033, 0.00000000, 0.00000000, 287.99560547); //object(skullpillar01_lvs) (2)
    //Спринт 1
    AddStaticVehicle(541, 1324.03601074, -2548.27905273, 13.42700005, 246.00000000, 6, 6); //Bullet
    AddStaticVehicle(541, 1324.12805176, -2552.22509766, 13.42700005, 246.00000000, 6, 6); //Bullet
    AddStaticVehicle(562, 1355.71594238, -2551.34594727, 13.26799965, 130.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 1354.52099609, -2547.87890625, 13.26799965, 129.99572754, -1, -1); //Elegy
    CreateDynamicObject(979, 1325.77600098, -2569.66088867, 13.38700008, 0.00000000, 0.00000000, 276.00000000); //object(sub_roadleft) (2)
    CreateDynamicObject(979, 1326.75097656, -2578.95996094, 13.38700008, 0.00000000, 0.00000000, 275.99853516); //object(sub_roadleft) (3)
    CreateDynamicObject(979, 1327.73498535, -2588.28198242, 13.38700008, 0.00000000, 0.00000000, 275.99853516); //object(sub_roadleft) (4)
    CreateDynamicObject(979, 1329.51000977, -2597.36499023, 13.38700008, 0.00000000, 0.00000000, 285.99853516); //object(sub_roadleft) (5)
    CreateDynamicObject(979, 1332.08605957, -2606.35791016, 13.38700008, 0.00000000, 0.00000000, 285.99609375); //object(sub_roadleft) (6)
    CreateDynamicObject(979, 1334.66003418, -2615.37304688, 13.38700008, 0.00000000, 0.00000000, 285.99609375); //object(sub_roadleft) (7)
    CreateDynamicObject(979, 1338.25695801, -2623.84008789, 13.38700008, 0.00000000, 0.00000000, 299.99609375); //object(sub_roadleft) (8)
    CreateDynamicObject(979, 1342.94104004, -2631.96899414, 13.38700008, 0.00000000, 0.00000000, 299.99267578); //object(sub_roadleft) (9)
    CreateDynamicObject(979, 1348.15197754, -2639.68994141, 13.38700008, 0.00000000, 0.00000000, 307.99267578); //object(sub_roadleft) (10)
    CreateDynamicObject(979, 1353.94104004, -2647.08105469, 13.39400005, 0.00000000, 0.00000000, 307.99072266); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1359.96594238, -2654.27905273, 13.39400005, 0.00000000, 0.00000000, 311.99072266); //object(sub_roadleft) (12)
    CreateDynamicObject(979, 1366.72204590, -2660.59204102, 13.38700008, 0.00000000, 0.00000000, 321.98974609); //object(sub_roadleft) (13)
    CreateDynamicObject(979, 1374.05895996, -2666.32104492, 13.38700008, 0.00000000, 0.00000000, 321.98730469); //object(sub_roadleft) (14)
    CreateDynamicObject(979, 1381.78198242, -2671.34204102, 13.38700008, 0.00000000, 0.00000000, 331.98730469); //object(sub_roadleft) (15)
    CreateDynamicObject(979, 1390.06396484, -2675.74389648, 13.38700008, 0.00000000, 0.00000000, 331.98486328); //object(sub_roadleft) (16)
    CreateDynamicObject(979, 1398.32495117, -2680.13403320, 13.38700008, 0.00000000, 0.00000000, 331.98486328); //object(sub_roadleft) (17)
    CreateDynamicObject(979, 1406.97399902, -2683.62402344, 13.38700008, 0.00000000, 0.00000000, 343.98486328); //object(sub_roadleft) (18)
    CreateDynamicObject(979, 1415.98901367, -2686.20410156, 13.38700008, 0.00000000, 0.00000000, 343.98193359); //object(sub_roadleft) (19)
    CreateDynamicObject(979, 1425.08203125, -2688.30200195, 13.38700008, 0.00000000, 0.00000000, 349.98193359); //object(sub_roadleft) (20)
    CreateDynamicObject(979, 1434.11303711, -2689.88891602, 13.38700008, 0.00000000, 0.00000000, 349.98046875); //object(sub_roadleft) (21)
    CreateDynamicObject(979, 1442.74694824, -2693.04589844, 13.38700008, 0.00000000, 0.00000000, 329.98046875); //object(sub_roadleft) (22)
    CreateDynamicObject(979, 2180.36694336, -2484.55810547, 13.21500015, 0.00000000, 0.00000000, 177.99072266); //object(sub_roadleft) (23)
    CreateDynamicObject(979, 2170.99902344, -2484.23608398, 13.21500015, 0.00000000, 0.00000000, 177.98950195); //object(sub_roadleft) (24)
    CreateDynamicObject(979, 2161.62402344, -2484.05810547, 13.21500015, 0.00000000, 0.00000000, 179.98950195); //object(sub_roadleft) (25)
    CreateDynamicObject(979, 2152.56201172, -2484.03588867, 13.21500015, 0.00000000, 0.00000000, 179.98950195); //object(sub_roadleft) (26)
    CreateDynamicObject(979, 2216.03808594, -2485.03198242, 13.20699978, 0.00000000, 0.00000000, 179.98950195); //object(sub_roadleft) (27)
    CreateDynamicObject(979, 2225.40991211, -2485.18798828, 13.20800018, 0.00000000, 0.00000000, 177.98937988); //object(sub_roadleft) (28)
    CreateDynamicObject(979, 2230.49291992, -2490.28100586, 13.38700008, 0.00000000, 0.00000000, 89.98400879); //object(sub_roadleft) (29)
    CreateDynamicObject(979, 2230.49194336, -2497.26489258, 13.38700008, 0.00000000, 0.00000000, 89.97851562); //object(sub_roadleft) (30)
    CreateDynamicObject(979, 2230.48510742, -2506.62597656, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (31)
    CreateDynamicObject(713, 2152.58007812, -2475.92504883, 12.55399990, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (2)
    CreateDynamicObject(713, 2167.52807617, -2472.07592773, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (3)
    CreateDynamicObject(713, 2182.69604492, -2471.87890625, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1440.60705566, -2696.14990234, 12.53899956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (5)
    CreateDynamicObject(713, 1427.50805664, -2693.22705078, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (6)
    CreateDynamicObject(713, 1413.55395508, -2690.34497070, 12.53899956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, 1398.25097656, -2685.43798828, 12.53899956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (8)
    CreateDynamicObject(713, 1381.40100098, -2676.48388672, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, 1365.68896484, -2665.15795898, 12.53899956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (10)
    CreateDynamicObject(713, 1353.61804199, -2653.37011719, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (11)
    CreateDynamicObject(713, 1342.29602051, -2638.22607422, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (12)
    CreateDynamicObject(713, 1334.64001465, -2624.12109375, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (13)
    CreateDynamicObject(713, 1329.25598145, -2610.71997070, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (14)
    CreateDynamicObject(713, 1325.02697754, -2597.83789062, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (15)
    CreateDynamicObject(713, 1323.04199219, -2584.54711914, 12.53899956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (16)
    CreateDynamicObject(713, 1321.63793945, -2573.17797852, 12.53899956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (17)
    CreateDynamicObject(713, 1320.64697266, -2563.64990234, 12.53899956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (18)
    CreateDynamicObject(713, 2217.26293945, -2481.33300781, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (19)
    CreateDynamicObject(713, 2225.18310547, -2480.99096680, 12.39599991, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (20)
    CreateDynamicObject(713, 2230.37597656, -2485.11206055, 12.37399960, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (21)
    CreateDynamicObject(713, 2233.82202148, -2488.95288086, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (22)
    CreateDynamicObject(713, 2233.84204102, -2501.41503906, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (23)
    CreateDynamicObject(979, 2230.48803711, -2516.00195312, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (32)
    CreateDynamicObject(979, 2230.49194336, -2525.35791016, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (33)
    CreateDynamicObject(979, 2230.50195312, -2534.69799805, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (34)
    CreateDynamicObject(979, 2230.50097656, -2543.27294922, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (35)
    CreateDynamicObject(979, 2230.49707031, -2552.64404297, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (36)
    CreateDynamicObject(979, 2230.50610352, -2561.95898438, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (37)
    CreateDynamicObject(979, 2230.50708008, -2571.34008789, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (38)
    CreateDynamicObject(979, 2230.50805664, -2580.72094727, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (39)
    CreateDynamicObject(979, 2230.50805664, -2590.08593750, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (40)
    CreateDynamicObject(979, 2230.51489258, -2599.45410156, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (41)
    CreateDynamicObject(979, 2230.50610352, -2608.83398438, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (42)
    CreateDynamicObject(979, 2230.50000000, -2618.20800781, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (43)
    CreateDynamicObject(979, 2230.48706055, -2627.58105469, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (44)
    CreateDynamicObject(979, 2230.47802734, -2636.94189453, 13.38700008, 0.00000000, 0.00000000, 89.97802734); //object(sub_roadleft) (45)
    CreateDynamicObject(979, 2231.92504883, -2646.05493164, 13.39500046, 0.00000000, 0.00000000, 107.97805786); //object(sub_roadleft) (46)
    CreateDynamicObject(979, 2236.89892578, -2653.43505859, 13.38700008, 0.00000000, 0.00000000, 139.97366333); //object(sub_roadleft) (47)
    CreateDynamicObject(979, 2245.08593750, -2656.56298828, 13.39500046, 0.00000000, 0.00000000, 177.97235107); //object(sub_roadleft) (48)
    CreateDynamicObject(979, 2254.45800781, -2656.72998047, 13.39500046, 0.00000000, 0.00000000, 179.96801758); //object(sub_roadleft) (49)
    CreateDynamicObject(979, 2263.67309570, -2655.61889648, 13.39799976, 0.00000000, 0.00000000, 193.96704102); //object(sub_roadleft) (50)
    CreateDynamicObject(713, 2233.52392578, -2516.18603516, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (24)
    CreateDynamicObject(713, 2233.47192383, -2534.50610352, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (25)
    CreateDynamicObject(713, 2233.23608398, -2556.62597656, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (26)
    CreateDynamicObject(713, 2233.61791992, -2573.71508789, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (27)
    CreateDynamicObject(713, 2233.06201172, -2592.06689453, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (28)
    CreateDynamicObject(713, 2233.05493164, -2609.97802734, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (29)
    CreateDynamicObject(713, 2232.66210938, -2628.78295898, 12.54699993, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (30)
    CreateDynamicObject(713, 2236.29394531, -2647.14501953, 12.56799984, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (31)
    CreateDynamicObject(713, 2251.61401367, -2652.42089844, 12.55000019, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (32)
    CreateDynamicObject(713, 2264.55810547, -2652.72192383, 12.55900002, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (33)
    CreateDynamicObject(981, 2167.54492188, -2481.90698242, 12.54699993, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (1)
    CreateDynamicObject(981, 2167.74804688, -2479.03710938, 12.54699993, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (2)
    CreateDynamicObject(981, 2202.49194336, -2506.87011719, 12.54699993, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (3)
    CreateDynamicObject(979, 2190.79492188, -2505.46997070, 13.38700008, 0.00000000, 0.00000000, 359.98950195); //object(sub_roadleft) (51)
    CreateDynamicObject(979, 2200.12988281, -2505.46606445, 13.38700008, 0.00000000, 0.00000000, 359.98852539); //object(sub_roadleft) (52)
    CreateDynamicObject(979, 2209.50097656, -2505.45410156, 13.38700008, 0.00000000, 0.00000000, 359.98352051); //object(sub_roadleft) (53)
    CreateDynamicObject(979, 2215.11694336, -2505.47509766, 13.38700008, 0.00000000, 0.00000000, 359.98352051); //object(sub_roadleft) (54)
    CreateDynamicObject(979, 2219.66088867, -2510.06689453, 13.38700008, 0.00000000, 0.00000000, 269.98352051); //object(sub_roadleft) (55)
    CreateDynamicObject(979, 2219.66992188, -2519.44409180, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (56)
    CreateDynamicObject(979, 2219.66894531, -2528.82104492, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (57)
    CreateDynamicObject(979, 2219.65991211, -2538.18188477, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (58)
    CreateDynamicObject(979, 2219.65502930, -2547.54809570, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (59)
    CreateDynamicObject(979, 2219.64990234, -2556.92211914, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (60)
    CreateDynamicObject(979, 2219.63598633, -2566.28710938, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (61)
    CreateDynamicObject(979, 2219.63891602, -2575.67211914, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (62)
    CreateDynamicObject(979, 2219.62792969, -2585.03710938, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (63)
    CreateDynamicObject(979, 2219.61791992, -2594.41308594, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (64)
    CreateDynamicObject(979, 2219.59497070, -2603.78100586, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (65)
    CreateDynamicObject(979, 2219.58593750, -2613.15893555, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (66)
    CreateDynamicObject(979, 2219.57006836, -2622.51806641, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (67)
    CreateDynamicObject(979, 2219.57202148, -2631.86108398, 13.38700008, 0.00000000, 0.00000000, 269.97802734); //object(sub_roadleft) (68)
    CreateDynamicObject(979, 2219.89111328, -2641.09204102, 13.38700008, 0.00000000, 0.00000000, 273.97802734); //object(sub_roadleft) (69)
    CreateDynamicObject(979, 2221.34204102, -2650.32910156, 13.39900017, 0.00000000, 0.00000000, 283.97705078); //object(sub_roadleft) (70)
    CreateDynamicObject(979, 2225.46191406, -2658.50195312, 13.38700008, 0.00000000, 0.00000000, 309.97460938); //object(sub_roadleft) (71)
    CreateDynamicObject(979, 2232.42700195, -2664.54101562, 13.38099957, 0.00000000, 0.00000000, 327.97375488); //object(sub_roadleft) (72)
    CreateDynamicObject(979, 2240.87988281, -2667.93188477, 13.40799999, 0.00000000, 0.00000000, 347.96936035); //object(sub_roadleft) (73)
    CreateDynamicObject(979, 2250.15600586, -2668.93188477, 13.40299988, 0.00000000, 0.00000000, 359.96447754); //object(sub_roadleft) (74)
    CreateDynamicObject(979, 2259.49511719, -2668.93701172, 13.40299988, 0.00000000, 0.00000000, 359.96154785); //object(sub_roadleft) (75)
    CreateDynamicObject(979, 2268.47802734, -2670.67504883, 13.41600037, 0.00000000, 0.00000000, 337.96154785); //object(sub_roadleft) (76)
    CreateDynamicObject(979, 2391.36206055, -2669.80493164, 13.50399971, 0.00000000, 0.00000000, 7.96154785); //object(sub_roadleft) (77)
    CreateDynamicObject(979, 2400.65893555, -2669.14892578, 13.50399971, 0.00000000, 0.00000000, 359.96154785); //object(sub_roadleft) (78)
    CreateDynamicObject(979, 2410.02294922, -2669.15087891, 13.50399971, 0.00000000, 0.00000000, 359.96154785); //object(sub_roadleft) (79)
    CreateDynamicObject(979, 2419.41503906, -2669.16894531, 13.50399971, 0.00000000, 0.00000000, 359.96154785); //object(sub_roadleft) (80)
    CreateDynamicObject(979, 2428.78808594, -2669.17895508, 13.50399971, 0.00000000, 0.00000000, 359.96154785); //object(sub_roadleft) (81)
    CreateDynamicObject(979, 2438.16088867, -2669.18090820, 13.50399971, 0.00000000, 0.00000000, 359.96154785); //object(sub_roadleft) (82)
    CreateDynamicObject(981, 2429.14892578, -2672.60595703, 12.66399956, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (4)
    CreateDynamicObject(981, 2399.58593750, -2672.57495117, 12.66399956, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (5)
    CreateDynamicObject(981, 2401.89697266, -2654.55102539, 12.66399956, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (6)
    CreateDynamicObject(981, 2454.50390625, -2672.57495117, 12.67099953, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (7)
    CreateDynamicObject(979, 2447.52294922, -2669.18994141, 13.50399971, 0.00000000, 0.00000000, 359.96154785); //object(sub_roadleft) (84)
    CreateDynamicObject(979, 2456.90087891, -2669.20605469, 13.50399971, 0.00000000, 0.00000000, 359.96105957); //object(sub_roadleft) (85)
    CreateDynamicObject(979, 2466.20898438, -2668.54907227, 13.52099991, 0.00000000, 0.00000000, 7.95605469); //object(sub_roadleft) (86)
    CreateDynamicObject(979, 2475.03710938, -2665.90991211, 13.48900032, 0.00000000, 0.00000000, 25.95410156); //object(sub_roadleft) (87)
    CreateDynamicObject(979, 2482.62109375, -2660.61596680, 13.48900032, 0.00000000, 0.00000000, 43.95068359); //object(sub_roadleft) (88)
    CreateDynamicObject(979, 2488.21411133, -2653.22509766, 13.52400017, 0.00000000, 0.00000000, 61.94531250); //object(sub_roadleft) (89)
    CreateDynamicObject(979, 2490.96191406, -2644.44409180, 13.48900032, 0.00000000, 0.00000000, 83.94091797); //object(sub_roadleft) (90)
    CreateDynamicObject(979, 2491.44897461, -2635.16894531, 13.48900032, 0.00000000, 0.00000000, 89.93554688); //object(sub_roadleft) (91)
    CreateDynamicObject(979, 2491.46801758, -2625.80810547, 13.48900032, 0.00000000, 0.00000000, 89.93359375); //object(sub_roadleft) (92)
    CreateDynamicObject(981, 2430.90502930, -2654.56201172, 12.66399956, 0.00000000, 0.00000000, 0.00000000); //object(helix_barrier) (8)
    CreateDynamicObject(981, 2475.82299805, -2629.22998047, 12.64799976, 0.00000000, 0.00000000, 270.00000000); //object(helix_barrier) (9)
    CreateDynamicObject(979, 2491.47607422, -2616.45800781, 13.48900032, 0.00000000, 0.00000000, 89.93359375); //object(sub_roadleft) (93)
    CreateDynamicObject(979, 2491.49096680, -2607.10498047, 13.48900032, 0.00000000, 0.00000000, 89.93359375); //object(sub_roadleft) (94)
    CreateDynamicObject(979, 2491.50097656, -2597.73095703, 13.48900032, 0.00000000, 0.00000000, 89.93359375); //object(sub_roadleft) (95)
    CreateDynamicObject(979, 2491.52807617, -2588.35888672, 13.48900032, 0.00000000, 0.00000000, 89.93359375); //object(sub_roadleft) (96)
    CreateDynamicObject(979, 2491.53906250, -2579.00000000, 13.48900032, 0.00000000, 0.00000000, 89.92858887); //object(sub_roadleft) (97)
    CreateDynamicObject(979, 2491.56396484, -2569.61206055, 13.48900032, 0.00000000, 0.00000000, 89.92858887); //object(sub_roadleft) (98)
    CreateDynamicObject(979, 2491.58105469, -2560.22705078, 13.49499989, 0.00000000, 0.00000000, 89.92858887); //object(sub_roadleft) (99)
    CreateDynamicObject(979, 2491.59008789, -2550.86206055, 13.49499989, 0.00000000, 0.00000000, 89.92858887); //object(sub_roadleft) (100)
    CreateDynamicObject(979, 2491.60693359, -2541.48999023, 13.48900032, 0.00000000, 0.00000000, 89.92858887); //object(sub_roadleft) (101)
    CreateDynamicObject(979, 2491.63110352, -2532.16796875, 13.48900032, 0.00000000, 0.00000000, 89.92858887); //object(sub_roadleft) (102)
    CreateDynamicObject(979, 2492.48510742, -2522.86889648, 13.48900032, 0.00000000, 0.00000000, 79.92858887); //object(sub_roadleft) (103)
    CreateDynamicObject(979, 2496.31811523, -2514.74804688, 13.48900032, 0.00000000, 0.00000000, 49.92553711); //object(sub_roadleft) (104)
    CreateDynamicObject(979, 2503.82690430, -2510.38891602, 13.52499962, 0.00000000, 0.00000000, 9.92187500); //object(sub_roadleft) (105)
    CreateDynamicObject(979, 2513.09912109, -2509.61010742, 13.50399971, 0.00000000, 0.00000000, 359.92065430); //object(sub_roadleft) (106)
    CreateDynamicObject(979, 2522.46411133, -2509.61791992, 13.51099968, 0.00000000, 0.00000000, 359.91760254); //object(sub_roadleft) (107)
    CreateDynamicObject(979, 2531.82397461, -2509.62988281, 13.51099968, 0.00000000, 0.00000000, 359.91760254); //object(sub_roadleft) (108)
    CreateDynamicObject(979, 2541.17309570, -2509.64501953, 13.51099968, 0.00000000, 0.00000000, 359.91760254); //object(sub_roadleft) (109)
    CreateDynamicObject(979, 2550.52587891, -2509.65991211, 13.50399971, 0.00000000, 0.00000000, 359.91760254); //object(sub_roadleft) (110)
    CreateDynamicObject(979, 2559.91601562, -2509.66088867, 13.50399971, 0.00000000, 0.00000000, 359.91760254); //object(sub_roadleft) (111)
    CreateDynamicObject(979, 2388.43896484, -2655.50488281, 13.50399971, 0.00000000, 0.00000000, 179.92858887); //object(sub_roadleft) (113)
    CreateDynamicObject(979, 2397.78588867, -2655.51806641, 13.50399971, 0.00000000, 0.00000000, 179.92309570); //object(sub_roadleft) (114)
    CreateDynamicObject(979, 2407.14599609, -2655.52587891, 13.50399971, 0.00000000, 0.00000000, 179.92309570); //object(sub_roadleft) (115)
    CreateDynamicObject(979, 2416.52001953, -2655.54296875, 13.50399971, 0.00000000, 0.00000000, 179.92309570); //object(sub_roadleft) (116)
    CreateDynamicObject(979, 2425.90307617, -2655.55810547, 13.50399971, 0.00000000, 0.00000000, 179.92309570); //object(sub_roadleft) (117)
    CreateDynamicObject(979, 2435.29394531, -2655.59106445, 13.50399971, 0.00000000, 0.00000000, 179.92309570); //object(sub_roadleft) (118)
    CreateDynamicObject(979, 2444.66088867, -2655.61303711, 13.50399971, 0.00000000, 0.00000000, 179.92309570); //object(sub_roadleft) (119)
    CreateDynamicObject(979, 2454.00805664, -2655.62500000, 13.50399971, 0.00000000, 0.00000000, 179.92309570); //object(sub_roadleft) (120)
    CreateDynamicObject(979, 2385.68310547, -2670.59497070, 13.50399971, 0.00000000, 0.00000000, 7.95959473); //object(sub_roadleft) (121)
    CreateDynamicObject(979, 2463.37597656, -2655.64599609, 13.50399971, 0.00000000, 0.00000000, 179.92309570); //object(sub_roadleft) (122)
    CreateDynamicObject(979, 2471.88696289, -2653.19311523, 13.48900032, 0.00000000, 0.00000000, 211.92309570); //object(sub_roadleft) (123)
    CreateDynamicObject(979, 2477.38696289, -2646.39599609, 13.50500011, 0.00000000, 0.00000000, 249.92077637); //object(sub_roadleft) (124)
    CreateDynamicObject(979, 2478.99389648, -2637.42504883, 13.48900032, 0.00000000, 0.00000000, 269.91699219); //object(sub_roadleft) (125)
    CreateDynamicObject(979, 2479.00805664, -2628.04492188, 13.48900032, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (126)
    CreateDynamicObject(979, 2479.02807617, -2618.67700195, 13.48900032, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (127)
    CreateDynamicObject(979, 2479.04394531, -2609.30493164, 13.48900032, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (128)
    CreateDynamicObject(979, 2479.04589844, -2599.92602539, 13.48900032, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (129)
    CreateDynamicObject(979, 2479.06591797, -2590.55908203, 13.48900032, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (130)
    CreateDynamicObject(979, 2479.08300781, -2581.18994141, 13.48900032, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (131)
    CreateDynamicObject(979, 2479.09204102, -2571.82397461, 13.48900032, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (132)
    CreateDynamicObject(979, 2479.11108398, -2562.44311523, 13.49499989, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (133)
    CreateDynamicObject(979, 2479.13110352, -2553.05908203, 13.50899982, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (134)
    CreateDynamicObject(979, 2479.15795898, -2543.67700195, 13.52999973, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (135)
    CreateDynamicObject(979, 2479.16406250, -2534.31909180, 13.51900005, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (136)
    CreateDynamicObject(981, 2475.66894531, -2598.05102539, 12.64799976, 0.00000000, 0.00000000, 270.00000000); //object(helix_barrier) (16)
    CreateDynamicObject(981, 2475.58789062, -2565.71508789, 12.64799976, 0.00000000, 0.00000000, 270.00000000); //object(helix_barrier) (17)
    CreateDynamicObject(981, 2475.74096680, -2534.52294922, 12.65999985, 0.00000000, 0.00000000, 270.00000000); //object(helix_barrier) (18)
    CreateDynamicObject(979, 2479.14794922, -2524.96704102, 13.49400043, 0.00000000, 0.00000000, 269.91210938); //object(sub_roadleft) (137)
    CreateDynamicObject(979, 2480.74707031, -2515.96411133, 13.51799965, 0.00000000, 0.00000000, 249.91210938); //object(sub_roadleft) (138)
    CreateDynamicObject(979, 2485.05102539, -2507.78710938, 13.48900032, 0.00000000, 0.00000000, 233.91003418); //object(sub_roadleft) (139)
    CreateDynamicObject(979, 2491.87500000, -2501.72094727, 13.49499989, 0.00000000, 0.00000000, 209.90991211); //object(sub_roadleft) (140)
    CreateDynamicObject(979, 2500.57592773, -2498.56494141, 13.51399994, 0.00000000, 0.00000000, 189.90881348); //object(sub_roadleft) (141)
    CreateDynamicObject(979, 2509.68310547, -2497.78295898, 13.50399971, 0.00000000, 0.00000000, 179.90417480); //object(sub_roadleft) (142)
    CreateDynamicObject(979, 2519.04907227, -2497.79296875, 13.50399971, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (143)
    CreateDynamicObject(979, 2528.43603516, -2497.81005859, 13.51099968, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (144)
    CreateDynamicObject(979, 2537.81396484, -2497.83691406, 13.51099968, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (145)
    CreateDynamicObject(979, 2547.19799805, -2497.83593750, 13.50399971, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (146)
    CreateDynamicObject(979, 2556.56201172, -2497.85498047, 13.50399971, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (147)
    CreateDynamicObject(713, 2475.54907227, -2670.59912109, 12.64799976, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (34)
    CreateDynamicObject(713, 2487.27490234, -2661.69799805, 12.64799976, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (35)
    CreateDynamicObject(713, 2493.62988281, -2650.55590820, 12.67099953, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (36)
    CreateDynamicObject(713, 2494.72998047, -2630.07788086, 12.64799976, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (37)
    CreateDynamicObject(713, 2494.57690430, -2618.41406250, 12.64799976, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (38)
    CreateDynamicObject(713, 2494.82910156, -2604.42407227, 12.65200043, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (39)
    CreateDynamicObject(713, 2494.75292969, -2582.86206055, 12.64799976, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (40)
    CreateDynamicObject(713, 2494.94189453, -2566.19189453, 12.65200043, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (41)
    CreateDynamicObject(713, 2494.66503906, -2551.62597656, 12.65499973, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (42)
    CreateDynamicObject(713, 2494.58789062, -2536.72094727, 12.64799976, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (43)
    CreateDynamicObject(713, 2495.85107422, -2520.63500977, 12.68900013, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (44)
    CreateDynamicObject(713, 2502.38305664, -2514.07788086, 12.65999985, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (45)
    CreateDynamicObject(713, 2517.14501953, -2513.77587891, 12.66399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (46)
    CreateDynamicObject(713, 2529.92602539, -2513.68505859, 12.67099953, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (47)
    CreateDynamicObject(713, 2546.57910156, -2513.44311523, 12.61400032, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (48)
    CreateDynamicObject(713, 2559.99707031, -2513.01293945, 12.66399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (49)
    CreateDynamicObject(713, 2452.90991211, -2652.42407227, 12.66199970, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (50)
    CreateDynamicObject(713, 2467.37792969, -2652.37402344, 12.65400028, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (51)
    CreateDynamicObject(713, 2475.16406250, -2643.80688477, 12.65499973, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (52)
    CreateDynamicObject(713, 2477.40502930, -2513.06591797, 12.68700027, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (53)
    CreateDynamicObject(713, 2484.19897461, -2502.36889648, 12.65600014, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (54)
    CreateDynamicObject(713, 2495.09912109, -2495.87304688, 12.65499973, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (55)
    CreateDynamicObject(713, 2508.74707031, -2494.29394531, 12.66399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (56)
    CreateDynamicObject(713, 2521.50195312, -2494.40307617, 12.66399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (57)
    CreateDynamicObject(713, 2533.71289062, -2494.23291016, 12.67099953, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (58)
    CreateDynamicObject(713, 2548.51708984, -2494.08496094, 12.66399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (59)
    CreateDynamicObject(713, 2561.16406250, -2494.20507812, 12.66399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (60)
    CreateDynamicObject(979, 2565.89111328, -2497.52490234, 13.50399971, 0.00000000, 0.00000000, 183.90112305); //object(sub_roadleft) (149)
    CreateDynamicObject(979, 2569.19604492, -2510.48095703, 13.50399971, 0.00000000, 0.00000000, 349.91760254); //object(sub_roadleft) (150)
    CreateDynamicObject(979, 2662.05395508, -2510.82299805, 13.50399971, 0.00000000, 0.00000000, 17.91760254); //object(sub_roadleft) (151)
    CreateDynamicObject(979, 2671.17089844, -2509.37890625, 13.50399971, 0.00000000, 0.00000000, 359.91760254); //object(sub_roadleft) (152)
    CreateDynamicObject(979, 2680.57910156, -2509.42602539, 13.47200012, 0.00000000, 0.00000000, 359.91760254); //object(sub_roadleft) (153)
    CreateDynamicObject(979, 2688.12402344, -2505.89892578, 13.48470020, 0.00000000, 0.00000000, 51.91760254); //object(sub_roadleft) (154)
    CreateDynamicObject(979, 2690.91210938, -2497.56909180, 13.50399971, 0.00000000, 0.00000000, 89.91589355); //object(sub_roadleft) (155)
    CreateDynamicObject(979, 2690.94311523, -2488.22094727, 13.49499989, 0.00000000, 0.00000000, 89.91162109); //object(sub_roadleft) (156)
    CreateDynamicObject(979, 2690.96899414, -2478.86889648, 13.49100018, 0.00000000, 0.00000000, 89.91162109); //object(sub_roadleft) (157)
    CreateDynamicObject(979, 2691.00000000, -2469.49194336, 13.48600006, 0.00000000, 0.00000000, 89.91162109); //object(sub_roadleft) (158)
    CreateDynamicObject(979, 2691.02197266, -2460.14111328, 13.48200035, 0.00000000, 0.00000000, 89.90661621); //object(sub_roadleft) (159)
    CreateDynamicObject(979, 2691.04492188, -2450.76098633, 13.47700024, 0.00000000, 0.00000000, 89.90661621); //object(sub_roadleft) (160)
    CreateDynamicObject(979, 2691.07299805, -2441.38989258, 13.47200012, 0.00000000, 0.00000000, 89.90661621); //object(sub_roadleft) (161)
    CreateDynamicObject(979, 2691.09399414, -2432.05102539, 13.46800041, 0.00000000, 0.00000000, 89.90661621); //object(sub_roadleft) (162)
    CreateDynamicObject(979, 2691.11303711, -2422.67211914, 13.47299957, 0.00000000, 0.00000000, 89.90661621); //object(sub_roadleft) (163)
    CreateDynamicObject(979, 2691.12890625, -2413.33691406, 13.47299957, 0.00000000, 0.00000000, 89.90661621); //object(sub_roadleft) (164)
    CreateDynamicObject(979, 2691.24389648, -2404.08300781, 13.36900043, 0.00000000, 0.00000000, 89.90661621); //object(sub_roadleft) (165)
    CreateDynamicObject(979, 2686.58691406, -2399.24389648, 13.47299957, 0.00000000, 0.00000000, 179.90661621); //object(sub_roadleft) (166)
    CreateDynamicObject(979, 2677.25097656, -2399.21606445, 13.47299957, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (167)
    CreateDynamicObject(979, 2667.87109375, -2399.20288086, 13.47299957, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (168)
    CreateDynamicObject(979, 2658.51293945, -2399.16796875, 13.46800041, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (169)
    CreateDynamicObject(979, 2649.14501953, -2399.15405273, 13.46800041, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (170)
    CreateDynamicObject(979, 2639.79003906, -2399.13305664, 13.46800041, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (171)
    CreateDynamicObject(979, 2630.41796875, -2399.12011719, 13.47299957, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (172)
    CreateDynamicObject(981, 2666.84912109, -2482.94506836, 12.64500046, 0.00000000, 0.00000000, 270.00000000); //object(helix_barrier) (24)
    CreateDynamicObject(981, 2666.88305664, -2453.94506836, 12.63300037, 0.00000000, 0.00000000, 270.00000000); //object(helix_barrier) (25)
    CreateDynamicObject(979, 2621.06103516, -2399.09106445, 13.47000027, 0.00000000, 0.00000000, 179.90112305); //object(sub_roadleft) (173)
    CreateDynamicObject(979, 2612.11010742, -2397.32910156, 13.46300030, 0.00000000, 0.00000000, 157.90112305); //object(sub_roadleft) (174)
    CreateDynamicObject(979, 2604.24096680, -2392.59912109, 13.47000027, 0.00000000, 0.00000000, 139.90100098); //object(sub_roadleft) (175)
    CreateDynamicObject(979, 2597.73510742, -2386.01000977, 13.40699959, 0.00000000, 0.00000000, 129.89990234); //object(sub_roadleft) (176)
    CreateDynamicObject(979, 2649.76000977, -2415.76098633, 13.47299957, 0.00000000, 0.00000000, 1.90112305); //object(sub_roadleft) (177)
    CreateDynamicObject(979, 2628.66601562, -2415.77709961, 13.47299957, 0.00000000, 0.00000000, 1.90063477); //object(sub_roadleft) (178)
    CreateDynamicObject(979, 2586.96411133, -2395.41088867, 13.39999962, 0.00000000, 0.00000000, 317.90063477); //object(sub_roadleft) (179)
    CreateDynamicObject(979, 2594.18798828, -2401.43603516, 13.46800041, 0.00000000, 0.00000000, 321.90039062); //object(sub_roadleft) (180)
    CreateDynamicObject(979, 2601.82788086, -2406.81689453, 13.46700001, 0.00000000, 0.00000000, 327.89941406); //object(sub_roadleft) (181)
    CreateDynamicObject(979, 2609.73388672, -2411.80102539, 13.46199989, 0.00000000, 0.00000000, 327.89794922); //object(sub_roadleft) (182)
    CreateDynamicObject(979, 2618.11303711, -2415.22509766, 13.46500015, 0.00000000, 0.00000000, 347.89794922); //object(sub_roadleft) (183)
    CreateDynamicObject(713, 2695.88696289, -2494.22094727, 12.66399956, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (61)
    CreateDynamicObject(713, 2694.16601562, -2475.24291992, 12.65100002, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (62)
    CreateDynamicObject(713, 2694.03100586, -2456.34594727, 12.64200020, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (63)
    CreateDynamicObject(713, 2693.96606445, -2439.23510742, 12.63300037, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (64)
    CreateDynamicObject(713, 2694.25390625, -2415.57397461, 12.63300037, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (65)
    CreateDynamicObject(713, 2695.08691406, -2405.00708008, 12.54899979, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (66)
    CreateDynamicObject(713, 2690.08203125, -2394.91992188, 12.63300037, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (67)
    CreateDynamicObject(713, 2675.70507812, -2395.04199219, 12.63300037, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (68)
    CreateDynamicObject(713, 2663.74194336, -2395.14990234, 12.63300037, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (69)
    CreateDynamicObject(713, 2652.96093750, -2395.41894531, 12.62800026, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (70)
    CreateDynamicObject(713, 2639.86694336, -2395.42211914, 12.62800026, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (71)
    CreateDynamicObject(713, 2628.14208984, -2395.51098633, 12.63300037, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (72)
    CreateDynamicObject(713, 2616.07495117, -2394.98388672, 12.62500000, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (73)
    CreateDynamicObject(713, 2605.31298828, -2388.47290039, 12.61800003, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (74)
    CreateDynamicObject(713, 2597.53808594, -2381.03393555, 12.52000046, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (75)
    CreateDynamicObject(979, 2592.54492188, -2378.98193359, 13.39400005, 0.00000000, 0.00000000, 123.89685059); //object(sub_roadleft) (184)
    CreateDynamicObject(16090, 1346.18505859, -2557.89306641, 12.37500000, 0.00000000, 0.00000000, 90.00000000); //object(des_pipestrut03) (1)
    CreateDynamicObject(16090, 1332.68701172, -2558.01904297, 12.37500000, 0.00000000, 0.00000000, 89.99951172); //object(des_pipestrut03) (2)
    CreateDynamicObject(979, 1356.64697266, -2553.53295898, 13.38700008, 0.00000000, 0.00000000, 51.99853516); //object(sub_roadleft) (186)
    CreateDynamicObject(979, 1325.28295898, -2563.48510742, 13.38700008, 0.00000000, 0.00000000, 273.99829102); //object(sub_roadleft) (187)
    CreateDynamicObject(16090, 2319.12792969, -2116.00195312, 12.39299965, 0.00000000, 0.00000000, 135.99450684); //object(des_pipestrut03) (3)
    CreateDynamicObject(1262, 1339.43395996, -2557.14306641, 19.39399910, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (1)
    CreateDynamicObject(1262, 1339.44897461, -2557.14306641, 17.26899910, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (2)
    CreateDynamicObject(1262, 1339.44604492, -2557.15087891, 14.70600033, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (3)
    CreateDynamicObject(1262, 1325.94995117, -2557.26904297, 19.37400055, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (4)
    CreateDynamicObject(1262, 1325.95300293, -2557.26904297, 17.26499939, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (5)
    CreateDynamicObject(1262, 1325.90698242, -2557.27709961, 14.77700043, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (6)
    CreateDynamicObject(1262, 1353.03698730, -2557.14306641, 18.27099991, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (7)
    CreateDynamicObject(1262, 1353.01293945, -2557.14306641, 16.09799957, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (8)
    CreateDynamicObject(1262, 1352.99194336, -2557.15087891, 13.97200012, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (9)
    CreateDynamicObject(1262, 1351.19604492, -2557.14306641, 19.93499947, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (10)
    CreateDynamicObject(1262, 1346.97204590, -2557.14306641, 19.84600067, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (11)
    CreateDynamicObject(1262, 1341.39794922, -2557.14306641, 19.86400032, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (12)
    CreateDynamicObject(1262, 1335.88403320, -2557.26904297, 19.90699959, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (13)
    CreateDynamicObject(1262, 1332.60205078, -2557.26904297, 19.94199944, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (14)
    CreateDynamicObject(1262, 1327.81494141, -2557.26904297, 19.94000053, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (15)
    CreateDynamicObject(6959, 1338.88793945, -2561.55688477, 12.41200066, 0.00000000, 0.00000000, 0.00000000); //object(vegasnbball1) (1)
    CreateDynamicObject(713, 2608.93603516, -2414.95288086, 12.62600040, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (76)
    CreateDynamicObject(713, 2599.41088867, -2408.70288086, 12.62699986, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (77)
    CreateDynamicObject(713, 2589.13598633, -2401.00000000, 12.59899998, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (78)
    CreateDynamicObject(713, 2581.29296875, -2394.33496094, 12.55700016, 0.00000000, 0.00000000, 155.47851562); //object(veg_bevtree1) (79)
    CreateDynamicObject(3524, 2324.55590820, -2112.32397461, 15.44900036, 0.00000000, 0.00000000, 0.00000000); //object(skullpillar01_lvs) (1)
    CreateDynamicObject(3524, 2325.92089844, -2113.76000977, 15.47799969, 0.00000000, 0.00000000, 0.00000000); //object(skullpillar01_lvs) (2)
    CreateDynamicObject(3524, 2327.42504883, -2115.21997070, 15.50899982, 0.00000000, 0.00000000, 0.00000000); //object(skullpillar01_lvs) (3)
    CreateDynamicObject(3524, 2328.88305664, -2116.80102539, 15.53499985, 0.00000000, 0.00000000, 0.00000000); //object(skullpillar01_lvs) (4)
    CreateDynamicObject(3524, 2316.05004883, -2121.64990234, 15.45499992, 0.00000000, 0.00000000, 94.00000000); //object(skullpillar01_lvs) (5)
    CreateDynamicObject(3524, 2317.61499023, -2123.38696289, 15.48600006, 0.00000000, 0.00000000, 91.99514771); //object(skullpillar01_lvs) (6)
    CreateDynamicObject(3524, 2318.83496094, -2124.72802734, 15.51099968, 0.00000000, 0.00000000, 91.99401855); //object(skullpillar01_lvs) (7)
    CreateDynamicObject(7893, 2309.20507812, -2106.15795898, 12.94299984, 0.00000000, 0.00000000, 224.00000000); //object(vegascrashbar04) (1)
    //Драг 5
    //AddStaticVehicle(560,-2133.04394531,1045.31701660,79.84700012,0.00000000,6,1); //Sultan
    CreateDynamicObject(8172, -2143.01293945, 651.73101807, 67.76200104, 0.00000000, 0.00000000, 0.00000000); //object(vgssairportland07) (1)
    CreateDynamicObject(8172, -2143.07202148, 522.83599854, 67.75400543, 0.00000000, 0.00000000, 0.00000000); //object(vgssairportland07) (2)
    CreateDynamicObject(8150, -2154.77001953, 543.59600830, 70.83899689, 0.00000000, 0.00000000, 270.00000000); //object(vgsselecfence04) (1)
    CreateDynamicObject(8150, -2154.78588867, 660.82098389, 70.84700012, 0.00000000, 0.00000000, 270.00000000); //object(vgsselecfence04) (2)
    CreateDynamicObject(8150, -2131.85205078, 656.72302246, 70.84700012, 0.00000000, 0.00000000, 90.00000000); //object(vgsselecfence04) (3)
    CreateDynamicObject(8150, -2131.75805664, 542.93402100, 70.83899689, 0.00000000, 0.00000000, 90.00000000); //object(vgsselecfence04) (5)
    CreateDynamicObject(8149, -2154.87890625, 756.41302490, 70.66400146, 0.00000000, 0.00000000, 0.00000000); //object(vgsselecfence03) (1)
    CreateDynamicObject(8149, -2132.15307617, 767.44299316, 70.66000366, 0.00000000, 0.00000000, 180.00000000); //object(vgsselecfence03) (2)
    CreateDynamicObject(984, -2129.34399414, 918.59698486, 79.48799896, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit2) (1)
    CreateDynamicObject(984, -2156.73706055, 917.99401855, 79.48799896, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit2) (2)
    CreateDynamicObject(984, -2160.24804688, 930.07202148, 79.63700104, 0.00000000, 0.00000000, 34.00000000); //object(fenceshit2) (3)
    CreateDynamicObject(984, -2160.06494141, 906.04302979, 79.65200043, 0.00000000, 0.00000000, 327.99719238); //object(fenceshit2) (4)
    CreateDynamicObject(984, -2129.15502930, 958.02398682, 79.60399628, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit2) (5)
    CreateDynamicObject(984, -2129.20898438, 970.81500244, 79.64399719, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit2) (6)
    CreateDynamicObject(982, -2161.63208008, 1017.91497803, 79.54299927, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (1)
    CreateDynamicObject(705, -2129.36010742, 836.65899658, 68.55500031, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (1)
    CreateDynamicObject(705, -2157.19702148, 833.42999268, 68.55599976, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (2)
    CreateDynamicObject(705, -2156.36889648, 924.77197266, 79.00000000, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (3)
    CreateDynamicObject(705, -2156.03002930, 911.65899658, 79.00000000, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (4)
    CreateDynamicObject(705, -2128.52001953, 926.08398438, 78.91799927, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (5)
    CreateDynamicObject(705, -2128.80908203, 910.42102051, 78.99199677, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (6)
    CreateDynamicObject(705, -2165.71997070, 1014.71002197, 79.00800323, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (7)
    CreateDynamicObject(705, -2165.85107422, 1020.13000488, 78.85900116, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (8)
    CreateDynamicObject(705, -2165.95996094, 1025.64794922, 79.00800323, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (9)
    CreateDynamicObject(983, -2129.18310547, 839.56201172, 69.24600220, 0.00000000, 0.00000000, 284.00000000); //object(fenceshit3) (1)
    CreateDynamicObject(983, -2157.16894531, 837.14501953, 69.23999786, 0.00000000, 0.00000000, 233.99658203); //object(fenceshit3) (2)
    CreateDynamicObject(705, -2154.10498047, 481.15100098, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (10)
    CreateDynamicObject(705, -2131.28100586, 479.94900513, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (11)
    CreateDynamicObject(994, -2131.59301758, 472.34298706, 67.73799896, 0.00000000, 0.00000000, 90.00000000); //object(lhouse_barrier2) (1)
    CreateDynamicObject(994, -2154.02587891, 472.81298828, 67.73799896, 0.00000000, 0.00000000, 89.99499512); //object(lhouse_barrier2) (2)
    CreateDynamicObject(994, -2154.06201172, 466.64001465, 67.73799896, 0.00000000, 0.00000000, 89.99450684); //object(lhouse_barrier2) (3)
    CreateDynamicObject(994, -2154.05004883, 460.45700073, 67.73799896, 0.00000000, 0.00000000, 89.99450684); //object(lhouse_barrier2) (4)
    CreateDynamicObject(994, -2154.08496094, 454.30398560, 67.73799896, 0.00000000, 0.00000000, 89.99450684); //object(lhouse_barrier2) (5)
    CreateDynamicObject(994, -2147.85205078, 454.31698608, 67.74600220, 0.00000000, 0.00000000, 179.99450684); //object(lhouse_barrier2) (6)
    CreateDynamicObject(994, -2141.67089844, 454.32699585, 67.73799896, 0.00000000, 0.00000000, 179.99450684); //object(lhouse_barrier2) (7)
    CreateDynamicObject(994, -2135.51708984, 454.32299805, 67.73799896, 0.00000000, 0.00000000, 179.99450684); //object(lhouse_barrier2) (8)
    CreateDynamicObject(994, -2131.81689453, 454.25100708, 67.73799896, 0.00000000, 0.00000000, 179.99450684); //object(lhouse_barrier2) (9)
    CreateDynamicObject(994, -2131.60888672, 466.18399048, 67.73799896, 0.00000000, 0.00000000, 89.99450684); //object(lhouse_barrier2) (10)
    CreateDynamicObject(994, -2131.60498047, 460.00900269, 67.73799896, 0.00000000, 0.00000000, 89.99450684); //object(lhouse_barrier2) (11)
    CreateDynamicObject(994, -2131.58691406, 454.27999878, 67.73799896, 0.00000000, 0.00000000, 89.99450684); //object(lhouse_barrier2) (12)
    CreateDynamicObject(1237, -2131.66601562, 454.19100952, 67.73799896, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (1)
    CreateDynamicObject(705, -2157.25488281, 450.69601440, 67.74600220, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (12)
    CreateDynamicObject(705, -2148.83007812, 449.58300781, 67.74600220, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (13)
    CreateDynamicObject(705, -2139.90209961, 449.43499756, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (14)
    CreateDynamicObject(705, -2132.11206055, 449.48498535, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (15)
    CreateDynamicObject(705, -2126.93310547, 454.58700562, 67.74600220, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (16)
    CreateDynamicObject(705, -2126.65087891, 461.90499878, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (17)
    CreateDynamicObject(705, -2126.68505859, 469.29199219, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (18)
    CreateDynamicObject(705, -2127.55810547, 475.23498535, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (19)
    CreateDynamicObject(3749, -2142.87109375, 480.28799438, 73.59700012, 0.00000000, 0.00000000, 0.00000000); //object(clubgate01_lax) (1)
    CreateDynamicObject(3749, -2142.42797852, 1029.08605957, 84.70999908, 0.00000000, 0.00000000, 0.00000000); //object(clubgate01_lax) (2)
    CreateDynamicObject(984, -2127.18603516, 1027.05798340, 79.64399719, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit2) (7)
    CreateDynamicObject(984, -2158.17089844, 1029.31799316, 79.64399719, 0.00000000, 0.00000000, 70.00000000); //object(fenceshit2) (8)
    CreateDynamicObject(705, -2128.20410156, 977.38000488, 79.00800323, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (20)
    CreateDynamicObject(705, -2152.45288086, 482.94799805, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (21)
    CreateDynamicObject(705, -2132.62695312, 482.30801392, 67.73799896, 0.00000000, 0.00000000, 93.99902344); //object(sm_veg_tree7vbig) (22)

    //Пещера
    AddStaticVehicle(521, -364.40499878, 1169.37902832, 19.40299988, 334.00000000, -1, -1); //FCR-900
    AddStaticVehicle(446, -422.71398926, 1216.94604492, 0.00000000, 149.99975586, -1, -1); //Squalo
    AddStaticVehicle(446, -419.87399292, 1211.82397461, 0.00000000, 149.99633789, -1, -1); //Squalo
    CreateDynamicObject(11496, -413.76501465, 1235.61499023, 0.16300011, 0.00000000, 0.00000000, 186.00000000); //object(des_wjetty) (1)
    CreateDynamicObject(11496, -412.21301270, 1221.03894043, 0.13000000, 0.00000000, 0.00000000, 185.99853516); //object(des_wjetty) (2)
    CreateDynamicObject(669, -412.95800781, 1242.99804688, -1.00000000, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree4) (1)
    CreateDynamicObject(1225, -417.83599854, 1242.40905762, 0.76899999, 0.00000000, 0.00000000, 0.00000000); //object(barrel4) (1)
    CreateDynamicObject(1225, -418.48699951, 1242.04797363, 0.76899999, 0.00000000, 0.00000000, 0.00000000); //object(barrel4) (2)
    CreateDynamicObject(1225, -417.83099365, 1241.69799805, 0.76899999, 0.00000000, 0.00000000, 0.00000000); //object(barrel4) (3)
    CreateDynamicObject(2780, -394.97100830, 1243.83703613, 4.61399984, 0.00000000, 0.00000000, 0.00000000); //object(cj_smoke_mach) (1)
    CreateDynamicObject(2780, -444.11700439, 1442.86096191, 19.23699951, 0.00000000, 0.00000000, 0.00000000); //object(cj_smoke_mach) (2)
    CreateDynamicObject(3524, -399.76199341, 1241.84094238, 7.34800005, 0.00000000, 0.00000000, 350.00000000); //object(skullpillar01_lvs) (1)
    CreateDynamicObject(3524, -393.42498779, 1237.84802246, 7.32700014, 0.00000000, 0.00000000, 347.99487305); //object(skullpillar01_lvs) (2)
    CreateDynamicObject(3524, -452.13299561, 1441.33203125, 22.84499931, 0.00000000, 0.00000000, 241.99194336); //object(skullpillar01_lvs) (3)
    CreateDynamicObject(3524, -447.93301392, 1449.41101074, 23.27400017, 0.00000000, 0.00000000, 241.99035645); //object(skullpillar01_lvs) (4)


    //База [PrO_DrifT]
    AddStaticVehicle(562, -2121.24804688, -119.24099731, 35.04199982, 180.00000000, -1, -1); //Elegy
    AddStaticVehicle(477, -2114.94189453, -119.37100220, 35.08599854, 180.00000000, -1, -1); //ZR-350
    CreateDynamicObject(1257, -2125.44995117, -63.89699936, 35.59999847, 0.00000000, 0.00000000, 88.00000000); //object(bustopm) (1)
    CreateDynamicObject(1232, -2102.14794922, -75.73400116, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (1)
    CreateDynamicObject(1232, -2107.21997070, -75.75099945, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (2)
    CreateDynamicObject(1232, -2112.23901367, -75.72299957, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (3)
    CreateDynamicObject(1232, -2117.29003906, -75.62100220, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (4)
    CreateDynamicObject(1232, -2136.61499023, -75.63300323, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (5)
    CreateDynamicObject(1232, -2142.12890625, -75.61100006, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (6)
    CreateDynamicObject(1232, -2147.21191406, -75.55599976, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (7)
    CreateDynamicObject(1232, -2154.69702148, -75.55799866, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (8)
    CreateDynamicObject(672, -2115.40600586, -78.68000031, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (1)
    CreateDynamicObject(672, -2109.64599609, -79.08699799, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (2)
    CreateDynamicObject(672, -2104.72192383, -78.96700287, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (3)
    CreateDynamicObject(672, -2099.60791016, -78.59700012, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (4)
    CreateDynamicObject(672, -2139.51611328, -79.11299896, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (5)
    CreateDynamicObject(672, -2144.63598633, -79.22200012, 34.31299973, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (6)
    CreateDynamicObject(672, -2150.95605469, -79.17199707, 34.31299973, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (7)
    CreateDynamicObject(17969, -2097.18994141, -125.04900360, 36.33300018, 0.00000000, 0.00000000, 0.00000000); //object(hub_graffitti) (1)
    CreateDynamicObject(17969, -2118.45410156, -80.16300201, 36.77099991, 0.00000000, 0.00000000, 270.00000000); //object(hub_graffitti) (2)
    CreateDynamicObject(19124, -2110.79199219, -108.08100128, 34.88499832, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight4) (1)
    CreateDynamicObject(19124, -2132.39208984, -80.19400024, 34.88499832, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight4) (2)
    CreateDynamicObject(19124, -2121.94311523, -80.27799988, 34.88499832, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight4) (3)
    CreateDynamicObject(672, -2111.68994141, -109.22299957, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (8)
    CreateDynamicObject(672, -2120.19995117, -108.87999725, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (9)
    CreateDynamicObject(672, -2128.51904297, -108.94100189, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (10)
    CreateDynamicObject(672, -2136.84301758, -109.40799713, 34.32699966, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (11)
    CreateDynamicObject(672, -2145.03491211, -109.43000031, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (12)
    CreateDynamicObject(672, -2155.89501953, -109.26100159, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (13)
    CreateDynamicObject(983, -2110.75390625, -111.21900177, 35.07400131, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (1)
    CreateDynamicObject(983, -2113.99096680, -108.00900269, 35.00400162, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (2)
    CreateDynamicObject(983, -2120.33496094, -107.98100281, 35.00400162, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (3)
    CreateDynamicObject(983, -2126.71191406, -107.96900177, 35.00400162, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (4)
    CreateDynamicObject(983, -2133.11401367, -107.95800018, 35.01100159, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (5)
    CreateDynamicObject(983, -2139.49609375, -107.95099640, 35.01100159, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (6)
    CreateDynamicObject(983, -2145.86010742, -107.95099640, 35.00400162, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (7)
    CreateDynamicObject(983, -2152.23706055, -107.96099854, 35.00400162, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (8)
    CreateDynamicObject(983, -2153.81689453, -107.95300293, 35.00400162, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (9)
    CreateDynamicObject(982, -2100.26708984, -122.29799652, 35.00400162, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (1)
    CreateDynamicObject(982, -2100.24707031, -147.86999512, 35.00400162, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (2)
    CreateDynamicObject(982, -2100.23608398, -173.45899963, 35.00400162, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (3)
    CreateDynamicObject(672, -2098.42089844, -111.75499725, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (14)
    CreateDynamicObject(672, -2098.37304688, -118.19699860, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (15)
    CreateDynamicObject(672, -2098.43798828, -123.65200043, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (16)
    CreateDynamicObject(672, -2098.47094727, -129.03199768, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (17)
    CreateDynamicObject(672, -2098.57202148, -135.00300598, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (18)
    CreateDynamicObject(672, -2098.38208008, -140.58200073, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (19)
    CreateDynamicObject(672, -2098.09692383, -147.00000000, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (20)
    CreateDynamicObject(672, -2098.06591797, -152.59800720, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (21)
    CreateDynamicObject(672, -2098.02490234, -160.09399414, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (22)
    CreateDynamicObject(672, -2097.73901367, -167.96299744, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, -2098.10693359, -175.79899597, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (24)
    CreateDynamicObject(1232, -2098.64404297, -114.91300201, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (9)
    CreateDynamicObject(1232, -2098.62890625, -120.78399658, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (10)
    CreateDynamicObject(1232, -2098.65307617, -126.22499847, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (11)
    CreateDynamicObject(1232, -2098.60888672, -131.95599365, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (12)
    CreateDynamicObject(1232, -2098.84399414, -137.75700378, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (13)
    CreateDynamicObject(1232, -2098.99096680, -143.87199402, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (14)
    CreateDynamicObject(1232, -2098.88500977, -149.61300659, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (15)
    CreateDynamicObject(1232, -2098.77709961, -156.58299255, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (16)
    CreateDynamicObject(1232, -2098.52294922, -164.12199402, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (17)
    CreateDynamicObject(1232, -2098.50610352, -171.91900635, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (18)
    CreateDynamicObject(3648, -2103.69409180, -204.73899841, 37.06399918, 0.00000000, 0.00000000, 0.00000000); //object(ganghous02_lax) (1)
    CreateDynamicObject(3648, -2103.49902344, -222.60299683, 37.06399918, 0.00000000, 0.00000000, 0.00000000); //object(ganghous02_lax) (2)
    CreateDynamicObject(3648, -2103.69799805, -241.13999939, 37.06399918, 0.00000000, 0.00000000, 0.00000000); //object(ganghous02_lax) (3)
    CreateDynamicObject(3648, -2104.10693359, -258.84899902, 37.06399918, 0.00000000, 0.00000000, 0.00000000); //object(ganghous02_lax) (4)
    CreateDynamicObject(672, -2099.98510742, -269.44299316, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (25)
    CreateDynamicObject(672, -2104.23803711, -269.35000610, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (26)
    CreateDynamicObject(672, -2108.23706055, -269.64898682, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (27)
    CreateDynamicObject(672, -2112.02099609, -269.91598511, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (28)
    CreateDynamicObject(672, -2115.94311523, -269.93899536, 34.31999969, 0.00000000, 0.00000000, 125.99670410); //object(sm_veg_tree5) (29)
    CreateDynamicObject(1232, -2113.91406250, -269.93600464, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (19)
    CreateDynamicObject(1232, -2110.07495117, -269.76098633, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (20)
    CreateDynamicObject(1232, -2105.96508789, -269.90899658, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (21)
    CreateDynamicObject(1232, -2101.75805664, -269.65100098, 36.95700073, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (22)
    CreateDynamicObject(3589, -2133.26098633, -261.13800049, 37.04800034, 0.00000000, 0.00000000, 0.00000000); //object(compfukhouse3) (1)
    CreateDynamicObject(3589, -2152.46289062, -170.50599670, 37.04800034, 0.00000000, 0.00000000, 270.00000000); //object(compfukhouse3) (2)
    CreateDynamicObject(3580, -2129.89794922, -119.22699738, 38.95899963, 0.00000000, 0.00000000, 180.00000000); //object(compbigho2_lae) (1)
    CreateDynamicObject(9321, -2121.18701172, -114.01200104, 35.78099823, 0.00000000, 0.00000000, 270.00000000); //object(garage_sfn01) (1)
    CreateDynamicObject(9321, -2114.59692383, -114.02700043, 35.78099823, 0.00000000, 0.00000000, 270.00000000); //object(garage_sfn01) (2)

    //Дрифт 12
    AddStaticVehicle(587, 2078.11303711, 2419.45288086, 45.02899933, 90.00000000, -1, -1); //Euros
    AddStaticVehicle(562, 2069.14794922, 2410.91601562, 44.93999863, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2069.24291992, 2413.60400391, 44.93999863, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2069.23291016, 2416.40307617, 44.93999863, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2069.27709961, 2419.36010742, 44.93999863, 270.00000000, -1, -1); //Elegy
    AddStaticVehicle(589, 2078.15087891, 2413.47705078, 44.96300125, 90.00000000, -1, -1); //Club
    AddStaticVehicle(589, 2078.27490234, 2410.80395508, 44.96300125, 90.00000000, -1, -1); //Club
    AddStaticVehicle(589, 2078.27001953, 2407.82299805, 44.96300125, 90.00000000, -1, -1); //Club
    AddStaticVehicle(560, 2069.22998047, 2396.00805664, 45.03200150, 90.00000000, -1, -1); //Sultan
    AddStaticVehicle(560, 2069.22998047, 2399.01806641, 45.03200150, 89.99499512, -1, -1); //Sultan
    AddStaticVehicle(560, 2069.33300781, 2392.92089844, 45.03200150, 90.00000000, -1, -1); //Sultan
    CreateDynamicObject(978, 2082.34912109, 2385.19604492, 45.05899811, 0.00000000, 0.00000000, 89.99487305); //object(sub_roadright) (9)
    CreateDynamicObject(978, 2068.89501953, 2389.75708008, 45.00699997, 0.00000000, 0.00000000, 179.99731445); //object(sub_roadright) (10)
    CreateDynamicObject(978, 2064.33691406, 2394.31494141, 45.30599976, 0.00000000, 0.00000000, 89.99731445); //object(sub_roadright) (11)
    CreateDynamicObject(978, 2064.32202148, 2401.64404297, 45.30599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (15)
    CreateDynamicObject(978, 2064.42309570, 2411.30688477, 45.30599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (16)
    CreateDynamicObject(978, 2064.45800781, 2418.26489258, 45.30599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (17)
    CreateDynamicObject(978, 2064.37207031, 2395.13208008, 41.00899887, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (18)
    CreateDynamicObject(978, 2064.35498047, 2402.06811523, 41.00899887, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (19)
    CreateDynamicObject(978, 2064.39794922, 2411.22705078, 41.00899887, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (20)
    CreateDynamicObject(978, 2064.39990234, 2418.28710938, 41.00899887, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (21)
    CreateDynamicObject(978, 2064.33691406, 2395.08105469, 36.70500183, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (22)
    CreateDynamicObject(978, 2064.30493164, 2402.06494141, 36.70500183, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (23)
    CreateDynamicObject(978, 2064.29492188, 2411.43408203, 36.70500183, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (24)
    CreateDynamicObject(978, 2064.26855469, 2418.41406250, 36.70500183, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2064.35498047, 2417.71801758, 10.90799999, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (26)
    CreateDynamicObject(978, 2064.35498047, 2410.75292969, 10.90799999, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (27)
    CreateDynamicObject(978, 2064.41992188, 2401.36010742, 10.90799999, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (28)
    CreateDynamicObject(978, 2064.41699219, 2394.41796875, 10.90799999, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (29)
    CreateDynamicObject(978, 2064.33105469, 2417.86694336, 15.20499992, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (30)
    CreateDynamicObject(978, 2064.34008789, 2410.94897461, 15.20499992, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (31)
    CreateDynamicObject(978, 2064.38891602, 2401.48388672, 15.20499992, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (32)
    CreateDynamicObject(978, 2064.38403320, 2394.53906250, 15.20499992, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (33)
    CreateDynamicObject(978, 2064.34692383, 2417.89111328, 19.50900078, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (34)
    CreateDynamicObject(978, 2064.35205078, 2410.91503906, 19.50900078, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (35)
    CreateDynamicObject(978, 2064.37402344, 2401.43798828, 19.50900078, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (36)
    CreateDynamicObject(978, 2064.37890625, 2394.47192383, 19.50900078, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (37)
    CreateDynamicObject(978, 2064.30908203, 2394.96606445, 23.80599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (38)
    CreateDynamicObject(978, 2064.33398438, 2401.92797852, 23.80599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (39)
    CreateDynamicObject(978, 2064.35107422, 2411.42993164, 23.80599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (40)
    CreateDynamicObject(978, 2064.41210938, 2418.40087891, 23.80599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (41)
    CreateDynamicObject(978, 2064.36694336, 2394.75903320, 28.11100006, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (42)
    CreateDynamicObject(978, 2064.37207031, 2401.74194336, 28.11100006, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (43)
    CreateDynamicObject(978, 2064.38598633, 2410.55004883, 28.11100006, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (44)
    CreateDynamicObject(978, 2064.39990234, 2417.51098633, 28.11100006, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (45)
    CreateDynamicObject(978, 2064.36206055, 2394.75390625, 32.40800095, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (46)
    CreateDynamicObject(978, 2064.37792969, 2401.72998047, 32.40800095, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (47)
    CreateDynamicObject(978, 2064.42700195, 2411.33789062, 32.40800095, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (48)
    CreateDynamicObject(978, 2064.43994141, 2418.29296875, 32.40800095, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (49)
    CreateDynamicObject(978, 2068.80297852, 2386.64990234, 40.77000046, 0.00000000, 0.00000000, 145.99734497); //object(sub_roadright) (50)
    CreateDynamicObject(978, 2077.01000977, 2382.29809570, 40.77000046, 0.00000000, 0.00000000, 157.99731445); //object(sub_roadright) (51)
    CreateDynamicObject(978, 2068.41308594, 2386.61791992, 36.46500015, 0.00000000, 0.00000000, 145.99734497); //object(sub_roadright) (52)
    CreateDynamicObject(978, 2076.41894531, 2382.19995117, 36.46500015, 0.00000000, 0.00000000, 155.99731445); //object(sub_roadright) (53)
    CreateDynamicObject(978, 2068.25610352, 2386.84912109, 32.16799927, 0.00000000, 0.00000000, 145.99734497); //object(sub_roadright) (54)
    CreateDynamicObject(978, 2076.31909180, 2382.22998047, 32.16799927, 0.00000000, 0.00000000, 153.99731445); //object(sub_roadright) (55)
    CreateDynamicObject(978, 2068.16796875, 2386.87304688, 27.87100029, 0.00000000, 0.00000000, 145.99734497); //object(sub_roadright) (56)
    CreateDynamicObject(978, 2076.21411133, 2382.41601562, 27.87100029, 0.00000000, 0.00000000, 155.99731445); //object(sub_roadright) (57)
    CreateDynamicObject(978, 2068.23437500, 2386.69433594, 23.56699944, 0.00000000, 0.00000000, 145.99734497); //object(sub_roadright) (58)
    CreateDynamicObject(978, 2076.35742188, 2382.38085938, 23.56699944, 0.00000000, 0.00000000, 157.99438477); //object(sub_roadright) (59)
    CreateDynamicObject(978, 2068.28295898, 2386.85693359, 14.96500015, 0.00000000, 0.00000000, 145.99734497); //object(sub_roadright) (60)
    CreateDynamicObject(978, 2076.40209961, 2382.37011719, 14.96500015, 0.00000000, 0.00000000, 155.99731445); //object(sub_roadright) (61)
    CreateDynamicObject(978, 2068.23193359, 2386.73193359, 10.66800022, 0.00000000, 0.00000000, 145.99734497); //object(sub_roadright) (62)
    CreateDynamicObject(978, 2076.42407227, 2382.42407227, 10.66800022, 0.00000000, 0.00000000, 157.99731445); //object(sub_roadright) (63)
    CreateDynamicObject(982, 2078.11791992, 2423.41992188, 44.90200043, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (1)
    CreateDynamicObject(983, 2094.15405273, 2423.39208984, 44.90200043, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit3) (1)
    CreateDynamicObject(983, 2097.32299805, 2423.38305664, 44.90200043, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit3) (2)
    CreateDynamicObject(982, 2078.08105469, 2423.54907227, 40.60499954, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (2)
    CreateDynamicObject(982, 2087.68188477, 2423.54809570, 40.60499954, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (3)
    CreateDynamicObject(982, 2077.82910156, 2423.50000000, 36.30099869, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (4)
    CreateDynamicObject(982, 2087.42602539, 2423.50097656, 36.30099869, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (5)
    CreateDynamicObject(982, 2077.77587891, 2423.55297852, 32.00400162, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (6)
    CreateDynamicObject(982, 2087.36206055, 2423.57006836, 32.00400162, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (7)
    CreateDynamicObject(982, 2078.14990234, 2423.52197266, 27.70700073, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (8)
    CreateDynamicObject(982, 2087.74804688, 2423.51489258, 27.70700073, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (9)
    CreateDynamicObject(982, 2078.08007812, 2423.50292969, 23.40200043, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (10)
    CreateDynamicObject(982, 2087.63696289, 2423.51000977, 23.40200043, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (11)
    CreateDynamicObject(982, 2077.18603516, 2423.51391602, 19.10499954, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (12)
    CreateDynamicObject(982, 2086.78393555, 2423.51806641, 19.10499954, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (13)
    CreateDynamicObject(982, 2077.20288086, 2423.46899414, 14.80099964, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (14)
    CreateDynamicObject(982, 2086.79394531, 2423.49096680, 14.80099964, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (15)
    CreateDynamicObject(982, 2078.02490234, 2423.49511719, 10.50399971, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (16)
    CreateDynamicObject(982, 2087.61694336, 2423.45507812, 10.50399971, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (17)
    CreateDynamicObject(1237, 2064.02905273, 2423.56201172, 10.06700039, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (2)
    CreateDynamicObject(1237, 2078.57006836, 2380.76708984, 9.81999969, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (3)
    CreateDynamicObject(1237, 2078.76391602, 2380.67797852, 22.71899986, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (4)
    CreateDynamicObject(978, 2101.67700195, 2384.86499023, 45.05899811, 0.00000000, 0.00000000, 287.99450684); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.50000000, 2395.10107422, 45.30599976, 0.00000000, 0.00000000, 269.99011230); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.51489258, 2402.09204102, 45.30599976, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.51489258, 2411.34008789, 45.30599976, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.52392578, 2418.34008789, 45.30599976, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.60693359, 2417.64208984, 41.00899887, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.59008789, 2410.64697266, 41.00899887, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.31396484, 2401.79711914, 41.00899887, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.30297852, 2394.79589844, 41.00899887, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.53710938, 2395.14697266, 36.70500183, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.48999023, 2402.07397461, 36.70500183, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.52905273, 2411.71093750, 36.70500183, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.53906250, 2418.68310547, 36.70500183, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.53491211, 2417.82495117, 32.40800095, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.49291992, 2410.89111328, 32.40800095, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.44799805, 2401.76293945, 32.40800095, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.50195312, 2394.80908203, 32.40800095, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.56396484, 2417.77587891, 28.11100006, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.56494141, 2410.81909180, 28.11100006, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.48803711, 2401.22192383, 28.11100006, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.46191406, 2394.23803711, 28.11100006, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.58911133, 2394.72900391, 23.80599976, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.57299805, 2401.70092773, 23.80599976, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.53198242, 2411.42211914, 23.80599976, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.51489258, 2418.36303711, 23.80599976, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.55102539, 2418.00610352, 19.50900078, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.50488281, 2411.06201172, 19.50900078, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.42895508, 2401.59912109, 19.50900078, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.39990234, 2394.65209961, 19.50900078, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.58398438, 2418.02807617, 15.20499992, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.57690430, 2411.05395508, 15.20499992, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.52099609, 2401.38500977, 15.20499992, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.50000000, 2394.39892578, 15.20499992, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.68310547, 2417.54003906, 10.90799999, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.67797852, 2410.58593750, 10.90799999, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.67407227, 2401.40087891, 10.90799999, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.65405273, 2394.44995117, 10.90799999, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2100.28710938, 2384.63110352, 10.66100025, 0.00000000, 0.00000000, 269.98901367); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2068.22998047, 2386.59912109, 19.27000046, 0.00000000, 0.00000000, 145.99734497); //object(sub_roadright) (58)
    CreateDynamicObject(978, 2076.39794922, 2382.25097656, 19.27000046, 0.00000000, 0.00000000, 157.99731445); //object(sub_roadright) (58)
    CreateDynamicObject(978, 2101.47094727, 2384.84008789, 40.76200104, 0.00000000, 0.00000000, 287.99011230); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2101.64306641, 2384.84497070, 36.45700073, 0.00000000, 0.00000000, 287.99011230); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2101.58496094, 2384.78100586, 32.16099930, 0.00000000, 0.00000000, 287.99011230); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2101.47509766, 2384.73608398, 27.86400032, 0.00000000, 0.00000000, 287.99011230); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2101.48388672, 2384.84106445, 23.55900002, 0.00000000, 0.00000000, 287.99011230); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2101.30395508, 2384.82788086, 19.26199913, 0.00000000, 0.00000000, 287.99011230); //object(sub_roadright) (25)
    CreateDynamicObject(978, 2101.90087891, 2385.10400391, 14.95699978, 0.00000000, 0.00000000, 287.99011230); //object(sub_roadright) (25)
    CreateDynamicObject(7313, 2057.99609375, 2437.57495117, 47.06200027, 0.00000000, 0.00000000, 0.00000000); //object(vgsn_scrollsgn01) (1)
    CreateDynamicObject(7313, 2064.69604492, 2437.57495117, 47.05899811, 0.00000000, 0.00000000, 0.00000000); //object(vgsn_scrollsgn01) (2)
    CreateDynamicObject(978, 2082.24707031, 2394.58911133, 45.30599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (9)
    CreateDynamicObject(978, 2082.27099609, 2401.55004883, 45.30599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (9)
    CreateDynamicObject(978, 2082.35302734, 2411.17089844, 45.30599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (9)
    CreateDynamicObject(978, 2082.37109375, 2418.12890625, 45.30599976, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (9)
    CreateDynamicObject(978, 2078.44799805, 2374.07910156, 45.05899811, 0.00000000, 0.00000000, 89.99450684); //object(sub_roadright) (9)
    CreateDynamicObject(19124, 2063.98291016, 2389.31811523, 45.02999878, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight4) (1)
    CreateDynamicObject(8674, 2071.62011719, 2366.98999023, 45.68600082, 0.00000000, 0.00000000, 0.00000000); //object(csrsfence02_lvs) (1)
    CreateDynamicObject(8674, 2063.58398438, 2437.61621094, 11.28699970, 0.00000000, 0.00000000, 0.00000000); //object(csrsfence02_lvs) (2)
    CreateDynamicObject(8674, 2058.44702148, 2437.62109375, 11.28699970, 0.00000000, 0.00000000, 0.00000000); //object(csrsfence02_lvs) (3)
    CreateDynamicObject(1237, 2073.62109375, 2389.82788086, 44.22700119, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (5)
    CreateDynamicObject(1237, 2078.71801758, 2368.53100586, 44.22000122, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (6)
    CreateDynamicObject(1237, 2078.73095703, 2379.38891602, 44.22200012, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (7)
    CreateDynamicObject(3785, 2053.79101562, 2389.77587891, 47.87300110, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (1)
    CreateDynamicObject(3785, 2053.79101562, 2389.77197266, 47.14500046, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (2)
    CreateDynamicObject(3785, 2053.79101562, 2389.75903320, 46.40599823, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (3)
    CreateDynamicObject(3785, 2053.79101562, 2389.75488281, 45.67200089, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (4)
    CreateDynamicObject(3785, 2053.79101562, 2389.75195312, 44.96300125, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (5)
    CreateDynamicObject(3785, 2053.79101562, 2390.33789062, 46.40200043, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (6)
    CreateDynamicObject(3785, 2053.79101562, 2390.90307617, 46.40100098, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (7)
    CreateDynamicObject(3785, 2053.79101562, 2390.32495117, 47.85900116, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (8)
    CreateDynamicObject(3785, 2053.79101562, 2390.87402344, 47.86999893, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (9)
    CreateDynamicObject(3785, 2053.79101562, 2391.42700195, 47.86399841, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (10)
    CreateDynamicObject(3785, 2053.79101562, 2392.43994141, 47.78300095, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (11)
    CreateDynamicObject(3785, 2053.79101562, 2392.43701172, 47.06299973, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (12)
    CreateDynamicObject(3785, 2053.79101562, 2392.43310547, 46.30699921, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (13)
    CreateDynamicObject(3785, 2053.79101562, 2392.52001953, 45.55599976, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (14)
    CreateDynamicObject(3785, 2053.79101562, 2392.93994141, 44.96799850, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (15)
    CreateDynamicObject(3785, 2053.79101562, 2393.52099609, 44.95100021, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (16)
    CreateDynamicObject(3785, 2053.79101562, 2393.97998047, 45.55099869, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (17)
    CreateDynamicObject(3785, 2053.79101562, 2393.98608398, 46.36999893, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (18)
    CreateDynamicObject(3785, 2053.79101562, 2393.99707031, 47.12799835, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (19)
    CreateDynamicObject(3785, 2053.79101562, 2393.99511719, 47.86299896, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (20)
    CreateDynamicObject(3785, 2053.79101562, 2395.10791016, 47.83599854, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (21)
    CreateDynamicObject(3785, 2053.79101562, 2395.10693359, 47.11100006, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (22)
    CreateDynamicObject(3785, 2053.79101562, 2395.11596680, 46.38000107, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (23)
    CreateDynamicObject(3785, 2053.79101562, 2395.10302734, 45.64400101, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (24)
    CreateDynamicObject(3785, 2053.79101562, 2395.10205078, 44.90100098, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (25)
    CreateDynamicObject(3785, 2053.79101562, 2397.09399414, 47.84700012, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (26)
    CreateDynamicObject(3785, 2053.79101562, 2397.10693359, 47.12099838, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (27)
    CreateDynamicObject(3785, 2053.79101562, 2397.12011719, 46.40599823, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (28)
    CreateDynamicObject(3785, 2053.79101562, 2397.13403320, 45.68899918, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (29)
    CreateDynamicObject(3785, 2053.79101562, 2397.14794922, 44.90800095, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (30)
    CreateDynamicObject(3785, 2053.79101562, 2395.54711914, 47.30300140, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (31)
    CreateDynamicObject(3785, 2053.79101562, 2395.90405273, 46.79100037, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (32)
    CreateDynamicObject(3785, 2053.79101562, 2396.20410156, 46.20800018, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (33)
    CreateDynamicObject(3785, 2053.79101562, 2396.65991211, 45.71599960, 0.00000000, 0.00000000, 0.00000000); //object(bulkheadlight) (34)
    CreateDynamicObject(18275, 2061.87792969, 2389.88403320, 46.17499924, 0.00000000, 0.00000000, 0.00000000); //object(cw2_mtbfinish) (1)
    CreateDynamicObject(18275, 2055.91894531, 2389.99511719, 46.17499924, 0.00000000, 0.00000000, 0.00000000); //object(cw2_mtbfinish) (2)
    CreateDynamicObject(18275, 2104.35205078, 2390.01391602, 11.76799965, 0.00000000, 0.00000000, 0.00000000); //object(cw2_mtbfinish) (3)
    CreateDynamicObject(18275, 2113.27709961, 2389.98901367, 11.76799965, 0.00000000, 0.00000000, 0.00000000); //object(cw2_mtbfinish) (4)
    CreateDynamicObject(1262, 2051.77099609, 2393.05688477, 48.73799896, 0.00000000, 0.00000000, 179.99450684); //object(mtraffic4) (1)
    CreateDynamicObject(8674, 2108.67211914, 2390.40405273, 8.91499901, 0.00000000, 90.00000000, 356.00000000); //object(csrsfence02_lvs) (2)


    //Квартира в ЛС
    CreateDynamicObject(2885, 1024.00781250, -1176.30957031, 55.97000122, 0.00000000, 0.00000000, 0.00000000); //object(xref_garagedoor)(1)
    CreateDynamicObject(2885, 1014.73242188, -1176.30957031, 55.97000122, 0.00000000, 0.00000000, 0.00000000); //object(xref_garagedoor)(2)
    CreateDynamicObject(2885, 1003.88671875, -1176.30957031, 55.97000122, 0.00000000, 0.00000000, 0.00000000); //object(xref_garagedoor)(4)
    CreateDynamicObject(1649, 998.59082031, -1175.89941406, 51.61708450, 0.00000000, 0.00000000, 270.00000000); //object(wglasssmash)(2)
    CreateDynamicObject(1649, 998.59082031, -1171.50000000, 51.61708450, 0.00000000, 0.00000000, 270.00000000); //object(wglasssmash)(4)
    CreateDynamicObject(1649, 998.59082031, -1167.11816406, 51.61708450, 0.00000000, 0.00000000, 270.00000000); //object(wglasssmash)(7)
    CreateDynamicObject(1649, 998.59082031, -1162.67993164, 51.61708450, 0.00000000, 0.00000000, 270.00000000); //object(wglasssmash)(8)
    CreateDynamicObject(1649, 998.59082031, -1175.89941406, 51.61708450, 0.00000000, 0.00000000, 90.00000000); //object(wglasssmash)(10)
    CreateDynamicObject(1649, 998.59082031, -1171.50000000, 51.61708450, 0.00000000, 0.00000000, 90.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 998.59082031, -1167.11816406, 51.61708450, 0.00000000, 0.00000000, 90.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 998.59082031, -1162.67993164, 51.61708450, 0.00000000, 0.00000000, 90.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1000.71002197, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 180.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1000.70996094, -1160.44921875, 51.61708450, 0.00000000, 0.00000000, 0.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1005.09997559, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 180.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1005.09997559, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 0.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1009.44000244, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 180.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1009.44000244, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 0.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1013.73999023, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 180.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1013.73999023, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 0.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1018.07995605, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 180.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1018.07995605, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 0.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1022.49993896, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 180.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1022.49993896, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 0.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1026.87805176, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 180.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1026.87805176, -1160.44995117, 51.61708450, 0.00000000, 0.00000000, 0.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1029.04895020, -1162.67993164, 51.61708450, 0.00000000, 0.00000000, 90.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1029.04895020, -1162.67993164, 51.61708450, 0.00000000, 0.00000000, 270.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1029.04882812, -1167.11816406, 51.61708450, 0.00000000, 0.00000000, 90.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1029.04882812, -1167.09960938, 51.61708450, 0.00000000, 0.00000000, 270.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1029.04895020, -1171.50000000, 51.61708450, 0.00000000, 0.00000000, 90.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1029.04895020, -1171.50000000, 51.61708450, 0.00000000, 0.00000000, 270.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1029.04895020, -1175.89941406, 51.61708450, 0.00000000, 0.00000000, 90.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(1649, 1029.04895020, -1175.89941406, 51.61708450, 0.00000000, 0.00000000, 270.00000000); //object(wglasssmash)(3)
    CreateDynamicObject(3095, 1002.59765625, -1173.30004883, 53.28499985, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetdoor)(3)
    CreateDynamicObject(3095, 1002.59765625, -1164.29980469, 53.28499985, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetdoor)(4)
    CreateDynamicObject(3385, 1000.70001221, -1159.94433594, 49.91199875, 0.00000000, 0.00000000, 0.00000000); //object(a51_light1_)(3)
    CreateDynamicObject(3385, 1026.50000000, -1159.94628906, 49.91199875, 0.00000000, 0.00000000, 0.00000000); //object(a51_light1_)(5)
    CreateDynamicObject(3385, 1014.15429688, -1159.96679688, 49.91199875, 0.00000000, 0.00000000, 0.00000000); //object(a51_light1_)(6)
    CreateDynamicObject(3095, 1011.59960938, -1173.29980469, 53.28499985, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetdoor)(1)
    CreateDynamicObject(3095, 1011.59960938, -1164.29980469, 53.28499985, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetdoor)(1)
    CreateDynamicObject(3095, 1020.59960938, -1173.29980469, 53.28499985, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetdoor)(1)
    CreateDynamicObject(3095, 1020.59960938, -1164.29980469, 53.28499985, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetdoor)(1)
    CreateDynamicObject(3095, 1024.98925781, -1173.29980469, 53.28499985, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetdoor)(1)
    CreateDynamicObject(3095, 1024.98925781, -1164.27929688, 53.28499985, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetdoor)(1)
    CreateDynamicObject(2885, 1011.58886719, -1165.90917969, 53.40000153, 0.00000000, 0.00000000, 270.00000000); //object(xref_garagedoor)(5)
    CreateDynamicObject(2885, 1011.58886719, -1165.92968750, 53.40000153, 0.00000000, 0.00000000, 90.00000000); //object(xref_garagedoor)(6)
    CreateDynamicObject(1504, 1026.52490234, -1176.09997559, 49.95838928, 0.00000000, 0.00000000, 0.00000000); //object(gen_doorext06)(1)
    CreateDynamicObject(1502, 1011.59552002, -1174.52001953, 49.98726273, 0.00000000, 0.00000000, 272.00000000); //object(gen_doorint04)(1)
    CreateDynamicObject(2885, 1011.58886719, -1169.11035156, 53.40000153, 0.00000000, 0.00000000, 90.00000000); //object(xref_garagedoor)(3)
    CreateDynamicObject(2885, 1011.58886719, -1169.11035156, 53.40000153, 0.00000000, 0.00000000, 270.00000000); //object(xref_garagedoor)(3)
    CreateDynamicObject(3385, 1020.26580811, -1159.96679688, 49.91199875, 0.00000000, 0.00000000, 0.00000000); //object(a51_light1_)(5)
    CreateDynamicObject(3385, 1008.66180420, -1159.94433594, 49.91199875, 0.00000000, 0.00000000, 0.00000000); //object(a51_light1_)(5)
    CreateDynamicObject(2566, 1014.38671875, -1168.99060059, 50.53116226, 0.00000000, 0.00000000, 90.00000000); //object(hotel_s_bedset_3)(1)
    CreateDynamicObject(2815, 1027.33300781, -1175.07324219, 49.80128860, 0.00000000, 0.00000000, 0.00000000); //object(gb_livingrug01)(1)
    CreateDynamicObject(2815, 1027.23242188, -1175.57421875, 49.88089371, 0.00000000, 0.00000000, 0.00000000); //object(gb_livingrug01)(2)
    CreateDynamicObject(2816, 1013.97796631, -1165.89611816, 49.95134354, 0.00000000, 0.00000000, 0.00000000); //object(gb_bedmags01)(1)
    CreateDynamicObject(646, 1013.00000000, -1162.00000000, 51.36786652, 0.00000000, 0.00000000, 0.00000000); //object(veg_palmkb14)(1)
    CreateDynamicObject(2135, 1010.81640625, -1167.69921875, 49.95134354, 0.00000000, 0.00000000, 270.00000000); //object(cj_k3_cooker)(1)
    CreateDynamicObject(2136, 1010.81665039, -1168.70996094, 49.95134354, 0.00000000, 0.00000000, 270.00000000); //object(cj_k3_sink)(1)
    CreateDynamicObject(1337, 966.39062500, -1243.90039062, 26.86673546, 0.00000000, 0.00000000, 0.00000000); //object(binnt07_la)(1)
    CreateDynamicObject(2841, 1026.52160645, -1175.57482910, 50.09131622, 0.00000000, 0.00000000, 0.00000000); //object(gb_bedrug03)(1)
    CreateDynamicObject(14806, 1028.63049316, -1167.07946777, 51.03736877, 0.00000000, 0.00000000, 270.00000000); //object(bdupshifi)(1)
    CreateDynamicObject(14867, 1020.41796875, -1175.57482910, 51.48105240, 0.00000000, 0.00000000, 0.00000000); //object(bobbie-cupboards)(1)
    CreateDynamicObject(2140, 1010.81640625, -1166.67004395, 49.95134354, 0.00000000, 0.00000000, 270.00000000); //object(cj_k3_tall_unit1)(1)
    CreateDynamicObject(2276, 1014.40734863, -1175.57482910, 51.74304962, 0.00000000, 0.00000000, 180.00000000); //object(frame_fab_3)(1)
    CreateDynamicObject(2270, 1025.38476562, -1175.57482910, 51.47740555, 0.00000000, 0.00000000, 186.00000000); //object(frame_wood_6)(1)
    CreateDynamicObject(2239, 1012.78955078, -1164.17773438, 49.95134354, 0.00000000, 0.00000000, 20.00000000); //object(cj_mlight16)(1)
    CreateDynamicObject(2239, 999.21093750, -1175.57482910, 49.97614670, 0.00000000, 0.00000000, 119.99517822); //object(cj_mlight16)(2)
    CreateDynamicObject(2239, 1010.74420166, -1171.58618164, 49.95134354, 0.00000000, 0.00000000, 251.99267578); //object(cj_mlight16)(3)
    CreateDynamicObject(2239, 1012.78955078, -1170.48547363, 49.95134354, 0.00000000, 0.00000000, 69.99511719); //object(cj_mlight16)(4)
    CreateDynamicObject(2332, 1015.65002441, -1176.41003418, 52.00000000, 0.00000000, 0.00000000, 180.00000000); //object(kev_safe)(1)
    CreateDynamicObject(2627, 1027.04370117, -1161.84765625, 49.95134354, 0.00000000, 0.00000000, 270.00000000); //object(gym_treadmill)(1)
    CreateDynamicObject(1815, 1017.78161621, -1162.48339844, 49.95134354, 0.00000000, 0.00000000, 0.00000000); //object(coffee_low_2)(1)
    CreateDynamicObject(2860, 1018.33764648, -1162.04650879, 50.44779587, 0.00000000, 0.00000000, 0.00000000); //object(gb_kitchtakeway05)(1)
    CreateDynamicObject(1723, 1006.09997559, -1175.36352539, 49.95134354, 0.00000000, 0.00000000, 180.00000000); //object(mrk_seating1)(1)
    CreateDynamicObject(646, 1002.03222656, -1175.21887207, 51.36786652, 0.00000000, 0.00000000, 0.00000000); //object(veg_palmkb14)(1)
    CreateDynamicObject(646, 1010.52001953, -1161.30004883, 51.36786652, 0.00000000, 0.00000000, 0.00000000); //object(veg_palmkb14)(1)
    CreateDynamicObject(2313, 999.12390137, -1167.65002441, 49.95134354, 0.00000000, 0.00000000, 90.00000000); //object(cj_tv_table1)(1)
    CreateDynamicObject(2312, 999.03100586, -1166.99414062, 50.84210205, 0.00000000, 0.00000000, 54.00000000); //object(cj_tele_2)(1)
    CreateDynamicObject(2230, 998.95971680, -1168.19531250, 49.95134354, 0.00000000, 0.00000000, 90.00000000); //object(swank_speaker_2)(1)
    CreateDynamicObject(2230, 998.95971680, -1164.99450684, 49.95134354, 0.00000000, 0.00000000, 88.00000000); //object(swank_speaker_2)(2)
    CreateDynamicObject(1825, 1004.88970947, -1167.54211426, 49.95134354, 0.00000000, 0.00000000, 0.00000000); //object(kb_table_chairs1)(2)
    CreateDynamicObject(2279, 1005.00506592, -1175.57482910, 52.17184830, 0.00000000, 0.00000000, 180.00000000); //object(frame_thick_6)(1)
    CreateDynamicObject(2821, 1010.81378174, -1168.88000488, 51.00459671, 0.00000000, 0.00000000, 0.00000000); //object(gb_foodwrap01)(1)
    //Для выбора скина
    AddStaticVehicle(562, 2637.29492188, 2348.88208008, 10.39299965, 282.00000000, -1, -1); //Elegy
    CreateDynamicObject(2780, 2607.48388672, 2415.49291992, 17.11400032, 0.00000000, 0.00000000, 0.00000000); //object(cj_smoke_mach) (1)
    CreateDynamicObject(2780, 2614.65209961, 2414.62695312, 16.96100044, 0.00000000, 0.00000000, 0.00000000); //object(cj_smoke_mach) (2)
    CreateDynamicObject(2780, 2618.97900391, 2414.21289062, 16.96100044, 0.00000000, 0.00000000, 0.00000000); //object(cj_smoke_mach) (3)
    CreateDynamicObject(2780, 2626.01611328, 2415.16894531, 16.81999969, 0.00000000, 0.00000000, 0.00000000); //object(cj_smoke_mach) (4)
    CreateDynamicObject(2780, 2622.58789062, 2414.91308594, 16.81999969, 0.00000000, 0.00000000, 0.00000000); //object(cj_smoke_mach) (5)
    CreateDynamicObject(2780, 2610.72412109, 2414.62792969, 16.81999969, 0.00000000, 0.00000000, 0.00000000); //object(cj_smoke_mach) (6)
    CreateDynamicObject(672, 2607.82788086, 2422.90795898, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (1)
    CreateDynamicObject(672, 2608.08105469, 2427.09790039, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (2)
    CreateDynamicObject(672, 2608.24511719, 2430.97705078, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (3)
    CreateDynamicObject(672, 2608.29394531, 2435.51196289, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (4)
    CreateDynamicObject(672, 2608.31689453, 2441.06689453, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (5)
    CreateDynamicObject(672, 2608.47412109, 2446.13793945, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (6)
    CreateDynamicObject(672, 2608.32397461, 2451.09497070, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (7)
    CreateDynamicObject(672, 2608.55493164, 2455.93408203, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (8)
    CreateDynamicObject(672, 2613.38110352, 2455.98706055, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (9)
    CreateDynamicObject(672, 2618.13598633, 2456.09204102, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (10)
    CreateDynamicObject(672, 2621.92089844, 2455.94995117, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (11)
    CreateDynamicObject(672, 2624.88500977, 2452.25000000, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (12)
    CreateDynamicObject(672, 2627.13305664, 2448.27709961, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (13)
    CreateDynamicObject(672, 2629.88110352, 2444.35107422, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (14)
    CreateDynamicObject(672, 2632.45996094, 2440.41699219, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (15)
    CreateDynamicObject(672, 2635.42407227, 2435.53588867, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (16)
    CreateDynamicObject(672, 2637.87109375, 2431.07592773, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (17)
    CreateDynamicObject(672, 2640.44409180, 2425.76489258, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (18)
    CreateDynamicObject(672, 2642.69189453, 2421.09106445, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (19)
    CreateDynamicObject(672, 2644.76293945, 2415.95288086, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (20)
    CreateDynamicObject(672, 2639.29199219, 2415.97290039, 13.86699963, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (21)
    CreateDynamicObject(672, 2634.61401367, 2415.89599609, 13.86100006, 0.00000000, 0.00000000, 128.35879517); //object(sm_veg_tree5) (22)



    //Объекты на респавнах
    CreateDynamicObject(711, 2545.30004883, -1491.90002441, 29.00000000, 0.00000000, 0.00000000, 0.00000000); //object(vgs_palm02) (1)
    CreateDynamicObject(711, 2545.19995117, -1487.00000000, 29.00000000, 0.00000000, 0.00000000, 0.00000000); //object(vgs_palm02) (2)
    CreateDynamicObject(711, 2545.10009766, -1481.59997559, 29.00000000, 0.00000000, 0.00000000, 0.00000000); //object(vgs_palm02) (3)
    CreateDynamicObject(711, 2545.09960938, -1477.29980469, 29.00000000, 0.00000000, 0.00000000, 0.00000000); //object(vgs_palm02) (4)
    CreateDynamicObject(983, 2545.39990234, -1488.69995117, 23.70000076, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (1)
    CreateDynamicObject(983, 2545.39990234, -1482.30004883, 23.70000076, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (2)
    CreateDynamicObject(983, 2545.39941406, -1480.69921875, 23.70000076, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (3)
    CreateDynamicObject(983, 2541.80004883, -1477.09997559, 23.70000076, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit3) (4)
    CreateDynamicObject(983, 2542.39990234, -1492.00000000, 23.70000076, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit3) (5)
    CreateDynamicObject(983, 2517.80004883, -1472.80004883, 23.70000076, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (3)
    CreateDynamicObject(983, 2517.80004883, -1466.40002441, 23.70000076, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (3)
    CreateDynamicObject(12843, 2540.30004883, -1467.59997559, 23.00000000, 0.00000000, 0.00000000, 270.00000000); //object(cos_liquorshop) (2)
    CreateDynamicObject(983, 2542.80004883, -1455.59997559, 23.70000076, 0.00000000, 0.00000000, 50.00000000); //object(fenceshit3) (3)
    CreateDynamicObject(711, 2542.69995117, -1456.69995117, 29.00000000, 0.00000000, 0.00000000, 0.00000000); //object(vgs_palm02) (4)
    CreateDynamicObject(1215, 2517.80004883, -1463.09997559, 23.50000000, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (1)
    CreateDynamicObject(1215, 2517.80004883, -1456.50000000, 23.50000000, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (2)
    CreateDynamicObject(1504, 2545.30004883, -1458.19995117, 23.00000000, 0.00000000, 0.00000000, 270.00000000); //object(gen_doorext06) (1)
    CreateDynamicObject(1706, 2543.19995117, -1465.80004883, 23.00000000, 0.00000000, 0.00000000, 270.00000000); //object(kb_couch03) (1)
    CreateDynamicObject(1706, 2540.50000000, -1464.09997559, 23.00000000, 0.00000000, 0.00000000, 359.99499512); //object(kb_couch03) (2)
    CreateDynamicObject(1706, 2538.89990234, -1466.69995117, 23.00000000, 0.00000000, 0.00000000, 89.98950195); //object(kb_couch03) (3)
    CreateDynamicObject(1706, 2541.39990234, -1468.50000000, 23.00000000, 0.00000000, 0.00000000, 179.98950195); //object(kb_couch03) (4)
    CreateDynamicObject(2024, 2540.50000000, -1466.80004883, 23.00000000, 0.00000000, 0.00000000, 0.00000000); //object(mrk_liv_tble) (1)
    CreateDynamicObject(3017, 2541.00000000, -1466.80004883, 23.60000038, 0.00000000, 0.00000000, 0.00000000); //object(arch_plans) (1)
    CreateDynamicObject(3524, 2517.80004883, -1463.19995117, 25.89999962, 0.00000000, 0.00000000, 86.00000000); //object(skullpillar01_lvs) (1)
    CreateDynamicObject(3524, 2517.80004883, -1456.90002441, 25.89999962, 0.00000000, 0.00000000, 85.99548340); //object(skullpillar01_lvs) (2)
    CreateDynamicObject(3525, 2533.00000000, -1476.90002441, 27.20000076, 0.00000000, 0.00000000, 148.00000000); //object(exbrtorch01) (1)
    CreateDynamicObject(3525, 2537.10009766, -1476.90002441, 27.20000076, 0.00000000, 0.00000000, 147.99682617); //object(exbrtorch01) (2)
    CreateDynamicObject(3525, 2540.50000000, -1476.90002441, 27.20000076, 0.00000000, 0.00000000, 147.99682617); //object(exbrtorch01) (3)
    CreateDynamicObject(2921, 2535.30004883, -1471.90002441, 26.89999962, 0.00000000, 0.00000000, 0.00000000); //object(kmb_cam) (1)
    CreateDynamicObject(1222, 2530.89990234, -1475.00000000, 23.50000000, 0.00000000, 0.00000000, 0.00000000); //object(barrel3) (2)
    CreateDynamicObject(1550, 2542.89990234, -1467.59997559, 23.39999962, 0.00000000, 0.00000000, 0.00000000); //object(cj_money_bag) (1)
    CreateDynamicObject(1550, 2543.39990234, -1467.59997559, 23.39999962, 0.00000000, 0.00000000, 0.00000000); //object(cj_money_bag) (2)
    CreateDynamicObject(1550, 2543.19995117, -1467.90002441, 23.39999962, 0.00000000, 0.00000000, 0.00000000); //object(cj_money_bag) (3)
    CreateDynamicObject(2690, 2540.60009766, -1458.00000000, 24.10000038, 0.00000000, 0.00000000, 0.00000000); //object(cj_fire_ext) (1)
    CreateDynamicObject(3525, 2502.30004883, -1465.09997559, 26.20000076, 0.00000000, 0.00000000, 147.99682617); //object(exbrtorch01) (4)
    CreateDynamicObject(3525, 2485.89990234, -1465.09997559, 26.20000076, 0.00000000, 0.00000000, 147.99682617); //object(exbrtorch01) (5)
    CreateDynamicObject(3525, 2468.30004883, -1465.09997559, 26.39999962, 0.00000000, 0.00000000, 147.99682617); //object(exbrtorch01) (6)
    CreateDynamicObject(3524, 2239.00000000, -2220.60009766, 15.39999962, 0.00000000, 0.00000000, 326.00000000); //object(skullpillar01_lvs) (1)
    CreateDynamicObject(3524, 2229.10009766, -2210.80004883, 15.39999962, 0.00000000, 0.00000000, 325.99731445); //object(skullpillar01_lvs) (2)
    CreateDynamicObject(6865, 2179.00000000, -2254.89990234, 20.10000038, 0.00000000, 0.00000000, 90.00000000); //object(steerskull) (1)
    CreateDynamicObject(3749, 2102.00000000, 2463.69995117, 15.30000019, 0.00000000, 0.00000000, 0.00000000); //object(clubgate01_lax) (1)
    CreateDynamicObject(987, 2080.80004883, 2463.39990234, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(elecfence_bar) (1)
    CreateDynamicObject(987, 2068.89990234, 2463.39990234, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(elecfence_bar) (2)
    CreateDynamicObject(3749, 2062.89990234, 2462.10009766, 15.19999981, 0.00000000, 0.00000000, 0.00000000); //object(clubgate01_lax) (2)
    CreateDynamicObject(987, 2041.90002441, 2463.00000000, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(elecfence_bar) (3)
    CreateDynamicObject(987, 2039.00000000, 2463.00000000, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(elecfence_bar) (4)
    CreateDynamicObject(3749, 2039.40002441, 2476.19995117, 15.39999962, 0.00000000, 0.00000000, 270.00000000); //object(clubgate01_lax) (3)
    CreateDynamicObject(987, 2043.50000000, 2495.80004883, 10.00000000, 0.00000000, 0.00000000, 240.00000000); //object(elecfence_bar) (5)
    CreateDynamicObject(706, 2038.40002441, 2464.10009766, 10.10000038, 0.00000000, 0.00000000, 11.00280762); //object(sm_vegvbbig) (1)
    CreateDynamicObject(987, 2111.80004883, 2463.30004883, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(elecfence_bar) (6)
    CreateDynamicObject(987, 2123.60009766, 2463.30004883, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(elecfence_bar) (7)
    CreateDynamicObject(987, 2135.50000000, 2463.30004883, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(elecfence_bar) (8)
    CreateDynamicObject(987, 2145.39990234, 2463.30004883, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(elecfence_bar) (9)
    CreateDynamicObject(706, 2155.80004883, 2463.69995117, 9.10000038, 0.00000000, 0.00000000, 11.00280762); //object(sm_vegvbbig) (2)

    //Дрифт NEW!! by Basota
    AddStaticVehicle(477, 2102.50000000, 1963.80004883, 10.69999981, 96.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, 2094.60009766, 1962.30004883, 10.89999962, 105.99853516, -1, -1); //ZR-350
    CreateDynamicObject(984, 1910.00000000, 1963.00000000, 7.19999981, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit2) (1)
    CreateDynamicObject(1237, 1903.09997559, 1962.90002441, 6.59999990, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (1)
    CreateDynamicObject(982, 1902.50000000, 1975.80004883, 7.30000019, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (1)
    CreateDynamicObject(983, 1902.50000000, 1990.19995117, 7.30000019, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (1)
    CreateDynamicObject(984, 1860.09997559, 1995.30004883, 7.19999981, 0.00000000, 0.00000000, 274.00000000); //object(fenceshit2) (2)
    CreateDynamicObject(1237, 1853.59997559, 1994.90002441, 6.59999990, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (2)
    CreateDynamicObject(984, 1910.09997559, 1960.30004883, 7.19999981, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit2) (3)
    CreateDynamicObject(1237, 1903.19995117, 1960.30004883, 6.59999990, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (3)
    CreateDynamicObject(984, 1908.90002441, 2009.59997559, 13.39999962, 0.00000000, 0.00000000, 267.99902344); //object(fenceshit2) (4)
    CreateDynamicObject(1237, 1915.50000000, 2009.40002441, 12.80000019, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (4)
    CreateDynamicObject(982, 1902.50000000, 1975.80004883, 13.50000000, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (3)
    CreateDynamicObject(983, 1902.50000000, 1990.19995117, 13.50000000, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (2)
    CreateDynamicObject(984, 1860.30004883, 1960.09997559, 13.39999962, 0.00000000, 0.00000000, 267.99499512); //object(fenceshit2) (6)
    CreateDynamicObject(1237, 1853.80004883, 1960.30004883, 12.80000019, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (5)
    CreateDynamicObject(984, 1860.30004883, 1943.50000000, 7.19999981, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit2) (7)
    CreateDynamicObject(1237, 1853.80004883, 1943.59997559, 6.59999990, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (6)
    CreateDynamicObject(979, 1921.59997559, 1962.69995117, 7.40000010, 0.00000000, 0.00000000, 0.00000000); //object(sub_roadleft) (2)
    CreateDynamicObject(979, 1926.50000000, 1958.00000000, 7.40000010, 0.00000000, 0.00000000, 274.00000000); //object(sub_roadleft) (3)
    CreateDynamicObject(979, 1927.09997559, 1948.80004883, 7.40000010, 0.00000000, 0.00000000, 273.99902344); //object(sub_roadleft) (4)
    CreateDynamicObject(707, 1924.80004883, 1942.30004883, 6.69999981, 0.00000000, 0.00000000, 354.57824707); //object(sm_bushvbig) (1)
    CreateDynamicObject(707, 1924.40002441, 1950.19995117, 6.59999990, 0.00000000, 0.00000000, 354.57824707); //object(sm_bushvbig) (2)
    CreateDynamicObject(707, 1924.59997559, 1957.40002441, 6.59999990, 0.00000000, 0.00000000, 354.57824707); //object(sm_bushvbig) (3)
    CreateDynamicObject(984, 1879.50000000, 1790.19995117, 12.39999962, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit2) (8)
    CreateDynamicObject(1237, 1886.00000000, 1790.09997559, 11.69999981, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (7)
    CreateDynamicObject(982, 1954.80004883, 1774.69995117, 12.39999962, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (4)
    CreateDynamicObject(983, 1954.80004883, 1760.30004883, 12.39999962, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (3)
    CreateDynamicObject(984, 1961.90002441, 1757.90002441, 12.39999962, 0.00000000, 0.00000000, 88.00000000); //object(fenceshit2) (9)
    CreateDynamicObject(1237, 1955.59997559, 1757.90002441, 11.69999981, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (8)
    CreateDynamicObject(1237, 1955.00000000, 1757.90002441, 11.69999981, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (9)
    CreateDynamicObject(984, 1922.09997559, 1797.40002441, 12.39999962, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit2) (10)
    CreateDynamicObject(1237, 1922.09997559, 1790.80004883, 11.80000019, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (10)
    CreateDynamicObject(984, 2096.60009766, 1863.80004883, 10.30000019, 0.00000000, 0.00000000, 354.00000000); //object(fenceshit2) (11)
    CreateDynamicObject(1237, 2097.30004883, 1870.19995117, 10.00000000, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (11)
    CreateDynamicObject(1237, 2097.39990234, 1870.90002441, 10.00000000, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (12)
    CreateDynamicObject(994, 2106.50000000, 1975.80004883, 9.69999981, 0.00000000, 0.00000000, 274.00000000); //object(lhouse_barrier2) (1)
    CreateDynamicObject(994, 2107.00000000, 1968.80004883, 9.69999981, 0.00000000, 0.00000000, 273.99902344); //object(lhouse_barrier2) (2)
    CreateDynamicObject(11500, 2079.19995117, 1854.30004883, 9.89999962, 0.00000000, 0.00000000, 356.00000000); //object(des_skelsignbush_) (1)
    CreateDynamicObject(16090, 2098.80004883, 1975.40002441, 9.69999981, 0.00000000, 0.00000000, 274.00000000); //object(des_pipestrut03) (1)
    CreateDynamicObject(1238, 2096.50000000, 1868.50000000, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (1)
    CreateDynamicObject(1238, 2095.69995117, 1869.69995117, 10.19999981, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (2)
    CreateDynamicObject(1238, 2094.80004883, 1870.50000000, 10.39999962, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (3)
    CreateDynamicObject(1238, 2093.89990234, 1871.59997559, 10.39999962, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (4)
    CreateDynamicObject(1238, 1915.59997559, 2022.19995117, 6.90000010, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (5)
    CreateDynamicObject(1238, 1915.00000000, 2023.09997559, 6.90000010, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (6)
    CreateDynamicObject(1238, 1914.19995117, 2024.00000000, 6.90000010, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (7)
    CreateDynamicObject(1238, 1913.30004883, 2024.90002441, 6.90000010, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (8)
    CreateDynamicObject(1238, 1913.50000000, 2008.90002441, 13.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (9)
    CreateDynamicObject(1238, 1914.40002441, 2007.59997559, 13.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (10)
    CreateDynamicObject(1238, 1915.59997559, 2006.00000000, 13.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (11)
    CreateDynamicObject(1232, 1917.40002441, 1976.69995117, 9.19999981, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (1)
    CreateDynamicObject(1232, 1914.90002441, 1961.80004883, 9.19999981, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (2)
    CreateDynamicObject(1232, 1910.00000000, 1961.50000000, 9.19999981, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (3)
    CreateDynamicObject(1232, 1905.40002441, 1961.40002441, 9.19999981, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (4)
    CreateDynamicObject(1262, 2098.39990234, 1974.59997559, 17.20000076, 0.00000000, 0.00000000, 190.00000000); //object(mtraffic4) (1)


    //aero LS
    //AddStaticVehicle(429,1552.55627441,-2360.52026367,13.30465508,0.00000000,-1,-1); //Banshee
    //AddStaticVehicle(429,1549.52111816,-2360.36572266,13.30465508,0.00000000,-1,-1); //Banshee
    //AddStaticVehicle(429,1546.33447266,-2360.30590820,13.30465508,0.00000000,-1,-1); //Banshee
    //AddStaticVehicle(562,1536.20019531,-2360.56103516,13.30820465,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(562,1533.05200195,-2360.61621094,13.30820465,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(562,1529.89465332,-2360.67529297,13.30820465,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(475,1548.40600586,-2346.89257812,13.87189102,0.00000000,-1,6); //Sabre
    CreateDynamicObject(3516, 1583.44384766, -2376.03710938, 15.78254223, 0.00000000, 0.00000000, 89.82501221); //object(vgsstriptlights1)(1)
    CreateDynamicObject(1238, 1589.44042969, -2382.49218750, 12.69318008, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone)(1)
    CreateDynamicObject(1238, 1589.38000488, -2373.91308594, 12.69318008, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone)(2)
    CreateDynamicObject(1215, 1588.68530273, -2378.21044922, 12.93932343, 0.00000000, 0.00000000, 1.98498535); //object(bollardlight)(8)
    CreateDynamicObject(3379, 1340.19152832, -2372.02490234, 20.73039055, 1.75000000, 0.00000000, 91.31002808); //object(ce_hairpinr)(1)
    CreateDynamicObject(18102, 1603.75671387, -2382.36279297, 19.26451874, 0.00000000, 0.00000000, 266.70495605); //object(light_box1)(1)
    CreateDynamicObject(10575, 1361.59057617, -2439.17651367, 8.58372498, 0.00000000, 0.00000000, 91.31002808); //object(modshopdoor1_sfs)(1)
    CreateDynamicObject(10575, 1354.73400879, -2439.14404297, 8.56458950, 0.00000000, 0.00000000, 90.07501221); //object(modshopdoor1_sfs)(2)
    CreateDynamicObject(10575, 1361.59020996, -2474.21704102, 8.50075626, 0.00000000, 0.00000000, 269.67498779); //object(modshopdoor1_sfs)(3)
    CreateDynamicObject(10575, 1354.70227051, -2474.27343750, 8.50157070, 0.00000000, 0.00000000, 271.42498779); //object(modshopdoor1_sfs)(4)
    CreateDynamicObject(18286, 1573.16003418, -2371.94946289, 11.60791302, 353.27636719, 0.00000000, 73.44360352); //object(cw_mountbarr06)(1)
    CreateDynamicObject(18286, 1509.21752930, -2371.79565430, 11.63291264, 352.77087402, 0.00000000, 73.43811035); //object(cw_mountbarr06)(2)
    CreateDynamicObject(1215, 1303.98205566, -2297.96337891, 13.08053398, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(16)
    CreateDynamicObject(1215, 1307.49353027, -2298.66552734, 13.10111427, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(17)
    CreateDynamicObject(1215, 1310.17553711, -2299.00097656, 13.11119843, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(18)
    CreateDynamicObject(1215, 1312.61950684, -2300.52734375, 13.11119843, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(19)
    CreateDynamicObject(1215, 1314.56506348, -2301.24023438, 13.11119843, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(20)
    CreateDynamicObject(1215, 1316.41442871, -2302.27832031, 13.11119843, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(21)
    CreateDynamicObject(1215, 1318.14770508, -2303.12451172, 13.11119843, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(22)
    CreateDynamicObject(1215, 1320.69982910, -2304.56420898, 13.11119843, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(23)
    CreateDynamicObject(1215, 1320.69982910, -2304.56420898, 13.11119843, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(24)
    CreateDynamicObject(18219, 1330.51623535, -2315.11596680, 13.44942760, 354.04504395, 0.00000000, 0.00000000); //object(mtbfence09)(1)
    CreateDynamicObject(18219, 1339.46923828, -2339.44116211, 13.44942760, 354.03991699, 0.00000000, 320.53500366); //object(mtbfence09)(2)
    CreateDynamicObject(18219, 1339.68432617, -2367.01513672, 13.44942760, 354.03991699, 0.00000000, 320.53161621); //object(mtbfence09)(3)
    CreateDynamicObject(18219, 1339.95410156, -2394.64550781, 13.44942760, 354.03991699, 0.00000000, 320.53161621); //object(mtbfence09)(4)
    CreateDynamicObject(18219, 1333.01232910, -2420.30615234, 13.44942760, 355.78991699, 356.52999878, 109.40597534); //object(mtbfence09)(5)
    CreateDynamicObject(18219, 1315.83007812, -2510.76855469, 12.41665745, 351.03515625, 356.52282715, 325.46447754); //object(mtbfence09)(6)
    CreateDynamicObject(18219, 1343.35668945, -2519.11279297, 13.22379780, 357.28674316, 356.52832031, 95.50683594); //object(mtbfence09)(7)
    CreateDynamicObject(18219, 1315.11328125, -2424.71801758, 9.34372044, 13.11999512, 352.21276855, 320.25952148); //object(mtbfence09)(8)
    CreateDynamicObject(18219, 1314.52246094, -2397.33105469, 12.79372501, 6.09741211, 349.70581055, 320.25146484); //object(mtbfence09)(9)
    CreateDynamicObject(18219, 1314.36279297, -2454.38378906, 7.59373236, 9.14767456, 344.27075195, 320.52197266); //object(mtbfence09)(10)
    CreateDynamicObject(18219, 1314.27429199, -2482.55834961, 8.96671009, 346.53515625, 356.52282715, 318.49450684); //object(mtbfence09)(11)
    CreateDynamicObject(18219, 1360.94873047, -2456.70043945, 7.49788523, 355.52999878, 0.00000000, 50.56500244); //object(mtbfence09)(12)
    CreateDynamicObject(18219, 1328.41247559, -2457.21069336, 7.49788523, 355.52856445, 0.00000000, 50.56457520); //object(mtbfence09)(13)
    CreateDynamicObject(16281, 1344.37719727, -2456.78320312, 6.90158176, 0.00000000, 0.00000000, 0.00000000); //object(des_fgateway01)(1)
    CreateDynamicObject(18220, 1530.74877930, -2288.32128906, -2.91943979, 358.50000000, 359.25000000, 337.15002441); //object(mtbfence10)(1)
    CreateDynamicObject(18219, 1351.62829590, -2391.62548828, 13.44942760, 354.03991699, 0.00000000, 320.53161621); //object(mtbfence09)(14)
    CreateDynamicObject(18219, 1351.99694824, -2364.14379883, 13.44942760, 354.03991699, 0.00000000, 317.78161621); //object(mtbfence09)(15)
    CreateDynamicObject(18219, 1345.56469727, -2313.46459961, 13.44942760, 354.03991699, 0.00000000, 113.14501953); //object(mtbfence09)(16)
    CreateDynamicObject(18219, 1361.10461426, -2290.84179688, 13.44942760, 354.03991699, 0.00000000, 97.26269531); //object(mtbfence09)(17)
    CreateDynamicObject(18219, 1352.76757812, -2336.59960938, 13.44942760, 354.03991699, 0.00000000, 319.02648926); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1384.25146484, -2280.78295898, 13.44942760, 354.03991699, 0.00000000, 49.62194824); //object(mtbfence09)(19)
    CreateDynamicObject(18219, 1428.48974609, -2291.50366211, 13.44942760, 354.03991699, 0.00000000, 49.61975098); //object(mtbfence09)(20)
    CreateDynamicObject(18219, 1400.94848633, -2292.79272461, 13.44942760, 354.03991699, 0.00000000, 55.57434082); //object(mtbfence09)(21)
    CreateDynamicObject(18219, 1444.53112793, -2278.08374023, 13.44942760, 354.03991699, 0.00000000, 131.00476074); //object(mtbfence09)(22)
    CreateDynamicObject(18219, 1478.73339844, -2244.01269531, 13.44942760, 354.03991699, 0.00000000, 131.00097656); //object(mtbfence09)(23)
    CreateDynamicObject(18219, 1481.19067383, -2216.60009766, 13.37442112, 355.03991699, 0.00000000, 138.94097900); //object(mtbfence09)(24)
    CreateDynamicObject(18219, 1495.28515625, -2202.04492188, 13.37442112, 355.03967285, 0.00000000, 233.00903320); //object(mtbfence09)(25)
    CreateDynamicObject(18219, 1468.25573730, -2216.30517578, 13.37442112, 355.03967285, 0.00000000, 138.93859863); //object(mtbfence09)(26)
    CreateDynamicObject(18219, 1729.51074219, -2176.95532227, 14.19632053, 355.03967285, 0.00000000, 48.36358643); //object(mtbfence09)(27)
    CreateDynamicObject(18219, 1488.11975098, -2187.91674805, 13.77441502, 355.03967285, 0.00000000, 51.10290527); //object(mtbfence09)(28)
    CreateDynamicObject(18219, 1757.08435059, -2177.68164062, 13.82132626, 355.03967285, 0.00000000, 48.36181641); //object(mtbfence09)(29)
    CreateDynamicObject(18219, 1784.75427246, -2178.72290039, 13.82132626, 355.03967285, 0.00000000, 48.36181641); //object(mtbfence09)(30)
    CreateDynamicObject(18219, 1793.60498047, -2205.31762695, 13.82132626, 355.03967285, 0.25000000, 47.87683105); //object(mtbfence09)(31)
    CreateDynamicObject(18219, 1793.29882812, -2366.97290039, 13.82132626, 355.03967285, 0.24719238, 47.87292480); //object(mtbfence09)(32)
    CreateDynamicObject(3334, 1465.54553223, -2230.55957031, 16.93926811, 0.00000000, 0.00000000, 281.84997559); //object(big_cock_sign)(1)
    CreateDynamicObject(18219, 1314.12194824, -2371.07519531, 13.24371815, 6.06741333, 347.72082520, 320.25146484); //object(mtbfence09)(9)
    CreateDynamicObject(18219, 1307.98242188, -2344.96386719, 13.24371815, 6.05895996, 347.71728516, 346.05285645); //object(mtbfence09)(9)
    CreateDynamicObject(18219, 1362.83264160, -2312.88403320, 13.44942760, 354.03991699, 0.00000000, 275.35681152); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1515.58850098, -2186.60864258, 13.81351376, 354.03991699, 0.00000000, 235.65600586); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1543.11853027, -2184.80786133, 13.63851643, 354.03991699, 0.00000000, 231.46124268); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1570.40844727, -2181.92895508, 13.23850727, 354.03991699, 0.00000000, 240.40124512); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1625.17431641, -2175.97265625, 13.29633045, 354.03991699, 0.00000000, 233.15124512); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1597.70092773, -2178.08203125, 13.37132263, 354.03991699, 0.00000000, 235.65124512); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1652.63928223, -2174.45483398, 13.29633045, 354.03991699, 0.00000000, 233.14636230); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1680.08557129, -2174.79443359, 13.29633045, 354.03991699, 0.00000000, 225.47137451); //object(mtbfence09)(18)
    CreateDynamicObject(18219, 1522.85522461, -2201.52001953, 13.37442112, 355.03967285, 358.01501465, 229.05401611); //object(mtbfence09)(25)
    CreateDynamicObject(18219, 1550.46643066, -2202.09497070, 13.37442112, 355.03967285, 358.01147461, 228.30395508); //object(mtbfence09)(25)
    CreateDynamicObject(18219, 1577.92687988, -2204.24877930, 13.37442112, 355.03967285, 358.01147461, 222.34637451); //object(mtbfence09)(25)
    CreateDynamicObject(18219, 1288.36645508, -2330.51147461, 13.24371815, 350.17895508, 3.59716797, 41.63244629); //object(mtbfence09)(9)
    CreateDynamicObject(18219, 1408.73425293, -2272.18505859, 13.59765053, 0.00000000, 355.00000000, 89.32501221); //object(mtbfence09)(47)
    CreateDynamicObject(18219, 1428.16809082, -2252.75000000, 13.47265244, 357.50000000, 356.98071289, 280.11914062); //object(mtbfence09)(48)
    CreateDynamicObject(18219, 1450.13623047, -2236.46875000, 13.59765053, 0.00000000, 353.97875977, 252.09045410); //object(mtbfence09)(49)
    CreateDynamicObject(18221, 1378.91442871, -2301.42578125, 13.55608273, 357.25000000, 0.00000000, 290.52499390); //object(mtbfence11)(1)
    CreateDynamicObject(1215, 1384.74975586, -2294.97143555, 13.05544853, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(7)
    CreateDynamicObject(1215, 1381.34216309, -2296.65161133, 13.03284264, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(7)
    CreateDynamicObject(1215, 1376.68872070, -2299.86791992, 13.07365131, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(7)
    CreateDynamicObject(1215, 1378.69714355, -2298.00146484, 13.04692745, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(7)
    CreateDynamicObject(1215, 1373.76647949, -2301.73559570, 13.09638119, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(7)
    CreateDynamicObject(1215, 1437.20446777, -2242.05834961, 13.11802673, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(7)
    CreateDynamicObject(18219, 1450.09851074, -2387.65722656, 13.78856659, 0.00000000, 0.00000000, 47.86001587); //object(mtbfence09)(51)
    CreateDynamicObject(18219, 1451.07434082, -2368.48876953, 13.81033897, 0.00000000, 0.00000000, 49.62500000); //object(mtbfence09)(52)
    CreateDynamicObject(7893, 1324.50024414, -2530.65283203, 12.79263687, 0.00000000, 0.47000122, 346.00000000); //object(vegascrashbar04)(1)
    CreateDynamicObject(973, 1333.07873535, -2528.33081055, 12.94081497, 0.00000000, 0.00000000, 214.38006592); //object(sub_roadbarrier)(1)
    CreateDynamicObject(973, 1318.39123535, -2524.45800781, 13.09022236, 0.00000000, 0.00000000, 113.14501953); //object(sub_roadbarrier)(2)
    CreateDynamicObject(973, 1468.31762695, -2197.99804688, 13.22303295, 0.00000000, 0.00000000, 91.31002808); //object(sub_roadbarrier)(3)
    CreateDynamicObject(994, 1468.62121582, -2192.77075195, 12.38281250, 0.00000000, 0.00000000, 37.71499634); //object(lhouse_barrier2)(1)
    CreateDynamicObject(1282, 1545.09387207, -2365.20434570, 13.23569107, 0.00000000, 0.00000000, 359.99938965); //object(barrierm)(1)
    CreateDynamicObject(1282, 1537.78405762, -2365.35424805, 13.24347115, 0.00000000, 358.01501465, 175.39025879); //object(barrierm)(2)
    CreateDynamicObject(1237, 1545.14147949, -2366.92065430, 12.54687500, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(1)
    CreateDynamicObject(1237, 1537.65515137, -2366.87475586, 12.54687500, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(2)
    CreateDynamicObject(18219, 1469.68469238, -2368.24145508, 12.51032829, 355.00000000, 0.00000000, 49.61975098); //object(mtbfence09)(56)
    CreateDynamicObject(13646, 1548.41064453, -2346.93627930, 12.47085857, 0.00000000, 0.00000000, 0.00000000); //object(ramplandpad)(1)
    CreateDynamicObject(2932, -1116.66394043, 376.00985718, 14.60035706, 0.00000000, 0.00000000, 314.34500122); //object(kmb_container_blue)(1)
    CreateDynamicObject(8229, -1110.58654785, 396.37109375, 15.84966755, 0.00000000, 0.00000000, 162.77001953); //object(vgsbikeschl02)(1)
    CreateDynamicObject(8229, -1096.58483887, 382.55633545, 15.84966755, 0.00000000, 0.00000000, 108.42294312); //object(vgsbikeschl02)(2)
    CreateDynamicObject(8229, -1101.20812988, 364.43368530, 15.84966755, 0.00000000, 0.00000000, 42.91357422); //object(vgsbikeschl02)(3)
    CreateDynamicObject(8229, -1128.60180664, 391.44754028, 15.84966755, 0.00000000, 0.00000000, 230.00262451); //object(vgsbikeschl02)(4)
    CreateDynamicObject(3031, -1118.68041992, 374.43728638, 17.65752792, 0.00000000, 0.00000000, 226.98995972); //object(wong_dish)(1)
    CreateDynamicObject(16052, -1686.59570312, -163.30168152, 17.71630859, 0.00000000, 0.00000000, 43.67001343); //object(des_ghotfence)(1)
    //Ограждения около Джиззи
    CreateDynamicObject(3578, -2615.08, 1350.81, 6.86, 0.00, 0.00, 91.98);
    CreateDynamicObject(3578, -2615.18, 1371.80, 6.86, 0.00, 0.00, 91.98);
    CreateDynamicObject(3578, -2615.28, 1375.76, 6.86, 0.00, 0.00, 91.98);
    CreateDynamicObject(3578, -2630.35, 1380.97, 6.86, 0.00, 0.00, 180.98);
    CreateDynamicObject(3578, -2620.30, 1381.12, 6.86, 0.00, 0.00, 180.98);
    CreateDynamicObject(3578, -2640.04, 1380.83, 6.86, 0.00, 0.00, 180.98);
    CreateDynamicObject(3578, -2643.48, 1380.77, 6.86, 0.00, 0.00, 180.98);
    CreateDynamicObject(3578, -2648.69, 1375.72, 6.86, 0.00, 0.00, 86.16);
    CreateDynamicObject(3578, -2649.10, 1356.14, 6.86, 0.00, 0.00, 90.16);
    CreateDynamicObject(3578, -2649.07, 1346.19, 6.86, 0.00, 0.00, 90.16);
    CreateDynamicObject(3578, -2649.05, 1336.13, 6.86, 0.00, 0.00, 90.16);
    CreateDynamicObject(3578, -2643.97, 1331.30, 6.86, 0.00, 0.00, 180.16);
    CreateDynamicObject(3578, -2634.32, 1331.31, 6.86, 0.00, 0.00, 180.16);
    CreateDynamicObject(3578, -2632.61, 1331.31, 6.86, 0.00, 0.00, 180.16);
    CreateDynamicObject(3578, -2624.20, 1334.79, 6.86, 0.00, 0.00, 45.16);
    CreateDynamicObject(3578, -2617.96, 1341.85, 6.86, 0.00, 0.00, 52.79);
    //Зона домов bu Basota
    AddStaticVehicle(560, 1487.80004883, 2854.00000000, 10.69999981, 0.00000000, -1, -1); //Sultan
    AddStaticVehicle(560, 1521.40002441, 2816.39990234, 10.60000038, 0.00000000, -1, -1); //Sultan
    AddStaticVehicle(562, 1521.19995117, 2853.00000000, 10.60000038, 174.00000000, -1, -1); //Elegy
    AddStaticVehicle(477, 1501.40002441, 2852.50000000, 10.60000038, 180.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, 1457.90002441, 2857.39990234, 10.60000038, 180.00000000, -1, 1); //ZR-350
    AddStaticVehicle(477, 1423.09997559, 2851.50000000, 10.60000038, 89.99987793, -1, 1); //ZR-350
    AddStaticVehicle(506, 1422.90002441, 2856.10009766, 10.60000038, 90.00000000, -1, -1); //Super GT
    AddStaticVehicle(558, 1422.90002441, 2860.39990234, 10.50000000, 90.00000000, -1, -1); //Uranus
    AddStaticVehicle(541, 1423.09997559, 2864.69995117, 10.50000000, 90.00000000, -1, -1); //Bullet
    AddStaticVehicle(411, 1422.90002441, 2868.89990234, 10.60000038, 90.00000000, -1, -1); //Infernus
    AddStaticVehicle(402, 1422.90002441, 2873.00000000, 10.80000019, 88.00000000, -1, -1); //Buffalo
    AddStaticVehicle(451, 1467.50000000, 2847.39990234, 10.60000038, 270.00000000, -1, -1); //Turismo
    AddStaticVehicle(451, 1475.00000000, 2847.39990234, 10.60000038, 269.99499512, -1, -1); //Turismo
    AddStaticVehicle(451, 1482.30004883, 2847.50000000, 10.60000038, 269.99450684, -1, -1); //Turismo
    CreateDynamicObject(9259, 1426.30004883, 2823.80004883, 15.00000000, 0.00000000, 0.00000000, 182.00000000); //object(preshoosbig02_sfn) (1)
    CreateDynamicObject(3488, 1524.00000000, 2866.19995117, 16.29999924, 0.00000000, 0.00000000, 0.00000000); //object(vegasxrexhse07) (1)
    CreateDynamicObject(3488, 1503.19995117, 2866.10009766, 16.29999924, 0.00000000, 0.00000000, 0.00000000); //object(vegasxrexhse07) (2)
    CreateDynamicObject(3485, 1477.90002441, 2866.19995117, 16.79999924, 0.00000000, 0.00000000, 0.00000000); //object(vegasxrexhse04) (1)
    CreateDynamicObject(3485, 1448.09997559, 2866.19995117, 16.79999924, 0.00000000, 0.00000000, 0.00000000); //object(vegasxrexhse04) (2)
    CreateDynamicObject(3446, 1523.59997559, 2803.30004883, 13.19999981, 0.00000000, 0.00000000, 180.00000000); //object(vegasxrexhse10) (1)
    CreateDynamicObject(3749, 1485.80004883, 2810.00000000, 15.69999981, 0.00000000, 0.00000000, 0.00000000); //object(clubgate01_lax) (1)
    CreateDynamicObject(703, 1519.80004883, 2787.60009766, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (1)
    CreateDynamicObject(703, 1525.80004883, 2787.30004883, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (2)
    CreateDynamicObject(703, 1424.80004883, 2839.30004883, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (3)
    CreateDynamicObject(703, 1461.50000000, 2812.69995117, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (4)
    CreateDynamicObject(703, 1470.80004883, 2814.19995117, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (5)
    CreateDynamicObject(703, 1510.59997559, 2804.00000000, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (6)
    CreateDynamicObject(703, 1503.09997559, 2808.60009766, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (7)
    CreateDynamicObject(1232, 1495.90002441, 2809.10009766, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (1)
    CreateDynamicObject(1232, 1475.69995117, 2808.30004883, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (2)
    CreateDynamicObject(1232, 1506.30004883, 2792.39990234, 12.39999962, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (3)
    CreateDynamicObject(1232, 1510.80004883, 2779.69995117, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (4)
    CreateDynamicObject(1232, 1493.30004883, 2849.10009766, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (5)
    CreateDynamicObject(1232, 1512.40002441, 2849.50000000, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (6)
    CreateDynamicObject(1232, 1514.09997559, 2849.39990234, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (7)
    CreateDynamicObject(1232, 1515.09997559, 2817.69995117, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (8)
    CreateDynamicObject(1232, 1433.59997559, 2817.19995117, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (9)
    CreateDynamicObject(1232, 1433.30004883, 2830.39990234, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (10)
    CreateDynamicObject(1232, 1433.80004883, 2872.50000000, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (11)
    CreateDynamicObject(1232, 1434.00000000, 2859.69995117, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (12)
    CreateDynamicObject(703, 1531.90002441, 2842.10009766, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (8)
    CreateDynamicObject(703, 1531.09997559, 2833.30004883, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (9)
    CreateDynamicObject(703, 1531.59997559, 2825.10009766, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree7_big) (10)
    CreateDynamicObject(1232, 1491.40002441, 2808.00000000, 12.50000000, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (13)
    CreateDynamicObject(1232, 1480.09997559, 2808.19995117, 12.39999962, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1) (14)


    //vinewood
    CreateDynamicObject(11239, 1272.38452148, -728.16247559, 93.33664703, 357.75000000, 0.00000000, 289.74011230); //object(dockbarrier2zb_sfse)(1)
    CreateDynamicObject(11239, 1322.98059082, -704.77355957, 92.36158752, 0.49780273, 0.00000000, 291.48919678); //object(dockbarrier2zb_sfse)(2)
    CreateDynamicObject(11239, 1322.33972168, -690.52246094, 92.83650970, 358.50939941, 0.00000000, 289.11352539); //object(dockbarrier2zb_sfse)(3)
    CreateDynamicObject(11239, 1271.02136230, -713.59075928, 94.51153564, 359.25585938, 359.54501343, 291.03802490); //object(dockbarrier2zb_sfse)(4)
    CreateDynamicObject(18218, 1312.07336426, -597.49517822, 97.74626160, 0.00000000, 0.00000000, 70.21002197); //object(mtbfence08)(1)
    CreateDynamicObject(18218, 1287.04833984, -609.20739746, 101.12139130, 357.25000000, 0.00000000, 70.20812988); //object(mtbfence08)(2)
    CreateDynamicObject(18218, 1361.13171387, -687.76483154, 92.27913666, 343.42791748, 358.25000000, 72.70309448); //object(mtbfence08)(3)
    CreateDynamicObject(18218, 1141.40332031, -635.51660156, 104.42617035, 353.44738770, 0.00000000, 31.24127197); //object(mtbfence08)(4)
    CreateDynamicObject(18218, 1406.99414062, -636.08984375, 87.34294891, 7.24548340, 358.24768066, 122.73922729); //object(mtbfence08)(5)
    CreateDynamicObject(18218, 1384.72387695, -672.90612793, 93.17919159, 351.17712402, 358.24768066, 82.39202881); //object(mtbfence08)(6)
    CreateDynamicObject(18218, 1375.44335938, -567.02734375, 83.54271698, 335.24230957, 353.18847656, 219.07836914); //object(mtbfence08)(7)
    CreateDynamicObject(18218, 1275.94042969, -598.92968750, 101.12139130, 357.24243164, 0.00000000, 66.45629883); //object(mtbfence08)(8)
    CreateDynamicObject(18218, 1088.99450684, -628.16839600, 111.20117188, 3.19665527, 0.00000000, 40.91461182); //object(mtbfence08)(9)
    CreateDynamicObject(18219, 1056.37634277, -625.05407715, 116.58195496, 3.97000122, 0.00000000, 58.22503662); //object(mtbfence09)(1)
    CreateDynamicObject(18219, 1071.46313477, -636.81896973, 114.50064087, 356.46606445, 357.00000000, 147.03500366); //object(mtbfence09)(2)
    CreateDynamicObject(18219, 1045.57519531, -630.81054688, 116.27574921, 3.96606445, 0.00000000, 57.47497559); //object(mtbfence09)(3)
    CreateDynamicObject(18219, 936.95532227, -683.08496094, 118.59222412, 346.21606445, 0.00000000, 94.82205200); //object(mtbfence09)(4)
    CreateDynamicObject(18219, 924.74499512, -668.25616455, 118.59222412, 346.21215820, 0.00000000, 97.27252197); //object(mtbfence09)(5)
    CreateDynamicObject(18219, 898.42388916, -708.59899902, 109.81717682, 338.95666504, 359.25000000, 116.80746460); //object(mtbfence09)(6)
    CreateDynamicObject(18219, 920.09295654, -704.24847412, 113.59207153, 339.20568848, 359.24743652, 108.30664062); //object(mtbfence09)(7)
    CreateDynamicObject(18219, 908.11145020, -727.83734131, 106.51708221, 336.70568848, 354.24194336, 114.27627563); //object(mtbfence09)(8)
    CreateDynamicObject(18219, 897.84497070, -752.14739990, 98.39207458, 332.95349121, 358.49194336, 114.74230957); //object(mtbfence09)(9)
    CreateDynamicObject(18219, 897.84472656, -752.14648438, 98.39207458, 332.95166016, 358.48937988, 114.74121094); //object(mtbfence09)(10)
    CreateDynamicObject(18219, 887.92218018, -732.49853516, 101.99229431, 327.45166016, 359.73937988, 112.49121094); //object(mtbfence09)(11)
    CreateDynamicObject(18219, 844.14410400, -793.63940430, 76.34231567, 345.24707031, 346.60644531, 73.58401489); //object(mtbfence09)(12)
    CreateDynamicObject(18219, 884.83776855, -769.13305664, 92.34251404, 342.99536133, 346.60217285, 90.69592285); //object(mtbfence09)(13)
    CreateDynamicObject(18219, 863.64898682, -783.82183838, 83.24247742, 344.24316406, 345.09667969, 74.41711426); //object(mtbfence09)(14)
    CreateDynamicObject(18219, 819.51641846, -803.03265381, 70.01068115, 352.99011230, 345.09155273, 65.41589355); //object(mtbfence09)(15)
    CreateDynamicObject(18216, 822.03527832, -780.26586914, 72.67448425, 352.05999756, 15.88000488, 190.56005859); //object(mtbfence1)(1)
    CreateDynamicObject(18219, 783.01226807, -787.50555420, 66.85360718, 1.64514160, 339.33605957, 59.98760986); //object(mtbfence09)(16)
    CreateDynamicObject(8674, 799.99865723, -807.04260254, 66.69572449, 0.00000000, 357.00000000, 8.70501709); //object(csrsfence02_lvs)(1)
    CreateDynamicObject(8674, 784.53906250, -809.07421875, 65.96806335, 0.00000000, 0.00000000, 2.71911621); //object(csrsfence02_lvs)(2)
    CreateDynamicObject(18220, 492.20401001, -1016.89550781, 91.79369354, 354.04501343, 0.00000000, 292.78997803); //object(mtbfence10)(1)
    CreateDynamicObject(18220, 511.90206909, -998.03588867, 88.46849060, 349.28991699, 356.00000000, 284.03564453); //object(mtbfence10)(2)
    CreateDynamicObject(18220, 183.25653076, -1406.41711426, 45.41336060, 353.24322510, 1.95043945, 115.21380615); //object(mtbfence10)(3)
    CreateDynamicObject(18220, 181.89379883, -1170.66979980, 55.61434555, 342.32614136, 1.95007324, 118.77941895); //object(mtbfence10)(4)
    CreateDynamicObject(18220, 197.07035828, -1147.95507812, 60.36434555, 6.17285156, 1.95007324, 299.67364502); //object(mtbfence10)(5)
    CreateDynamicObject(18220, 163.07812500, -1189.98535156, 51.98939896, 0.68115234, 1.95007324, 284.02954102); //object(mtbfence10)(6)
    CreateDynamicObject(18220, 671.26770020, -1042.88452148, 50.95029449, 1.39782715, 344.95007324, 128.13250732); //object(mtbfence10)(7)
    CreateDynamicObject(18220, 162.71777344, -1409.57421875, 44.81332397, 356.46789551, 1.95007324, 31.23413086); //object(mtbfence10)(8)
    CreateDynamicObject(18220, 241.52050781, -1322.87890625, 53.66773987, 356.46789551, 350.94726562, 101.11816406); //object(mtbfence10)(9)
    CreateDynamicObject(18220, 397.22070312, -1234.48437500, 51.46558380, 1.14257812, 350.94726562, 84.72656250); //object(mtbfence10)(10)
    CreateDynamicObject(18220, 603.44238281, -1119.08789062, 47.51325989, 2.39501953, 353.44665527, 330.37536621); //object(mtbfence10)(11)
    CreateDynamicObject(18220, 642.83691406, -1083.98144531, 47.44284439, 1.39526367, 344.94873047, 106.29272461); //object(mtbfence10)(12)
    CreateDynamicObject(18220, 694.35650635, -1002.96301270, 51.67533875, 3.85025024, 344.94873047, 120.87805176); //object(mtbfence10)(13)
    CreateDynamicObject(18220, 1006.31250000, -784.30364990, 101.43162537, 5.08013916, 356.44323730, 284.36682129); //object(mtbfence10)(14)
    CreateDynamicObject(18220, 749.45996094, -934.07714844, 55.35037994, 359.12109375, 355.68786621, 290.08300781); //object(mtbfence10)(15)
    CreateDynamicObject(8674, 1025.73693848, -791.89428711, 102.86946869, 0.75000000, 354.50000000, 17.11499023); //object(csrsfence02_lvs)(3)
    CreateDynamicObject(8674, 1082.13879395, -765.85449219, 108.71701050, 0.74707031, 354.49584961, 7.36120605); //object(csrsfence02_lvs)(4)
    CreateDynamicObject(12921, 1244.44470215, -733.94714355, 96.80424500, 0.00000000, 0.00000000, 289.27499390); //object(sw_farment01)(1)
    CreateDynamicObject(17037, 1235.22021484, -728.96038818, 97.03719330, 357.75000000, 0.25000000, 293.75997925); //object(cuntw_carport2_)(1)
    CreateDynamicObject(1976, 1411.96740723, -617.56396484, 88.81216431, 0.00000000, 0.00000000, 266.90997314); //object(w_test)(1)
    CreateDynamicObject(1222, 1401.48352051, -653.87774658, 91.31628418, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(1)
    CreateDynamicObject(1222, 1399.37109375, -657.27209473, 91.96942139, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(2)
    CreateDynamicObject(1222, 1397.06225586, -661.11688232, 92.82727051, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(3)
    CreateDynamicObject(1222, 1349.29418945, -569.84356689, 89.25022888, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(4)
    CreateDynamicObject(1222, 1337.48022461, -574.07281494, 91.62543488, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(5)
    CreateDynamicObject(1222, 1252.19812012, -608.21136475, 101.09958649, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(6)
    CreateDynamicObject(1222, 1258.97607422, -608.27593994, 103.97601318, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(7)
    CreateDynamicObject(1222, 1262.95324707, -605.44311523, 103.61735535, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(8)
    CreateDynamicObject(1222, 1270.74084473, -618.13153076, 102.87844849, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(9)
    CreateDynamicObject(1222, 1265.38061523, -620.55987549, 103.26860046, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(10)
    CreateDynamicObject(1222, 1158.11914062, -640.09161377, 103.39943695, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(11)
    CreateDynamicObject(1222, 1125.19042969, -632.46289062, 105.01345825, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(12)
    CreateDynamicObject(1222, 1119.90551758, -632.60314941, 106.32041931, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(13)
    CreateDynamicObject(1222, 1005.40112305, -643.12463379, 120.86266327, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(14)
    CreateDynamicObject(1222, 1003.04656982, -643.95880127, 120.98595428, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(15)
    CreateDynamicObject(1222, 1001.01391602, -644.88641357, 121.07382965, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(16)
    CreateDynamicObject(1222, 933.38519287, -656.41052246, 119.45359802, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(17)
    CreateDynamicObject(1222, 906.38342285, -691.93725586, 113.94023132, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(18)
    CreateDynamicObject(1222, 907.38208008, -688.81103516, 114.63664246, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(19)
    CreateDynamicObject(1222, 909.64379883, -684.42443848, 115.56820679, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(20)
    CreateDynamicObject(1222, 912.89514160, -681.08386230, 115.99917603, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(21)
    CreateDynamicObject(1222, 805.98504639, -806.29425049, 66.80753326, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(22)
    CreateDynamicObject(1222, 508.24877930, -927.15075684, 75.70549011, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(23)
    CreateDynamicObject(1222, 506.65557861, -939.99847412, 77.71740723, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(24)
    CreateDynamicObject(1222, 501.46838379, -1006.91802979, 90.38364410, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(25)
    CreateDynamicObject(1222, 410.65045166, -1007.85766602, 91.95027924, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(26)
    CreateDynamicObject(1222, 407.87298584, -1008.01702881, 91.88504028, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(27)
    CreateDynamicObject(1222, 289.56488037, -1096.81701660, 82.57524872, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(28)
    CreateDynamicObject(1222, 291.19219971, -1100.99108887, 82.44524384, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(29)
    CreateDynamicObject(1222, 208.32284546, -1134.09216309, 62.63312912, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(30)
    CreateDynamicObject(1222, 211.38076782, -1131.19274902, 62.99439240, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(31)
    CreateDynamicObject(1222, 217.82662964, -1127.50451660, 63.75838470, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(32)
    CreateDynamicObject(1222, 223.03546143, -1125.87609863, 64.51033020, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(33)
    CreateDynamicObject(1222, 150.37162781, -1199.89978027, 50.21736908, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(34)
    CreateDynamicObject(1222, 170.36241150, -1391.74963379, 47.77999115, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(35)
    CreateDynamicObject(1222, 202.00099182, -1385.66040039, 48.52035522, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(36)
    CreateDynamicObject(1222, 199.06173706, -1388.33605957, 48.00099182, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(37)
    CreateDynamicObject(1222, 209.87446594, -1351.89526367, 50.27656174, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(38)
    CreateDynamicObject(1222, 211.30595398, -1350.14697266, 50.40404129, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(39)
    CreateDynamicObject(1222, 213.50889587, -1348.82824707, 50.53567123, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(40)
    CreateDynamicObject(1222, 264.79052734, -1332.21203613, 52.75268173, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(41)
    CreateDynamicObject(1222, 263.30139160, -1333.23522949, 52.70021057, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(43)
    CreateDynamicObject(1222, 261.87420654, -1334.33337402, 52.64924240, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(44)
    CreateDynamicObject(1222, 285.37091064, -1317.79614258, 53.42681503, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(45)
    CreateDynamicObject(1222, 304.58038330, -1354.49780273, 23.29575729, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(46)
    CreateDynamicObject(1222, 283.85931396, -1318.85278320, 53.37773132, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(47)
    CreateDynamicObject(1222, 282.44836426, -1319.90417480, 53.33553696, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(48)
    CreateDynamicObject(1222, 281.07849121, -1320.80065918, 53.29212570, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(49)
    CreateDynamicObject(1222, 279.40310669, -1322.08374023, 53.23595047, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(50)
    CreateDynamicObject(1222, 335.68386841, -1288.32617188, 53.70001221, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(51)
    CreateDynamicObject(1222, 333.77755737, -1289.22778320, 53.70001221, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(52)
    CreateDynamicObject(1222, 331.71759033, -1290.53649902, 53.70001221, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(53)
    CreateDynamicObject(1222, 329.33148193, -1291.52709961, 53.70001221, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(54)
    CreateDynamicObject(1222, 381.27099609, -1241.24426270, 52.69118500, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(55)
    CreateDynamicObject(1222, 377.81314087, -1243.36596680, 53.01886368, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(56)
    CreateDynamicObject(1222, 373.94726562, -1244.17785645, 53.47394562, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(57)
    CreateDynamicObject(1222, 605.47509766, -1111.52172852, 46.82185364, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(58)
    CreateDynamicObject(1222, 608.52850342, -1110.19995117, 46.65509033, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(59)
    CreateDynamicObject(1222, 612.31872559, -1106.78564453, 46.52270126, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(60)
    CreateDynamicObject(1222, 629.45245361, -1115.90893555, 46.22140503, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(61)
    CreateDynamicObject(1222, 675.42712402, -1042.25659180, 49.95164108, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(62)
    CreateDynamicObject(1222, 680.27209473, -1035.00659180, 50.31716156, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(63)
    CreateDynamicObject(1222, 798.97460938, -879.56433105, 58.64400482, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(64)
    CreateDynamicObject(1222, 805.76257324, -875.36657715, 60.93883514, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(65)
    CreateDynamicObject(1222, 833.27917480, -865.67968750, 68.50798798, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(66)
    CreateDynamicObject(1222, 837.09283447, -875.62384033, 68.26512909, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(67)
    CreateDynamicObject(1222, 833.75189209, -876.99456787, 68.26512909, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(68)
    CreateDynamicObject(1222, 830.66802979, -878.45892334, 68.25255585, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(69)
    CreateDynamicObject(1222, 937.11523438, -834.89379883, 94.29386139, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(70)
    CreateDynamicObject(1222, 931.44323730, -837.97576904, 93.81705475, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(71)
    CreateDynamicObject(1222, 927.23999023, -840.71826172, 93.45554352, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(72)
    CreateDynamicObject(1222, 923.37060547, -842.63513184, 93.13568878, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(73)
    CreateDynamicObject(1222, 994.63922119, -794.53765869, 99.40617371, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(74)
    CreateDynamicObject(1222, 1018.99945068, -774.99731445, 102.41915894, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(75)
    CreateDynamicObject(1222, 1022.85510254, -777.90600586, 102.42423248, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(76)
    CreateDynamicObject(1222, 1018.00555420, -778.81433105, 101.96015167, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(77)
    CreateDynamicObject(1222, 1076.30566406, -765.58483887, 107.10494995, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(78)
    CreateDynamicObject(1222, 1071.84948730, -762.58032227, 106.32182312, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(79)
    CreateDynamicObject(1222, 1084.33093262, -776.50970459, 107.78250122, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(80)
    CreateDynamicObject(1222, 1079.80883789, -777.34594727, 107.38788605, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(81)
    CreateDynamicObject(1222, 1075.68688965, -777.88208008, 107.08756256, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(82)
    CreateDynamicObject(1222, 1244.27709961, -725.87835693, 94.92636108, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(83)
    CreateDynamicObject(1222, 1240.30310059, -728.36218262, 94.97270203, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(84)
    CreateDynamicObject(1222, 1231.36743164, -733.03540039, 95.55207062, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(85)
    CreateDynamicObject(1222, 1350.73718262, -680.20538330, 92.04203796, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(86)
    CreateDynamicObject(1222, 1354.00439453, -678.82867432, 92.47928619, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(87)
    CreateDynamicObject(1222, 1083.22851562, -623.16296387, 112.00064850, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(88)
    CreateDynamicObject(1222, 1122.25988770, -632.52911377, 105.73506165, 0.00000000, 0.00000000, 0.00000000); //object(barrel3)(89)
    CreateDynamicObject(16776, 1350.43237305, -698.97479248, 90.71424866, 4.19000244, 0.00000000, 179.36495972); //object(des_cockbody)(1)
    CreateDynamicObject(10397, 1293.99194336, -711.32824707, 95.46125793, 8.00000000, 359.75000000, 21.83499146); //object(hc_stadlight1_sfs)(1)
    CreateDynamicObject(2886, 1245.81091309, -738.38116455, 95.01042938, 0.00000000, 0.00000000, 294.49499512); //object(sec_keypad)(1)
    CreateDynamicObject(1210, 1232.56311035, -733.21276855, 95.09844208, 0.00000000, 0.00000000, 23.27001953); //object(briefcase)(1)
    CreateDynamicObject(2061, 1231.76367188, -733.68438721, 95.25838470, 0.00000000, 0.00000000, 21.83499146); //object(cj_shells1)(1)
    CreateDynamicObject(1350, 1254.97387695, -733.46002197, 93.40153503, 0.00000000, 0.00000000, 292.50997925); //object(cj_traffic_light4)(1)
    CreateDynamicObject(1232, 1409.42114258, -619.88586426, 85.51596832, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(1)
    CreateDynamicObject(1232, 1403.71057129, -585.83001709, 80.10076141, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(2)
    CreateDynamicObject(1232, 1344.54443359, -571.75665283, 92.36463928, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(3)
    CreateDynamicObject(1232, 1337.45776367, -586.17205811, 94.85404968, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(4)
    CreateDynamicObject(1232, 1260.61389160, -607.02661133, 106.02983093, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(5)
    CreateDynamicObject(1232, 1081.83227539, -623.03094482, 114.35849762, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(6)
    CreateDynamicObject(1232, 985.22015381, -647.00250244, 123.47516632, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(7)
    CreateDynamicObject(1232, 894.44323730, -760.10833740, 98.86382294, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(8)
    CreateDynamicObject(1232, 557.92468262, -908.68414307, 69.98642731, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(9)
    CreateDynamicObject(1232, 142.06802368, -1291.00012207, 47.71102142, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(10)
    CreateDynamicObject(1232, 170.41192627, -1390.23364258, 50.12850952, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(11)
    CreateDynamicObject(16442, 1267.45202637, -618.78186035, 104.36456299, 0.00000000, 0.00000000, 194.53002930); //object(desn2_stripsigs1)(1)
    CreateDynamicObject(1825, 1235.76464844, -730.59735107, 94.80340576, 0.00000000, 2.25000000, 0.00000000); //object(kb_table_chairs1)(1)
    CreateDynamicObject(1226, 1389.38134766, -667.73370361, 96.84304810, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(1)
    CreateDynamicObject(1226, 1401.61633301, -651.94836426, 94.33677673, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(2)
    CreateDynamicObject(1226, 1369.64123535, -567.16729736, 88.10899353, 0.00000000, 0.00000000, 89.32501221); //object(lamppost3)(3)
    CreateDynamicObject(1226, 1296.32714844, -603.92993164, 102.99044037, 0.00000000, 0.00000000, 296.47998047); //object(lamppost3)(4)
    CreateDynamicObject(1226, 1264.54760742, -604.87133789, 106.50233459, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(5)
    CreateDynamicObject(1226, 1197.73999023, -633.69342041, 106.88238525, 0.00000000, 0.00000000, 276.62994385); //object(lamppost3)(6)
    CreateDynamicObject(1226, 1192.94055176, -621.52026367, 106.88249207, 0.00000000, 0.00000000, 53.59500122); //object(lamppost3)(7)
    CreateDynamicObject(1226, 1062.00109863, -623.44067383, 118.97878265, 0.00000000, 0.00000000, 280.59997559); //object(lamppost3)(8)
    CreateDynamicObject(1226, 971.38287354, -634.88659668, 124.74300385, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(9)
    CreateDynamicObject(1226, 944.12030029, -670.28509521, 123.25410461, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(10)
    CreateDynamicObject(1226, 912.04364014, -683.34240723, 119.16013336, 0.00000000, 0.00000000, 140.93499756); //object(lamppost3)(11)
    CreateDynamicObject(1226, 924.89495850, -694.40966797, 119.66194916, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(12)
    CreateDynamicObject(1226, 923.45019531, -696.81427002, 119.38590240, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(13)
    CreateDynamicObject(1226, 905.34240723, -694.92187500, 116.66868591, 0.00000000, 0.00000000, 164.75500488); //object(lamppost3)(14)
    CreateDynamicObject(1226, 886.85644531, -762.37908936, 98.38565826, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(15)
    CreateDynamicObject(1226, 882.26855469, -747.93829346, 100.28084564, 0.00000000, 0.00000000, 129.02502441); //object(lamppost3)(16)
    CreateDynamicObject(1226, 862.86102295, -766.90991211, 89.61988068, 0.00000000, 0.00000000, 121.08502197); //object(lamppost3)(17)
    CreateDynamicObject(1226, 804.62170410, -806.33441162, 70.03250885, 0.00000000, 0.00000000, 274.64501953); //object(lamppost3)(18)
    CreateDynamicObject(1226, 771.62658691, -813.85919189, 69.00217438, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(19)
    CreateDynamicObject(1226, 771.90240479, -791.17822266, 68.82360840, 0.00000000, 0.00000000, 95.28002930); //object(lamppost3)(20)
    CreateDynamicObject(1226, 661.10852051, -898.77355957, 66.31480408, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(21)
    CreateDynamicObject(1226, 646.26080322, -887.66711426, 66.04538727, 0.00000000, 0.00000000, 115.13003540); //object(lamppost3)(22)
    CreateDynamicObject(1226, 520.40863037, -897.86651611, 74.95420074, 0.00000000, 0.00000000, 140.93499756); //object(lamppost3)(23)
    CreateDynamicObject(1226, 508.34207153, -933.75280762, 79.98278809, 0.00000000, 0.00000000, 168.72503662); //object(lamppost3)(24)
    CreateDynamicObject(1226, 514.48101807, -989.25415039, 90.51309204, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(25)
    CreateDynamicObject(1226, 473.69836426, -1024.05346680, 95.66733551, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(29)
    CreateDynamicObject(1226, 500.79199219, -1008.80664062, 93.57212067, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(30)
    CreateDynamicObject(1226, 289.86257935, -1098.97546387, 85.53942871, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(31)
    CreateDynamicObject(1226, 287.31115723, -1094.84350586, 86.31204224, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(32)
    CreateDynamicObject(1226, 263.57141113, -1117.35266113, 81.44820404, 0.00000000, 0.00000000, 142.92004395); //object(lamppost3)(33)
    CreateDynamicObject(1226, 259.90380859, -1120.78710938, 80.72808075, 0.00000000, 0.00000000, 123.07003784); //object(lamppost3)(34)
    CreateDynamicObject(1226, 253.37496948, -1147.03686523, 78.21880341, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(35)
    CreateDynamicObject(1226, 246.51936340, -1147.50915527, 77.21734619, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(36)
    CreateDynamicObject(1226, 260.08648682, -1144.77685547, 78.88256836, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(37)
    CreateDynamicObject(1226, 219.65896606, -1125.07861328, 67.59033966, 0.00000000, 0.00000000, 121.08502197); //object(lamppost3)(38)
    CreateDynamicObject(1226, 213.18260193, -1129.04785156, 66.68775940, 0.00000000, 0.00000000, 125.05505371); //object(lamppost3)(39)
    CreateDynamicObject(1226, 208.33361816, -1131.52221680, 66.19905853, 0.00000000, 0.00000000, 136.96502686); //object(lamppost3)(40)
    CreateDynamicObject(1226, 166.33242798, -1186.49316406, 55.80247879, 0.00000000, 0.00000000, 123.07003784); //object(lamppost3)(41)
    CreateDynamicObject(1226, 163.74346924, -1222.17016602, 46.96490097, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(42)
    CreateDynamicObject(1226, 178.03340149, -1205.51562500, 52.42467499, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(43)
    CreateDynamicObject(1226, 156.20266724, -1377.58593750, 52.84606552, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(46)
    CreateDynamicObject(1226, 186.28962708, -1403.52319336, 49.19467545, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(47)
    CreateDynamicObject(1226, 181.08247375, -1410.42785645, 48.48181152, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(48)
    CreateDynamicObject(1226, 174.86782837, -1416.77770996, 47.69363785, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(49)
    CreateDynamicObject(1226, 156.78353882, -1407.70458984, 48.74791718, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(50)
    CreateDynamicObject(1226, 162.90936279, -1412.39550781, 47.84764099, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(51)
    CreateDynamicObject(1226, 199.79792786, -1387.20056152, 51.49699402, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(52)
    CreateDynamicObject(1226, 209.19456482, -1350.32641602, 53.72365570, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(53)
    CreateDynamicObject(1226, 244.98016357, -1316.28820801, 56.83303833, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(54)
    CreateDynamicObject(1226, 263.70257568, -1335.07800293, 56.10049820, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(55)
    CreateDynamicObject(1226, 331.85501099, -1290.14782715, 58.14426804, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(56)
    CreateDynamicObject(1226, 396.85260010, -1233.72705078, 54.66538239, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(57)
    CreateDynamicObject(1226, 569.62512207, -1192.02380371, 52.10385132, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(58)
    CreateDynamicObject(1226, 605.11627197, -1109.27514648, 51.39933395, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(59)
    CreateDynamicObject(1226, 608.32690430, -1106.41491699, 51.13420105, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(60)
    CreateDynamicObject(1226, 601.10693359, -1131.79602051, 50.25518799, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(61)
    CreateDynamicObject(1226, 629.42877197, -1115.62109375, 49.59315491, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(62)
    CreateDynamicObject(1226, 627.21807861, -1094.34558105, 52.37442017, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(63)
    CreateDynamicObject(1226, 638.06823730, -1085.14221191, 50.89460373, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(64)
    CreateDynamicObject(1226, 644.24914551, -1080.70812988, 51.09255219, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(65)
    CreateDynamicObject(1226, 662.54431152, -1054.29650879, 52.67029572, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(66)
    CreateDynamicObject(1226, 681.15325928, -1032.92687988, 53.87639999, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(67)
    CreateDynamicObject(1226, 686.08062744, -1015.45880127, 54.99857330, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(68)
    CreateDynamicObject(1226, 703.80584717, -990.39703369, 55.07268143, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(69)
    CreateDynamicObject(1226, 716.70379639, -970.23114014, 57.13665390, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(70)
    CreateDynamicObject(1226, 726.88543701, -956.86950684, 58.35350037, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(71)
    CreateDynamicObject(1226, 739.66864014, -941.53106689, 58.45489502, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(72)
    CreateDynamicObject(1226, 830.67559814, -878.52990723, 73.00762939, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(73)
    CreateDynamicObject(1226, 836.27386475, -877.49206543, 71.25066376, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(74)
    CreateDynamicObject(1226, 834.48748779, -864.59362793, 72.08514404, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(75)
    CreateDynamicObject(1226, 858.95898438, -856.17224121, 79.80172729, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(76)
    CreateDynamicObject(1226, 864.87829590, -853.76831055, 80.17848969, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(77)
    CreateDynamicObject(1226, 925.51550293, -842.95330811, 96.64979553, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(78)
    CreateDynamicObject(1226, 929.57543945, -840.57812500, 96.97010803, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(79)
    CreateDynamicObject(1226, 934.36657715, -837.99517822, 97.35578918, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(80)
    CreateDynamicObject(1226, 992.07208252, -794.15911865, 103.50201416, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(81)
    CreateDynamicObject(1226, 998.82867432, -787.65771484, 103.39389038, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(82)
    CreateDynamicObject(1226, 1019.83349609, -777.18096924, 105.69866943, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(83)
    CreateDynamicObject(1226, 1020.45721436, -794.48364258, 104.88574219, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(84)
    CreateDynamicObject(1226, 1076.64538574, -778.01989746, 110.48265076, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(85)
    CreateDynamicObject(1226, 1080.80908203, -777.01391602, 110.91291809, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(86)
    CreateDynamicObject(1226, 1073.84216309, -766.51513672, 110.37097931, 0.00000000, 0.00000000, 0.00000000); //object(lamppost3)(87)
    CreateDynamicObject(1226, 173.37011719, -1182.13574219, 56.69085693, 0.00000000, 0.00000000, 123.06884766); //object(lamppost3)(89)
    CreateDynamicObject(1226, 156.87004089, -1194.14184570, 54.83742142, 0.00000000, 0.00000000, 123.06884766); //object(lamppost3)(90)

    //drift island
    //AddStaticVehicle(562,-872.23309326,558.36602783,5.54981613,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(562,-876.05651855,558.42041016,5.54981613,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(562,-872.47137451,565.15521240,5.54981613,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(562,-875.70642090,564.84960938,5.54981613,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(475,-885.82690430,574.75878906,4.69626617,0.00000000,-1,-1); //Sabre
    //AddStaticVehicle(475,-881.63806152,574.61071777,4.94626617,0.00000000,-1,-1); //Sabre
    //AddStaticVehicle(475,-878.24597168,574.48107910,4.94626617,0.00000000,-1,-1); //Sabre
    //AddStaticVehicle(555,-884.99554443,560.31231689,5.82664061,0.00000000,-1,-1); //Windsor
    //AddStaticVehicle(555,-881.24176025,560.38562012,6.57664061,0.00000000,-1,-1); //Windsor
    //AddStaticVehicle(555,-882.92230225,567.04278564,5.57664061,0.00000000,-1,-1); //Windsor
    CreateDynamicObject(10946, -828.62701416, 506.04324341, 3.62499857, 0.00000000, 0.00000000, 0.00000000); //object(fuuuuuuuck_sfs)(1)
    CreateDynamicObject(10946, -828.51562500, 553.94531250, 3.66345406, 0.00000000, 0.00000000, 180.10986328); //object(fuuuuuuuck_sfs)(4)
    CreateDynamicObject(3281, -879.90875244, 549.58843994, 3.06702852, 0.00000000, 0.00000000, 65.50500488); //object(mtb_banner1)(3)
    CreateDynamicObject(3281, -875.91796875, 554.52636719, 3.06702852, 0.00000000, 0.00000000, 0.00000000); //object(mtb_banner1)(4)
    CreateDynamicObject(7834, -856.28125000, 539.85351562, 6.03849077, 0.00000000, 0.00000000, 179.36279297); //object(vegasnfrates08)(1)
    CreateDynamicObject(7834, -828.83636475, 547.26965332, 6.03849077, 0.00000000, 0.00000000, 90.39276123); //object(vegasnfrates08)(2)
    CreateDynamicObject(8341, -794.98828125, 519.85742188, 5.51940107, 0.00000000, 0.00000000, 359.71984863); //object(vgsfrates12)(1)
    CreateDynamicObject(8883, -831.15917969, 517.71289062, 5.47404718, 0.00000000, 0.00000000, 0.00000000); //object(vgsefrght01)(2)
    CreateDynamicObject(8884, -800.68316650, 494.16351318, 5.47404718, 0.00000000, 0.00000000, 89.79501343); //object(vgsefrght02)(3)
    CreateDynamicObject(8884, -855.20336914, 488.65161133, 5.47404718, 0.00000000, 0.00000000, 89.79125977); //object(vgsefrght02)(4)
    CreateDynamicObject(8884, -856.76379395, 505.45642090, 5.52404737, 0.00000000, 359.96691895, 179.65942383); //object(vgsefrght02)(5)
    CreateDynamicObject(8886, -883.17663574, 513.56030273, 5.47404718, 0.00000000, 0.00000000, 288.53997803); //object(vgsefrght04)(10)
    CreateDynamicObject(7516, -798.32025146, 567.57519531, 6.03654671, 0.00000000, 0.00000000, 269.93994141); //object(vegasnfrates02)(1)
    CreateDynamicObject(3281, -795.38513184, 539.21405029, 2.99202824, 0.00000000, 0.00000000, 89.08041382); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -844.68267822, 522.26385498, 3.06702852, 0.00000000, 0.00000000, 0.41198730); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -827.07965088, 507.52645874, 3.06702852, 0.00000000, 0.00000000, 91.07714844); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -795.33911133, 542.80328369, 2.99202824, 0.00000000, 0.00000000, 89.07714844); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -843.79852295, 557.08099365, 3.06702852, 0.00000000, 0.00000000, 179.63714600); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -795.35058594, 555.57910156, 2.96702814, 0.00000000, 0.00000000, 89.07714844); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -795.29101562, 546.39062500, 2.99202824, 0.00000000, 0.00000000, 89.07714844); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -810.27996826, 557.50030518, 3.06702852, 0.00000000, 0.00000000, 179.32122803); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -815.69641113, 562.95861816, 3.06702852, 0.00000000, 0.00000000, 89.57507324); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -806.68719482, 557.52380371, 3.06702852, 0.00000000, 0.00000000, 182.09680176); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -876.77081299, 510.32287598, 3.06702852, 0.00000000, 0.00000000, 0.41198730); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -841.08685303, 522.25122070, 3.06702852, 0.00000000, 0.00000000, 0.41198730); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -837.51141357, 522.22534180, 3.06702852, 0.00000000, 0.00000000, 0.41198730); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -865.96020508, 527.84826660, 3.06702852, 0.00000000, 0.00000000, 269.83520508); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -864.19494629, 522.47637939, 3.06702852, 0.00000000, 0.00000000, 0.10913086); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -856.99652100, 522.41497803, 3.06702852, 0.00000000, 0.00000000, 359.93408203); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -860.58874512, 522.44158936, 3.06702852, 0.00000000, 0.00000000, 359.93408203); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -878.42578125, 552.85742188, 3.06702852, 0.00000000, 0.00000000, 65.50048828); //object(mtb_banner1)(3)
    CreateDynamicObject(3281, -881.40631104, 546.31854248, 3.06702852, 0.00000000, 0.00000000, 65.50048828); //object(mtb_banner1)(3)
    CreateDynamicObject(3281, -873.15686035, 510.34448242, 3.06702852, 0.00000000, 0.00000000, 0.41198730); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -804.91796875, 484.81933594, 3.06702852, 0.00000000, 0.00000000, 89.07714844); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -827.04467773, 516.01562500, 3.06702852, 0.00000000, 0.00000000, 91.07666016); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -827.04467773, 516.01562500, 3.06702852, 0.00000000, 0.00000000, 91.07666016); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -865.94238281, 524.28808594, 3.06702852, 0.00000000, 0.00000000, 269.83520508); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -872.32781982, 554.51379395, 3.06702852, 0.00000000, 0.00000000, 0.00000000); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -870.50073242, 556.29779053, 3.06702852, 0.00000000, 0.00000000, 89.59002686); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -882.16632080, 542.88720703, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -870.47595215, 563.45086670, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -870.41748047, 567.02075195, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -870.47363281, 559.87792969, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -882.17529297, 539.22534180, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -882.18383789, 535.57525635, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -882.19470215, 531.89697266, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -882.22271729, 528.30895996, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -882.25915527, 524.72393799, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(3281, -882.30371094, 521.12176514, 3.06702852, 0.00000000, 0.00000000, 89.58801270); //object(mtb_banner1)(4)
    CreateDynamicObject(17969, -843.67144775, 482.30874634, 3.36633110, 0.00000000, 0.00000000, 269.71997070); //object(hub_graffitti)(1)
    CreateDynamicObject(3463, -875.89654541, 508.95614624, 2.04626656, 0.00000000, 0.00000000, 0.00000000); //object(vegaslampost2)(1)
    CreateDynamicObject(3463, -865.21893311, 523.03497314, 2.04626656, 0.00000000, 0.00000000, 0.00000000); //object(vegaslampost2)(2)
    CreateDynamicObject(3463, -870.59893799, 555.32873535, 2.04626656, 0.00000000, 0.00000000, 0.00000000); //object(vegaslampost2)(3)
    CreateDynamicObject(3463, -815.11834717, 558.34973145, 2.04626656, 0.00000000, 0.00000000, 0.00000000); //object(vegaslampost2)(4)
    CreateDynamicObject(3463, -831.67974854, 507.75546265, 2.04626656, 0.00000000, 0.00000000, 0.00000000); //object(vegaslampost2)(5)
    CreateDynamicObject(3281, -815.65167236, 566.54919434, 3.06702852, 0.00000000, 0.00000000, 89.57153320); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -815.68572998, 559.37622070, 3.06702852, 0.00000000, 0.00000000, 90.80657959); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -813.88464355, 557.57427979, 3.06702852, 0.00000000, 0.00000000, 178.89514160); //object(mtb_banner1)(6)
    CreateDynamicObject(3281, -803.10552979, 557.63604736, 3.06702852, 0.00000000, 0.00000000, 182.09289551); //object(mtb_banner1)(6)
    CreateDynamicObject(16092, -874.37475586, 531.03796387, 2.04626560, 0.00000000, 0.00000000, 89.84002686); //object(des_pipestrut05)(1)
    CreateDynamicObject(7655, -855.11517334, 519.67895508, 8.23618698, 0.00000000, 358.01501465, 85.35501099); //object(bunting06)(1)
    CreateDynamicObject(7655, -816.56640625, 499.22656250, 8.52464199, 0.00000000, 0.00000000, 0.00000000); //object(bunting06)(2)
    CreateDynamicObject(7655, -816.56640625, 499.22656250, 8.52464199, 0.00000000, 0.00000000, 0.00000000); //object(bunting06)(3)
    CreateDynamicObject(7655, -806.27667236, 558.01910400, 9.02464199, 0.00000000, 0.00000000, 55.58001709); //object(bunting06)(4)
    CreateDynamicObject(1215, -866.26843262, 542.40991211, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(1)
    CreateDynamicObject(1215, -856.10211182, 557.31353760, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(2)
    CreateDynamicObject(1215, -826.43847656, 557.30108643, 2.69885683, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(3)
    CreateDynamicObject(1215, -816.13861084, 577.79534912, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(4)
    CreateDynamicObject(1215, -811.31970215, 547.38061523, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(5)
    CreateDynamicObject(1215, -800.82348633, 557.60620117, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(6)
    CreateDynamicObject(1215, -795.39288330, 553.72106934, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(7)
    CreateDynamicObject(1215, -795.34765625, 548.23144531, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(8)
    CreateDynamicObject(1215, -795.17413330, 522.56097412, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(9)
    CreateDynamicObject(1215, -794.74005127, 537.73968506, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(10)
    CreateDynamicObject(1215, -804.97058105, 522.35491943, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(11)
    CreateDynamicObject(1215, -811.37390137, 537.40319824, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(12)
    CreateDynamicObject(1215, -827.64764404, 520.73028564, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(13)
    CreateDynamicObject(1215, -804.23773193, 505.63381958, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(14)
    CreateDynamicObject(1215, -804.74291992, 487.22183228, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(15)
    CreateDynamicObject(1215, -804.85107422, 482.36691284, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(16)
    CreateDynamicObject(1215, -826.78521729, 496.16918945, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(17)
    CreateDynamicObject(1215, -836.31066895, 496.32916260, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(18)
    CreateDynamicObject(1215, -850.92242432, 500.08834839, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(19)
    CreateDynamicObject(1215, -850.25097656, 510.27239990, 2.83612537, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(20)
    CreateDynamicObject(1215, -868.24896240, 509.97341919, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(21)
    CreateDynamicObject(1215, -881.43817139, 519.29779053, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(22)
    CreateDynamicObject(1215, -866.43432617, 527.49578857, 2.57213426, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(23)
    CreateDynamicObject(1215, -870.44854736, 554.38629150, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(24)
    CreateDynamicObject(1262, -877.97302246, 530.29803467, 9.51682377, 0.00000000, 0.00000000, 182.62005615); //object(mtraffic4)(1)
    CreateDynamicObject(1262, -869.95751953, 530.01940918, 9.51682377, 0.00000000, 0.00000000, 182.61474609); //object(mtraffic4)(3)
    CreateDynamicObject(8397, -873.20416260, 492.22293091, 12.00781059, 0.00000000, 0.00000000, 0.00000000); //object(luxorpillar01_lvs)(1)
    CreateDynamicObject(12943, -787.24011230, 541.83032227, 1.69626582, 0.00000000, 0.00000000, 359.00000000); //object(sw_shed07)(1)
    CreateDynamicObject(1215, -794.93920898, 538.20513916, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(8)
    CreateDynamicObject(1215, -779.63616943, 545.42675781, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(8)
    CreateDynamicObject(1215, -779.55822754, 537.95281982, 2.61058974, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(8)
    CreateDynamicObject(16151, -791.45446777, 539.14422607, 2.34626746, 0.00000000, 0.00000000, 270.67498779); //object(ufo_bar)(1)
    CreateDynamicObject(1667, -789.03564453, 540.13610840, 3.09026527, 0.00000000, 0.00000000, 1.98498535); //object(propwineglass1)(1)
    CreateDynamicObject(1667, -789.72967529, 540.07641602, 3.06526518, 0.00000000, 0.00000000, 0.00000000); //object(propwineglass1)(2)
    CreateDynamicObject(643, -788.62548828, 544.62390137, 2.51673794, 0.00000000, 0.00000000, 0.00000000); //object(kb_chr_tbl_test)(1)
    CreateDynamicObject(643, -783.73687744, 539.64605713, 2.51673794, 0.00000000, 0.00000000, 0.00000000); //object(kb_chr_tbl_test)(2)
    CreateDynamicObject(1670, -788.66735840, 544.53894043, 2.91681790, 0.00000000, 0.00000000, 0.00000000); //object(propcollecttable)(1)
    CreateDynamicObject(1775, -785.96502686, 545.13684082, 3.14330292, 0.00000000, 0.00000000, 0.00000000); //object(cj_sprunk1)(1)
    CreateDynamicObject(2837, -783.33343506, 544.15014648, 2.91681790, 0.00000000, 0.00000000, 0.00000000); //object(gb_takeaway02)(1)
    CreateDynamicObject(643, -783.31054688, 544.22851562, 2.51673794, 0.00000000, 0.00000000, 0.00000000); //object(kb_chr_tbl_test)(4)
    CreateDynamicObject(2860, -784.04022217, 539.63348389, 2.93340707, 0.00000000, 0.00000000, 0.00000000); //object(gb_kitchtakeway05)(1)
    CreateDynamicObject(3515, -775.23632812, 554.06304932, 4.01647377, 0.00000000, 0.00000000, 0.00000000); //object(vgsfountain)(1)
    CreateDynamicObject(7388, -782.11352539, 536.15417480, 2.04626656, 0.00000000, 0.00000000, 0.00000000); //object(vrockpole)(1)
    CreateDynamicObject(13562, -884.07757568, 513.98236084, 9.11369133, 0.00000000, 0.00000000, 0.00000000); //object(bigsprunkpole)(1)
    CreateDynamicObject(2672, -784.44409180, 566.51025391, 2.32572865, 0.00000000, 0.00000000, 0.00000000); //object(proc_rubbish_4)(1)


    //fort carson
    //AddStaticVehicle(562,-91.56045532,588.36486816,3.05251098,282.58496094,-1,-1); //Elegy
    //AddStaticVehicle(514,236.92858887,746.71539307,6.89892817,125.05499268,-1,-1); //Tanker
    //AddStaticVehicle(514,234.01722717,738.46215820,6.89892817,346.10180664,-1,-1); //Tanker
    //AddStaticVehicle(562,-123.14777374,596.39428711,2.14527535,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(562,-93.36083221,594.47875977,2.80251098,282.58483887,-1,-1); //Elegy
    //AddStaticVehicle(562,-102.48195648,586.57641602,2.80251098,282.58483887,-1,-1); //Elegy
    //AddStaticVehicle(562,-103.70115662,591.58410645,2.80251098,282.58483887,-1,-1); //Elegy
    //AddStaticVehicle(562,-101.04456329,580.36944580,3.20250964,282.58483887,-1,-1); //Elegy
    //AddStaticVehicle(562,-90.28929138,583.66809082,3.45250964,282.58483887,-1,-1); //Elegy
    CreateDynamicObject(16092, -139.07237244, 618.33245850, 1.07812500, 0.00000000, 0.00000000, 278.84997559); //object(des_pipestrut05)(1)
    CreateDynamicObject(979, -112.21865845, 825.26824951, 19.90633202, 0.00000000, 0.00000000, 114.63006592); //object(sub_roadleft)(1)
    CreateDynamicObject(978, -143.91137695, 611.77001953, 1.91834509, 0.00000000, 0.00000000, 282.58496094); //object(sub_roadright)(1)
    CreateDynamicObject(978, -132.80815125, 534.25280762, 7.01209497, 0.00000000, 358.01501465, 261.98498535); //object(sub_roadright)(2)
    CreateDynamicObject(979, -116.96738434, 544.63281250, 6.59373236, 0.00000000, 3.75000000, 86.83663940); //object(sub_roadleft)(2)
    CreateDynamicObject(978, -144.00585938, 602.76757812, 2.05073357, 0.00000000, 358.01147461, 256.77795410); //object(sub_roadright)(3)
    CreateDynamicObject(978, -132.15467834, 543.35894775, 6.68709373, 0.00000000, 358.01147461, 269.91992188); //object(sub_roadright)(4)
    CreateDynamicObject(978, -129.08341980, 527.89599609, 7.08709526, 0.00000000, 0.99645996, 337.40942383); //object(sub_roadright)(5)
    CreateDynamicObject(978, -120.13241577, 526.69219971, 6.93709469, 0.00000000, 0.99426270, 7.18139648); //object(sub_roadright)(6)
    CreateDynamicObject(979, -127.62109375, 605.61035156, 1.83357346, 0.00000000, 0.00000000, 128.51257324); //object(sub_roadleft)(3)
    CreateDynamicObject(979, -112.70424652, 540.90698242, 6.91209459, 1.00000000, 359.99633789, 190.05603027); //object(sub_roadleft)(4)
    CreateDynamicObject(978, -134.40193176, 551.99389648, 6.03709126, 0.00000000, 353.76147461, 299.69238281); //object(sub_roadright)(7)
    CreateDynamicObject(978, -139.32974243, 559.51019287, 4.96209478, 0.00000000, 353.75976562, 305.64550781); //object(sub_roadright)(8)
    CreateDynamicObject(978, -145.74034119, 594.09399414, 2.19817638, 0.00000000, 359.50976562, 259.99047852); //object(sub_roadright)(9)
    CreateDynamicObject(978, -143.47363281, 567.33105469, 4.06209707, 0.00000000, 355.00671387, 289.76440430); //object(sub_roadright)(10)
    CreateDynamicObject(978, -146.05371094, 576.47753906, 3.16693544, 0.00000000, 355.00671387, 285.79284668); //object(sub_roadright)(11)
    CreateDynamicObject(978, -147.23127747, 585.55194092, 2.27317667, 0.00000000, 359.50561523, 259.98596191); //object(sub_roadright)(12)
    CreateDynamicObject(978, -111.61869049, 528.71441650, 6.93709469, 0.00000000, 359.23876953, 19.08956909); //object(sub_roadright)(13)
    CreateDynamicObject(978, -102.79519653, 531.50860596, 6.86209440, 0.00000000, 359.48645020, 19.08874512); //object(sub_roadright)(14)
    CreateDynamicObject(979, -103.70083618, 543.34185791, 6.83709431, 0.99975586, 358.99450684, 199.97747803); //object(sub_roadleft)(5)
    CreateDynamicObject(979, -116.50292969, 553.86718750, 5.86872959, 0.00000000, 5.74584961, 86.83044434); //object(sub_roadleft)(6)
    CreateDynamicObject(979, -131.56933594, 613.59765625, 1.91259813, 0.00000000, 0.00000000, 102.71667480); //object(sub_roadleft)(7)
    CreateDynamicObject(979, -120.89892578, 832.23815918, 20.03133011, 0.00000000, 356.25000000, 203.71594238); //object(sub_roadleft)(8)
    CreateDynamicObject(1237, -115.10894012, 831.58740234, 19.00323868, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(1)
    CreateDynamicObject(4505, -297.21838379, 829.10968018, 14.74152756, 359.25000000, 351.75000000, 270.67498779); //object(cuntw_roadblock01ld)(1)
    CreateDynamicObject(4526, -192.46078491, 1028.47094727, 20.63347435, 0.00000000, 0.00000000, 300.44998169); //object(sfse_roadblock5)(1)
    CreateDynamicObject(1237, -180.02806091, 1020.43731689, 18.74218750, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(2)
    CreateDynamicObject(1237, -180.20587158, 1017.01727295, 18.74218750, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(3)
    CreateDynamicObject(1237, -180.16336060, 1013.91174316, 18.74218750, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(4)
    CreateDynamicObject(1237, -180.15565491, 1010.95983887, 18.74218750, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(5)
    CreateDynamicObject(1228, -180.08642578, 1018.78277588, 19.16331482, 0.00000000, 0.00000000, 0.00000000); //object(roadworkbarrier1)(1)
    CreateDynamicObject(1228, -180.04400635, 1022.19232178, 19.16331482, 0.00000000, 0.00000000, 0.00000000); //object(roadworkbarrier1)(2)
    CreateDynamicObject(1228, -180.13121033, 1015.37036133, 19.16331482, 0.00000000, 0.00000000, 0.00000000); //object(roadworkbarrier1)(3)
    CreateDynamicObject(1228, -180.11943054, 1012.34381104, 19.16331482, 0.00000000, 0.00000000, 0.00000000); //object(roadworkbarrier1)(4)
    CreateDynamicObject(1228, -180.09120178, 1009.51715088, 19.16331482, 0.00000000, 0.00000000, 0.00000000); //object(roadworkbarrier1)(5)
    CreateDynamicObject(1228, -124.48321533, 812.25415039, 20.28607178, 0.00000000, 0.00000000, 21.83499146); //object(roadworkbarrier1)(6)
    CreateDynamicObject(1228, -126.38098145, 813.86645508, 20.28607178, 0.00000000, 0.00000000, 73.45483398); //object(roadworkbarrier1)(7)
    CreateDynamicObject(1228, -129.05854797, 814.19976807, 20.28607178, 0.00000000, 0.00000000, 107.19958496); //object(roadworkbarrier1)(8)
    CreateDynamicObject(978, -254.65048218, 1008.11816406, 19.59874916, 0.00000000, 0.00000000, 0.00000000); //object(sub_roadright)(15)
    CreateDynamicObject(978, -218.46289062, 1007.88476562, 19.57108498, 0.00000000, 0.00000000, 0.00000000); //object(sub_roadright)(16)
    CreateDynamicObject(978, -242.38906860, 1007.92248535, 19.58240700, 0.00000000, 0.00000000, 0.00000000); //object(sub_roadright)(17)
    CreateDynamicObject(978, -205.82524109, 977.67126465, 18.82107162, 0.00000000, 0.00000000, 278.61499023); //object(sub_roadright)(18)
    CreateDynamicObject(1237, -206.88226318, 971.66815186, 17.78583527, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(6)
    CreateDynamicObject(1237, -210.24404907, 971.46539307, 18.08794403, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(7)
    CreateDynamicObject(1237, -215.17567444, 971.29064941, 18.31286621, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(8)
    CreateDynamicObject(1237, -232.46179199, 1007.37670898, 18.71584702, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(9)
    CreateDynamicObject(1237, -248.90702820, 1007.80029297, 18.77929878, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(10)
    CreateDynamicObject(4505, -275.05572510, 1078.79394531, 21.64406204, 0.00000000, 0.00000000, 268.17504883); //object(cuntw_roadblock01ld)(2)
    CreateDynamicObject(978, -266.75234985, 1008.05865479, 19.57715988, 0.00000000, 0.00000000, 0.00000000); //object(sub_roadright)(19)
    CreateDynamicObject(978, -295.84454346, 1052.85913086, 19.42675018, 0.00000000, 0.00000000, 0.00000000); //object(sub_roadright)(20)
    CreateDynamicObject(981, -286.87988281, 1034.02539062, 19.46717644, 0.00000000, 0.00000000, 269.92309570); //object(helix_barrier)(4)
    CreateDynamicObject(978, -280.38458252, 1013.09973145, 19.57715988, 0.00000000, 0.00000000, 318.31500244); //object(sub_roadright)(21)
    CreateDynamicObject(1434, -265.26086426, 1061.17993164, 18.81995583, 0.00000000, 0.00000000, 272.65997314); //object(dyn_roadbarrier_5a)(1)
    CreateDynamicObject(1434, -265.26275635, 1058.30114746, 18.81995583, 0.00000000, 0.00000000, 269.40869141); //object(dyn_roadbarrier_5a)(2)
    CreateDynamicObject(1434, -265.28579712, 1055.34643555, 18.81995583, 0.00000000, 0.00000000, 269.40673828); //object(dyn_roadbarrier_5a)(3)
    CreateDynamicObject(1434, -265.20578003, 1052.34790039, 18.69495773, 0.00000000, 0.00000000, 269.40673828); //object(dyn_roadbarrier_5a)(4)
    CreateDynamicObject(1434, -263.93316650, 1040.61157227, 18.84736252, 0.00000000, 0.00000000, 217.81182861); //object(dyn_roadbarrier_5a)(5)
    CreateDynamicObject(1434, -264.10546875, 1049.94921875, 18.69495773, 0.00000000, 0.00000000, 311.10534668); //object(dyn_roadbarrier_5a)(6)
    CreateDynamicObject(4505, -299.03817749, 1097.88867188, 21.64406204, 0.00000000, 0.00000000, 173.89086914); //object(cuntw_roadblock01ld)(3)
    CreateDynamicObject(979, -311.76708984, 1107.78747559, 19.58240700, 0.00000000, 0.00000000, 180.63500977); //object(sub_roadleft)(9)
    CreateDynamicObject(1237, -307.10833740, 1105.52600098, 18.73439026, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(11)
    CreateDynamicObject(1408, -355.73080444, 1102.77258301, 19.33453751, 0.00000000, 0.00000000, 268.68997192); //object(dyn_f_wood_2)(1)
    CreateDynamicObject(1408, -355.57348633, 1108.04528809, 19.33453751, 0.00000000, 0.00000000, 268.68713379); //object(dyn_f_wood_2)(2)
    CreateDynamicObject(1408, -355.47924805, 1113.54492188, 19.33453751, 0.00000000, 0.00000000, 268.68713379); //object(dyn_f_wood_2)(3)
    CreateDynamicObject(1408, -355.38922119, 1118.76989746, 19.33453751, 0.00000000, 0.00000000, 268.68713379); //object(dyn_f_wood_2)(4)
    CreateDynamicObject(1408, -355.43118286, 1126.52209473, 19.33453751, 0.00000000, 0.00000000, 268.68713379); //object(dyn_f_wood_2)(5)
    CreateDynamicObject(978, -349.48480225, 1152.79785156, 19.57318687, 0.00000000, 0.00000000, 217.07647705); //object(sub_roadright)(22)
    CreateDynamicObject(978, -336.84768677, 1158.37902832, 19.50105286, 0.00000000, 0.00000000, 181.09887695); //object(sub_roadright)(23)
    CreateDynamicObject(978, -314.65368652, 1158.80297852, 19.50105286, 0.00000000, 0.00000000, 181.09863281); //object(sub_roadright)(24)
    CreateDynamicObject(978, -325.35641479, 1158.42517090, 19.50105286, 0.00000000, 0.00000000, 180.09863281); //object(sub_roadright)(25)
    CreateDynamicObject(979, -334.68896484, 1131.14379883, 19.43240929, 0.00000000, 0.00000000, 89.32501221); //object(sub_roadleft)(10)
    CreateDynamicObject(979, -316.40090942, 1138.13024902, 19.58144379, 0.00000000, 0.00000000, 359.99932861); //object(sub_roadleft)(11)
    CreateDynamicObject(979, -327.12561035, 1138.11523438, 19.58405304, 0.00000000, 0.00000000, 359.99450684); //object(sub_roadleft)(13)
    CreateDynamicObject(1228, -333.49774170, 1136.64733887, 19.16521645, 0.00000000, 0.00000000, 318.31500244); //object(roadworkbarrier1)(12)
    CreateDynamicObject(2914, -139.16818237, 617.38128662, 8.40031624, 0.00000000, 31.76000977, 9.92498779); //object(kmb_rcflag)(1)
    CreateDynamicObject(2914, -138.79992676, 617.45318604, 8.40031624, 0.00000000, 31.75598145, 189.28561401); //object(kmb_rcflag)(2)
    CreateDynamicObject(1584, -98.34984589, 533.92749023, 7.63345385, 0.00000000, 0.00000000, 102.70501709); //object(tar_gun1)(1)
    CreateDynamicObject(4526, -271.44528198, 1142.07092285, 20.63347435, 0.00000000, 0.00000000, 336.17999268); //object(sfse_roadblock5)(2)
    CreateDynamicObject(4527, -280.62026978, 1204.94311523, 20.09375000, 0.00000000, 0.00000000, 107.18811035); //object(sfse_roadblock2)(1)
    CreateDynamicObject(7933, -306.57943726, 1073.00573730, 19.30280304, 0.00000000, 0.00000000, 316.32998657); //object(vegascrashbar06)(1)
    CreateDynamicObject(16664, -300.53070068, 1078.95849609, 19.49925232, 0.00000000, 0.00000000, 0.00000000); //object(a51_jetpalpha)(1)
    CreateDynamicObject(4517, -96.05859375, 1198.70703125, 20.38884544, 0.00000000, 0.00000000, 91.30737305); //object(cn2_roadblock04ld)(1)
    CreateDynamicObject(4514, -114.97949219, 1180.32910156, 20.37833405, 0.00000000, 0.00000000, 0.00000000); //object(cn2_roadblock01ld)(1)
    CreateDynamicObject(4526, -140.83015442, 1213.56872559, 20.78191185, 0.00000000, 0.00000000, 328.23999023); //object(sfse_roadblock5)(3)
    CreateDynamicObject(1282, -132.13079834, 1210.50878906, 19.43100357, 0.00000000, 0.00000000, 31.76000977); //object(barrierm)(1)
    CreateDynamicObject(1282, -130.25375366, 1207.85546875, 19.43100357, 0.00000000, 0.00000000, 31.75598145); //object(barrierm)(2)
    CreateDynamicObject(1282, -127.50292969, 1207.60546875, 19.43100357, 0.00000000, 0.00000000, 89.32098389); //object(barrierm)(3)
    CreateDynamicObject(1282, -124.25292969, 1208.10546875, 19.43100357, 0.00000000, 0.00000000, 89.31884766); //object(barrierm)(4)
    CreateDynamicObject(981, -145.95539856, 1186.60034180, 19.51717567, 0.00000000, 0.00000000, 180.08319092); //object(helix_barrier)(4)
    CreateDynamicObject(4504, -248.66470337, 1215.65014648, 21.34220123, 0.00000000, 0.00000000, 268.70498657); //object(cuntw_roadblockld)(1)
    CreateDynamicObject(978, -199.39456177, 1210.74597168, 19.58240700, 0.00000000, 0.00000000, 180.63500977); //object(sub_roadright)(26)
    CreateDynamicObject(978, -172.30354309, 1210.56201172, 19.58240700, 0.00000000, 0.00000000, 172.69171143); //object(sub_roadright)(27)
    CreateDynamicObject(1237, -255.37442017, 1187.72216797, 18.74311638, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(12)
    CreateDynamicObject(1237, -261.07116699, 1187.65551758, 18.74364853, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(13)
    CreateDynamicObject(1237, -264.97128296, 1187.69592285, 18.74460220, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(14)
    CreateDynamicObject(1237, -265.08999634, 1183.70715332, 18.74218750, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(15)
    CreateDynamicObject(1237, -265.27105713, 1178.08752441, 18.75839233, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(16)
    CreateDynamicObject(4527, -289.08007812, 1163.65332031, 20.50140572, 0.00000000, 0.00000000, 107.18811035); //object(sfse_roadblock2)(1)
    CreateDynamicObject(1237, -266.17071533, 1209.14233398, 18.74218750, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(17)
    CreateDynamicObject(1237, -286.31219482, 1188.43579102, 18.74218750, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(18)
    CreateDynamicObject(7933, -107.98809814, 1245.27087402, 15.96988297, 0.00000000, 355.25000000, 232.95999146); //object(vegascrashbar06)(2)
    CreateDynamicObject(18218, 108.89533997, 1197.06787109, 17.75852585, 355.00000000, 359.00000000, 349.33999634); //object(mtbfence08)(1)
    CreateDynamicObject(2728, 178.58125305, 1145.93493652, 13.26162910, 0.00000000, 0.00000000, 248.83996582); //object(ds_backlight)(1)
    CreateDynamicObject(7315, -38.88340378, 1198.73596191, 33.14765930, 0.00000000, 0.00000000, 270.65997314); //object(vgsn_blucasign)(1)
    CreateDynamicObject(7908, -69.08517456, 1287.27490234, 13.91004181, 0.00000000, 0.00000000, 4.00000000); //object(vgwestbillbrd09)(1)
    CreateDynamicObject(1215, 159.25340271, 1166.55737305, 14.35047150, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(1)
    CreateDynamicObject(1215, 162.03881836, 1164.65368652, 14.35213089, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(2)
    CreateDynamicObject(1215, 164.44781494, 1162.89721680, 14.27828312, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(3)
    CreateDynamicObject(6299, 160.91857910, 1180.22937012, 16.20493317, 0.00000000, 0.00000000, 0.00000000); //object(pier03c_law2)(1)
    CreateDynamicObject(8483, -308.82818604, 770.93597412, 19.95237160, 359.25000000, 345.00000000, 91.31002808); //object(pirateland02_lvs)(1)
    CreateDynamicObject(8873, 172.41189575, 1134.06579590, 19.71282578, 0.00000000, 0.00000000, 117.82994080); //object(vgsecnstrct12)(1)
    CreateDynamicObject(18257, 283.14477539, 849.18463135, 17.96633911, 0.00000000, 0.00000000, 0.00000000); //object(crates)(1)
    CreateDynamicObject(18257, 288.45123291, 853.96624756, 18.01210976, 0.00000000, 0.00000000, 0.00000000); //object(crates)(2)
    CreateDynamicObject(18257, 285.33160400, 842.17053223, 17.47854233, 0.00000000, 0.00000000, 0.00000000); //object(crates)(3)
    CreateDynamicObject(18257, 293.17117310, 849.50939941, 17.35930634, 0.00000000, 0.00000000, 0.00000000); //object(crates)(4)
    CreateDynamicObject(3569, 243.39019775, 755.76672363, 7.89330912, 0.00000000, 0.00000000, 161.50000000); //object(lasntrk3)(1)
    CreateDynamicObject(3569, 226.81282043, 732.04620361, 7.74428415, 0.00000000, 0.00000000, 290.51660156); //object(lasntrk3)(2)
    CreateDynamicObject(14878, -122.12716675, 596.51177979, 1.89556122, 0.00000000, 0.00000000, 0.00000000); //object(michelle-barrels)(1)
    CreateDynamicObject(1348, -119.41036987, 597.62835693, 2.09153652, 0.00000000, 0.00000000, 0.00000000); //object(cj_o2tanks)(1)
    CreateDynamicObject(981, 235.44075012, 974.77026367, 28.07329750, 0.00000000, 0.00000000, 294.49499512); //object(helix_barrier)(2)
    CreateDynamicObject(981, 216.89756775, 965.96899414, 28.07329750, 0.00000000, 0.00000000, 114.59765625); //object(helix_barrier)(3)
    CreateDynamicObject(978, 186.28140259, 1152.88818359, 14.52765942, 0.00000000, 0.00000000, 136.96502686); //object(sub_roadright)(28)
    CreateDynamicObject(978, 191.58128357, 1145.64306641, 14.52765942, 0.00000000, 0.00000000, 115.12603760); //object(sub_roadright)(29)
    CreateDynamicObject(978, 192.94007874, 1137.13598633, 14.52765942, 0.00000000, 0.00000000, 83.36572266); //object(sub_roadright)(30)
    CreateDynamicObject(1237, 167.16021729, 1163.10449219, 13.74213982, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(19)
    CreateDynamicObject(7908, -69.0852, 1287.2749, 13.9100, 0.0000, 0.0000, 184.3644);
    CreateDynamicObject(1237, 172.68913269, 1159.79516602, 13.71103096, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(20)
    CreateDynamicObject(1237, 179.86676025, 1157.76928711, 13.68184853, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(21)
    CreateDynamicObject(1215, 272.46203613, 846.97186279, 18.69525337, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(4)
    CreateDynamicObject(1215, 273.47308350, 842.61010742, 18.29615021, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(5)
    CreateDynamicObject(1215, 264.30651855, 846.24267578, 18.69677925, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(6)
    CreateDynamicObject(1215, 274.60705566, 825.98248291, 16.72148132, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(7)
    CreateDynamicObject(1215, 265.77999878, 840.83618164, 18.16490364, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(8)
    CreateDynamicObject(1215, 272.36581421, 814.99633789, 15.19186211, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(10)
    CreateDynamicObject(1215, 266.35903931, 826.30267334, 16.19137764, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(11)
    CreateDynamicObject(1215, 264.54968262, 817.12103271, 14.65557766, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(12)
    CreateDynamicObject(1215, 258.80023193, 791.50256348, 10.00243759, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(13)
    CreateDynamicObject(1215, 260.43225098, 808.04821777, 12.63384247, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(14)
    CreateDynamicObject(1215, 267.21972656, 802.85546875, 12.82627106, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(15)
    CreateDynamicObject(1215, 252.33325195, 795.76306152, 9.77632332, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(16)
    CreateDynamicObject(1422, 242.67060852, 764.32531738, 5.60259914, 0.00000000, 0.00000000, 15.88000488); //object(dyn_roadbarrier_5)(2)
    CreateDynamicObject(1422, 239.30560303, 763.43768311, 5.60259914, 0.00000000, 0.00000000, 15.87524414); //object(dyn_roadbarrier_5)(3)
    CreateDynamicObject(1662, -1.07041550, 632.82763672, 9.21831036, 358.50000000, 0.25000000, 0.00000000); //object(nt_roadblockci)(1)
    CreateDynamicObject(1427, 209.86901855, 720.09448242, 5.67209625, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(1)
    CreateDynamicObject(1427, 206.00125122, 718.28210449, 5.59890842, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(2)
    CreateDynamicObject(1427, 201.27037048, 716.23406982, 5.53413677, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(3)
    CreateDynamicObject(1427, 195.96723938, 713.77008057, 5.43553448, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(4)
    CreateDynamicObject(1427, 191.37254333, 711.73376465, 5.48869705, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(5)
    CreateDynamicObject(1427, 186.83203125, 709.37628174, 5.61131191, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(6)
    CreateDynamicObject(1427, 181.15333557, 706.72009277, 5.67272282, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(7)
    CreateDynamicObject(1427, 172.86892700, 702.16625977, 5.67312527, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(8)
    CreateDynamicObject(1427, 165.27288818, 697.85949707, 5.67498398, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(9)
    CreateDynamicObject(1427, 155.74348450, 691.99853516, 5.66097546, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(10)
    CreateDynamicObject(1427, 149.72932434, 688.36199951, 5.68136597, 0.00000000, 0.00000000, 0.00000000); //object(cj_roadbarrier)(11)
    CreateDynamicObject(1215, 2.38031769, 609.77502441, 8.78263855, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(18)
    CreateDynamicObject(1215, -1.16506958, 606.34368896, 9.09197521, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(19)
    CreateDynamicObject(1215, 8.40501785, 603.60174561, 8.85286903, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(20)
    CreateDynamicObject(1215, 4.89934540, 600.06677246, 9.23649979, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(21)
    CreateDynamicObject(1215, -35.40620804, 563.41247559, 9.20627499, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(22)
    CreateDynamicObject(1215, -51.06542587, 551.99884033, 8.08676529, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(23)
    CreateDynamicObject(1215, -54.21475220, 560.52270508, 8.15927601, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(24)
    CreateDynamicObject(1215, -40.80817032, 569.61560059, 9.04625130, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(25)
    CreateDynamicObject(1215, -98.27946472, 533.82421875, 6.58929348, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight)(26)
    CreateDynamicObject(16327, 213.37908936, 758.46215820, 5.31469917, 0.00000000, 0.00000000, 0.00000000); //object(des_bycontowr)(1)
    CreateDynamicObject(967, -146.21813965, 619.42016602, 1.13706636, 0.00000000, 0.00000000, 13.89498901); //object(bar_gatebox01)(1)
    CreateDynamicObject(3243, -320.21905518, 787.60052490, 14.23938751, 0.00000000, 0.00000000, 0.00000000); //object(tepee_room_)(1)
    CreateDynamicObject(3243, -320.72259521, 797.75311279, 15.09213257, 0.00000000, 0.00000000, 0.00000000); //object(tepee_room_)(2)
    CreateDynamicObject(3243, -321.64999390, 807.47766113, 14.41622162, 0.00000000, 0.00000000, 0.00000000); //object(tepee_room_)(3)
    CreateDynamicObject(3243, -330.68783569, 790.18359375, 16.55134583, 0.00000000, 0.00000000, 0.00000000); //object(tepee_room_)(4)
    CreateDynamicObject(3243, -332.03475952, 798.40570068, 15.58509064, 0.00000000, 0.00000000, 0.00000000); //object(tepee_room_)(5)
    CreateDynamicObject(3243, -332.44561768, 808.16510010, 14.38178253, 0.00000000, 0.00000000, 0.00000000); //object(tepee_room_)(6)
    CreateDynamicObject(3615, -152.91137695, 611.79315186, 3.27558565, 0.00000000, 0.00000000, 280.83496094); //object(sanmonbhut1_law2)(1)
    CreateDynamicObject(978, -127.53421783, 1250.80566406, 18.30472374, 0.00000000, 0.00000000, 246.85156250); //object(sub_roadright)(22)
    CreateDynamicObject(978, -121.67773438, 1258.69238281, 17.90472984, 0.25000000, 355.24548340, 215.08483887); //object(sub_roadright)(22)
    CreateDynamicObject(978, -112.58331299, 1261.68005371, 16.77974701, 0.74707031, 351.74780273, 185.08483887); //object(sub_roadright)(22)
    CreateDynamicObject(18218, -71.92285156, 1269.73632812, 11.69405746, 354.99572754, 0.00000000, 45.65368652); //object(mtbfence08)(2)
    CreateDynamicObject(11505, -97.04075623, 588.26409912, 6.50242090, 357.00000000, 359.00000000, 12.89498901); //object(des_garwcanopy)(1)
    CreateDynamicObject(979, -120.22373962, 601.37475586, 1.86229444, 0.00000000, 0.00000000, 172.18255615); //object(sub_roadleft)(3)
    CreateDynamicObject(979, -114.11054230, 595.70800781, 1.86229444, 0.00000000, 0.00000000, 104.68768311); //object(sub_roadleft)(3)
    CreateDynamicObject(979, -115.89246368, 563.02221680, 4.76872540, 0.00000000, 6.99584961, 86.83044434); //object(sub_roadleft)(6)
    CreateDynamicObject(979, -113.85105133, 571.60534668, 3.96872807, 0.00000000, 6.49279785, 63.00494385); //object(sub_roadleft)(6)
    CreateDynamicObject(982, -100.88390350, 594.51257324, 2.08823991, 0.00000000, 0.00000000, 281.09997559); //object(fenceshit)(1)
    CreateDynamicObject(982, -96.99463654, 578.38415527, 3.21324420, 0.00000000, 0.00000000, 280.59631348); //object(fenceshit)(2)
    CreateDynamicObject(983, -86.99317169, 575.52685547, 3.87115383, 4.25000000, 0.75000000, 306.40496826); //object(fenceshit3)(1)
    CreateDynamicObject(983, -81.78226471, 582.68865967, 3.42832184, 4.24621582, 1.99707031, 306.40319824); //object(fenceshit3)(2)
    CreateDynamicObject(983, -85.18498230, 597.64819336, 2.42832184, 5.74621582, 0.74401855, 282.56286621); //object(fenceshit3)(3)
    CreateDynamicObject(984, -80.07597351, 591.83618164, 3.74050450, 357.25000000, 0.00000000, 14.14498901); //object(fenceshit2)(1)
    CreateDynamicObject(1337, -79.91903687, 585.85101318, 3.94386625, 0.00000000, 0.00000000, 0.00000000); //object(binnt07_la)(1)

    //sklad1
    AddStaticVehicle(477, 1689.57604980, 920.69799805, 10.72900009, 0.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, 1694.55200195, 921.04400635, 10.73400021, 0.00000000, -1, -1); //ZR-350
    CreateDynamicObject(672, 1677.95300293, 968.11602783, 9.74100018, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (1)
    CreateDynamicObject(1251, 1677.41699219, 956.75201416, 9.66199970, 0.00000000, 0.00000000, 0.00000000); //object(smashbar) (1)
    CreateDynamicObject(1282, 1675.67004395, 967.11499023, 10.43599987, 0.00000000, 0.00000000, 42.00000000); //object(barrierm) (1)
    CreateDynamicObject(984, 1701.35705566, 966.57897949, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (1)
    CreateDynamicObject(984, 1690.18896484, 966.54901123, 10.41600037, 0.00000000, 0.00000000, 269.99951172); //object(fenceshit2) (2)
    CreateDynamicObject(983, 1680.55395508, 966.53802490, 10.41699982, 0.00000000, 0.00000000, 90.00000000); //object(fenceshit3) (3)
    CreateDynamicObject(1282, 1676.72595215, 966.45697021, 10.42700005, 0.00000000, 0.00000000, 67.99670410); //object(barrierm) (2)
    CreateDynamicObject(983, 1677.36999512, 963.36798096, 10.40400028, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (4)
    CreateDynamicObject(983, 1677.36096191, 950.07702637, 10.34799957, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (5)
    CreateDynamicObject(983, 1677.06799316, 943.73699951, 10.40399933, 0.00000000, 0.00000000, 354.00000000); //object(fenceshit3) (6)
    CreateDynamicObject(3749, 1666.65502930, 941.65301514, 15.52999973, 0.00000000, 0.00000000, 355.99584961); //object(clubgate01_lax) (1)
    CreateDynamicObject(672, 1656.75805664, 942.87200928, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (2)
    CreateDynamicObject(19127, 1677.37805176, 960.04901123, 10.33100033, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (1)
    CreateDynamicObject(19127, 1677.35498047, 953.38500977, 10.33100033, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (2)
    CreateDynamicObject(19125, 1672.71997070, 943.38598633, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight5) (1)
    CreateDynamicObject(19125, 1660.86303711, 944.18200684, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight5) (2)
    CreateDynamicObject(18647, 1660.87097168, 942.34497070, 12.18400002, 0.00000000, 0.00000000, 0.00000000); //object(redneontube1) (1)
    CreateDynamicObject(18647, 1672.50305176, 941.66302490, 12.23400021, 0.00000000, 0.00000000, 0.00000000); //object(redneontube1) (2)
    CreateDynamicObject(19291, 1710.30603027, 988.63299561, 14.35799980, 0.00000000, 0.00000000, 0.00000000); //object(pointlight11) (1)
    CreateDynamicObject(982, 1649.05395508, 965.18902588, 10.50399971, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (2)
    CreateDynamicObject(19127, 1661.82702637, 964.93798828, 10.36800003, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (3)
    CreateDynamicObject(983, 1633.07104492, 965.20202637, 10.50399971, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit3) (7)
    CreateDynamicObject(1237, 1629.35205078, 965.30700684, 9.81999969, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (1)
    CreateDynamicObject(8076, 1630.50097656, 933.28302002, 13.17000008, 0.00000000, 0.00000000, 0.00000000); //object(vgsfrates05) (1)
    CreateDynamicObject(978, 1636.28100586, 919.00299072, 10.46100044, 0.00000000, 0.00000000, 252.00000000); //object(sub_roadright) (2)
    CreateDynamicObject(978, 1634.85705566, 888.12701416, 10.42899990, 0.00000000, 0.00000000, 267.99890137); //object(sub_roadright) (3)
    CreateDynamicObject(978, 1654.82604980, 919.65399170, 10.46100044, 0.00000000, 0.00000000, 53.99890137); //object(sub_roadright) (4)
    CreateDynamicObject(978, 1650.35205078, 911.60302734, 10.54699993, 0.00000000, 0.00000000, 67.99780273); //object(sub_roadright) (5)
    CreateDynamicObject(672, 1648.54797363, 906.57299805, 9.77299976, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (3)
    CreateDynamicObject(978, 1664.60900879, 892.18200684, 10.56299973, 0.00000000, 0.00000000, 165.99499512); //object(sub_roadright) (6)
    CreateDynamicObject(978, 1660.05798340, 893.34497070, 10.57199955, 0.00000000, 0.00000000, 165.99243164); //object(sub_roadright) (7)
    CreateDynamicObject(978, 1725.02697754, 889.34899902, 10.53899956, 0.00000000, 0.00000000, 87.99243164); //object(sub_roadright) (8)
    CreateDynamicObject(1237, 1724.78405762, 884.23901367, 9.81999969, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (3)
    CreateDynamicObject(1237, 1725.25305176, 894.66400146, 9.74300003, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (4)
    CreateDynamicObject(982, 1717.07702637, 923.58502197, 10.50399971, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (3)
    CreateDynamicObject(19127, 1717.24804688, 912.76702881, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (4)
    CreateDynamicObject(19127, 1744.83605957, 914.75799561, 10.31799984, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (5)
    CreateDynamicObject(11326, 1677.27099609, 917.68402100, 12.02600002, 0.00000000, 0.00000000, 0.00000000); //object(sfse_hublockup) (1)
    CreateDynamicObject(984, 1750.79394531, 914.32897949, 10.33800030, 0.00000000, 0.00000000, 268.00000000); //object(fenceshit2) (3)
    CreateDynamicObject(978, 1757.34997559, 976.05297852, 10.66100025, 0.00000000, 0.00000000, 89.98950195); //object(sub_roadright) (12)
    CreateDynamicObject(978, 1757.33703613, 967.92102051, 10.67500019, 0.00000000, 0.00000000, 89.98901367); //object(sub_roadright) (13)
    CreateDynamicObject(978, 1752.28503418, 988.79199219, 10.52799988, 0.00000000, 0.00000000, 177.98901367); //object(sub_roadright) (14)
    CreateDynamicObject(978, 1672.32202148, 1016.15802002, 10.66100025, 0.00000000, 0.00000000, 359.98901367); //object(sub_roadright) (15)
    CreateDynamicObject(978, 1663.31005859, 1016.13098145, 10.66100025, 0.00000000, 0.00000000, 359.98803711); //object(sub_roadright) (17)
    CreateDynamicObject(978, 1671.26696777, 1010.84100342, 10.66100025, 0.00000000, 0.00000000, 179.98852539); //object(sub_roadright) (18)
    CreateDynamicObject(978, 1663.68103027, 1010.83502197, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (19)
    CreateDynamicObject(672, 1672.00305176, 1013.26898193, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (4)
    CreateDynamicObject(672, 1662.46398926, 1013.15301514, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (5)
    CreateDynamicObject(984, 1690.72204590, 991.25897217, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (6)
    CreateDynamicObject(984, 1703.51403809, 991.26098633, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (7)
    CreateDynamicObject(984, 1677.92004395, 991.24200439, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (8)
    CreateDynamicObject(984, 1665.11401367, 991.22998047, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (9)
    CreateDynamicObject(984, 1655.51196289, 991.22198486, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (10)
    CreateDynamicObject(984, 1690.65100098, 996.62298584, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (11)
    CreateDynamicObject(984, 1703.37695312, 996.61297607, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (12)
    CreateDynamicObject(984, 1677.85998535, 996.62402344, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (13)
    CreateDynamicObject(984, 1665.03601074, 996.65301514, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (14)
    CreateDynamicObject(984, 1655.46997070, 996.64697266, 10.45699978, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit2) (15)
    CreateDynamicObject(19127, 1648.95495605, 991.25402832, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (6)
    CreateDynamicObject(19127, 1648.90698242, 996.58300781, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (7)
    CreateDynamicObject(982, 1649.82897949, 976.78002930, 10.50399971, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit) (5)
    CreateDynamicObject(982, 1637.07800293, 989.59899902, 10.50399971, 0.00000000, 0.00000000, 180.00000000); //object(fenceshit) (6)
    CreateDynamicObject(984, 1637.03198242, 1004.03997803, 10.45699978, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit2) (16)
    CreateDynamicObject(982, 1637.07604980, 1029.16796875, 10.50399971, 0.00000000, 0.00000000, 179.99450684); //object(fenceshit) (8)
    CreateDynamicObject(982, 1637.04394531, 1046.75598145, 10.50399971, 0.00000000, 0.00000000, 179.99450684); //object(fenceshit) (9)
    CreateDynamicObject(982, 1637.08605957, 1060.29296875, 10.50399971, 0.00000000, 0.00000000, 91.99450684); //object(fenceshit) (10)
    CreateDynamicObject(1237, 1637.13903809, 1059.93103027, 9.81999969, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (5)
    CreateDynamicObject(984, 1656.18896484, 1060.94104004, 10.45699978, 0.00000000, 0.00000000, 272.00000000); //object(fenceshit2) (17)
    CreateDynamicObject(984, 1655.33203125, 1049.69396973, 10.45699978, 0.00000000, 0.00000000, 271.99951172); //object(fenceshit2) (18)
    CreateDynamicObject(984, 1643.46203613, 1049.28796387, 10.45699978, 0.00000000, 0.00000000, 271.99951172); //object(fenceshit2) (19)
    CreateDynamicObject(672, 1641.55200195, 1053.96105957, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (6)
    CreateDynamicObject(672, 1648.44897461, 1053.78405762, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (7)
    CreateDynamicObject(672, 1654.60400391, 1054.21594238, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (8)
    CreateDynamicObject(672, 1654.17797852, 972.24700928, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (9)
    CreateDynamicObject(672, 1646.56494141, 972.40802002, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (10)
    CreateDynamicObject(672, 1639.21594238, 972.38397217, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (11)
    CreateDynamicObject(672, 1633.63403320, 978.76501465, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (12)
    CreateDynamicObject(672, 1633.71997070, 985.42498779, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (13)
    CreateDynamicObject(672, 1633.73901367, 993.64398193, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (14)
    CreateDynamicObject(672, 1633.87402344, 1003.51000977, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (15)
    CreateDynamicObject(672, 1634.30798340, 1011.12200928, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (16)
    CreateDynamicObject(672, 1633.55004883, 1019.07800293, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (17)
    CreateDynamicObject(672, 1633.36499023, 1026.57800293, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (18)
    CreateDynamicObject(672, 1633.67700195, 1041.76293945, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (19)
    CreateDynamicObject(672, 1634.31103516, 1056.86401367, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (20)
    CreateDynamicObject(672, 1628.16198730, 1056.91699219, 9.81999969, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (21)
    CreateDynamicObject(978, 1687.87194824, 1036.67797852, 10.66100025, 0.00000000, 0.00000000, 359.98352051); //object(sub_roadright) (20)
    CreateDynamicObject(978, 1656.20300293, 1075.03405762, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (21)
    CreateDynamicObject(978, 1692.48706055, 1041.47302246, 10.66100025, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadright) (22)
    CreateDynamicObject(978, 1688.62402344, 1031.17797852, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (23)
    CreateDynamicObject(978, 1697.98303223, 1031.20202637, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (24)
    CreateDynamicObject(978, 1707.23999023, 1031.19396973, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (25)
    CreateDynamicObject(978, 1679.28295898, 1031.15600586, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (26)
    CreateDynamicObject(978, 1669.92895508, 1031.13098145, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (27)
    CreateDynamicObject(978, 1660.66796875, 1031.14404297, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (28)
    CreateDynamicObject(978, 1653.70703125, 1031.16296387, 10.66100025, 0.00000000, 0.00000000, 179.98852539); //object(sub_roadright) (29)
    CreateDynamicObject(978, 1678.52404785, 1036.69799805, 10.66100025, 0.00000000, 0.00000000, 359.98352051); //object(sub_roadright) (30)
    CreateDynamicObject(978, 1669.18200684, 1036.70898438, 10.66100025, 0.00000000, 0.00000000, 359.98352051); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1659.91198730, 1036.70202637, 10.66100025, 0.00000000, 0.00000000, 359.98352051); //object(sub_roadright) (32)
    CreateDynamicObject(978, 1653.42297363, 1036.70202637, 10.66100025, 0.00000000, 0.00000000, 359.98352051); //object(sub_roadright) (33)
    CreateDynamicObject(19127, 1648.97900391, 1031.09594727, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (8)
    CreateDynamicObject(19127, 1648.73400879, 1036.61999512, 10.48400021, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight7) (9)
    CreateDynamicObject(1238, 1648.54199219, 995.80798340, 10.13799953, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (1)
    CreateDynamicObject(1238, 1648.04199219, 994.71301270, 10.13799953, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (2)
    CreateDynamicObject(1238, 1648.01098633, 993.36901855, 10.13799953, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (3)
    CreateDynamicObject(1238, 1648.59399414, 992.03302002, 10.13799953, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (4)
    CreateDynamicObject(1238, 1648.63098145, 1035.97204590, 10.13799953, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (5)
    CreateDynamicObject(1238, 1648.00097656, 1034.81494141, 10.13799953, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (6)
    CreateDynamicObject(1238, 1648.00903320, 1033.35998535, 10.13799953, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (7)
    CreateDynamicObject(1238, 1648.74096680, 1031.90002441, 10.13799953, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (8)
    CreateDynamicObject(978, 1665.55004883, 1075.02502441, 10.66100025, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (34)
    CreateDynamicObject(978, 1673.61206055, 1071.73303223, 10.66100025, 0.00000000, 0.00000000, 135.98352051); //object(sub_roadright) (35)
    CreateDynamicObject(978, 1692.50402832, 1051.06896973, 10.66100025, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadright) (36)
    CreateDynamicObject(978, 1689.86401367, 1059.32104492, 10.66100025, 0.00000000, 0.00000000, 125.98352051); //object(sub_roadright) (37)
    CreateDynamicObject(978, 1678.83496094, 1066.71496582, 10.66100025, 0.00000000, 0.00000000, 135.98352051); //object(sub_roadright) (38)
    CreateDynamicObject(978, 1587.10803223, 1075.10803223, 10.56200027, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (39)
    CreateDynamicObject(978, 1582.02404785, 1075.10498047, 10.51599979, 0.00000000, 0.00000000, 179.98352051); //object(sub_roadright) (40)
    CreateDynamicObject(978, 1589.26293945, 998.75201416, 10.58100033, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadright) (41)
    CreateDynamicObject(978, 1589.25500488, 989.42401123, 10.58100033, 0.00000000, 0.00000000, 89.98352051); //object(sub_roadright) (43)
    CreateDynamicObject(672, 1592.63000488, 1001.11700439, 9.77099991, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (22)
    CreateDynamicObject(672, 1592.88476562, 995.65332031, 9.77400017, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1592.89196777, 989.74499512, 9.77400017, 0.00000000, 0.00000000, 279.82177734); //object(sm_veg_tree5) (24)
    CreateDynamicObject(19122, 1687.09899902, 926.65502930, 10.32900047, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight2) (1)
    CreateDynamicObject(19122, 1697.78698730, 926.39300537, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight2) (2)
    CreateDynamicObject(19123, 1707.46105957, 934.35498047, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight3) (1)
    CreateDynamicObject(19126, 1692.37194824, 1046.25598145, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight6) (1)
    CreateDynamicObject(19121, 1577.32897949, 1074.63098145, 10.38500023, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight1) (1)
    CreateDynamicObject(672, 1704.43603516, 993.59497070, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1696.39294434, 993.55700684, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1690.77600098, 993.57098389, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1704.95996094, 1033.44299316, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1698.21997070, 1033.08105469, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1690.49902344, 1033.05505371, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(1675, 1704.29602051, 1055.29003906, 12.97999954, 0.00000000, 0.00000000, 270.00000000); //object(wshxrefhse1) (1)
    CreateDynamicObject(1675, 1704.28198242, 1041.04394531, 12.97999954, 0.00000000, 0.00000000, 270.00000000); //object(wshxrefhse1) (2)
    CreateDynamicObject(672, 1657.49804688, 1079.30297852, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1663.95397949, 1079.44897461, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1670.61499023, 1079.34997559, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1682.96704102, 1068.61303711, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1689.45202637, 1068.83496094, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(672, 1696.63195801, 1069.04101562, 9.81999969, 0.00000000, 0.00000000, 279.81628418); //object(sm_veg_tree5) (23)
    CreateDynamicObject(18750, 1611.20996094, 896.58300781, 64.30200195, 90.00000000, 0.00000000, 128.00000000); //object(samplogobig) (1)
    CreateDynamicObject(18649, 1697.39294434, 924.37902832, 12.69999981, 0.00000000, 0.00000000, 0.00000000); //object(greenneontube1) (1)
    CreateDynamicObject(18649, 1687.20605469, 924.79699707, 12.66699982, 0.00000000, 0.00000000, 0.00000000); //object(greenneontube1) (2)
    CreateDynamicObject(18651, 1698.32702637, 921.20501709, 13.51000023, 0.00000000, 0.00000000, 0.00000000); //object(pinkneontube1) (1)


    //sklad2
    //AddStaticVehicle(411,1589.55773926,697.94226074,10.62785435,0.00000000,-1,-1); //Infernus
    //AddStaticVehicle(411,1589.54504395,690.62475586,10.62031269,0.00000000,-1,-1); //Infernus
    //AddStaticVehicle(411,1589.53442383,683.00213623,10.62031269,0.00000000,-1,-1); //Infernus
    //AddStaticVehicle(562,1582.38842773,698.07189941,10.58140373,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(562,1582.50585938,690.92620850,10.58140373,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(562,1582.78479004,682.55255127,10.57386208,0.00000000,-1,-1); //Elegy
    //AddStaticVehicle(402,1586.64929199,671.51922607,10.76031208,0.00000000,-1,-1); //Buffalo
    //AddStaticVehicle(402,1581.38159180,671.33343506,10.76031208,0.00000000,-1,-1); //Buffalo
    CreateDynamicObject(982, 1603.55773926, 719.30615234, 10.50386715, 0.00000000, 0.00000000, 88.32501221); //object(fenceshit)(1)
    CreateDynamicObject(982, 1640.71337891, 677.59112549, 10.50386715, 0.00000000, 0.00000000, 89.57458496); //object(fenceshit)(2)
    CreateDynamicObject(982, 1657.67968750, 718.69281006, 10.50386715, 0.00000000, 0.00000000, 89.57153320); //object(fenceshit)(3)
    CreateDynamicObject(982, 1685.49584961, 718.94677734, 10.50386715, 0.00000000, 0.00000000, 91.07153320); //object(fenceshit)(4)
    CreateDynamicObject(982, 1712.49914551, 719.04016113, 10.50386715, 0.00000000, 0.00000000, 89.32116699); //object(fenceshit)(5)
    CreateDynamicObject(982, 1695.58520508, 709.03045654, 10.50386715, 0.00000000, 0.00000000, 179.63122559); //object(fenceshit)(6)
    CreateDynamicObject(982, 1700.11511230, 761.94671631, 10.50386715, 0.00000000, 0.00000000, 90.30145264); //object(fenceshit)(7)
    CreateDynamicObject(982, 1738.58837891, 720.02716064, 10.50386715, 0.00000000, 358.01501465, 178.90887451); //object(fenceshit)(10)
    CreateDynamicObject(982, 1634.59167480, 731.52990723, 10.50386715, 0.00000000, 0.00000000, 179.62646484); //object(fenceshit)(11)
    CreateDynamicObject(982, 1634.53845215, 706.04016113, 10.50386715, 0.00000000, 0.00000000, 179.62646484); //object(fenceshit)(12)
    CreateDynamicObject(982, 1695.81933594, 734.78417969, 10.50386715, 0.00000000, 0.00000000, 179.62646484); //object(fenceshit)(13)
    CreateDynamicObject(982, 1674.52294922, 761.77612305, 10.47886753, 0.00000000, 0.00000000, 90.29663086); //object(fenceshit)(14)
    CreateDynamicObject(982, 1630.64355469, 718.79296875, 10.50386715, 0.00000000, 0.00000000, 89.57153320); //object(fenceshit)(15)
    CreateDynamicObject(982, 1621.48425293, 677.69824219, 10.50386715, 0.00000000, 0.00000000, 89.57153320); //object(fenceshit)(16)
    CreateDynamicObject(982, 1590.45581055, 737.48339844, 10.50386715, 0.00000000, 0.00000000, 130.00958252); //object(fenceshit)(17)
    CreateDynamicObject(982, 1589.53161621, 701.87341309, 10.50386715, 0.00000000, 0.00000000, 62.51669312); //object(fenceshit)(18)
    CreateDynamicObject(1237, 1590.72900391, 719.73004150, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(1)
    CreateDynamicObject(1237, 1634.53588867, 718.75665283, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(2)
    CreateDynamicObject(1237, 1634.51501465, 693.13775635, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(3)
    CreateDynamicObject(1237, 1644.19812012, 718.80462646, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(4)
    CreateDynamicObject(1237, 1695.66821289, 719.12017822, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(5)
    CreateDynamicObject(1237, 1695.45080566, 696.19885254, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(6)
    CreateDynamicObject(1237, 1699.01098633, 719.26263428, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(7)
    CreateDynamicObject(1237, 1725.25036621, 718.87451172, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(8)
    CreateDynamicObject(1237, 1734.57763672, 729.31341553, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(9)
    CreateDynamicObject(1237, 1731.77563477, 731.47045898, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(10)
    CreateDynamicObject(1237, 1736.93664551, 727.25061035, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(11)
    CreateDynamicObject(1237, 1737.13818359, 712.65313721, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(12)
    CreateDynamicObject(1237, 1734.55432129, 710.34515381, 9.82031155, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(13)
    CreateDynamicObject(1237, 1732.11010742, 708.10241699, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(14)
    CreateDynamicObject(1237, 1710.10986328, 733.45690918, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(15)
    CreateDynamicObject(1237, 1695.84558105, 747.66491699, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(16)
    CreateDynamicObject(1237, 1691.97167969, 718.98150635, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(17)
    CreateDynamicObject(1237, 1709.34191895, 707.64923096, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(18)
    CreateDynamicObject(1237, 1680.18212891, 706.91235352, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(19)
    CreateDynamicObject(1237, 1678.88549805, 756.06079102, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(20)
    CreateDynamicObject(1237, 1680.30078125, 757.44464111, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(21)
    CreateDynamicObject(1237, 1681.93725586, 759.27978516, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(22)
    CreateDynamicObject(1237, 1705.25427246, 760.87500000, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(23)
    CreateDynamicObject(1237, 1707.13061523, 758.91204834, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(24)
    CreateDynamicObject(1237, 1709.27697754, 757.36785889, 9.82031441, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(25)
    CreateDynamicObject(1237, 1672.62731934, 718.54089355, 9.82031345, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(26)
    CreateDynamicObject(1237, 1670.54565430, 718.51672363, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(27)
    CreateDynamicObject(1237, 1624.98437500, 718.70092773, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(28)
    CreateDynamicObject(1237, 1617.09729004, 718.66931152, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(29)
    CreateDynamicObject(1237, 1651.55212402, 718.59259033, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(30)
    CreateDynamicObject(1237, 1649.32763672, 686.22595215, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(31)
    CreateDynamicObject(1237, 1647.01000977, 683.94238281, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(32)
    CreateDynamicObject(1237, 1644.34082031, 680.29797363, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(33)
    CreateDynamicObject(1237, 1627.63940430, 679.17346191, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(34)
    CreateDynamicObject(1237, 1624.71362305, 681.57696533, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(35)
    CreateDynamicObject(1237, 1621.60107422, 683.49768066, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(36)
    CreateDynamicObject(1237, 1648.91809082, 706.47406006, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(37)
    CreateDynamicObject(1237, 1621.61352539, 707.12951660, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(38)
    CreateDynamicObject(1237, 1648.25878906, 732.77880859, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(39)
    CreateDynamicObject(1237, 1621.68273926, 734.11608887, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(40)
    CreateDynamicObject(1237, 1625.69360352, 762.99853516, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(41)
    CreateDynamicObject(1237, 1623.74145508, 760.18243408, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(42)
    CreateDynamicObject(1237, 1621.59631348, 757.21350098, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(43)
    CreateDynamicObject(1237, 1643.34704590, 762.05419922, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(44)
    CreateDynamicObject(1237, 1645.41540527, 758.53094482, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(45)
    CreateDynamicObject(1237, 1648.25097656, 755.71209717, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(46)
    CreateDynamicObject(1237, 1634.55212402, 744.38116455, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(47)
    CreateDynamicObject(1237, 1701.79467773, 683.12005615, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(48)
    CreateDynamicObject(1237, 1704.83203125, 684.16790771, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(49)
    CreateDynamicObject(1237, 1704.83203125, 684.16699219, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(50)
    CreateDynamicObject(1237, 1707.66271973, 685.51953125, 9.82031059, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(51)
    CreateDynamicObject(1237, 1709.94714355, 688.09863281, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(52)
    CreateDynamicObject(1237, 1688.37963867, 683.73095703, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(53)
    CreateDynamicObject(1237, 1685.46020508, 684.28125000, 9.82031441, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(54)
    CreateDynamicObject(1237, 1682.39160156, 685.92065430, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(55)
    CreateDynamicObject(1237, 1679.57666016, 688.29522705, 9.82031250, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01)(56)
    CreateDynamicObject(1425, 1589.31701660, 719.63000488, 10.27280998, 0.00000000, 0.00000000, 0.00000000); //object(dyn_roadbarrier_3)(1)
    CreateDynamicObject(1425, 1587.93151855, 719.63885498, 10.27280998, 0.00000000, 0.00000000, 0.00000000); //object(dyn_roadbarrier_3)(2)
    CreateDynamicObject(1425, 1589.33654785, 720.22338867, 10.27280998, 0.00000000, 0.00000000, 181.34996033); //object(dyn_roadbarrier_3)(3)
    CreateDynamicObject(1425, 1587.90991211, 720.17150879, 10.27280998, 0.00000000, 0.00000000, 181.34582520); //object(dyn_roadbarrier_3)(4)
    CreateDynamicObject(3472, 1634.60131836, 718.76843262, 9.97953987, 0.00000000, 0.00000000, 0.00000000); //object(circuslampost03)(1)
    CreateDynamicObject(3472, 1695.74133301, 719.11334229, 9.32815647, 0.00000000, 0.00000000, 0.00000000); //object(circuslampost03)(2)
    CreateDynamicObject(1232, 1634.51037598, 693.16534424, 11.47041130, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(1)
    CreateDynamicObject(1232, 1634.52197266, 744.27838135, 11.70534897, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(2)
    CreateDynamicObject(1232, 1695.85498047, 747.59338379, 11.71399117, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(3)
    CreateDynamicObject(1232, 1695.37976074, 696.21295166, 11.71419907, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(4)
    CreateDynamicObject(1232, 1725.24072266, 718.82977295, 11.46805382, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(5)
    CreateDynamicObject(1232, 1590.66088867, 719.63220215, 11.75154686, 0.00000000, 0.00000000, 0.00000000); //object(streetlamp1)(6)
    CreateDynamicObject(3666, 1648.12927246, 684.97851562, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(1)
    CreateDynamicObject(3666, 1645.47106934, 681.78350830, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(2)
    CreateDynamicObject(3666, 1643.54382324, 678.79760742, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(3)
    CreateDynamicObject(3666, 1626.01806641, 679.95758057, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(4)
    CreateDynamicObject(3666, 1622.83935547, 681.94641113, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(5)
    CreateDynamicObject(3666, 1620.35534668, 683.77825928, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(6)
    CreateDynamicObject(3666, 1629.06689453, 678.42956543, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(7)
    CreateDynamicObject(3666, 1649.96899414, 687.45349121, 10.42871952, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(8)
    CreateDynamicObject(3666, 1649.69909668, 706.07501221, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(9)
    CreateDynamicObject(3666, 1624.57434082, 761.76385498, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(10)
    CreateDynamicObject(3666, 1622.65136719, 758.82641602, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(11)
    CreateDynamicObject(3666, 1620.66931152, 756.30639648, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(12)
    CreateDynamicObject(3666, 1644.42041016, 760.45727539, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(13)
    CreateDynamicObject(3666, 1647.02502441, 757.71795654, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(14)
    CreateDynamicObject(3666, 1648.91638184, 733.41247559, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(15)
    CreateDynamicObject(3666, 1679.53393555, 756.73278809, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(16)
    CreateDynamicObject(3666, 1680.67639160, 758.79522705, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(17)
    CreateDynamicObject(3666, 1682.59143066, 760.16821289, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(18)
    CreateDynamicObject(3666, 1706.10534668, 759.94775391, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(19)
    CreateDynamicObject(3666, 1708.26159668, 758.19244385, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(20)
    CreateDynamicObject(3666, 1710.19555664, 756.63867188, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(21)
    CreateDynamicObject(3666, 1730.37231445, 732.97888184, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(22)
    CreateDynamicObject(3666, 1733.29479980, 730.60314941, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(23)
    CreateDynamicObject(3666, 1736.13806152, 728.65234375, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(24)
    CreateDynamicObject(3666, 1735.98229980, 711.45971680, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(25)
    CreateDynamicObject(3666, 1733.47326660, 709.29211426, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(26)
    CreateDynamicObject(3666, 1709.78588867, 707.14190674, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(27)
    CreateDynamicObject(3666, 1709.09130859, 686.62786865, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(28)
    CreateDynamicObject(3666, 1706.16076660, 684.89672852, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(29)
    CreateDynamicObject(3666, 1703.30688477, 683.64489746, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(30)
    CreateDynamicObject(3666, 1686.78955078, 683.71520996, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(31)
    CreateDynamicObject(3666, 1683.83471680, 684.95275879, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(32)
    CreateDynamicObject(3666, 1681.09729004, 686.95001221, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(33)
    CreateDynamicObject(3666, 1689.70642090, 683.53466797, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(34)
    CreateDynamicObject(3666, 1671.64099121, 718.69293213, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(35)
    CreateDynamicObject(3666, 1620.78295898, 706.84863281, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(36)
    CreateDynamicObject(3666, 1679.30297852, 706.39355469, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(37)
    CreateDynamicObject(3666, 1710.64550781, 733.67669678, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(38)
    CreateDynamicObject(3666, 1621.14428711, 734.50036621, 10.33399773, 0.00000000, 0.00000000, 0.00000000); //object(airuntest_las)(39)
    CreateDynamicObject(1425, 1578.66113281, 718.43945312, 10.26662540, 0.00000000, 0.00000000, 0.00000000); //object(dyn_roadbarrier_3)(5)
    //На аэро сф обьекты
    CreateDynamicObject(18759, -1367.3500, -16.3200, 13.0900, 0.0000, 0.0000, 45.0000);
    CreateDynamicObject(8150, -1361.5400, -180.5500, 16.1000, 0.0000, 0.0000, 45.0000);
    CreateDynamicObject(710, -1317.0900, -135.9000, 23.6800, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(710, -1308.8199, -128.2600, 23.6800, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(8150, -1264.1899, -83.5700, 16.1000, 0.0000, 0.0000, 45.0000);
    CreateDynamicObject(3485, -1277.0400, -117.7800, 20.1400, 0.0000, 0.0000, -45.0000);
    CreateDynamicObject(3485, -1255.7000, -139.0000, 20.1400, 0.0000, 0.0000, -45.0000);
    CreateDynamicObject(3485, -1234.4800, -160.2200, 20.1400, 0.0000, 0.0000, -45.0000);
    CreateDynamicObject(3485, -1213.2700, -181.3900, 20.1400, 0.0000, 0.0000, -45.0000);
    CreateDynamicObject(3485, -1192.0500, -202.7100, 20.1400, 0.0000, 0.0000, -45.0000);
    CreateDynamicObject(3485, -1289.5560, -173.6121, 20.1400, 0.0000, 0.0000, -45.0000);
    CreateDynamicObject(3485, -1268.4301, -194.6600, 20.1400, 0.0000, 0.0000, -45.0000);
    CreateDynamicObject(3485, -1247.1500, -215.9200, 20.1400, 0.0000, 0.0000, -45.0000);
    CreateDynamicObject(3485, -1225.8199, -237.2200, 20.1400, 0.0000, 0.0000, -45.0000);
    //Минигородок
    CreateDynamicObject(3749, -1122.7300, -339.9400, 18.5100, 0.0000, 0.0000, 90.0000);
    CreateDynamicObject(710, -1124.3400, -350.0800, 22.8000, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(710, -1124.4200, -329.5600, 22.8000, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(8071, -1034.7800, -330.1600, 14.1900, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(3485, -1107.2700, -373.2000, 20.0100, 0.0000, 0.0000, -180.0000);
    CreateDynamicObject(3485, -1077.3800, -373.1500, 20.0100, 0.0000, 0.0000, -180.0000);
    CreateDynamicObject(3485, -1017.4000, -373.1500, 20.0100, 0.0000, 0.0000, -180.0000);
    CreateDynamicObject(8071, -1034.8201, -330.1574, 14.1900, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(705, -1002.5900, -332.0500, 12.2400, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(705, -1037.3199, -332.3200, 12.2400, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(705, -1070.9700, -334.2400, 12.2400, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(3487, -989.4000, -289.3200, 19.6300, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(3487, -1010.2200, -289.3600, 19.6300, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(3487, -1030.6200, -289.3600, 19.6300, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(3487, -1051.4000, -289.2700, 19.6300, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(3487, -1072.1801, -289.2900, 19.6300, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(3487, -1093.0400, -289.3600, 19.6300, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(3487, -1113.9600, -289.3700, 19.6300, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(987, -1124.4399, -270.7000, 13.9200, 0.0000, 0.0000, -90.0000);
    CreateDynamicObject(987, -1124.4600, -282.5700, 13.9200, 0.0000, 0.0000, -90.0000);
    CreateDynamicObject(987, -1124.5699, -294.4500, 13.9200, 0.0000, 0.0000, -90.0000);
    CreateDynamicObject(987, -1124.5000, -318.3000, 13.9200, 0.0000, 0.0000, -90.0000);
    CreateDynamicObject(987, -1124.6801, -390.0400, 13.9200, 0.0000, 0.0000, 0.0000);
    CreateDynamicObject(987, -1124.6200, -378.1800, 13.9200, 0.0000, 0.0000, -90.0000);
    CreateDynamicObject(987, -1124.5300, -373.9700, 13.9200, 0.0000, 0.0000, -90.0000);
    CreateDynamicObject(987, -1124.5800, -362.0300, 13.9200, 0.0000, 0.0000, -90.0000);
    CreateDynamicObject(987, -1124.5300, -350.0900, 13.9200, 0.0000, 0.0000, -90.0000);
    CreateDynamicObject(3485, -1047.3300, -373.1600, 20.0100, 0.0000, 0.0000, -180.0000);
    CreateDynamicObject(987, -1124.5699, -306.3900, 13.9200, 0.0000, 0.0000, -90.0000);
    //Спуск
    CreateDynamicObject(2910, 1474.2275390625, 1825.4063720703, 90.577331542969, 20, 0, 0);
    CreateDynamicObject(2910, 1474.2335205078, 1966.0716552734, 141.86236572266, 19.9951171875, 0, 0);
    CreateDynamicObject(2910, 1474.2603759766, 2111.5612792969, 194.85751342773, 19.9951171875, 0, 0);
    CreateDynamicObject(2910, 1474.2542724609, 2256.2697753906, 247.63262939453, 19.9951171875, 0, 0);
    CreateDynamicObject(2910, 1474.1977539063, 2406.0246582031, 302.23260498047, 19.9951171875, 0, 0);
    CreateDynamicObject(3095, 1479.4420166016, 2490.2143554688, 331.45727539063, 0, 0, 0);
    CreateDynamicObject(3095, 1479.4364013672, 2499.16796875, 331.45727539063, 0, 0, 0);
    CreateDynamicObject(3095, 1479.4475097656, 2508.1694335938, 331.45727539063, 0, 0, 0);
    CreateDynamicObject(3095, 1470.4450683594, 2508.1403808594, 331.45727539063, 0, 0, 0);
    CreateDynamicObject(3095, 1470.4792480469, 2499.134765625, 331.45727539063, 0, 0, 0);
    CreateDynamicObject(3095, 1470.4210205078, 2490.2094726563, 331.45727539063, 0, 0, 0);
    CreateDynamicObject(3095, 1483.94140625, 2490.1655273438, 331.45727539063, 0, 270.50006103516, 0);
    CreateDynamicObject(3095, 1483.9774169922, 2499.1440429688, 331.45727539063, 0, 270.49987792969, 0);
    CreateDynamicObject(3095, 1483.9632568359, 2508.1611328125, 331.45727539063, 0, 270.49987792969, 0);
    CreateDynamicObject(3095, 1466.0606689453, 2499.3061523438, 331.45727539063, 0, 270.50006103516, 180);
    CreateDynamicObject(3095, 1466.0345458984, 2490.3049316406, 331.45727539063, 0, 270.49987792969, 179.99450683594);
    CreateDynamicObject(3095, 1466.0561523438, 2508.3405761719, 331.45727539063, 0, 270.49987792969, 179.99450683594);
    CreateDynamicObject(3095, 1470.3599853516, 2512.6625976563, 331.45727539063, 0, 270.50006103516, 89.494506835938);
    CreateDynamicObject(3095, 1479.3314208984, 2512.6171875, 331.45727539063, 0, 270.50006103516, 89.989379882813);
    CreateVehicle(522, 1469.2073974609, 2510.8979492188, 332.67300415039, 0, -1, -1, 60000);
    CreateVehicle(522, 1470.7322998047, 2510.9123535156, 332.67300415039, 0, -1, -1, 60000);
    CreateVehicle(522, 1472.4564208984, 2510.9289550781, 332.67300415039, 0, -1, -1, 60000);
    CreateVehicle(522, 1474.2561035156, 2510.9462890625, 332.67300415039, 0, -1, -1, 60000);
    CreateVehicle(522, 1476.0308837891, 2510.9636230469, 332.67300415039, 0, -1, -1, 60000);
    CreateVehicle(522, 1477.8303222656, 2510.98046875, 332.67300415039, 0, -1, -1, 60000);
    CreateVehicle(522, 1479.7048339844, 2510.9985351563, 332.67300415039, 0, -1, -1, 60000);
    CreateVehicle(522, 1481.1796875, 2511.0122070313, 332.67300415039, 0, -1, -1, 60000);
    CreateDynamicObject(16084, 1474.1827392578, 1746.8643798828, 63.084289550781, 357.34997558594, 344.48303222656, 284.51452636719);
    CreateDynamicObject(13593, 1477.6427001953, 1759.5570068359, 66.663963317871, 346.25012207031, 0.25738525390625, 180.06117248535);
    CreateDynamicObject(13593, 1475.443359375, 1759.4892578125, 66.663963317871, 346.2451171875, 0.252685546875, 180.06042480469);
    CreateDynamicObject(13593, 1472.6431884766, 1759.4046630859, 66.663963317871, 346.2451171875, 0.252685546875, 180.06042480469);
    CreateDynamicObject(13593, 1470.2678222656, 1759.3321533203, 66.663963317871, 346.2451171875, 0.252685546875, 180.06042480469);
    CreateDynamicObject(1634, 1473.8334960938, 1729.9375, 76.933059692383, 17.499816894531, 359.73785400391, 181.32888793945);
    CreateDynamicObject(1634, 1473.9798583984, 1726.5905761719, 80.933059692383, 37.495483398438, 359.68304443359, 181.43746948242);



    ///////////ВИП ЗОНА ЛОД//////////////////////////////////////////
    CreateDynamicObject(6189, 836.44, -2134.10, -2.64, 0.00, 0.00, 0.00);
    CreateDynamicObject(6189, 836.47, -2264.73, -2.64, 0.00, 0.00, 0.00);
    CreateDynamicObject(6189, 836.42, -2395.36, -2.64, 0.00, 0.00, 0.00);
    CreateDynamicObject(6189, 836.41, -2526.04, -2.64, 0.00, 0.00, 0.00);
    CreateDynamicObject(6189, 836.44, -2656.52, -2.64, 0.00, 0.00, 0.00);
    CreateDynamicObject(8071, 904.15, -2780.05, 13.02, 0.00, 0.00, 0.00);
    CreateDynamicObject(8071, 754.45, -2857.21, 13.02, 0.00, 0.00, -90.00);
    CreateDynamicObject(3749, 847.02, -2722.19, 17.43, 0.00, 0.00, 0.00);
    CreateDynamicObject(3749, 827.57, -2722.22, 17.43, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 814.85, -2721.95, 12.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 816.66, -2721.84, 12.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(8150, 920.55, -2720.39, 16.25, 0.00, 0.00, 0.00);
    CreateDynamicObject(8150, 931.48, -2839.53, 16.25, 0.00, 0.00, -180.00);
    CreateDynamicObject(8150, 814.17, -2884.11, 16.25, 0.00, 0.00, -90.00);
    CreateDynamicObject(8210, 842.07, -2839.68, 16.13, 0.00, 0.00, 0.00);
    CreateDynamicObject(8210, 993.92, -2812.34, 16.13, 0.00, 0.00, 90.00);
    CreateDynamicObject(8210, 994.00, -2756.86, 16.13, 0.00, 0.00, 90.00);
    CreateDynamicObject(8210, 994.04, -2747.73, 16.13, 0.00, 0.00, 90.00);
    CreateDynamicObject(8210, 966.47, -2720.25, 16.13, 0.00, 0.00, -180.00);
    CreateDynamicObject(8210, 814.69, -2747.58, 16.13, 0.00, 0.00, -90.00);
    CreateDynamicObject(8210, 786.63, -2767.54, 16.13, 0.00, 0.00, -180.00);
    CreateDynamicObject(8210, 740.58, -2767.51, 16.13, 0.00, 0.00, -180.00);
    CreateDynamicObject(8210, 722.42, -2767.52, 16.13, 0.00, 0.00, -180.00);
    CreateDynamicObject(8210, 694.74, -2795.03, 16.13, 0.00, 0.00, -90.00);
    CreateDynamicObject(8210, 694.71, -2850.64, 16.13, 0.00, 0.00, -90.00);
    CreateDynamicObject(8210, 694.70, -2903.86, 16.13, 0.00, 0.00, -90.00);
    CreateDynamicObject(8210, 694.66, -2919.17, 16.13, 0.00, 0.00, -90.00);
    CreateDynamicObject(3487, 803.81, -2929.94, 18.55, 0.00, 0.00, -180.00);
    CreateDynamicObject(3487, 783.25, -2929.98, 18.55, 0.00, 0.00, -180.00);
    CreateDynamicObject(3487, 736.86, -2927.90, 18.55, 0.00, 0.00, -180.00);
    CreateDynamicObject(3501, 711.24, -2885.38, 15.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(3501, 711.30, -2834.97, 15.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(3521, 815.56, -2803.45, 13.43, 0.00, 0.00, -90.00);
    CreateDynamicObject(3603, 766.17, -2875.63, 17.73, 0.00, 0.00, 90.00);
    CreateDynamicObject(3603, 766.35, -2837.26, 17.73, 0.00, 0.00, 90.00);
    CreateDynamicObject(3606, 808.45, -2808.98, 15.06, 0.00, 0.00, -90.00);
    CreateDynamicObject(3606, 808.44, -2827.25, 15.06, 0.00, 0.00, -90.00);
    CreateDynamicObject(3606, 808.36, -2845.62, 15.06, 0.00, 0.00, -90.00);
    CreateDynamicObject(3617, 809.06, -2868.26, 14.29, 0.00, 0.00, -90.00);
    CreateDynamicObject(3617, 807.91, -2886.04, 14.29, 0.00, 0.00, -90.00);
    CreateDynamicObject(3619, 853.70, -2766.52, 15.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(3619, 885.00, -2766.49, 15.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(3619, 951.06, -2797.51, 15.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(3619, 919.79, -2797.58, 15.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, 921.30, -2797.00, 13.66, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, 946.60, -2813.40, 13.66, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, 869.50, -2771.62, 13.66, 0.00, 0.00, 0.00);
    CreateDynamicObject(3715, 814.89, -2790.19, 20.76, 0.00, 0.00, 90.00);
    CreateDynamicObject(3984, 718.94, -2975.53, 23.84, 0.00, 0.00, 90.00);
    CreateDynamicObject(19070, 765.89, -2977.05, 6.77, 0.00, 0.00, 0.00);
    CreateDynamicObject(19070, 795.92, -2977.80, 6.77, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 712.12, -2966.00, 14.61, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 696.96, -2951.39, 13.29, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 723.63, -2996.68, 14.65, 0.00, 0.00, 0.00);
    CreateDynamicObject(19076, 747.93, -2981.28, 14.30, 0.00, 0.00, 0.00);
    CreateDynamicObject(7419, 950.57, -2748.76, 5.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(3619, 878.27, -2726.44, 15.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, 863.34, -2738.77, 13.66, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, 892.46, -2739.09, 13.66, 0.00, 0.00, 90.00);
    CreateDynamicObject(3485, 831.06, -2822.61, 18.92, 0.00, 0.00, 180.00);
    CreateDynamicObject(3485, 861.10, -2822.60, 18.92, 0.00, 0.00, 180.00);
    CreateDynamicObject(3446, 885.47, -2825.55, 15.33, 0.00, 0.00, -180.00);
    CreateDynamicObject(3446, 903.73, -2825.50, 15.37, 0.00, 0.00, -180.00);
    CreateDynamicObject(3446, 922.13, -2825.53, 15.37, 0.00, 0.00, -180.00);
    CreateDynamicObject(3619, 978.33, -2797.47, 15.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, 973.97, -2813.34, 13.66, 0.00, 0.00, 90.00);
    CreateDynamicObject(970, 973.19, -2805.53, 12.37, 0.00, 0.00, 90.00);
    CreateDynamicObject(970, 973.18, -2809.64, 12.37, 0.00, 0.00, 90.00);
    CreateDynamicObject(970, 973.24, -2813.76, 12.37, 0.00, 0.00, 90.00);
    CreateDynamicObject(970, 973.25, -2817.88, 12.37, 0.00, 0.00, 90.00);
    CreateDynamicObject(970, 973.23, -2821.11, 12.37, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 976.41, -2823.16, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 984.50, -2823.13, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 970.01, -2823.14, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 958.66, -2823.19, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 949.22, -2823.16, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 931.34, -2814.27, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 931.37, -2820.63, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 931.36, -2827.01, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 931.33, -2833.43, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 925.70, -2814.31, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 945.99, -2819.95, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 945.99, -2813.57, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 945.97, -2807.16, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 894.69, -2809.49, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 862.68, -2745.30, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 862.70, -2738.93, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 862.67, -2732.57, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 893.63, -2745.63, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 893.62, -2739.19, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 893.61, -2732.81, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 890.39, -2748.83, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 881.21, -2748.79, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 865.87, -2748.55, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, 852.90, -2727.42, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 852.92, -2733.82, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 852.94, -2740.20, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 852.94, -2745.03, 12.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 856.12, -2748.24, 12.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(3466, 733.66, -2782.30, 14.41, 0.00, 0.00, 90.00);
    CreateDynamicObject(3466, 707.30, -2782.23, 14.41, 0.00, 0.00, 90.00);
    CreateDynamicObject(3466, 759.83, -2782.44, 14.41, 0.00, 0.00, 90.00);
    CreateDynamicObject(3460, 737.97, -2795.38, 15.83, 0.00, 0.00, 0.00);
    CreateDynamicObject(3460, 711.73, -2795.31, 15.83, 0.00, 0.00, 0.00);
    CreateDynamicObject(3460, 763.99, -2795.55, 15.83, 0.00, 0.00, 0.00);
    CreateDynamicObject(2745, 764.47, -2788.39, 13.51, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 777.00, -2815.44, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 802.15, -2801.04, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 811.63, -2779.05, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 803.84, -2779.48, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 795.74, -2779.14, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 787.72, -2779.12, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 779.15, -2779.17, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 801.97, -2812.70, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 802.06, -2831.12, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, 802.08, -2849.57, 11.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(717, 764.16, -2856.61, 12.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(717, 780.00, -2834.60, 12.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(717, 780.00, -2834.60, 12.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(717, 779.73, -2872.94, 12.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(717, 779.69, -2878.33, 12.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(726, 793.56, -2919.70, 11.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(768, 808.25, -2903.00, 11.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(768, 763.07, -2938.87, 11.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(768, 726.74, -2910.83, 11.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(768, 724.81, -2860.23, 11.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 698.78, -2796.53, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 703.03, -2796.43, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 707.94, -2796.57, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 722.84, -2796.53, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 728.53, -2796.37, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 734.40, -2796.94, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 749.46, -2796.71, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 755.44, -2796.55, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(779, 761.68, -2797.24, 11.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(776, 752.38, -2829.14, 11.51, 0.00, 0.00, -258.00);
    CreateDynamicObject(776, 751.91, -2846.07, 11.51, 0.00, 0.00, -47.00);
    CreateDynamicObject(776, 751.92, -2883.73, 11.51, 0.00, 0.00, -47.00);
    CreateDynamicObject(776, 751.84, -2867.39, 11.51, 0.00, 0.00, 105.00);
    CreateDynamicObject(700, 839.44, -2773.86, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 839.44, -2777.86, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 839.43, -2781.94, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 839.06, -2804.08, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 839.03, -2799.82, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 839.12, -2795.41, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 856.98, -2808.41, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 874.15, -2807.89, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 911.09, -2812.38, 11.91, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 898.25, -2792.50, 11.93, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 879.17, -2773.65, 11.93, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 859.31, -2774.27, 11.93, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, 890.28, -2773.64, 11.93, 0.00, 0.00, 0.00);
    CreateDynamicObject(19129, 707.92, -2970.17, 14.04, 0.00, 0.00, 0.00);
    CreateDynamicObject(19129, 727.83, -2970.19, 14.04, 0.00, 0.00, 0.00);
    CreateDynamicObject(19129, 707.93, -2990.13, 14.04, 0.00, 0.00, 0.00);
    CreateDynamicObject(14537, 722.80, -2984.94, 15.85, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 713.86, -2987.45, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 715.17, -2993.53, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 710.76, -2995.82, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 708.86, -2989.74, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 704.16, -2995.43, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 701.34, -2989.63, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 704.90, -2983.33, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 710.19, -2981.31, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1679, 700.95, -2980.88, 14.57, 0.00, 0.00, 0.00);
    CreateDynamicObject(1597, 697.53, -2995.60, 16.59, 0.00, 0.00, 0.00);
    CreateDynamicObject(1597, 697.46, -2982.12, 16.59, 0.00, 0.00, 0.00);
    CreateDynamicObject(1597, 694.71, -2958.53, 15.66, 0.00, 0.00, 0.00);
    CreateDynamicObject(1597, 694.78, -2969.21, 15.66, 0.00, 0.00, 0.00);
    CreateDynamicObject(14838, 711.55, -2981.00, 10.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(14833, 711.54, -2981.08, 10.67, 0.00, 0.00, 0.00);
    CreateDynamicObject(2748, 706.38, -2976.15, 9.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(2748, 707.94, -2976.15, 9.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(2764, 707.08, -2977.77, 9.65, 0.00, 0.00, 0.00);
    CreateDynamicObject(2748, 709.71, -2973.07, 9.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(2764, 709.50, -2974.54, 9.65, 0.00, 0.00, 0.00);
    CreateDynamicObject(2644, 701.91, -2984.02, 9.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(2644, 701.91, -2983.05, 9.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(2644, 701.90, -2982.06, 9.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(2644, 701.90, -2981.04, 9.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(2644, 701.90, -2980.03, 9.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(2644, 701.90, -2979.04, 9.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(2811, 702.58, -2976.23, 9.14, 0.00, 0.00, 0.00);
    CreateDynamicObject(2811, 705.14, -2976.14, 9.14, 0.00, 0.00, 0.00);
    CreateDynamicObject(2764, 701.43, -2970.68, 9.65, 0.00, 0.00, 0.00);
    CreateDynamicObject(1723, 718.21, -2969.29, 9.22, 0.00, 0.00, 0.00);
    CreateDynamicObject(1723, 721.53, -2970.78, 9.22, 0.00, 0.00, -90.00);
    CreateDynamicObject(1723, 720.58, -2974.24, 9.22, 0.00, 0.00, -180.00);
    CreateDynamicObject(2811, 717.27, -2969.20, 9.14, 0.00, 0.00, 0.00);
    CreateDynamicObject(2811, 721.38, -2969.65, 9.14, 0.00, 0.00, 0.00);
    CreateDynamicObject(2811, 721.64, -2973.93, 9.14, 0.00, 0.00, 0.00);
    CreateDynamicObject(1775, 713.49, -2973.53, 10.31, 0.00, 0.00, 90.00);
    CreateDynamicObject(1775, 713.55, -2969.96, 10.31, 0.00, 0.00, 90.00);
    CreateDynamicObject(1827, 719.43, -2971.80, 9.20, 0.00, 0.00, 0.00);
    CreateDynamicObject(1836, 715.48, -2968.94, 9.92, 0.00, 0.00, 0.00);
    CreateDynamicObject(1954, 719.14, -2971.77, 9.72, 0.00, 0.00, 0.00);
    CreateDynamicObject(1970, 721.88, -2976.70, 9.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(1970, 719.49, -2976.67, 9.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(2001, 722.86, -2979.55, 9.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(2001, 720.94, -2982.55, 9.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(2001, 715.22, -2982.58, 9.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(2001, 713.27, -2980.65, 9.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(2001, 710.97, -2982.83, 9.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(2001, 712.77, -2984.76, 9.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(2001, 712.77, -2987.83, 9.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(1963, 714.28, -2986.09, 9.96, 0.00, 0.00, -90.00);
    CreateDynamicObject(1958, 714.52, -2986.59, 10.36, 0.00, 0.00, -273.00);
    CreateDynamicObject(1958, 714.51, -2985.21, 10.36, 0.00, 0.00, -273.00);
    CreateDynamicObject(1957, 714.51, -2985.90, 10.44, 0.00, 0.00, 0.00);
    CreateDynamicObject(1839, 714.02, -2986.92, 10.32, 0.00, 0.00, -156.00);
    CreateDynamicObject(1840, 712.17, -2982.78, 9.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 712.17, -2982.78, 10.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 712.17, -2982.78, 10.55, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 712.17, -2982.78, 11.01, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 721.75, -2980.32, 9.71, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 721.75, -2980.32, 10.14, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 721.75, -2980.32, 10.60, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 721.75, -2980.32, 11.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 721.75, -2991.00, 9.71, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 721.75, -2991.00, 10.19, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 721.75, -2991.00, 10.64, 0.00, 0.00, 0.00);
    CreateDynamicObject(1840, 721.75, -2991.00, 11.10, 0.00, 0.00, 0.00);
    CreateDynamicObject(1753, 722.60, -2992.96, 9.14, 0.00, 0.00, -90.00);
    CreateDynamicObject(1753, 721.70, -2995.51, 9.14, 0.00, 0.00, -180.00);
    CreateDynamicObject(1753, 717.73, -2995.32, 9.14, 0.00, 0.00, -180.00);
    CreateDynamicObject(1753, 714.92, -2995.30, 9.14, 0.00, 0.00, -180.00);
    CreateDynamicObject(1753, 712.12, -2995.31, 9.14, 0.00, 0.00, -180.00);
    CreateDynamicObject(2001, 709.39, -2995.16, 9.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(1753, 709.46, -2994.56, 9.14, 0.00, 0.00, 90.00);
    CreateDynamicObject(2229, 708.42, -2992.68, 9.22, 0.00, 0.00, -180.00);
    CreateDynamicObject(2229, 708.42, -2992.68, 10.60, 0.00, 0.00, -180.00);
    CreateDynamicObject(2229, 704.97, -2992.73, 9.22, 0.00, 0.00, -180.00);
    CreateDynamicObject(2229, 704.97, -2992.73, 10.61, 0.00, 0.00, -180.00);
    CreateDynamicObject(2571, 708.62, -2991.64, 9.25, 0.00, 0.00, 180.00);
    CreateDynamicObject(18649, 709.07, -2986.70, 9.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(18649, 709.08, -2984.76, 9.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(18649, 709.06, -2983.75, 9.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(18649, 716.26, -2982.75, 9.78, 0.00, 0.00, 90.00);
    CreateDynamicObject(18649, 718.26, -2982.75, 9.78, 0.00, 0.00, 90.00);
    CreateDynamicObject(18649, 720.24, -2982.75, 9.78, 0.00, 0.00, 90.00);
    CreateDynamicObject(18649, 721.08, -2981.24, 9.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(18649, 723.05, -2978.74, 9.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 718.31, -2976.70, 9.79, 0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 711.04, -2974.03, 9.79, 0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 709.07, -2974.23, 9.79, 0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 707.58, -2982.72, 9.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 707.13, -2992.63, 11.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 710.24, -2995.72, 11.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 712.17, -2995.72, 11.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 714.13, -2995.71, 11.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 716.03, -2995.70, 11.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 716.03, -2995.70, 11.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 713.05, -2986.20, 9.79, 0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 714.17, -2987.76, 9.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 716.19, -2987.77, 9.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 718.16, -2987.77, 9.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 720.15, -2987.77, 9.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(18651, 721.07, -2988.71, 9.79, 0.00, 0.00, 0.00);
    CreateDynamicObject(18651, 721.05, -2990.68, 9.79, 0.00, 0.00, 0.00);
    CreateDynamicObject(18654, 723.68, -2988.42, 9.03, 0.00, 0.00, 0.00);
    CreateDynamicObject(18654, 723.56, -2985.96, 9.03, 0.00, 0.00, 0.00);
    CreateDynamicObject(18654, 723.56, -2983.23, 9.03, 0.00, 0.00, 0.00);
    CreateDynamicObject(14781, 747.62, -2968.15, 14.97, 0.00, 0.00, 0.00);
    CreateDynamicObject(14781, 747.63, -2955.39, 14.97, 0.00, 0.00, 0.00);
    ///АВТО//////////////////
    CreateVehicle(400, 865.5699, -2735.9307, 14.5765, 0.0000, -1, -1, 100);
    CreateVehicle(400, 869.0910, -2736.2280, 14.5765, 0.0000, -1, -1, 100);
    CreateVehicle(479, 855.9425, -2727.9194, 12.7488, 69.0000, -1, -1, 100);
    CreateVehicle(479, 856.0385, -2732.6780, 12.7488, 69.0000, -1, -1, 100);
    CreateVehicle(579, 854.2880, -2744.4363, 13.1504, 0.0000, -1, -1, 100);
    CreateVehicle(579, 845.3723, -2758.5134, 12.9000, 0.0000, -1, -1, 100);
    CreateVehicle(401, 876.8520, -2759.2148, 12.6958, 0.0000, -1, -1, 100);
    CreateVehicle(602, 872.9269, -2759.2813, 12.6002, 0.0000, -1, -1, 100);
    CreateVehicle(602, 886.9573, -2735.5984, 12.6002, 0.0000, -1, -1, 100);
    CreateVehicle(527, 841.1041, -2759.1814, 12.7228, 0.0000, -1, -1, 100);
    CreateVehicle(589, 821.7169, -2813.3506, 12.6973, 0.0000, -1, -1, 100);
    CreateVehicle(589, 842.9001, -2776.3789, 12.6973, 0.0000, -1, -1, 100);
    CreateVehicle(589, 846.4770, -2776.2971, 12.6973, 0.0000, -1, -1, 100);
    CreateVehicle(526, 852.0211, -2809.7100, 13.3339, 0.0000, -1, -1, 100);
    CreateVehicle(410, 844.7668, -2799.3811, 13.6484, 0.0000, -1, -1, 100);
    CreateVehicle(445, 862.2007, -2778.5391, 12.7931, 0.0000, -1, -1, 100);
    CreateVehicle(445, 866.3113, -2778.5637, 12.7931, 0.0000, -1, -1, 100);
    CreateVehicle(445, 870.7703, -2778.3374, 12.7931, 0.0000, -1, -1, 100);
    CreateVehicle(445, 875.2233, -2778.3501, 12.7931, 0.0000, -1, -1, 100);
    CreateVehicle(587, 883.6356, -2809.5464, 13.5887, 0.0000, -1, -1, 100);
    CreateVehicle(587, 940.8885, -2805.5349, 12.5615, 0.0000, -1, -1, 100);
    CreateVehicle(587, 944.3192, -2805.4307, 12.5615, 0.0000, -1, -1, 100);
    CreateVehicle(402, 958.5659, -2805.2722, 12.6771, 0.0000, -1, -1, 100);
    CreateVehicle(402, 962.9763, -2805.3994, 12.6771, 0.0000, -1, -1, 100);
    CreateVehicle(603, 969.5441, -2810.8796, 12.6431, 156.0000, -1, -1, 100);
    CreateVehicle(603, 970.7474, -2816.9624, 12.6431, 156.0000, -1, -1, 100);
    CreateVehicle(562, 985.6310, -2806.9338, 12.5359, 0.0000, -1, -1, 100);
    CreateVehicle(562, 989.5613, -2807.2896, 12.5359, 0.0000, -1, -1, 100);
    CreateVehicle(477, 977.4368, -2818.6223, 12.5745, 0.0000, -1, -1, 100);
    CreateVehicle(562, 769.5858, -2782.2983, 13.1663, 0.0000, -1, -1, 100);
    CreateVehicle(562, 743.3359, -2783.0923, 13.1663, 0.0000, -1, -1, 100);
    CreateVehicle(562, 717.0576, -2782.9060, 13.1663, 0.0000, -1, -1, 100);
    CreateVehicle(559, 729.7277, -2813.2029, 12.4689, 50.0000, -1, -1, 100);
    CreateVehicle(559, 729.5196, -2819.5112, 12.4689, 50.0000, -1, -1, 100);
    CreateVehicle(559, 729.2813, -2826.6650, 12.4689, 50.0000, -1, -1, 100);
    CreateVehicle(559, 729.2019, -2835.0408, 12.4689, 50.0000, -1, -1, 100);
    CreateVehicle(559, 729.6039, -2844.7295, 12.4689, 50.0000, -1, -1, 100);
    CreateVehicle(560, 728.1085, -2870.4436, 12.4216, 0.0000, -1, -1, 100);
    CreateVehicle(560, 728.0546, -2880.6350, 12.4216, 0.0000, -1, -1, 100);
    CreateVehicle(560, 727.6211, -2896.4905, 12.4216, 0.0000, -1, -1, 100);
    CreateVehicle(560, 727.6260, -2905.1187, 12.4216, 0.0000, -1, -1, 100);
    CreateVehicle(560, 727.5815, -2888.5952, 12.4216, 0.0000, -1, -1, 100);
    CreateVehicle(558, 737.3228, -2913.5115, 12.5827, 0.0000, -1, -1, 100);
    CreateVehicle(560, 732.4254, -2913.3823, 12.5612, 0.0000, -1, -1, 100);
    CreateVehicle(522, 754.4587, -2891.7402, 13.1963, 0.0000, -1, -1, 100);
    CreateVehicle(522, 756.5500, -2891.7332, 13.1963, 0.0000, -1, -1, 100);
    CreateVehicle(522, 779.0050, -2913.3335, 13.1963, 0.0000, -1, -1, 100);
    CreateVehicle(522, 799.4280, -2915.1138, 12.4423, 0.0000, -1, -1, 100);
    CreateVehicle(409, 779.2827, -2885.1733, 12.7835, 0.0000, -1, -1, 100);
    CreateVehicle(409, 779.7345, -2849.6514, 12.7835, 0.0000, -1, -1, 100);
    CreateVehicle(562, 804.2656, -2915.3745, 12.5516, 0.0000, -1, -1, 100);
    CreateVehicle(562, 783.3826, -2915.5366, 12.5516, 0.0000, -1, -1, 100);
    CreateVehicle(562, 801.4083, -2892.7666, 12.5516, 0.0000, -1, -1, 100);
    CreateVehicle(562, 800.6283, -2878.3245, 12.5516, 0.0000, -1, -1, 100);
    CreateVehicle(562, 800.6124, -2865.8516, 12.5516, 0.0000, -1, -1, 100);
    CreateVehicle(561, 799.1738, -2853.3259, 12.9101, -62.0000, -1, -1, 100);
    CreateVehicle(561, 799.7791, -2840.6035, 12.9101, -62.0000, -1, -1, 100);
    CreateVehicle(561, 799.4604, -2835.1306, 12.9101, -62.0000, -1, -1, 100);
    CreateVehicle(561, 799.5847, -2817.4524, 12.9101, -62.0000, -1, -1, 100);
    CreateVehicle(561, 799.5088, -2822.4390, 12.9101, -62.0000, -1, -1, 100);
    CreateVehicle(561, 781.6810, -2830.0867, 12.9101, -62.0000, -1, -1, 100);
    CreateVehicle(487, 759.7026, -2922.5205, 12.9810, 0.0000, -1, -1, 100);
    CreateVehicle(487, 711.1151, -2925.3833, 12.9810, 0.0000, -1, -1, 100);
    CreateVehicle(546, 950.5518, -2732.9551, 28.4324, 0.0000, -1, -1, 100);
    CreateVehicle(546, 957.3223, -2732.9236, 28.4324, 0.0000, -1, -1, 100);
    CreateVehicle(547, 945.3927, -2740.5715, 28.7751, 90.0000, -1, -1, 100);
    CreateVehicle(547, 945.0157, -2745.7483, 28.7751, 90.0000, -1, -1, 100);
    CreateVehicle(547, 945.3527, -2751.7483, 28.7751, 90.0000, -1, -1, 100);
    CreateVehicle(550, 981.7454, -2748.2874, 25.3412, 90.0000, -1, -1, 100);
    CreateVehicle(550, 982.7046, -2740.4587, 25.3412, 90.0000, -1, -1, 100);
    CreateVehicle(550, 954.4281, -2731.6765, 21.4442, 0.0000, -1, -1, 100);
    CreateVehicle(542, 960.0275, -2732.8455, 21.3958, 0.0000, -1, -1, 100);
    CreateVehicle(542, 964.6686, -2733.0015, 20.5002, 0.0000, -1, -1, 100);
    CreateVehicle(565, 982.9957, -2737.9038, 19.4574, 90.0000, -1, -1, 100);
    CreateVehicle(565, 982.5782, -2742.9619, 19.4574, 90.0000, -1, -1, 100);
    CreateVehicle(565, 982.6535, -2747.4021, 19.4574, 90.0000, -1, -1, 100);
    //Клуб джиззи на драг 1
    CreateDynamicObject(9582, -1687.15, -308.59, 21.85, 0.00, 0.00, 135.00);
    CreateDynamicObject(1501, -1711.73, -288.36, 13.05, 0.00, 0.00, -210.00);
    CreateDynamicObject(12950, -1700.21, -281.86, 14.24, 0.00, 0.00, -120.00);
    CreateDynamicObject(12950, -1694.72, -285.04, 18.98, 0.00, 0.00, -120.00);
    CreateDynamicObject(12950, -1689.29, -288.16, 23.82, 0.00, 0.00, -120.00);
    CreateDynamicObject(983, -1682.41, -292.86, 27.05, 0.00, 90.00, 62.00);
    CreateDynamicObject(983, -1681.83, -291.77, 27.05, 0.00, 90.00, 62.00);
    CreateDynamicObject(983, -1681.60, -291.31, 27.67, 0.00, 0.00, 62.00);
    CreateDynamicObject(983, -1680.38, -295.56, 27.67, 0.00, 0.00, -30.00);
    CreateDynamicObject(710, -1703.61, -276.03, 26.82, 0.00, 0.00, 0.00);
    CreateDynamicObject(710, -1709.94, -269.68, 26.82, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1700.61, -278.75, 13.77, 0.00, 0.00, 45.00);
    CreateDynamicObject(983, -1696.08, -283.26, 13.77, 0.00, 0.00, 45.00);
    CreateDynamicObject(983, -1691.58, -287.82, 13.77, 0.00, 0.00, 45.00);
    CreateDynamicObject(983, -1712.24, -267.08, 13.77, 0.00, 0.00, 45.00);
    CreateDynamicObject(983, -1716.77, -262.55, 13.77, 0.00, 0.00, 45.00);
    CreateDynamicObject(983, -1720.13, -259.18, 13.77, 0.00, 0.00, 45.00);
    CreateDynamicObject(983, -1722.39, -260.11, 13.77, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1722.38, -266.47, 13.77, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1722.37, -272.83, 13.77, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1722.36, -279.21, 13.77, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1722.34, -285.56, 13.77, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1722.37, -291.89, 13.77, 0.00, 0.00, 0.00);
    CreateDynamicObject(1501, -1705.52, -286.70, 13.05, 0.00, 0.00, -155.00);
    CreateDynamicObject(1501, -1702.72, -285.37, 13.05, 0.00, 0.00, -155.00);
    CreateDynamicObject(19071, -1678.98, -295.74, 0.49, 90.00, 0.00, 150.00);
    CreateDynamicObject(18649, -1664.13, -299.96, 13.33, 0.00, 0.00, 62.00);
    CreateDynamicObject(18649, -1673.07, -294.81, 13.33, 0.00, 0.00, 62.00);
    CreateDynamicObject(18649, -1681.80, -290.35, 13.33, 0.00, 0.00, 62.00);
    CreateDynamicObject(18649, -1690.77, -285.82, 13.33, 0.00, 0.00, 62.00);
    CreateDynamicObject(18751, -1179.77, -46.53, 4.78, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -1132.53, 4.57, 4.78, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -1119.99, -104.65, 4.78, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -1060.29, -25.66, 4.78, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -1044.54, -153.30, 4.78, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -986.88, -87.81, 4.78, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -933.98, -1.02, 7.74, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -994.90, 51.03, 7.74, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -1052.69, 69.68, 7.74, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -990.41, 138.73, 7.74, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -894.43, 103.80, 7.74, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -876.30, 196.98, 7.74, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -958.74, 241.17, 7.74, 0.00, 0.00, -40.00);
    CreateDynamicObject(18751, -865.02, 284.37, 7.74, 0.00, 0.00, -40.00);
    //////////////////ЗОНА ДОМОВ///////////////////////////////////////////
    CreateDynamicObject(3583, -1110.08, -1242.97, 131.16, 0.00, 0.00, 0.00);
    CreateDynamicObject(3583, -1110.21, -1224.51, 131.16, 0.00, 0.00, 0.00);
    CreateDynamicObject(3601, -1128.84, -1213.08, 135.99, 0.00, 0.00, 180.00);
    CreateDynamicObject(3601, -1142.38, -1213.07, 135.99, 0.00, 0.00, 180.00);
    CreateDynamicObject(3601, -1156.12, -1213.05, 135.99, 0.00, 0.00, 180.00);
    CreateDynamicObject(3601, -1169.90, -1213.02, 135.99, 0.00, 0.00, 180.00);
    CreateDynamicObject(3601, -1183.58, -1213.05, 135.99, 0.00, 0.00, 180.00);
    CreateDynamicObject(3601, -1197.24, -1213.01, 135.99, 0.00, 0.00, 180.00);
    CreateDynamicObject(3715, -1047.11, -1313.41, 137.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(3825, -1127.92, -1181.57, 132.75, 0.00, 0.00, 90.00);
    CreateDynamicObject(3825, -1136.38, -1181.60, 132.73, 0.00, 0.00, 90.00);
    CreateDynamicObject(3825, -1144.91, -1181.62, 132.73, 0.00, 0.00, 90.00);
    CreateDynamicObject(3825, -1153.46, -1181.59, 132.73, 0.00, 0.00, 90.00);
    CreateDynamicObject(3825, -1162.01, -1181.57, 132.73, 0.00, 0.00, 90.00);
    CreateDynamicObject(3825, -1170.46, -1181.56, 132.73, 0.00, 0.00, 90.00);
    CreateDynamicObject(3601, -1182.05, -1181.78, 135.67, 0.00, 0.00, -90.00);
    CreateDynamicObject(983, -1166.19, -1172.67, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1174.46, -1172.68, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1171.23, -1169.50, 128.78, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1157.71, -1172.70, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1160.07, -1172.67, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1149.22, -1172.71, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1151.51, -1172.68, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1143.01, -1172.69, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1140.66, -1172.69, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1134.43, -1172.71, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1132.27, -1172.65, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1125.97, -1172.66, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1123.67, -1172.66, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(3580, -1098.09, -1159.12, 132.65, 0.00, 0.00, 90.00);
    CreateDynamicObject(3580, -1098.05, -1171.29, 132.65, 0.00, 0.00, 90.00);
    CreateDynamicObject(3580, -1098.02, -1183.35, 132.65, 0.00, 0.00, 90.00);
    CreateDynamicObject(3580, -1098.01, -1195.49, 132.65, 0.00, 0.00, 90.00);
    CreateDynamicObject(986, -1123.59, -1204.14, 129.12, 0.00, 0.00, -90.00);
    CreateDynamicObject(986, -1123.84, -1189.37, 129.12, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1132.16, -1189.41, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1140.61, -1189.39, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1149.22, -1189.43, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1157.75, -1189.41, 128.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1166.28, -1189.39, 128.78, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1166.28, -1189.39, 130.08, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1157.75, -1189.41, 130.12, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1149.22, -1189.43, 130.04, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1140.61, -1189.39, 130.08, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1132.16, -1189.41, 130.05, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1208.86, -1030.29, 129.34, 18.00, 0.00, 180.00);
    CreateDynamicObject(18769, -1208.90, -1049.24, 135.48, 18.00, 0.00, 180.00);
    CreateDynamicObject(18769, -1208.91, -1068.48, 138.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1188.99, -1068.50, 138.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1188.89, -1048.97, 141.64, 18.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1188.88, -1029.67, 144.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1188.89, -1009.81, 144.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1168.96, -1009.81, 144.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1149.01, -1009.82, 144.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1148.97, -990.03, 144.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1149.00, -970.13, 144.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1148.99, -950.26, 144.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1129.24, -950.26, 144.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1110.21, -950.30, 148.91, 25.00, 0.00, -90.00);
    CreateDynamicObject(18769, -1091.50, -950.28, 153.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1071.58, -950.29, 153.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1071.54, -930.52, 153.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1071.59, -910.92, 153.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1051.86, -910.93, 153.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1031.97, -910.96, 153.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1012.12, -910.97, 153.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1011.97, -930.13, 150.00, 18.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1011.99, -948.88, 143.94, 18.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1012.00, -967.79, 137.77, 18.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1011.99, -986.67, 131.63, 18.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1011.98, -1005.86, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1011.97, -1025.83, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1031.91, -1025.73, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1051.87, -1025.71, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1071.85, -1025.70, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1071.89, -1005.78, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1071.88, -985.82, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1071.90, -965.88, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1091.81, -965.87, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1111.77, -965.86, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1131.66, -965.88, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1151.62, -965.86, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1171.59, -965.85, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1191.52, -965.90, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1211.46, -965.90, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1208.83, -1019.03, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1208.83, -999.08, 128.48, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1208.90, -985.45, 128.48, 0.00, 0.00, 0.90);
    CreateDynamicObject(983, -1199.08, -1025.24, 129.76, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1199.09, -1018.84, 129.76, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1199.17, -1006.42, 129.76, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1199.18, -1000.01, 129.76, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1199.18, -993.59, 129.76, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1199.16, -987.19, 129.76, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1199.14, -980.84, 129.76, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1186.40, -975.64, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1160.79, -975.62, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1135.22, -975.65, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1109.56, -975.65, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1075.25, -956.40, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1062.44, -969.20, 129.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1062.44, -994.79, 129.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1081.63, -988.71, 129.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1081.63, -1014.30, 129.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1068.52, -1035.17, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1049.07, -1016.33, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1042.92, -1035.16, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1017.34, -1035.20, 129.74, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1002.36, -1016.75, 129.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1015.50, -901.47, 154.31, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1041.13, -901.48, 154.31, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1042.40, -920.52, 154.31, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1061.71, -937.90, 154.31, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1081.11, -914.41, 154.31, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1074.90, -959.82, 154.31, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1145.68, -940.78, 145.99, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1158.45, -953.57, 145.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1158.42, -979.18, 145.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1139.20, -982.97, 145.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1198.66, -1012.79, 145.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1195.88, -1015.00, 128.09, 18.00, 90.00, 90.00);
    CreateDynamicObject(983, -1195.90, -1013.77, 128.09, 18.00, 90.00, 90.00);
    CreateDynamicObject(983, -1195.91, -1012.51, 128.09, 18.00, 90.00, 90.00);
    CreateDynamicObject(983, -1195.90, -1011.24, 128.09, 18.00, 90.00, 90.00);
    CreateDynamicObject(983, -1195.92, -1010.00, 128.09, 18.00, 90.00, 90.00);
    CreateDynamicObject(18761, -1209.12, -1008.75, 132.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1089.88, -956.34, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1093.50, -956.31, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1097.16, -956.29, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1100.82, -956.30, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1104.40, -956.26, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1108.02, -956.24, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1111.67, -956.23, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1115.33, -956.24, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1118.95, -956.23, 129.96, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1122.62, -956.23, 129.96, 0.00, 0.00, 0.00);
    //Стант, Драг 1, Драг 2
    AddStaticVehicle(563, -1706.04199219, -231.16503906, 21.31699944, 180.00000000, -1, -1); //Raindance
    AddStaticVehicle(526, -1680.12805176, -243.85400391, 13.68000031, 314.00000000, -1, -1); //Fortune
    AddStaticVehicle(526, -1676.44494629, -249.25199890, 13.68000031, 135.99475098, -1, -1); //Fortune
    AddStaticVehicle(603, -1643.91894531, -174.21600342, 14.15100002, 136.00000000, -1, -1); //Phoenix
    AddStaticVehicle(562, -1639.38696289, -177.35000610, 14.20199966, 136.00000000, -1, -1); //Elegy
    AddStaticVehicle(429, -1676.57299805, -215.75000000, 13.89799976, 0.00000000, -1, -1); //Banshee
    AddStaticVehicle(402, -1680.65905762, -211.72999573, 14.08800030, 0.00000000, -1, -1); //Buffalo
    AddStaticVehicle(411, -1684.90625000, -207.91503906, 13.94799995, 0.00000000, -1, -1); //Infernus
    AddStaticVehicle(415, -1689.26293945, -203.80599976, 13.99800014, 0.00000000, -1, -1); //Cheetah
    AddStaticVehicle(573, -1624.52502441, -251.78799438, 14.95900059, 0.00000000, -1, -1); //Duneride
    AddStaticVehicle(573, -1619.88903809, -247.19599915, 14.96400070, 0.00000000, -1, -1); //Duneride
    AddStaticVehicle(556, -1605.73144531, -259.98632812, 14.00000000, 279.99755859, -1, -1); //Monster A
    AddStaticVehicle(556, -1610.07604980, -265.67999268, 13.99994755, 279.99755859, -1, -1); //Monster A
    AddStaticVehicle(420, -1265.39196777, -30.07200050, 13.99800014, 182.00000000, -1, -1); //Taxi
    AddStaticVehicle(477, -1268.57604980, -79.15599823, 13.99800014, 44.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, -1276.53894043, -71.07700348, 13.99800014, 43.99475098, -1, -1); //ZR-350
    AddStaticVehicle(402, -1256.32702637, -37.21599960, 14.08800030, 0.00000000, -1, -1); //Buffalo
    AddStaticVehicle(402, -1252.49401855, -41.27799988, 14.08800030, 0.00000000, -1, -1); //Buffalo
    AddStaticVehicle(535, -1245.04003906, -19.35400009, 13.98799992, 316.00000000, -1, -1); //Slamvan
    AddStaticVehicle(535, -1241.05603027, -23.43600082, 13.98799992, 315.99475098, -1, -1); //Slamvan
    AddStaticVehicle(535, -1237.09497070, -27.32200050, 13.98799992, 316.00000000, -1, -1); //Slamvan
    AddStaticVehicle(535, -1233.01904297, -31.38199997, 13.98799992, 315.99975586, -1, -1); //Slamvan
    AddStaticVehicle(535, -1228.94201660, -35.40900040, 13.98799992, 315.99975586, -1, -1); //Slamvan
    AddStaticVehicle(560, -1693.32604980, -199.08500671, 13.99499989, 0.00000000, 1, 1); //Sultan
    AddStaticVehicle(467, -1686.43896484, -195.82600403, 13.99100018, 0.00000000, 6, 1); //Oceanic
    CreateDynamicObject(10830, -1642.10253906, -150.60742188, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (1)
    CreateDynamicObject(10830, -1608.75598145, -117.21900177, 21.35000038, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (2)
    CreateDynamicObject(10830, -1575.47595215, -83.87400055, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (3)
    CreateDynamicObject(10830, -1542.11804199, -50.51800156, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (4)
    CreateDynamicObject(10830, -1508.62402344, -16.99900055, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (5)
    CreateDynamicObject(10830, -1475.76403809, 15.85499954, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (6)
    CreateDynamicObject(10830, -1442.74511719, 48.77832031, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (7)
    CreateDynamicObject(10830, -1409.72497559, 81.94599915, 21.34700012, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (8)
    CreateDynamicObject(10830, -1376.98095703, 114.72200012, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (9)
    CreateDynamicObject(10830, -1343.98205566, 147.79899597, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (10)
    CreateDynamicObject(10830, -1310.69628906, 181.05468750, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (11)
    CreateDynamicObject(10830, -1276.80603027, 214.87699890, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (12)
    CreateDynamicObject(10830, -1243.28405762, 248.55000305, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (13)
    CreateDynamicObject(10830, -1210.21594238, 281.66900635, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (14)
    CreateDynamicObject(10830, -1176.29003906, 315.70001221, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (15)
    CreateDynamicObject(10830, -1142.29199219, 349.63900757, 21.45700073, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (16)
    CreateDynamicObject(10765, -1655.97558594, -163.75488281, 13.20699978, 0.00000000, 0.00000000, 0.00000000); //object(skidmarks_sfse) (1)
    CreateDynamicObject(10830, -1109.60302734, 382.14498901, 21.35499954, 0.00000000, 0.00000000, 0.00000000); //object(drydock2_sfse) (17)
    CreateDynamicObject(7033, -1654.62304688, -162.51699829, 17.52099991, 0.00000000, 0.00000000, 136.00000000); //object(vgnhsegate02) (1)
    CreateDynamicObject(970, -1639.02697754, -167.80499268, 13.69999981, 0.00000000, 0.00000000, 315.99975586); //object(fencesmallb) (4)
    CreateDynamicObject(970, -1636.04895020, -170.65600586, 13.76200008, 0.00000000, 0.00000000, 315.99975586); //object(fencesmallb) (5)
    CreateDynamicObject(970, -1633.33105469, -173.27000427, 13.79799938, 0.00000000, 0.00000000, 315.99975586); //object(fencesmallb) (6)
    CreateDynamicObject(970, -1643.87304688, -168.11599731, 13.75800037, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (7)
    CreateDynamicObject(970, -1646.73498535, -171.08799744, 13.75800037, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (8)
    CreateDynamicObject(970, -1649.60998535, -174.05099487, 13.75800037, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (9)
    CreateDynamicObject(970, -1660.62695312, -151.97500610, 13.75800037, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (10)
    CreateDynamicObject(970, -1663.48205566, -154.94900513, 13.75800037, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (11)
    CreateDynamicObject(970, -1666.35095215, -157.91499329, 13.75800037, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (12)
    CreateDynamicObject(970, -1670.18200684, -157.27600098, 13.75800037, 0.00000000, 0.00000000, 135.99975586); //object(fencesmallb) (13)
    CreateDynamicObject(970, -1673.05200195, -154.34300232, 13.69999981, 0.00000000, 0.00000000, 135.99426270); //object(fencesmallb) (14)
    CreateDynamicObject(3852, -1671.86999512, -148.61399841, 15.05200005, 0.00000000, 0.00000000, 314.86315918); //object(sf_jump) (1)
    CreateDynamicObject(7971, -1674.72497559, -242.34800720, 17.96999931, 0.00000000, 0.00000000, 46.00000000); //object(vgnprtlstation03) (1)
    CreateDynamicObject(700, -1710.81103516, -209.39500427, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (1)
    CreateDynamicObject(700, -1706.84899902, -200.79499817, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (2)
    CreateDynamicObject(700, -1701.15405273, -191.32299805, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (3)
    CreateDynamicObject(700, -1695.41101074, -183.06399536, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (4)
    CreateDynamicObject(700, -1689.60400391, -175.89999390, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (5)
    CreateDynamicObject(700, -1678.86499023, -164.47999573, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (6)
    CreateDynamicObject(700, -1672.14697266, -157.83799744, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (7)
    CreateDynamicObject(10838, -1654.89648438, -199.46972656, 26.39599991, 0.00000000, 0.00000000, 315.99975586); //object(airwelcomesign_sfse) (1)
    CreateDynamicObject(970, -1668.72094727, -216.04299927, 13.69999981, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (15)
    CreateDynamicObject(970, -1671.56701660, -219.00700378, 13.69999981, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (16)
    CreateDynamicObject(970, -1673.07495117, -220.53599548, 13.69999981, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (17)
    CreateDynamicObject(970, -1670.23803711, -214.65899658, 13.69499969, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (18)
    CreateDynamicObject(970, -1671.78698730, -216.29100037, 13.69999981, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (19)
    CreateDynamicObject(970, -1674.28100586, -218.86399841, 13.69999981, 0.00000000, 0.00000000, 225.99975586); //object(fencesmallb) (20)
    CreateDynamicObject(700, -1669.31604004, -215.13200378, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (12)
    CreateDynamicObject(700, -1671.64196777, -217.43400574, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (13)
    CreateDynamicObject(700, -1673.47302246, -219.38499451, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (14)
    CreateDynamicObject(9527, -1692.35803223, -229.25000000, 19.12400055, 0.00000000, 0.00000000, 88.00000000); //object(boigas_sfw01) (1)
    CreateDynamicObject(700, -1684.59301758, -170.02099609, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (15)
    CreateDynamicObject(16002, -1635.35205078, -188.71600342, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(drvin_sign) (1)
    CreateDynamicObject(700, -1626.25878906, -188.47460938, 13.14500046, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (16)
    CreateDynamicObject(700, -1614.66198730, -189.50000000, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (17)
    CreateDynamicObject(700, -1603.96105957, -189.80599976, 13.19299984, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (18)
    CreateDynamicObject(700, -1595.18701172, -190.42900085, 13.19099998, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (19)
    CreateDynamicObject(700, -1587.09375000, -185.54687500, 13.20300007, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(18803, -1512.68896484, -20.47900009, 12.41100025, 0.00000000, 0.00000000, 44.98999023); //object(mbridge150m1) (1)
    CreateDynamicObject(19280, -1560.28295898, -79.05699921, 13.21899986, 0.00000000, 0.00000000, 146.00000000); //object(carrooflight1) (1)
    CreateDynamicObject(19280, -1570.95605469, -67.73000336, 13.21899986, 0.00000000, 0.00000000, 140.00000000); //object(carrooflight1) (2)
    CreateDynamicObject(19282, -1660.69104004, -166.49400330, 15.10499954, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (1)
    CreateDynamicObject(19283, -1660.66394043, -166.51899719, 14.54599953, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (1)
    CreateDynamicObject(19284, -1660.67199707, -166.51199341, 13.92500019, 0.00000000, 0.00000000, 0.00000000); //object(pointlight4) (1)
    CreateDynamicObject(19282, -1658.41394043, -168.69299316, 15.13799953, 0.00000000, 0.00000000, 0.00000000); //object(pointlight2) (2)
    CreateDynamicObject(19283, -1658.40405273, -168.70199585, 14.62100029, 0.00000000, 0.00000000, 0.00000000); //object(pointlight3) (2)
    CreateDynamicObject(19284, -1658.43798828, -168.66999817, 14.11699963, 0.00000000, 0.00000000, 0.00000000); //object(pointlight4) (2)
    CreateDynamicObject(18750, -828.89898682, 383.03100586, 48.47700119, 90.00000000, 0.00000000, 313.99475098); //object(samplogobig) (1)
    CreateDynamicObject(18824, -1627.30102539, -268.99798584, 21.60099983, 0.00000000, 296.00000000, 46.00000000); //object(tube50mglass90bend1) (1)
    CreateDynamicObject(18824, -1650.36804199, -292.83401489, 51.00299835, 0.00000000, 122.00000000, 45.99978638); //object(tube50mglass90bend1) (2)
    CreateDynamicObject(18824, -1686.42382812, -314.26562500, 58.44969940, 90.00000000, 0.00000000, 93.99902344); //object(tube50mglass90bend1) (3)
    CreateDynamicObject(18809, -1697.70703125, -256.42285156, 58.41099930, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1667.00585938, -217.12207031, 58.37400055, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (2)
    CreateDynamicObject(18809, -1636.44799805, -178.00300598, 58.35998917, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (3)
    CreateDynamicObject(970, -1702.46496582, -249.16700745, 13.69999981, 0.00000000, 0.00000000, 135.99975586); //object(fencesmallb) (21)
    CreateDynamicObject(970, -1699.50805664, -252.04200745, 13.69999981, 0.00000000, 0.00000000, 135.99426270); //object(fencesmallb) (22)
    CreateDynamicObject(970, -1696.54895020, -254.90299988, 13.69499969, 0.00000000, 0.00000000, 135.99426270); //object(fencesmallb) (23)
    CreateDynamicObject(970, -1693.60400391, -257.74499512, 13.69499969, 0.00000000, 0.00000000, 135.99426270); //object(fencesmallb) (24)
    CreateDynamicObject(970, -1690.63403320, -260.62399292, 13.69999981, 0.00000000, 0.00000000, 135.99426270); //object(fencesmallb) (25)
    CreateDynamicObject(970, -1687.68701172, -263.50100708, 13.69999981, 0.00000000, 0.00000000, 135.99426270); //object(fencesmallb) (26)
    CreateDynamicObject(970, -1684.73400879, -266.37701416, 13.69999981, 0.00000000, 0.00000000, 135.99426270); //object(fencesmallb) (27)
    CreateDynamicObject(970, -1681.79101562, -269.24600220, 13.69999981, 0.00000000, 0.00000000, 135.99426270); //object(fencesmallb) (28)
    CreateDynamicObject(18809, -1606.33007812, -139.46679688, 58.38040161, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (4)
    CreateDynamicObject(18809, -1575.81896973, -100.38899994, 58.27399826, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (4)
    CreateDynamicObject(18809, -1545.49511719, -61.58000183, 58.28299713, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (4)
    CreateDynamicObject(18809, -1515.00000000, -22.53700066, 58.28299713, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (4)
    CreateDynamicObject(18809, -1485.12988281, 15.70699978, 58.26599884, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (4)
    CreateDynamicObject(1415, -1698.02294922, -218.63299561, 13.38399982, 0.00000000, 0.00000000, 134.00000000); //object(dyn_dumpster) (1)
    CreateDynamicObject(18809, -1454.25988770, 55.20800018, 58.16350174, 90.00000000, 0.00000000, 321.99829102); //object(tube50mglass1) (4)
    CreateDynamicObject(18824, -1419.16699219, 83.30664062, 58.09700012, 90.00000000, 0.00000000, 281.99707031); //object(tube50mglass90bend1) (3)
    CreateDynamicObject(18809, -1375.30664062, 70.62792969, 58.11500168, 90.00000000, 0.00000000, 239.99633789); //object(tube50mglass1) (1)
    CreateDynamicObject(10765, -1200.31396484, 20.79800034, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(skidmarks_sfse) (1)
    CreateDynamicObject(18809, -1332.08203125, 45.59960938, 58.09400177, 90.00000000, 0.00000000, 239.99084473); //object(tube50mglass1) (1)
    CreateDynamicObject(18824, -1298.51904297, 13.48600006, 58.09999847, 90.00000000, 0.00000000, 197.99707031); //object(tube50mglass90bend1) (3)
    CreateDynamicObject(7520, -1239.91699219, -30.39100075, 13.14799976, 0.00000000, 0.00000000, 136.00000000); //object(vgnlowbuild203) (1)
    CreateDynamicObject(19129, -1660.15820312, -221.65039062, 13.21100044, 0.00000000, 0.00000000, 315.99975586); //object(dancefloor2) (1)
    CreateDynamicObject(19129, -1646.33898926, -207.35499573, 13.21100044, 0.00000000, 0.00000000, 315.99975586); //object(dancefloor2) (2)
    CreateDynamicObject(19129, -1632.41394043, -193.07600403, 13.21100044, 0.00000000, 0.00000000, 315.99975586); //object(dancefloor2) (3)
    CreateDynamicObject(700, -1156.73803711, 29.96500015, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1167.18994141, 20.59600067, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1174.67797852, 12.53299999, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1183.35095215, 3.66100001, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1192.13000488, -5.60099983, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1203.45996094, -16.61899948, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1212.34704590, -25.40099907, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1192.83801270, 67.27700043, 13.14099979, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1200.41601562, 74.70200348, 13.14099979, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1208.57995605, 83.14399719, 13.14099979, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1216.59301758, 91.39499664, 13.14099979, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1224.84497070, 99.83100128, 13.14099979, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1232.30395508, 107.11599731, 13.14099979, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1238.65295410, 113.40599823, 13.14099979, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1244.60351562, 119.79687500, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(9132, -1205.11999512, 69.69899750, 32.25500107, 0.00000000, 0.00000000, 171.99951172); //object(triadcasign_lvs) (1)
    CreateDynamicObject(18809, -1309.08996582, -30.96400070, 58.09989929, 90.00000000, 0.00000000, 149.99633789); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1334.05700684, -74.15699768, 58.04399872, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1358.60644531, -116.49804688, 58.11299896, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(5033, -1302.30273438, -58.94824219, 26.73500061, 0.00000000, 0.00000000, 45.99975586); //object(unmainstat_las) (1)
    CreateDynamicObject(18803, -1522.31799316, -96.26200104, 27.76899910, 0.00000000, 20.00000000, 334.00000000); //object(mbridge150m1) (2)
    CreateDynamicObject(18789, -1652.71191406, -32.64599991, 53.28699875, 0.00000000, 0.00000000, 334.00000000); //object(mroad150m) (1)
    CreateDynamicObject(18800, -1751.51293945, -9.84399986, 41.19998932, 0.00000000, 0.00000000, 154.00000000); //object(mroadhelix1) (2)
    CreateDynamicObject(18800, -1737.96704102, -66.90200043, 41.34400177, 0.00000000, 0.00000000, 333.99536133); //object(mroadhelix1) (4)
    CreateDynamicObject(18800, -1805.19299316, -84.99099731, 41.37300110, 0.00000000, 0.00000000, 153.98986816); //object(mroadhelix1) (5)
    CreateDynamicObject(18800, -1786.29980469, -144.41000366, 41.30099869, 0.00000000, 0.00000000, 333.98437500); //object(mroadhelix1) (6)
    CreateDynamicObject(18800, -1837.24401855, -119.86100006, 64.79998779, 0.00000000, 0.00000000, 153.97888184); //object(mroadhelix1) (7)
    CreateDynamicObject(18789, -1748.10998535, -137.79499817, 76.91799927, 0.00000000, 0.00000000, 333.99536133); //object(mroad150m) (5)
    CreateDynamicObject(18789, -1614.55895996, -202.97300720, 76.90999603, 0.00000000, 0.00000000, 333.99536133); //object(mroad150m) (6)
    CreateDynamicObject(18800, -1515.37304688, -226.10000610, 64.73899841, 0.00000000, 0.00000000, 333.97888184); //object(mroadhelix1) (8)
    CreateDynamicObject(18800, -1561.41198730, -203.94900513, 41.13399887, 0.00000000, 0.00000000, 153.97888184); //object(mroadhelix1) (9)
    CreateDynamicObject(18789, -1493.17199707, -262.43499756, 29.72299957, 0.00000000, 0.00000000, 333.99536133); //object(mroad150m) (7)
    CreateDynamicObject(18789, -1375.66894531, -319.71679688, 29.71800041, 0.00000000, 0.00000000, 333.98986816); //object(mroad150m) (8)
    CreateDynamicObject(18789, -1270.65405273, -370.87500000, 29.85199928, 0.00000000, 0.00000000, 333.99536133); //object(mroad150m) (9)
    CreateDynamicObject(18800, -1182.94396973, -388.26199341, 17.64900017, 0.00000000, 0.00000000, 333.97888184); //object(mroadhelix1) (11)
    CreateDynamicObject(700, -1247.71997070, 14.97399998, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1242.41894531, 20.11899948, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1237.20104980, 26.04199982, 13.14799976, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(10838, -1174.14001465, 48.48199844, 29.70100021, 0.00000000, 0.00000000, 43.99975586); //object(airwelcomesign_sfse) (1)
    CreateDynamicObject(978, -1158.64794922, 32.79600143, 13.98900032, 0.00000000, 0.00000000, 134.99450684); //object(sub_roadright) (1)
    CreateDynamicObject(978, -1189.94201660, 66.33599854, 13.98200035, 0.00000000, 0.00000000, 134.98904419); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1196.53698730, 72.94599915, 13.98200035, 0.00000000, 0.00000000, 134.98904419); //object(sub_roadright) (3)
    CreateDynamicObject(978, -1203.05798340, 79.46399689, 13.98200035, 0.00000000, 0.00000000, 134.98904419); //object(sub_roadright) (4)
    CreateDynamicObject(978, -1209.43798828, 85.84999847, 13.98200035, 0.00000000, 0.00000000, 134.98904419); //object(sub_roadright) (5)
    CreateDynamicObject(978, -1215.98400879, 92.40299988, 13.98200035, 0.00000000, 0.00000000, 134.98904419); //object(sub_roadright) (6)
    CreateDynamicObject(978, -1222.61901855, 99.02600098, 13.98200035, 0.00000000, 0.00000000, 134.98904419); //object(sub_roadright) (7)
    CreateDynamicObject(978, -1229.24694824, 105.66200256, 13.98200035, 0.00000000, 0.00000000, 134.98904419); //object(sub_roadright) (8)
    CreateDynamicObject(978, -1235.87402344, 112.30400085, 13.98200035, 0.00000000, 0.00000000, 134.98904419); //object(sub_roadright) (9)
    CreateDynamicObject(978, -1242.47204590, 112.39399719, 13.97799969, 0.00000000, 0.00000000, 224.98901367); //object(sub_roadright) (10)
    CreateDynamicObject(978, -1245.90600586, 108.95200348, 13.98200035, 0.00000000, 0.00000000, 224.98901367); //object(sub_roadright) (11)
    CreateDynamicObject(18789, -1112.96997070, 94.27100372, 12.72000027, 0.00000000, 0.00000000, 43.98986816); //object(mroad150m) (8)
    CreateDynamicObject(18789, -1126.15295410, 107.66799927, 12.74600029, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18789, -1007.13201904, 196.39300537, 12.70300007, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18809, -1383.58605957, -159.68699646, 58.09998703, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(18789, -1018.56097412, 211.51100159, 12.81980038, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18789, -900.05798340, 299.73699951, 12.69939995, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18789, -914.50500488, 311.90301514, 12.81500053, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18789, -807.37500000, 389.23199463, 12.67099953, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18789, -815.70300293, 407.29598999, 12.79909992, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18789, -712.86798096, 506.64001465, 12.95899963, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18789, -700.02697754, 492.68798828, 12.68400002, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(10765, 2073.46899414, 842.92700195, 5.79600000, 0.00000000, 0.00000000, 134.00000000); //object(skidmarks_sfse) (2)
    CreateDynamicObject(18789, -639.76702881, 550.78302002, 12.63599968, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(18789, -652.98699951, 564.46600342, 12.96199989, 0.00000000, 0.00000000, 43.98925781); //object(mroad150m) (8)
    CreateDynamicObject(1655, -602.82000732, 613.42797852, 14.60599995, 0.00000000, 0.00000000, 314.00000000); //object(waterjumpx2) (1)
    CreateDynamicObject(1655, -588.52600098, 599.48400879, 14.27999973, 0.00000000, 0.00000000, 313.99475098); //object(waterjumpx2) (2)
    CreateDynamicObject(18809, -1405.72094727, -198.01499939, 58.07400131, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1430.28796387, -240.44000244, 58.10599899, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1455.34204102, -283.82800293, 58.06900024, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1480.26000977, -326.97601318, 58.11119843, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1504.88098145, -369.56298828, 58.08499908, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1529.64794922, -412.40200806, 58.01699829, 90.00000000, 0.00000000, 149.99087524); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1713.61901855, -367.92098999, 58.20999908, 90.00000000, 0.00000000, 237.99633789); //object(tube50mglass1) (1)
    CreateDynamicObject(18824, -1561.24609375, -446.41992188, 58.05899811, 90.00000000, 0.00000000, 109.98962402); //object(tube50mglass90bend1) (3)
    CreateDynamicObject(18809, -1604.92297363, -435.93399048, 57.95500183, 90.00000000, 0.00000000, 237.99084473); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1647.17797852, -409.37600708, 58.00000000, 90.00000000, 0.00000000, 237.98535156); //object(tube50mglass1) (1)
    CreateDynamicObject(18809, -1689.03503418, -383.19000244, 58.00000000, 90.00000000, 0.00000000, 237.98535156); //object(tube50mglass1) (1)
    CreateDynamicObject(18824, -1742.48803711, -334.40399170, 58.24000168, 90.00000000, 0.00000000, 9.99902344); //object(tube50mglass90bend1) (3)
    CreateDynamicObject(700, -1074.39196777, 387.74301147, 13.54699993, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1068.84497070, 393.14199829, 13.54699993, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1062.21203613, 399.70199585, 13.54699993, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1059.64294434, 409.09500122, 13.53999996, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1068.78796387, 418.54901123, 13.53999996, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1080.71801758, 429.29998779, 13.53999996, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1087.67602539, 434.77099609, 13.54599953, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1094.42797852, 431.11300659, 13.54699993, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1101.54699707, 423.31698608, 13.54699993, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(700, -1106.59594727, 417.88500977, 13.54699993, 0.00000000, 0.00000000, 0.00000000); //object(sm_veg_tree6) (20)
    CreateDynamicObject(982, -1713.46386719, -238.59863281, 19.14122963, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit) (1)
    CreateDynamicObject(8229, -1102.32995605, 424.02801514, 16.24799919, 0.00000000, 0.00000000, 44.00000000); //object(vgsbikeschl02) (1)
    CreateDynamicObject(8229, -1093.93103027, 432.08898926, 16.24799919, 0.00000000, 0.00000000, 43.99475098); //object(vgsbikeschl02) (2)
    CreateDynamicObject(8229, -1078.14001465, 431.97399902, 16.24099922, 0.00000000, 0.00000000, 315.99475098); //object(vgsbikeschl02) (3)
    CreateDynamicObject(8229, -1069.96398926, 423.89498901, 16.24099922, 0.00000000, 0.00000000, 315.99426270); //object(vgsbikeschl02) (4)
    CreateDynamicObject(8229, -1058.55798340, 412.84201050, 16.24099922, 0.00000000, 0.00000000, 315.99426270); //object(vgsbikeschl02) (5)
    CreateDynamicObject(8229, -1058.83496094, 397.76699829, 16.04000092, 0.00000000, 0.00000000, 223.99426270); //object(vgsbikeschl02) (6)
    CreateDynamicObject(8229, -1074.70898438, 382.40798950, 16.09499931, 0.00000000, 0.00000000, 223.98925781); //object(vgsbikeschl02) (7)
    CreateDynamicObject(5817, -1698.44995117, -217.04899597, 15.76599979, 0.00000000, 0.00000000, 43.99804688); //object(odrampbit01) (2)
    CreateDynamicObject(984, -1174.45300293, 49.71900177, 13.78499985, 90.00000000, 0.00000000, 44.00000000); //object(fenceshit2) (1)
    CreateDynamicObject(984, -1173.58801270, 48.78799820, 13.78499985, 90.00000000, 0.00000000, 43.99475098); //object(fenceshit2) (2)
    CreateDynamicObject(984, -1172.72705078, 47.90399933, 13.78499985, 90.00000000, 0.00000000, 43.99475098); //object(fenceshit2) (3)
    CreateDynamicObject(1262, -1173.55200195, 48.65299988, 17.27599907, 0.00000000, 0.00000000, 136.00000000); //object(mtraffic4) (1)
    CreateDynamicObject(18818, -1722.16394043, -300.38500977, 58.37600327, 90.00000000, 0.00000000, 232.00000000); //object(tube50mglasst1) (1)
    ///Дрифт 10
    AddStaticVehicleEx(602, -1604.4479980, 287.7099915, 6.9349999, 329.9963379, -1, -1, 2000); //Elegy
    AddStaticVehicleEx(562, -1597.9229736, 287.5100098, 6.9410000, 329.9963379, -1, -1, 2000); //Elegy
    AddStaticVehicleEx(562, -1589.6500244, 287.0499878, 6.9410000, 329.9963379, -1, -1, 2000); //Elegy
    AddStaticVehicleEx(562, -1583.3580322, 286.6940002, 6.9410000, 329.9963379, -1, -1, 2000); //Elegy
    AddStaticVehicleEx(562, -1577.1269531, 286.5180054, 6.9410000, 329.9963379, -1, -1, 2000); //Elegy
    CreateDynamicObject(19340, -1336.6250000, 291.9248047, 2.4340000, 0.0000000, 0.0000000, 179.9945068); //object(cslab01) (1)
    CreateDynamicObject(19340, -1424.5742188, 291.9062500, 2.4380000, 0.0000000, 0.0000000, 179.9945068); //object(cslab01) (4)
    CreateDynamicObject(19340, -1513.0693359, 291.9960938, 2.4380000, 0.0000000, 0.0000000, 179.9945068); //object(cslab01) (5)
    CreateDynamicObject(19340, -1336.7958984, 394.0146484, 2.4359999, 0.0000000, 0.0000000, 179.9945068); //object(cslab01) (6)
    CreateDynamicObject(19340, -1412.7060547, 395.1619873, 2.4000001, 0.0000000, 0.0000000, 181.9940186); //object(cslab01) (7)
    CreateDynamicObject(19340, -1307.8525391, 393.1054688, 2.3999100, 0.0000000, 0.0000000, 269.9890137); //object(cslab01) (8)
    CreateDynamicObject(16092, -1524.6269531, 220.9658203, 6.1880002, 0.0000000, 0.0000000, 0.0000000); //object(des_pipestrut05) (1)
    CreateDynamicObject(16092, -1524.6319580, 245.2259979, 6.1880002, 0.0000000, 0.0000000, 0.0000000); //object(des_pipestrut05) (2)
    CreateDynamicObject(981, -1510.4199219, 232.8906250, 6.8880000, 0.0000000, 0.0000000, 0.0000000); //object(helix_barrier) (1)
    CreateDynamicObject(979, -1519.2530518, 239.1909943, 7.0279999, 0.0000000, 0.0000000, 0.0000000); //object(sub_roadleft) (2)
    CreateDynamicObject(978, -1525.2998047, 233.1396484, 7.0279999, 0.0000000, 0.0000000, 90.0000000); //object(sub_roadright) (2)
    CreateDynamicObject(979, -1509.8950195, 239.1849976, 7.0279999, 0.0000000, 0.0000000, 0.0000000); //object(sub_roadleft) (3)
    CreateDynamicObject(979, -1500.5849609, 239.1779938, 7.0279999, 0.0000000, 0.0000000, 0.0000000); //object(sub_roadleft) (4)
    CreateDynamicObject(978, -1519.2840576, 226.9790039, 7.0279999, 0.0000000, 0.0000000, 178.0000000); //object(sub_roadright) (3)
    CreateDynamicObject(978, -1509.9010010, 226.6529999, 7.0279999, 0.0000000, 0.0000000, 177.9949951); //object(sub_roadright) (4)
    CreateDynamicObject(978, -1500.5410156, 226.3329926, 7.0279999, 0.0000000, 0.0000000, 177.9949951); //object(sub_roadright) (5)
    CreateDynamicObject(978, -1492.6409912, 229.3750000, 7.0279999, 0.0000000, 0.0000000, 223.9949951); //object(sub_roadright) (6)
    CreateDynamicObject(979, -1492.6719971, 235.9600067, 7.0279999, 0.0000000, 0.0000000, 316.0000000); //object(sub_roadleft) (5)
    CreateDynamicObject(19124, -1489.2929688, 232.6582031, 6.9640002, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight4) (1)
    CreateDynamicObject(713, -1513.9360352, 233.4290009, 6.1880002, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (1)
    CreateDynamicObject(713, -1493.6250000, 233.1779938, 6.1880002, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (2)
    CreateDynamicObject(979, -1527.5140381, 209.4140015, 7.0279999, 0.0000000, 0.0000000, 59.9963379); //object(sub_roadleft) (6)
    CreateDynamicObject(979, -1534.5190430, 205.2879944, 7.0279999, 0.0000000, 0.0000000, 359.9963379); //object(sub_roadleft) (7)
    CreateDynamicObject(979, -1543.8809814, 205.2859955, 7.0279999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (8)
    CreateDynamicObject(979, -1552.3010254, 205.2859955, 7.0279999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (9)
    CreateDynamicObject(979, -1556.9720459, 209.9940033, 7.0279999, 0.0000000, 0.0000000, 269.9945068); //object(sub_roadleft) (10)
    CreateDynamicObject(979, -1556.9739990, 219.3730011, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (11)
    CreateDynamicObject(979, -1556.9830322, 228.7369995, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (12)
    CreateDynamicObject(979, -1556.9759521, 238.1119995, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (13)
    CreateDynamicObject(979, -1556.9749756, 247.4969940, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (14)
    CreateDynamicObject(979, -1556.9849854, 255.5059967, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (15)
    CreateDynamicObject(979, -1519.2280273, 214.7819977, 7.0279999, 0.0000000, 0.0000000, 359.9963379); //object(sub_roadleft) (16)
    CreateDynamicObject(979, -1509.8599854, 214.7740021, 7.0279999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (17)
    CreateDynamicObject(979, -1500.5269775, 214.7689972, 7.0279999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (18)
    CreateDynamicObject(979, -1491.2690430, 214.7700043, 7.0279999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (19)
    CreateDynamicObject(713, -1520.5310059, 210.2590027, 6.1880002, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (3)
    CreateDynamicObject(713, -1498.4300537, 210.4490051, 6.1880002, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (4)
    CreateDynamicObject(979, -1561.5889893, 260.3330078, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (20)
    CreateDynamicObject(979, -1570.9720459, 260.3290100, 7.0279999, 0.0000000, 0.0000000, 359.9835205); //object(sub_roadleft) (21)
    CreateDynamicObject(979, -1580.3056641, 260.3408203, 7.0279999, 0.0000000, 0.0000000, 359.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(978, -1608.9339600, 312.4949951, 7.0279999, 0.0000000, 0.0000000, 89.9949951); //object(sub_roadright) (7)
    CreateDynamicObject(978, -1608.9260254, 303.1239929, 7.0219998, 0.0000000, 0.0000000, 89.9945068); //object(sub_roadright) (8)
    CreateDynamicObject(978, -1608.9169922, 293.7940063, 7.0219998, 0.0000000, 0.0000000, 89.9945068); //object(sub_roadright) (9)
    CreateDynamicObject(978, -1608.9150391, 288.2640076, 7.0219998, 0.0000000, 0.0000000, 89.9945068); //object(sub_roadright) (10)
    CreateDynamicObject(978, -1604.2309570, 283.5859985, 7.0279999, 0.0000000, 0.0000000, 179.9945068); //object(sub_roadright) (11)
    CreateDynamicObject(978, -1594.8559570, 283.5820007, 7.0279999, 0.0000000, 0.0000000, 179.9895020); //object(sub_roadright) (12)
    CreateDynamicObject(978, -1585.4880371, 283.5780029, 7.0279999, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadright) (16)
    CreateDynamicObject(7952, -1475.2871094, 210.1777344, 6.9320002, 0.0000000, 0.0000000, 90.0000000); //object(miragehedge09) (1)
    CreateDynamicObject(713, -1476.8620605, 210.2989960, 6.1880002, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (5)
    CreateDynamicObject(713, -1454.2409668, 210.1399994, 6.1680002, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (6)
    CreateDynamicObject(713, -1431.8046875, 210.2792969, 6.1680002, 0.0000000, 0.0000000, 155.4730225); //object(veg_bevtree1) (7)
    CreateDynamicObject(979, -1481.8940430, 214.7689972, 7.0279999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (23)
    CreateDynamicObject(979, -1472.5209961, 214.7689972, 7.0279999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (24)
    CreateDynamicObject(979, -1463.1590576, 214.7510071, 7.0079999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (25)
    CreateDynamicObject(979, -1453.7840576, 214.7469940, 7.0079999, 0.0000000, 0.0000000, 359.9945068); //object(sub_roadleft) (26)
    CreateDynamicObject(979, -1444.4082031, 214.7460938, 7.0079999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1435.0273438, 214.7412109, 7.0079999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (28)
    CreateDynamicObject(7952, -1475.9479980, 255.5000000, 6.9320002, 0.0000000, 0.0000000, 90.0000000); //object(miragehedge09) (2)
    CreateDynamicObject(8643, -1508.0849609, 269.6099854, 12.3151999, 0.0000000, 0.0000000, 180.0000000); //object(vgsebuild01_lvs) (1)
    CreateDynamicObject(978, -1525.2110596, 257.4150085, 7.0279999, 0.0000000, 0.0000000, 90.0000000); //object(sub_roadright) (17)
    CreateDynamicObject(978, -1519.2039795, 251.3690033, 7.0279999, 0.0000000, 0.0000000, 179.9949951); //object(sub_roadright) (18)
    CreateDynamicObject(978, -1509.8199463, 251.3739929, 7.0279999, 0.0000000, 0.0000000, 179.9949951); //object(sub_roadright) (19)
    CreateDynamicObject(978, -1500.4658203, 251.3798828, 7.0279999, 0.0000000, 0.0000000, 179.9945068); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1491.1629639, 251.3840027, 7.0279999, 0.0000000, 0.0000000, 179.9949951); //object(sub_roadright) (21)
    CreateDynamicObject(978, -1481.7879639, 251.3780060, 7.0279999, 0.0000000, 0.0000000, 179.9949951); //object(sub_roadright) (22)
    CreateDynamicObject(978, -1472.4329834, 251.3840027, 7.0279999, 0.0000000, 0.0000000, 179.9949951); //object(sub_roadright) (23)
    CreateDynamicObject(978, -1463.1440430, 251.4029999, 7.0079999, 0.0000000, 0.0000000, 179.9949951); //object(sub_roadright) (24)
    CreateDynamicObject(978, -1453.7869873, 251.4019928, 7.0079999, 0.0000000, 0.0000000, 179.9949951); //object(sub_roadright) (25)
    CreateDynamicObject(978, -1444.4443359, 251.4140625, 7.0079999, 0.0000000, 0.0000000, 179.9945068); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1531.4310303, 282.5920105, 7.0279999, 0.0000000, 0.0000000, 138.0000000); //object(sub_roadright) (27)
    CreateDynamicObject(978, -1436.9139404, 251.4299927, 7.0079999, 0.0000000, 0.0000000, 179.9945068); //object(sub_roadright) (28)
    CreateDynamicObject(713, -1521.0269775, 256.0880127, 6.1880002, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (8)
    CreateDynamicObject(713, -1498.6259766, 256.0927734, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1477.6020508, 256.0840149, 6.1880002, 0.0000000, 0.0000000, 155.4730225); //object(veg_bevtree1) (10)
    CreateDynamicObject(713, -1455.4859619, 255.9349976, 6.1680002, 0.0000000, 0.0000000, 155.4730225); //object(veg_bevtree1) (11)
    CreateDynamicObject(713, -1433.9560547, 256.0769958, 6.1680002, 0.0000000, 0.0000000, 155.4730225); //object(veg_bevtree1) (12)
    CreateDynamicObject(979, -1589.5749512, 260.3540039, 7.0279999, 0.0000000, 0.0000000, 359.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1598.9570312, 260.3670044, 7.0279999, 0.0000000, 0.0000000, 359.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1608.3320312, 260.3720093, 7.0279999, 0.0000000, 0.0000000, 359.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1617.7180176, 260.3760071, 7.0279999, 0.0000000, 0.0000000, 359.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1627.0729980, 260.3840027, 7.0279999, 0.0000000, 0.0000000, 359.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1636.4169922, 260.3919983, 7.0279999, 0.0000000, 0.0000000, 359.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1644.6810303, 263.3760071, 7.0279999, 0.0000000, 0.0000000, 319.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1649.3900146, 270.9630127, 7.0279999, 0.0000000, 0.0000000, 283.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1551.6319580, 461.5520020, 7.0279999, 0.0000000, 0.0000000, 239.9780273); //object(sub_roadleft) (22)
    CreateDynamicObject(978, -1479.1328125, 265.4873047, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1474.4530029, 260.7749939, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1465.0889893, 260.7839966, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1455.7180176, 260.7860107, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1446.3370361, 260.7950134, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1436.9689941, 260.7699890, 7.0079999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1432.2769775, 256.1149902, 7.0079999, 0.0000000, 0.0000000, 269.9945068); //object(sub_roadright) (28)
    CreateDynamicObject(7952, -1399.8719482, 247.6730042, 6.9120002, 0.0000000, 0.0000000, 0.0000000); //object(miragehedge09) (1)
    CreateDynamicObject(979, -1425.6929932, 214.7250061, 7.0079999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1416.3349609, 214.7239990, 7.0079999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1408.6450195, 218.3000031, 7.0079999, 0.0000000, 0.0000000, 49.9890137); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1404.9610596, 226.5440063, 7.0079999, 0.0000000, 0.0000000, 81.9877930); //object(sub_roadleft) (28)
    CreateDynamicObject(7952, -1451.2216797, 210.1289062, 6.9120002, 0.0000000, 0.0000000, 90.0000000); //object(miragehedge09) (1)
    CreateDynamicObject(713, -1406.1357422, 210.1269531, 6.1680002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, -1400.1059570, 227.1670074, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, -1399.9870605, 249.6699982, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, -1399.8669434, 270.7940063, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (7)
    CreateDynamicObject(979, -1404.2989502, 235.8600006, 7.0079999, 0.0000000, 0.0000000, 89.9854736); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1404.2910156, 245.2189941, 7.0079999, 0.0000000, 0.0000000, 89.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1404.2840576, 254.5919952, 7.0079999, 0.0000000, 0.0000000, 89.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1404.2840576, 263.9379883, 7.0079999, 0.0000000, 0.0000000, 89.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1404.2879639, 273.3039856, 7.0079999, 0.0000000, 0.0000000, 89.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1404.2769775, 282.6499939, 7.0079999, 0.0000000, 0.0000000, 89.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1408.9370117, 287.3890076, 7.0079999, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1418.3129883, 287.3900146, 7.0079999, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1427.6789551, 287.3980103, 7.0079999, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1437.0429688, 287.4052734, 7.0079999, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(978, -1479.1290283, 274.8630066, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1479.1300049, 284.2399902, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(7894, -1452.8149414, 292.5780029, 6.7490001, 0.0000000, 0.0000000, 270.0000000); //object(vegascrashbar05) (1)
    CreateDynamicObject(979, -1446.4360352, 287.3949890, 7.0279999, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadleft) (28)
    CreateDynamicObject(979, -1446.4000244, 297.7269897, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1437.0400391, 297.7269897, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1427.6560059, 297.7269897, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1418.3249512, 297.7290039, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1408.9890137, 297.7250061, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1399.6350098, 297.7219849, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1394.9880371, 279.5780029, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1394.9859619, 274.3479919, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1394.9919434, 264.9890137, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1394.9949951, 255.6210022, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1394.9940186, 246.2469940, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1394.9990234, 236.8789978, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1395.0150146, 227.5070038, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1393.4659424, 218.5039978, 7.0279999, 0.0000000, 0.0000000, 289.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(7952, -1354.4119873, 209.2149963, 6.8979998, 0.0000000, 0.0000000, 90.0000000); //object(miragehedge09) (1)
    CreateDynamicObject(713, -1376.7889404, 209.5729980, 6.1539998, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, -1355.6970215, 209.2149963, 6.1539998, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, -1333.3759766, 209.1759949, 6.1539998, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (7)
    CreateDynamicObject(979, -1387.1829834, 213.9290009, 7.0279999, 0.0000000, 0.0000000, 357.9841309); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1377.8540039, 213.5579987, 6.9940000, 0.0000000, 0.0000000, 357.9840088); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1368.4849854, 213.2220001, 6.9940000, 0.0000000, 0.0000000, 357.9840088); //object(sub_roadleft) (27)
    CreateDynamicObject(713, -1451.3060303, 292.8169861, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1430.8599854, 293.3569946, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(979, -1359.1359863, 212.8919983, 6.9940000, 0.0000000, 0.0000000, 357.9840088); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1349.7819824, 212.5709991, 6.9940000, 0.0000000, 0.0000000, 357.9840088); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1340.4100342, 212.2380066, 6.9940000, 0.0000000, 0.0000000, 357.9840088); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1331.0310059, 211.9069977, 6.9940000, 0.0000000, 0.0000000, 357.9840088); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1323.0959473, 215.1390076, 7.0240002, 0.0000000, 0.0000000, 45.9827881); //object(sub_roadleft) (27)
    CreateDynamicObject(978, -1479.1300049, 293.5899963, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1479.1240234, 302.9549866, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1479.1300049, 312.3169861, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1479.1409912, 321.6700134, 7.0279999, 0.0000000, 0.0000000, 269.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(978, -1475.1159668, 328.8280029, 7.0279999, 0.0000000, 0.0000000, 211.9890137); //object(sub_roadright) (20)
    CreateDynamicObject(979, -1390.2480469, 297.7210083, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1380.9050293, 297.7170105, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1371.5589600, 297.7210083, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1362.1999512, 297.7239990, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1352.8070068, 297.7330017, 7.0279999, 0.0000000, 0.0000000, 359.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(7894, -1346.6103516, 292.4853516, 6.7480001, 0.0000000, 0.0000000, 87.9895020); //object(vegascrashbar05) (3)
    CreateDynamicObject(979, -1353.2010498, 287.3280029, 6.9940000, 0.0000000, 0.0000000, 179.9890137); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1362.5749512, 287.3359985, 6.9940000, 0.0000000, 0.0000000, 179.9885254); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1371.9229736, 287.3389893, 6.9940000, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1381.3070068, 287.3290100, 7.0279999, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1390.4189453, 285.7340088, 7.0279999, 0.0000000, 0.0000000, 199.9835205); //object(sub_roadleft) (27)
    CreateDynamicObject(7952, -1407.9060059, 292.6130066, 6.9320002, 0.0000000, 0.0000000, 90.0000000); //object(miragehedge09) (1)
    CreateDynamicObject(7952, -1386.7850342, 292.6979980, 6.9320002, 0.0000000, 0.0000000, 90.0000000); //object(miragehedge09) (1)
    CreateDynamicObject(713, -1409.3499756, 292.9809875, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1388.0040283, 293.0190125, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1364.2939453, 292.9599915, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1345.9539795, 293.2579956, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(978, -1335.8699951, 326.2279968, 7.0279999, 0.0000000, 0.0000000, 120.0000000); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1331.7719727, 317.8259888, 7.0279999, 0.0000000, 0.0000000, 111.9981384); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1329.8590088, 308.7749939, 7.0279999, 0.0000000, 0.0000000, 91.9946289); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1328.0909424, 299.7739868, 6.9940000, 0.0000000, 0.0000000, 109.9939880); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1326.8339844, 290.8030090, 6.9940000, 0.0000000, 0.0000000, 85.9896240); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1329.0710449, 281.8720093, 6.9940000, 0.0000000, 0.0000000, 65.9844971); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1334.0909424, 274.1260071, 6.9940000, 0.0000000, 0.0000000, 47.9838867); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1341.2841797, 268.2988281, 6.9940000, 0.0000000, 0.0000000, 29.9816895); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1349.9619141, 265.1533203, 6.9940000, 0.0000000, 0.0000000, 9.9810791); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1359.2760010, 264.3410034, 6.9940000, 0.0000000, 0.0000000, 359.9810791); //object(sub_roadright) (2)
    CreateDynamicObject(978, -1368.6560059, 264.3510132, 6.9940000, 0.0000000, 0.0000000, 359.9780273); //object(sub_roadright) (2)
    CreateDynamicObject(7894, -1375.0379639, 259.1629944, 6.7150002, 0.0000000, 0.0000000, 270.0000000); //object(vegascrashbar05) (4)
    CreateDynamicObject(978, -1368.5880127, 253.8509979, 7.0240002, 0.0000000, 0.0000000, 179.9945068); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1359.2159424, 253.8580017, 7.0240002, 0.0000000, 0.0000000, 179.9945068); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1349.8630371, 253.8600006, 7.0240002, 0.0000000, 0.0000000, 179.9945068); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1342.1910400, 250.2949982, 7.0240002, 0.0000000, 0.0000000, 129.9926758); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1324.9659424, 249.4160004, 7.0240002, 0.0000000, 0.0000000, 289.9887695); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1328.1149902, 269.0820007, 7.0240002, 0.0000000, 0.0000000, 235.9887695); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1323.7629395, 277.2699890, 7.0240002, 0.0000000, 0.0000000, 247.9863281); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1321.8669434, 286.2290039, 7.0240002, 0.0000000, 0.0000000, 267.9833984); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1321.6999512, 295.5939941, 7.0240002, 0.0000000, 0.0000000, 269.9790039); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1321.6970215, 304.9660034, 7.0240002, 0.0000000, 0.0000000, 269.9790039); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1321.8580322, 314.3410034, 7.0240002, 0.0000000, 0.0000000, 271.9790039); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1322.8380127, 323.6149902, 7.0240002, 0.0000000, 0.0000000, 279.9790039); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1326.6450195, 331.7229919, 7.0170002, 0.0000000, 0.0000000, 309.9755859); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1333.7285156, 337.4589844, 7.0279999, 0.0000000, 0.0000000, 331.9683838); //object(sub_roadright) (26)
    CreateDynamicObject(713, -1371.2800293, 259.2789917, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1352.2900391, 258.7669983, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1334.4785156, 268.0595703, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1326.7089844, 280.4039917, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1324.9749756, 297.5289917, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1326.0107422, 314.4150391, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1334.1459961, 331.6119995, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(978, -1335.9870605, 243.4069977, 7.0240002, 0.0000000, 0.0000000, 133.9902344); //object(sub_roadright) (26)
    CreateDynamicObject(7894, -1327.1739502, 240.9750061, 6.7449999, 0.0000000, 0.0000000, 27.9949951); //object(vegascrashbar05) (3)
    CreateDynamicObject(978, -1327.0410156, 255.1380005, 7.0240002, 0.0000000, 0.0000000, 289.9841309); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1329.0939941, 260.8280029, 7.0240002, 0.0000000, 0.0000000, 289.9841309); //object(sub_roadright) (26)
    CreateDynamicObject(979, -1316.5820312, 221.8869934, 7.0240002, 0.0000000, 0.0000000, 45.9777832); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1310.0939941, 228.5970001, 7.0240002, 0.0000000, 0.0000000, 45.9777832); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1303.5799561, 235.3240051, 7.0240002, 0.0000000, 0.0000000, 45.9777832); //object(sub_roadleft) (27)
    CreateDynamicObject(713, -1328.4770508, 244.0980072, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(979, -1298.7430420, 240.3229980, 7.0240002, 0.0000000, 0.0000000, 45.9777832); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1295.3120117, 248.3809967, 7.0240002, 0.0000000, 0.0000000, 87.9777832); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.9770508, 257.7479858, 7.0240002, 0.0000000, 0.0000000, 87.9730225); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.6469727, 267.1119995, 7.0240002, 0.0000000, 0.0000000, 87.9730225); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.3110352, 276.4869995, 7.0240002, 0.0000000, 0.0000000, 87.9730225); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.1409912, 285.7919922, 7.0240002, 0.0000000, 0.0000000, 89.9730225); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.1369629, 295.1640015, 7.0240002, 0.0000000, 0.0000000, 89.9725342); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.1330566, 304.5490112, 7.0240002, 0.0000000, 0.0000000, 89.9725342); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.1330566, 313.9259949, 7.0240002, 0.0000000, 0.0000000, 89.9725342); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.1300049, 323.3020020, 7.0240002, 0.0000000, 0.0000000, 89.9725342); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.1240234, 332.6690063, 7.0240002, 0.0000000, 0.0000000, 89.9725342); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1294.1171875, 342.0292969, 7.0240002, 0.0000000, 0.0000000, 89.9670410); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1297.1240234, 350.2909851, 7.0240002, 0.0000000, 0.0000000, 129.9725342); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1303.2480469, 357.3340149, 7.0240002, 0.0000000, 0.0000000, 131.9682312); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1309.8060303, 363.9209900, 7.0170002, 0.0000000, 0.0000000, 137.9677734); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1316.9620361, 369.9289856, 7.0170002, 0.0000000, 0.0000000, 141.9663086); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1324.9726562, 374.5449219, 7.0170002, 0.0000000, 0.0000000, 157.9614258); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1334.0119629, 376.4679871, 7.0279999, 0.0000000, 0.0000000, 177.9614258); //object(sub_roadleft) (27)
    CreateDynamicObject(713, -1293.1560059, 250.5039978, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1293.1949463, 277.7380066, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1293.0920410, 307.6189880, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1293.0468750, 333.1191406, 6.1840000, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(1282, -1336.4060059, 366.7359924, 6.8820000, 0.0000000, 0.0000000, 280.0000000); //object(barrierm) (1)
    CreateDynamicObject(1282, -1334.6989746, 367.6470032, 6.8820000, 0.0000000, 0.0000000, 329.9981689); //object(barrierm) (2)
    CreateDynamicObject(1282, -1333.6949463, 369.3080139, 6.8759999, 0.0000000, 0.0000000, 329.9963379); //object(barrierm) (3)
    CreateDynamicObject(1282, -1332.6209717, 371.0509949, 6.8759999, 0.0000000, 0.0000000, 329.9963379); //object(barrierm) (4)
    CreateDynamicObject(1282, -1331.7540283, 372.7219849, 6.8759999, 0.0000000, 0.0000000, 329.9963379); //object(barrierm) (5)
    CreateDynamicObject(1282, -1330.8630371, 374.4939880, 6.8759999, 0.0000000, 0.0000000, 329.9963379); //object(barrierm) (6)
    CreateDynamicObject(978, -1469.2290039, 365.5480042, 7.0279999, 0.0000000, 0.0000000, 271.9683838); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1468.4229736, 356.2279968, 7.0279999, 0.0000000, 0.0000000, 277.9665527); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1465.4479980, 347.5369873, 7.0279999, 0.0000000, 0.0000000, 299.9665527); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1458.8690186, 341.4070129, 7.0279999, 0.0000000, 0.0000000, 333.9652100); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1458.8470459, 341.4010010, 8.3350000, 0.0000000, 0.0000000, 333.9624023); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1465.3959961, 347.5239868, 8.3350000, 0.0000000, 0.0000000, 299.9652100); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1468.3929443, 356.2160034, 8.3350000, 0.0000000, 0.0000000, 277.9650879); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1469.2080078, 365.4960022, 8.3350000, 0.0000000, 0.0000000, 271.9665527); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1425.6340332, 406.1659851, 7.0279999, 0.0000000, 0.0000000, 179.9683838); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1425.3759766, 406.1140137, 8.3350000, 0.0000000, 0.0000000, 179.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1425.5550537, 406.0880127, 9.6420002, 0.0000000, 0.0000000, 179.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1385.0849609, 406.1069946, 7.0279999, 0.0000000, 0.0000000, 179.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1384.8139648, 406.1220093, 8.3350000, 0.0000000, 0.0000000, 179.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1385.0050049, 406.1409912, 9.6420002, 0.0000000, 0.0000000, 179.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(979, -1384.8649902, 370.3689880, 7.0279999, 0.0000000, 0.0000000, 179.9614258); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1384.9720459, 370.4530029, 8.3350000, 0.0000000, 0.0000000, 179.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1385.0639648, 370.4809875, 9.6420002, 0.0000000, 0.0000000, 179.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1425.5000000, 370.5509949, 7.0279999, 0.0000000, 0.0000000, 179.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1425.2790527, 370.6080017, 8.3350000, 0.0000000, 0.0000000, 179.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1425.6199951, 370.5480042, 9.6420002, 0.0000000, 0.0000000, 179.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1425.3270264, 375.8030090, 7.0279999, 0.0000000, 0.0000000, 359.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1425.2879639, 375.7959900, 8.3350000, 0.0000000, 0.0000000, 359.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1425.6240234, 375.7940063, 9.6420002, 0.0000000, 0.0000000, 359.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1384.8509521, 375.7799988, 7.0279999, 0.0000000, 0.0000000, 359.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1384.7170410, 375.8129883, 8.3350000, 0.0000000, 0.0000000, 359.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1384.9809570, 375.7309875, 9.6420002, 0.0000000, 0.0000000, 359.9560547); //object(sub_roadleft) (27)
    CreateDynamicObject(978, -1469.3819580, 380.6730042, 7.0279999, 0.0000000, 0.0000000, 269.9665527); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1469.3759766, 390.0230103, 7.0279999, 0.0000000, 0.0000000, 269.9615479); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1466.2419434, 398.1820068, 7.0279999, 0.0000000, 0.0000000, 227.9615479); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1459.4339600, 404.5159912, 7.0279999, 0.0000000, 0.0000000, 217.9608154); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1469.3339844, 380.6990051, 8.3350000, 0.0000000, 0.0000000, 269.9615479); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1469.3360596, 390.0490112, 8.3350000, 0.0000000, 0.0000000, 269.9615479); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1466.1779785, 398.2290039, 8.3350000, 0.0000000, 0.0000000, 227.9608154); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1459.4060059, 404.5299988, 8.3350000, 0.0000000, 0.0000000, 217.9577637); //object(sub_roadright) (26)
    CreateDynamicObject(6959, -1338.2910156, 427.5849915, 3.6590004, 90.0000000, 0.0000000, 90.0000000); //object(vegasnbball1) (1)
    CreateDynamicObject(10763, -1243.9880371, 378.8940125, 38.8100014, 0.0000000, 0.0000000, 224.0000000); //object(controltower_sfse) (1)
    CreateDynamicObject(979, -1334.0689697, 379.2820129, 7.0279999, 0.0000000, 0.0000000, 1.9670410); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1325.1510010, 377.6749878, 7.0260000, 0.0000000, 0.0000000, 337.9665527); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1317.0550537, 373.1740112, 7.0260000, 0.0000000, 0.0000000, 323.9614258); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1309.6989746, 367.4240112, 7.0260000, 0.0000000, 0.0000000, 319.9593506); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1302.5209961, 361.3909912, 7.0260000, 0.0000000, 0.0000000, 319.9548340); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1295.3349609, 355.3519897, 7.0260000, 0.0000000, 0.0000000, 319.9548340); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1287.1130371, 352.2529907, 6.9899998, 0.0000000, 0.0000000, 359.9548340); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1277.7629395, 352.2319946, 6.9899998, 0.0000000, 0.0000000, 359.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1268.4060059, 352.2179871, 6.9899998, 0.0000000, 0.0000000, 359.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1259.1009521, 352.2099915, 6.9899998, 0.0000000, 0.0000000, 359.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1252.1099854, 356.2189941, 6.9899998, 0.0000000, 0.0000000, 59.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1248.5980225, 362.2560120, 6.9899998, 0.0000000, 0.0000000, 59.9468994); //object(sub_roadleft) (27)
    CreateDynamicObject(981, -1474.0849609, 391.6080017, 6.8880000, 0.0000000, 0.0000000, 272.0000000); //object(helix_barrier) (1)
    CreateDynamicObject(981, -1473.9300537, 355.3590088, 6.9880004, 0.0000000, 0.0000000, 271.9995117); //object(helix_barrier) (1)
    CreateDynamicObject(713, -1300.6190186, 357.1140137, 6.1859999, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1320.3380127, 374.3619995, 6.1859999, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1268.2010498, 350.8590088, 6.1500001, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1245.6500244, 356.4540100, 6.1500001, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(978, -1333.5129395, 401.7659912, 7.0339999, 0.0000000, 0.0000000, 179.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1324.1540527, 401.7789917, 7.0260000, 0.0000000, 0.0000000, 179.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1315.0610352, 400.1839905, 7.0260000, 0.0000000, 0.0000000, 159.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1306.2800293, 396.9760132, 7.0260000, 0.0000000, 0.0000000, 159.9664307); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1297.3940430, 394.0820007, 7.0260000, 0.0000000, 0.0000000, 163.9664307); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1288.7370605, 390.7770081, 6.9899998, 0.0000000, 0.0000000, 153.9654541); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1280.3149414, 386.6709900, 6.9899998, 0.0000000, 0.0000000, 153.9624023); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1271.8649902, 382.7179871, 6.9899998, 0.0000000, 0.0000000, 155.9624023); //object(sub_roadright) (26)
    CreateDynamicObject(979, -1245.1760254, 377.8750000, 6.9899998, 0.0000000, 0.0000000, 51.9468994); //object(sub_roadleft) (27)
    CreateDynamicObject(1262, -1525.6250000, 227.9179993, 13.2570000, 0.0000000, 0.0000000, 88.0000000); //object(mtraffic4) (1)
    CreateDynamicObject(1262, -1525.3769531, 214.2380066, 13.1759996, 0.0000000, 0.0000000, 87.9949951); //object(mtraffic4) (2)
    CreateDynamicObject(1262, -1525.3819580, 238.6320038, 12.9689999, 0.0000000, 0.0000000, 87.9949951); //object(mtraffic4) (3)
    CreateDynamicObject(1262, -1525.3819580, 252.0650024, 13.1859999, 0.0000000, 0.0000000, 87.9949951); //object(mtraffic4) (4)
    CreateDynamicObject(1262, -1514.6600342, 232.8959961, 11.5270004, 0.0000000, 0.0000000, 87.9949951); //object(mtraffic4) (5)
    CreateDynamicObject(1262, -1514.6590576, 232.8979950, 9.3389997, 0.0000000, 0.0000000, 87.9949951); //object(mtraffic4) (6)
    CreateDynamicObject(19124, -1262.9909668, 378.4649963, 6.7140002, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight4) (1)
    CreateDynamicObject(19124, -1248.2850342, 374.6229858, 6.7140002, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight4) (1)
    CreateDynamicObject(978, -1469.2409668, 365.5350037, 9.6420002, 0.0000000, 0.0000000, 271.9665527); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1468.4360352, 356.2130127, 9.6420002, 0.0000000, 0.0000000, 277.9650879); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1465.4589844, 347.5079956, 9.6420002, 0.0000000, 0.0000000, 299.9652100); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1458.8909912, 341.3980103, 9.6420002, 0.0000000, 0.0000000, 333.9624023); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1469.3330078, 380.6950073, 9.6420002, 0.0000000, 0.0000000, 269.9615479); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1469.3280029, 390.0580139, 9.6420002, 0.0000000, 0.0000000, 269.9615479); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1466.1920166, 398.2250061, 9.6420002, 0.0000000, 0.0000000, 227.9608154); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1459.4000244, 404.5589905, 9.6420002, 0.0000000, 0.0000000, 217.9577637); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1274.5159912, 399.0350037, 6.9899998, 0.0000000, 0.0000000, 353.9670410); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1283.8430176, 400.0140076, 6.9899998, 0.0000000, 0.0000000, 353.9630127); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1293.1879883, 401.0299988, 7.0260000, 0.0000000, 0.0000000, 353.9630127); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1302.4820557, 402.0050049, 7.0260000, 0.0000000, 0.0000000, 353.9630127); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1309.7800293, 406.4230042, 7.0260000, 0.0000000, 0.0000000, 303.9630127); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1313.5400391, 414.8580017, 7.0260000, 0.0000000, 0.0000000, 283.9587402); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1315.1579590, 424.0570068, 7.0260000, 0.0000000, 0.0000000, 275.9581299); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1315.4870605, 433.4100037, 7.0260000, 0.0000000, 0.0000000, 267.9545898); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1312.3139648, 441.6470032, 7.0279999, 0.0000000, 0.0000000, 229.9510498); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1305.2089844, 447.5589905, 7.0279999, 0.0000000, 0.0000000, 209.9493408); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1296.4959717, 450.5459900, 7.0279999, 0.0000000, 0.0000000, 187.9487305); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1287.1729736, 451.1789856, 7.0279999, 0.0000000, 0.0000000, 179.9486084); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1277.8280029, 451.1700134, 7.0279999, 0.0000000, 0.0000000, 179.9450684); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1268.4720459, 451.1669922, 7.0279999, 0.0000000, 0.0000000, 179.9450684); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1259.1429443, 451.1659851, 7.0279999, 0.0000000, 0.0000000, 179.9450684); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1242.1920166, 402.8959961, 6.9899998, 0.0000000, 0.0000000, 89.9450684); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1242.1590576, 412.2720032, 6.9899998, 0.0000000, 0.0000000, 89.9395752); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1243.7640381, 421.3670044, 6.9899998, 0.0000000, 0.0000000, 109.9395752); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1247.9599609, 429.6510010, 6.9899998, 0.0000000, 0.0000000, 123.9346924); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1255.2650146, 433.5679932, 6.9899998, 0.0000000, 0.0000000, 179.9312744); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1264.6409912, 433.5840149, 6.9899998, 0.0000000, 0.0000000, 179.9285889); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1273.9880371, 433.6040039, 6.9899998, 0.0000000, 0.0000000, 179.9285889); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1283.3399658, 433.6159973, 6.9899998, 0.0000000, 0.0000000, 179.9285889); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1292.6929932, 433.9320068, 7.0279999, 0.0000000, 0.0000000, 175.9285889); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1259.1899414, 461.5549927, 7.0279999, 0.0000000, 0.0000000, 359.9285889); //object(sub_roadright) (26)
    CreateDynamicObject(7894, -1252.7580566, 456.3420105, 6.7480001, 0.0000000, 0.0000000, 89.9895020); //object(vegascrashbar05) (3)
    CreateDynamicObject(979, -1292.7010498, 434.8800049, 7.0260000, 0.0000000, 0.0000000, 7.9548340); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1283.4029541, 435.5220032, 7.0209999, 0.0000000, 0.0000000, 359.9541016); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1274.0369873, 435.5060120, 7.0209999, 0.0000000, 0.0000000, 359.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1264.6629639, 435.4880066, 7.0209999, 0.0000000, 0.0000000, 359.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1255.3089600, 435.4790039, 7.0209999, 0.0000000, 0.0000000, 359.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1245.9300537, 435.4639893, 7.0209999, 0.0000000, 0.0000000, 359.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(1238, -1296.9370117, 433.5310059, 6.5040002, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (1)
    CreateDynamicObject(1238, -1298.3819580, 433.8059998, 6.5060000, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (2)
    CreateDynamicObject(1238, -1299.0930176, 435.1300049, 6.5060000, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (3)
    CreateDynamicObject(1238, -1297.9539795, 435.8280029, 6.5040002, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (4)
    CreateDynamicObject(1238, -1296.5639648, 435.7009888, 6.5040002, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (5)
    CreateDynamicObject(1238, -1295.1860352, 435.6080017, 6.5040002, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (6)
    CreateDynamicObject(1238, -1294.2530518, 434.9769897, 6.5619998, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (7)
    CreateDynamicObject(1238, -1274.2590332, 382.9400024, 6.4679999, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (8)
    CreateDynamicObject(1238, -1273.3110352, 381.7109985, 6.4679999, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (9)
    CreateDynamicObject(1238, -1272.2850342, 380.4989929, 6.4679999, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (10)
    CreateDynamicObject(1238, -1271.1409912, 379.1640015, 6.4679999, 0.0000000, 0.0000000, 0.0000000); //object(trafficcone) (11)
    CreateDynamicObject(978, -1268.5069580, 461.5679932, 7.0279999, 0.0000000, 0.0000000, 359.9230957); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1277.8640137, 461.5669861, 7.0209999, 0.0000000, 0.0000000, 359.9230957); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1287.2299805, 461.5729980, 7.0209999, 0.0000000, 0.0000000, 359.9230957); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1296.5889893, 461.5910034, 7.0260000, 0.0000000, 0.0000000, 359.9230957); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1305.9649658, 461.6000061, 7.0279999, 0.0000000, 0.0000000, 359.9230957); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1314.9139404, 459.8489990, 7.0279999, 0.0000000, 0.0000000, 21.9230957); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1323.5839844, 456.3450012, 7.0279999, 0.0000000, 0.0000000, 21.9177246); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1329.0579834, 454.1449890, 7.0279999, 0.0000000, 0.0000000, 21.9177246); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1338.0939941, 451.9089966, 7.0209999, 0.0000000, 0.0000000, 5.9177246); //object(sub_roadright) (26)
    CreateDynamicObject(979, -1237.2840576, 437.9410095, 7.0209999, 0.0000000, 0.0000000, 31.9505615); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1230.7030029, 444.3169861, 7.0279999, 0.0000000, 0.0000000, 55.9482422); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1228.2440186, 452.8680115, 7.0279999, 0.0000000, 0.0000000, 91.9478760); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1229.3680420, 462.1059875, 7.0279999, 0.0000000, 0.0000000, 101.9445801); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1233.4499512, 470.1789856, 7.0279999, 0.0000000, 0.0000000, 131.9421387); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1241.0500488, 475.1359863, 7.0209999, 0.0000000, 0.0000000, 161.9403076); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1249.8890381, 477.3580017, 7.0209999, 0.0000000, 0.0000000, 169.9384766); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1259.0579834, 478.5039978, 7.0209999, 0.0000000, 0.0000000, 175.9365234); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1268.3270264, 478.8439941, 7.0209999, 0.0000000, 0.0000000, 179.9350586); //object(sub_roadleft) (27)
    CreateDynamicObject(981, -1270.7039795, 456.2709961, 6.9880004, 0.0000000, 0.0000000, 0.0000000); //object(helix_barrier) (4)
    CreateDynamicObject(981, -1302.4320068, 456.3559875, 6.9880004, 0.0000000, 0.0000000, 0.0000000); //object(helix_barrier) (5)
    CreateDynamicObject(981, -1321.3089600, 439.1229858, 6.9880004, 0.0000000, 0.0000000, 270.0000000); //object(helix_barrier) (6)
    CreateDynamicObject(981, -1321.4980469, 419.2019958, 6.9860001, 0.0000000, 0.0000000, 270.0000000); //object(helix_barrier) (7)
    CreateDynamicObject(10838, -1281.3609619, 416.1719971, 22.3020000, 0.0000000, 0.0000000, 0.0000000); //object(airwelcomesign_sfse) (1)
    CreateDynamicObject(3458, -1590.7860107, 285.6839905, 7.7090001, 0.0000000, 0.0000000, 0.0000000); //object(vgncarshade1) (1)
    CreateDynamicObject(978, -1576.1250000, 283.5700073, 7.0279999, 0.0000000, 0.0000000, 179.9835205); //object(sub_roadright) (16)
    CreateDynamicObject(979, -1277.6899414, 478.8519897, 7.0279999, 0.0000000, 0.0000000, 179.9340820); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1287.0269775, 478.8680115, 7.0279999, 0.0000000, 0.0000000, 179.9340820); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1296.4169922, 478.8729858, 7.0279999, 0.0000000, 0.0000000, 179.9340820); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1305.7600098, 478.8829956, 7.0279999, 0.0000000, 0.0000000, 179.9340820); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1315.1190186, 478.8980103, 7.0279999, 0.0000000, 0.0000000, 179.9340820); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1324.4720459, 478.9179993, 7.0209999, 0.0000000, 0.0000000, 179.9340820); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1333.8160400, 478.9309998, 7.0209999, 0.0000000, 0.0000000, 179.9340820); //object(sub_roadleft) (27)
    CreateDynamicObject(979, -1343.1359863, 478.9349976, 7.0279999, 0.0000000, 0.0000000, 179.9340820); //object(sub_roadleft) (27)
    CreateDynamicObject(3569, -1355.5439453, 480.0320129, 8.5009995, 0.0000000, 0.0000000, 91.0000000); //object(lasntrk3) (1)
    CreateDynamicObject(3569, -1373.1459961, 479.7529907, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (2)
    CreateDynamicObject(3569, -1390.6870117, 479.5079956, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (3)
    CreateDynamicObject(3569, -1408.1710205, 479.2609863, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (4)
    CreateDynamicObject(3569, -1425.5269775, 479.0190125, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (5)
    CreateDynamicObject(3569, -1442.8909912, 478.7820129, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (6)
    CreateDynamicObject(3569, -1460.5439453, 478.5289917, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (7)
    CreateDynamicObject(3569, -1478.0860596, 478.2810059, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (8)
    CreateDynamicObject(3569, -1495.4990234, 478.0079956, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (9)
    CreateDynamicObject(3569, -1513.0260010, 477.7600098, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (10)
    CreateDynamicObject(3569, -1530.6779785, 477.5039978, 8.5009995, 0.0000000, 0.0000000, 90.9997559); //object(lasntrk3) (11)
    CreateDynamicObject(10838, -1568.5240479, 408.7640076, 22.0399990, 0.0000000, 0.0000000, 50.0000000); //object(airwelcomesign_sfse) (2)
    CreateDynamicObject(10838, -1631.7650146, 284.8070068, 22.5330009, 0.0000000, 0.0000000, 89.9987793); //object(airwelcomesign_sfse) (3)
    CreateDynamicObject(3569, -1546.5059814, 470.1879883, 8.5009995, 0.0000000, 0.0000000, 138.9997559); //object(lasntrk3) (12)
    CreateDynamicObject(713, -1276.2500000, 392.5840149, 6.1500001, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1305.7719727, 400.4270020, 6.1859999, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1236.1579590, 404.5870056, 6.1500001, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1241.3879395, 425.8599854, 6.1500001, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1231.2399902, 438.8980103, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1224.4040527, 454.8710022, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1234.7889404, 476.0419922, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1260.7609863, 480.9259949, 6.1810002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1291.5389404, 480.7260132, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1330.4210205, 481.1929932, 6.1810002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(979, -1650.8459473, 280.1679993, 7.0279999, 0.0000000, 0.0000000, 273.9746094); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1556.8659668, 453.8420105, 7.0279999, 0.0000000, 0.0000000, 231.9743652); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1562.6469727, 446.4570007, 7.0279999, 0.0000000, 0.0000000, 231.9708252); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1568.2750244, 439.0180054, 7.0200000, 0.0000000, 0.0000000, 233.9708252); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1573.8979492, 431.5559998, 7.0279999, 0.0000000, 0.0000000, 231.9703369); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1579.6259766, 424.2149963, 7.0279999, 0.0000000, 0.0000000, 231.9653320); //object(sub_roadleft) (22)
    CreateDynamicObject(713, -1578.0240479, 429.0599976, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1562.2249756, 450.9179993, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(978, -1549.8070068, 400.2590027, 7.0279999, 0.0000000, 0.0000000, 21.9177246); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1540.8669434, 401.8210144, 7.0279999, 0.0000000, 0.0000000, 357.9177246); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1531.5019531, 401.6499939, 7.0279999, 0.0000000, 0.0000000, 359.9125977); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1525.2399902, 401.6369934, 7.0279999, 0.0000000, 0.0000000, 359.9121094); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1558.2840576, 393.4700012, 7.0279999, 0.0000000, 0.0000000, 49.9121094); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1564.2900391, 386.3399963, 7.0279999, 0.0000000, 0.0000000, 49.9108887); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1570.2879639, 379.2189941, 7.0279999, 0.0000000, 0.0000000, 49.9108887); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1576.9909668, 372.7909851, 7.0279999, 0.0000000, 0.0000000, 37.9108887); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1584.3559570, 367.0509949, 7.0279999, 0.0000000, 0.0000000, 37.9083252); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1592.1800537, 361.9890137, 7.0279999, 0.0000000, 0.0000000, 27.9083252); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1600.8990479, 359.0010071, 7.0200000, 0.0000000, 0.0000000, 9.9052734); //object(sub_roadright) (26)
    CreateDynamicObject(978, -1610.9859619, 289.7560120, 7.0219998, 0.0000000, 0.0000000, 63.9041748); //object(sub_roadright) (26)
    CreateDynamicObject(979, -1585.8170166, 416.6879883, 7.0279999, 0.0000000, 0.0000000, 231.9653320); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1591.5909424, 409.3290100, 7.0279999, 0.0000000, 0.0000000, 231.9653320); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1597.7259521, 402.2820129, 7.0279999, 0.0000000, 0.0000000, 225.9653320); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1604.2419434, 395.5639954, 7.0279999, 0.0000000, 0.0000000, 225.9613037); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1610.6230469, 388.7380066, 7.0279999, 0.0000000, 0.0000000, 227.9613037); //object(sub_roadleft) (22)
    CreateDynamicObject(713, -1533.0930176, 396.9200134, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1558.2819824, 390.4249878, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1578.6710205, 369.0459900, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1604.9079590, 397.7279968, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1622.3709717, 378.1919861, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(979, -1616.8719482, 381.8099976, 7.0279999, 0.0000000, 0.0000000, 227.9608154); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1623.4870605, 375.2290039, 7.0200000, 0.0000000, 0.0000000, 221.9608154); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1630.4630127, 368.9540100, 7.0279999, 0.0000000, 0.0000000, 221.9567871); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1637.4329834, 362.6919861, 7.0279999, 0.0000000, 0.0000000, 221.9567871); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1650.3239746, 290.9809875, 7.0279999, 0.0000000, 0.0000000, 269.9567871); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1650.3170166, 300.2940063, 7.0279999, 0.0000000, 0.0000000, 269.9560547); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1650.3110352, 309.6359863, 7.0279999, 0.0000000, 0.0000000, 269.9560547); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1650.3020020, 318.9580078, 7.0279999, 0.0000000, 0.0000000, 269.9560547); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1650.3010254, 328.2980042, 7.0279999, 0.0000000, 0.0000000, 269.9560547); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1650.3029785, 337.6119995, 7.0279999, 0.0000000, 0.0000000, 269.9560547); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1649.4870605, 344.6449890, 7.0279999, 0.0000000, 0.0000000, 259.9560547); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1642.7619629, 356.8370056, 7.0219998, 0.0000000, 0.0000000, 231.9549561); //object(sub_roadleft) (22)
    CreateDynamicObject(979, -1645.7700195, 352.9549866, 7.0279999, 0.0000000, 0.0000000, 231.9543457); //object(sub_roadleft) (22)
    CreateDynamicObject(713, -1645.3100586, 355.5459900, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1651.2559814, 339.7149963, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1650.9379883, 322.3739929, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1651.6949463, 299.1229858, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1651.7110596, 277.5509949, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(713, -1643.2619629, 261.1960144, 6.1880002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (9)
    CreateDynamicObject(18783, -1573.1829834, 307.9809875, 3.7100000, 0.0000000, 0.0000000, 0.0000000); //object(funboxtop1) (1)
    //Дрифт NEW!!!
    AddStaticVehicle(477, 2289.10009766, 1517.40002441, 10.60000038, 0.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, 2285.69995117, 1517.40002441, 10.60000038, 0.00000000, -1, -1); //ZR-350
    AddStaticVehicle(477, 2282.39990234, 1517.50000000, 10.60000038, 0.00000000, -1, -1); //ZR-350
    AddStaticVehicle(562, 2272.39990234, 1504.80004883, 10.60000038, 268.00000000, -1, 1); //Elegy
    AddStaticVehicle(562, 2281.00000000, 1504.59997559, 10.60000038, 267.99499512, -1, 1); //Elegy
    AddStaticVehicle(562, 2288.60009766, 1504.50000000, 10.60000038, 267.99499512, -1, 1); //Elegy
    AddStaticVehicle(572, 2319.39990234, 1516.40002441, 10.50000000, 0.00000000, -1, -1); //Mower
    AddStaticVehicle(475, 2325.89990234, 1518.30004883, 10.69999981, 0.00000000, -1, -1); //Sabre
    AddStaticVehicle(475, 2329.30004883, 1518.30004883, 10.69999981, 0.00000000, -1, -1); //Sabre
    AddStaticVehicle(488, 2354.69995117, 1413.09997559, 47.70000076, 44.00000000, -1, -1); //News Chopper
    AddStaticVehicle(477, 2341.19995117, 1424.90002441, 42.59999847, 90.00000000, -1, -1); //ZR-350
    AddStaticVehicle(562, 2352.89990234, 1403.90002441, 42.59999847, 92.00000000, -1, -1); //Elegy
    AddStaticVehicle(562, 2353.10009766, 1400.19995117, 42.59999847, 91.99951172, -1, -1); //Elegy
    AddStaticVehicle(562, 2353.10009766, 1396.59997559, 42.59999847, 91.99951172, -1, -1); //Elegy
    AddStaticVehicle(411, 2304.30004883, 1412.80004883, 42.59999847, 270.00000000, -1, -1); //Infernus
    AddStaticVehicle(411, 2304.39990234, 1416.19995117, 42.59999847, 270.00000000, -1, -1); //Infernus
    CreateDynamicObject(1237, 2301.69995117, 1514.69995117, 10.00000000, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (4)
    CreateDynamicObject(3578, 2302.39990234, 1383.50000000, 10.60000038, 0.00000000, 0.00000000, 179.00000000); //object(dockbarr1_la) (1)
    CreateDynamicObject(3578, 2312.30004883, 1383.50000000, 10.60000038, 0.00000000, 0.00000000, 180.99475098); //object(dockbarr1_la) (2)
    CreateDynamicObject(983, 2302.10009766, 1520.00000000, 10.69999981, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (1)
    CreateDynamicObject(983, 2298.89990234, 1523.19995117, 10.69999981, 0.00000000, 0.00000000, 89.99499512); //object(fenceshit3) (6)
    CreateDynamicObject(18275, 2312.60009766, 1514.80004883, 12.10000038, 0.00000000, 0.00000000, 0.00000000); //object(cw2_mtbfinish) (1)
    CreateDynamicObject(18275, 2305.60009766, 1514.80004883, 12.10000038, 0.00000000, 0.00000000, 0.00000000); //object(cw2_mtbfinish) (2)
    CreateDynamicObject(983, 2316.19995117, 1518.30004883, 10.50000000, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (7)
    CreateDynamicObject(983, 2316.19995117, 1519.90002441, 10.50000000, 0.00000000, 0.00000000, 0.00000000); //object(fenceshit3) (8)
    CreateDynamicObject(983, 2319.39990234, 1523.19995117, 10.50000000, 0.00000000, 0.00000000, 270.00000000); //object(fenceshit3) (9)
    CreateDynamicObject(1237, 2316.39990234, 1514.80004883, 9.80000019, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (12)
    CreateDynamicObject(1262, 2309.80004883, 1515.30004883, 14.10000038, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (1)
    CreateDynamicObject(1262, 2309.30004883, 1515.30004883, 14.10000038, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (2)
    CreateDynamicObject(1262, 2308.80004883, 1515.30004883, 14.10000038, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (3)
    CreateDynamicObject(1262, 2302.69995117, 1515.30004883, 14.10000038, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (4)
    CreateDynamicObject(1262, 2315.69995117, 1515.30004883, 14.10000038, 0.00000000, 0.00000000, 0.00000000); //object(mtraffic4) (5)
    CreateDynamicObject(1215, 2312.39990234, 1384.09997559, 10.50000000, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (1)
    CreateDynamicObject(1215, 2297.19995117, 1384.00000000, 10.39999962, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (2)
    CreateDynamicObject(1238, 2309.10009766, 1516.00000000, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (1)
    CreateDynamicObject(1238, 2309.19995117, 1517.40002441, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (2)
    CreateDynamicObject(1238, 2309.30004883, 1518.80004883, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (3)
    CreateDynamicObject(1238, 2309.39990234, 1520.09997559, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (4)
    CreateDynamicObject(1238, 2309.50000000, 1521.40002441, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (5)
    CreateDynamicObject(1238, 2309.60009766, 1522.69995117, 10.10000038, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (6)
    CreateDynamicObject(3578, 2302.80004883, 1502.50000000, 17.00000000, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (3)
    CreateDynamicObject(3578, 2312.19995117, 1502.30004883, 17.00000000, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (4)
    CreateDynamicObject(3578, 2302.30004883, 1404.19995117, 23.39999962, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (5)
    CreateDynamicObject(3578, 2311.60009766, 1404.00000000, 23.39999962, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (6)
    CreateDynamicObject(3578, 2312.30004883, 1502.30004883, 29.79999924, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (7)
    CreateDynamicObject(3578, 2303.19995117, 1502.50000000, 29.79999924, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (8)
    CreateDynamicObject(3578, 2311.69995117, 1404.09997559, 36.20000076, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (9)
    CreateDynamicObject(3578, 2302.69995117, 1404.30004883, 36.20000076, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (10)
    CreateDynamicObject(3578, 2351.60009766, 1427.59997559, 42.59999847, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (11)
    CreateDynamicObject(3578, 2341.39990234, 1427.80004883, 42.59999847, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (12)
    CreateDynamicObject(3578, 2303.30004883, 1428.40002441, 42.59999847, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (13)
    CreateDynamicObject(3578, 2313.60009766, 1428.19995117, 42.59999847, 0.00000000, 0.00000000, 178.99475098); //object(dockbarr1_la) (14)
    CreateDynamicObject(18275, 2322.19995117, 1428.30004883, 44.09999847, 0.00000000, 0.00000000, 0.00000000); //object(cw2_mtbfinish) (3)
    CreateDynamicObject(18275, 2332.69995117, 1428.19995117, 44.09999847, 0.00000000, 0.00000000, 0.00000000); //object(cw2_mtbfinish) (4)
    CreateDynamicObject(1238, 2312.50000000, 1394.80004883, 10.30000019, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (7)
    CreateDynamicObject(1238, 2315.00000000, 1392.59997559, 10.30000019, 0.00000000, 0.00000000, 0.00000000); //object(trafficcone) (8)
    CreateDynamicObject(983, 2326.00000000, 1428.59997559, 42.50000000, 90.00000000, 0.00000000, 268.00000000); //object(fenceshit3) (10)
    CreateDynamicObject(983, 2328.60009766, 1428.59997559, 42.50000000, 90.00000000, 0.00000000, 267.99499512); //object(fenceshit3) (11)
    CreateDynamicObject(983, 2327.30004883, 1428.59997559, 42.50000000, 90.00000000, 0.00000000, 267.99499512); //object(fenceshit3) (12)
    CreateDynamicObject(1215, 2337.80004883, 1427.90002441, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (3)
    CreateDynamicObject(1215, 2340.19995117, 1427.80004883, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (4)
    CreateDynamicObject(1215, 2342.50000000, 1427.80004883, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (5)
    CreateDynamicObject(1215, 2344.50000000, 1427.80004883, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (6)
    CreateDynamicObject(1215, 2346.69995117, 1427.69995117, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (7)
    CreateDynamicObject(1215, 2348.80004883, 1427.69995117, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (8)
    CreateDynamicObject(1215, 2351.10009766, 1427.69995117, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (9)
    CreateDynamicObject(1215, 2353.50000000, 1427.59997559, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (10)
    CreateDynamicObject(1215, 2356.50000000, 1427.50000000, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (11)
    CreateDynamicObject(1215, 2315.69995117, 1428.19995117, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (12)
    CreateDynamicObject(1215, 2313.30004883, 1428.19995117, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (13)
    CreateDynamicObject(1215, 2311.10009766, 1428.19995117, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (14)
    CreateDynamicObject(1215, 2308.89990234, 1428.30004883, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (15)
    CreateDynamicObject(1215, 2306.60009766, 1428.40002441, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (16)
    CreateDynamicObject(1215, 2304.50000000, 1428.40002441, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (17)
    CreateDynamicObject(1215, 2301.39990234, 1428.50000000, 43.90000153, 0.00000000, 0.00000000, 0.00000000); //object(bollardlight) (18)
    CreateDynamicObject(13363, 2341.60009766, 1415.80004883, 42.50000000, 0.00000000, 0.00000000, 0.00000000); //object(ce_photoblock) (1)
    CreateDynamicObject(12951, 2304.39990234, 1423.30004883, 41.79999924, 0.00000000, 0.00000000, 0.00000000); //object(sw_shopflat01) (1)
    CreateDynamicObject(12951, 2304.00000000, 1406.90002441, 41.79999924, 0.00000000, 0.00000000, 0.00000000); //object(sw_shopflat01) (2)
    CreateDynamicObject(8167, 2309.89990234, 1397.90002441, 43.00000000, 0.00000000, 0.00000000, 0.00000000); //object(apgate1_vegs01) (1)
    CreateDynamicObject(8167, 2309.89990234, 1390.50000000, 43.00000000, 0.00000000, 0.00000000, 0.00000000); //object(apgate1_vegs01) (2)
    CreateDynamicObject(8167, 2309.89990234, 1386.80004883, 43.00000000, 0.00000000, 0.00000000, 0.00000000); //object(apgate1_vegs01) (3)
    //База Street-Racer
    CreateDynamicObject(980, -1480.27, 678.62, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.26, 667.17, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.28, 655.73, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.27, 644.26, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.23, 632.81, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.27, 621.36, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.30, 609.92, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.33, 598.58, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.32, 587.15, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.46, 575.92, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.42, 564.54, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.43, 553.15, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.40, 541.84, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.36, 530.35, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.33, 518.85, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.39, 509.79, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1480.25, 498.28, 0.28, 90.00, 90.00, 0.00);
    CreateDynamicObject(980, -1482.95, 498.40, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1482.98, 509.82, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.01, 532.66, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.00, 521.19, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.06, 543.99, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.06, 555.10, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.08, 566.41, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.07, 577.75, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.08, 589.15, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.09, 600.58, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.08, 612.00, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.06, 623.40, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.06, 634.78, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.05, 646.25, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.56, 656.63, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1483.01, 657.69, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.52, 667.93, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.50, 678.61, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.53, 645.16, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.51, 633.68, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.49, 622.21, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.51, 610.76, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.50, 599.30, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.49, 587.80, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.65, 576.46, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.65, 564.96, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.67, 553.52, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.68, 542.06, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.69, 530.58, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.70, 519.14, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.71, 503.78, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1477.72, 507.69, 2.92, 0.00, 180.00, 90.00);
    CreateDynamicObject(980, -1471.98, 498.02, 2.92, 0.00, 180.00, 180.00);
    CreateDynamicObject(980, -1460.53, 498.00, 2.92, 0.00, 180.00, 180.00);
    CreateDynamicObject(980, -1449.07, 498.01, 2.92, 0.00, 180.00, 180.00);
    CreateDynamicObject(980, -1439.95, 500.60, -3.60, 0.00, 90.00, 90.50);
    CreateDynamicObject(980, -1442.48, 498.02, 2.92, 0.00, 180.00, 180.00);
    CreateDynamicObject(980, -1471.76, 495.32, 0.28, 90.00, 180.00, 0.00);
    CreateDynamicObject(980, -1477.20, 492.70, 2.92, 0.00, 180.00, 180.00);
    CreateDynamicObject(980, -1460.27, 495.33, 0.28, 90.00, 180.00, 0.00);
    CreateDynamicObject(980, -1465.74, 492.71, 2.92, 0.00, 180.00, 180.00);
    CreateDynamicObject(980, -1448.81, 495.28, 0.28, 90.00, 180.00, 0.00);
    CreateDynamicObject(980, -1454.27, 492.71, 2.92, 0.00, 180.00, 180.00);
    CreateDynamicObject(980, -1442.79, 492.74, 2.92, 0.00, 180.00, 180.00);
    CreateDynamicObject(980, -1437.48, 495.44, 0.28, 90.00, 180.00, 0.00);
    CreateDynamicObject(980, -1439.88, 490.01, -3.09, 0.00, 90.00, 89.59);
    CreateDynamicObject(980, -1334.64, 487.32, 12.58, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1409.17, 515.26, 11.52, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1420.63, 515.31, 11.52, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1422.70, 512.92, 15.17, 55.00, 0.00, 0.00);
    CreateDynamicObject(980, -1411.24, 512.93, 15.17, 55.00, 0.00, 0.00);
    CreateDynamicObject(980, -1399.95, 512.80, 15.17, 55.00, 0.00, 0.00);
    CreateDynamicObject(980, -1324.22, 515.15, 11.69, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1461.46, 516.67, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1450.04, 516.68, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1438.59, 516.68, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1427.15, 516.68, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1415.75, 516.67, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1404.31, 516.66, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1393.01, 516.66, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1381.71, 516.65, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1370.29, 516.64, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1358.87, 516.64, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1347.53, 516.63, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1336.09, 516.64, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1324.61, 516.63, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1313.25, 516.64, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1301.82, 516.62, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1290.42, 516.62, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1278.96, 516.62, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1267.93, 516.60, 18.18, 0.00, 0.00, 0.00);
    CreateDynamicObject(980, -1256.70, 515.13, 18.18, 0.00, 0.00, 345.24);
    CreateDynamicObject(980, -1248.44, 508.60, 18.18, 0.00, 0.00, 298.63);
    CreateDynamicObject(980, -1246.09, 497.84, 18.15, 0.00, 0.00, 266.19);
    CreateDynamicObject(980, -1251.44, 489.22, 18.15, 0.00, 0.00, 210.05);
    CreateDynamicObject(980, -1262.13, 486.19, 18.14, 0.00, 0.00, 181.53);
    CreateDynamicObject(980, -1273.57, 486.02, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1285.06, 486.02, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1296.55, 486.02, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1308.00, 486.03, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1319.48, 486.02, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1330.93, 486.01, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1342.41, 486.03, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1353.88, 486.04, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1365.37, 486.05, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1376.85, 486.07, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1388.31, 486.04, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1399.81, 486.03, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1411.28, 486.04, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1422.76, 486.03, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1434.27, 486.04, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1445.71, 486.03, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1457.24, 486.03, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1461.61, 486.04, 18.16, 0.00, 0.00, 180.00);
    CreateDynamicObject(980, -1467.35, 491.76, 18.16, 0.00, 0.00, 90.00);
    CreateDynamicObject(980, -1467.33, 503.26, 18.16, 0.00, 0.00, 90.00);
    CreateDynamicObject(980, -1467.34, 510.97, 18.16, 0.00, 0.00, 90.00);
    CreateDynamicObject(6296, -1415.25, 494.56, 19.22, 0.00, 0.00, 90.82);
    CreateDynamicObject(3279, -1313.55, 494.92, 17.23, 0.00, 0.00, 0.00);
    CreateVehicle(560, -1249.7539, 504.2935, 17.5419, 90.3827, -1, -1, 100);
    CreateVehicle(560, -1249.9893, 498.6303, 17.5419, 90.3827, -1, -1, 100);
    CreateVehicle(560, -1260.3959, 493.5284, 17.5419, 90.3827, -1, -1, 100);
    CreateVehicle(560, -1260.2709, 501.4317, 17.5419, 90.3827, -1, -1, 100);
    CreateVehicle(560, -1259.6613, 509.9924, 17.5419, 90.3827, -1, -1, 100);
    CreateVehicle(522, -1267.0499, 508.9457, 17.7329, 90.0000, -1, -1, 100);
    CreateVehicle(522, -1267.0680, 501.3333, 17.7329, 90.0000, -1, -1, 100);
    CreateVehicle(522, -1266.8383, 493.9991, 17.7329, 90.0000, -1, -1, 100);
    CreateVehicle(487, -1454.4282, 503.1894, 18.5092, 260.0000, -1, -1, 100);
    //Клуб в ЛС
    CreateDynamicObject(17951, 1530.9322509766, -1451.2888183594, 13.098667144775, 0, 0, 269.97802734375);
    CreateDynamicObject(1491, 1534.0129394531, -1451.2937011719, 12.3828125, 0, 0, 0.6427001953125);
    CreateDynamicObject(17951, 1538.6025390625, -1451.2509765625, 13.107677459717, 0, 0, 270.02197265625);
    CreateDynamicObject(17951, 1537.0662841797, -1451.2788085938, 16.649044036865, 0, 0, 270.02197265625);
    CreateDynamicObject(17951, 1530.9201660156, -1451.30078125, 16.549133300781, 0, 0, 269.97802734375);
    CreateDynamicObject(14838, 6511.3198242188, -1267.5880126953, 18.383651733398, 0, 0, 288.42651367188);
    CreateDynamicObject(16151, 6498.9438476563, -1273.7852783203, 17.15446472168, 0, 0, 198.42321777344);
    CreateDynamicObject(16151, 1538.7067871094, -1472.7033691406, 8.7969837188721, 0, 0, 0);
    CreateDynamicObject(1950, 1537.6552734375, -1472.0170898438, 9.5905694961548, 0, 0, 0);
    CreateDynamicObject(1950, 1538.0772705078, -1469.42578125, 9.5905694961548, 0, 0, 0);
    CreateDynamicObject(1950, 1537.7406005859, -1470.0867919922, 9.5905694961548, 0, 0, 0);
    CreateDynamicObject(1950, 1537.8044433594, -1471.1361083984, 9.5905694961548, 0, 0, 0);
    CreateDynamicObject(18102, 1524.7774658203, -1478.7554931641, 14.935424804688, 0, 0, 0);
    CreateDynamicObject(18102, 1524.7275390625, -1472.166015625, 14.935424804688, 0, 0, 0);
    CreateDynamicObject(18102, 1524.6798095703, -1465.8516845703, 14.935424804688, 0, 0, 0);
    CreateDynamicObject(1583, 1534.6395263672, -1451.2091064453, 14.874815940857, 0, 0, 0);
    CreateDynamicObject(1584, 1533.4788818359, -1451.2026367188, 12.3828125, 0, 0, 0);
    CreateDynamicObject(1585, 1536.1630859375, -1451.1815185547, 12.3828125, 0, 0, 0);
    CreateDynamicObject(14829, 1527.2855224609, -1466.9437255859, 10.695915222168, 0, 0, 0);
    CreateObject(14622, 1508.1062011719, -1469.3149414063, 10.870109558105, 0, 0, 0);
    CreateObject(3749, 1534.7525634766, -1451.2025146484, 18.062887191772, 0, 0, 0);
    CreateObject(1583, 1534.63671875, -1451.294921875, 14.874815940857, 0, 0, 0);
    CreateDynamicObject(1585, 1536.1616210938, -1451.2451171875, 12.3828125, 0, 0, 0);
    CreateDynamicObject(1584, 1533.4776611328, -1451.2397460938, 12.3828125, 0, 0, 0);
    CreateDynamicObject(2780, 1512.6115722656, -1478.9952392578, 7.5091395378113, 0, 0, 0);
    CreateDynamicObject(2780, 1511.6315917969, -1460.1340332031, 7.5091395378113, 0, 0, 0);
    CreateDynamicObject(3461, 1532.7567138672, -1451.1182861328, 13.957823753357, 0, 0, 0);
    CreateDynamicObject(3461, 1536.8848876953, -1451.1202392578, 13.957823753357, 0, 0, 0);
    CreateDynamicObject(1211, 1548.6500244141, -1446.1370849609, 13.031094551086, 0, 0, 0);
    CreateDynamicObject(1215, 1544.7490234375, -1446.0181884766, 13.111198425293, 0, 0, 0);
    CreateDynamicObject(1215, 1524.7504882813, -1446.0328369141, 13.111198425293, 0, 0, 0);
    CreateDynamicObject(1775, 1529.0159912109, -1467.8424072266, 9.5729389190674, 0, 0, 0);
    CreateDynamicObject(2222, 1537.82421875, -1473.7064208984, 9.470760345459, 0, 0, 0);
    CreateDynamicObject(2453, 1538.4090576172, -1476.0671386719, 9.8007545471191, 0, 0, 0);
    CreateDynamicObject(2768, 1537.7873535156, -1472.2628173828, 9.4447174072266, 0, 0, 0);
    CreateDynamicObject(3528, 1510.1149902344, -1475.1350097656, 11.389183044434, 0, 0, 358.61999511719);
    CreateDynamicObject(3528, 1510.0106201172, -1465.7006835938, 11.389183044434, 0, 0, 358.61572265625);
    CreateDynamicObject(1892, 1534.2635498047, -1451.6252441406, 12.366130828857, 0, 0, 0);
    CreateDynamicObject(1753, 1527.7351074219, -1458.2852783203, 8.4591407775879, 0, 0, 269.96179199219);
    CreateDynamicObject(1753, 1527.7255859375, -1461.4929199219, 8.4591407775879, 0, 0, 269.96154785156);
    CreateDynamicObject(1753, 1527.7276611328, -1464.7333984375, 8.4591407775879, 0, 0, 269.96154785156);
    CreateDynamicObject(14820, 1511.5926513672, -1469.8178710938, 9.3908929824829, 0, 0, 269.95367431641);
    CreateDynamicObject(1737, 1511.5789794922, -1469.3101806641, 8.5, 0, 0, 269.84509277344);
    CreateDynamicObject(2229, 1511.3022460938, -1472.4108886719, 8.478401184082, 0, 0, 90.428070068359);
    CreateDynamicObject(2229, 1511.2966308594, -1471.9040527344, 8.478401184082, 0, 0, 90.837188720703);
    CreateDynamicObject(2229, 1511.4097900391, -1467.1567382813, 8.478401184082, 0, 0, 89.225036621094);
    CreateDynamicObject(2229, 1511.4227294922, -1466.6669921875, 8.478401184082, 0, 0, 90.144989013672);
    CreateDynamicObject(2229, 1520.9249267578, -1478.2938232422, 11.840213775635, 10.163269042969, 0, 90.837188720703);
    CreateDynamicObject(2229, 1521.1888427734, -1468.9677734375, 11.840213775635, 10.162353515625, 0, 90.8349609375);
    CreateDynamicObject(2229, 1520.8642578125, -1459.7733154297, 11.840213775635, 10.162353515625, 0, 90.8349609375);
    CreateDynamicObject(2231, 1511.1815185547, -1472.4343261719, 9.874321937561, 0, 0, 115.10202026367);
    CreateDynamicObject(2231, 1511.5095214844, -1466.830078125, 9.874321937561, 0, 0, 61.741088867188);
    CreateDynamicObject(2232, 1512.2197265625, -1466.5726318359, 9.0978755950928, 0, 0, 67.398620605469);
    CreateDynamicObject(2232, 1512.1733398438, -1473.1407470703, 9.0978755950928, 0, 0, 108.9465637207);
    CreateDynamicObject(2226, 1511.5048828125, -1469.8638916016, 8.4640550613403, 0, 0, 90.227478027344);
    //Дрифт трасса №1
    CreateDynamicObject(5191, -1434.70, 1145.40, 8.90, 0.00, 0.00, 90.00);
    CreateDynamicObject(5191, -1549.40, 1145.70, -4.40, 13.24, 0.00, 269.99);
    CreateDynamicObject(5184, -1305.90, 1150.30, 33.50, 0.00, 0.00, 0.00);
    CreateDynamicObject(5184, -1351.80, 1192.50, 33.40, 0.00, 0.00, 270.00);
    CreateDynamicObject(5184, -1388.60, 1230.10, 33.50, 0.00, 0.00, 359.99);
    CreateDynamicObject(5184, -1434.70, 1272.40, 33.40, 0.00, 0.00, 269.99);
    CreateDynamicObject(5184, -1512.50, 1349.90, 33.50, 0.00, 0.00, 359.98);
    CreateDynamicObject(5184, -1512.50, 1432.00, 33.50, 0.00, 0.00, 179.97);
    CreateDynamicObject(5184, -1382.70, 1431.90, 33.50, 0.00, 0.00, 179.96);
    CreateDynamicObject(5184, -1252.90, 1431.90, 33.50, 0.00, 0.00, 179.95);
    CreateDynamicObject(5184, -1183.40, 1389.70, 33.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(5184, -1224.70, 1256.90, 33.50, 0.00, 0.00, 89.95);
    CreateDynamicObject(5184, -1267.00, 1150.30, 33.50, 0.00, 0.00, 359.95);
    CreateDynamicObject(5184, -1224.80, 1196.00, 33.50, 0.00, 0.00, 89.94);
    CreateDynamicObject(6959, -1556.80, 1351.10, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(6959, -1556.80, 1391.10, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1556.80, 1431.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(5184, -1512.50, 1373.70, 33.40, 0.00, 0.00, 179.98);
    CreateDynamicObject(6959, -1515.50, 1351.10, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(6959, -1474.20, 1351.10, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(6959, -1515.50, 1391.10, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1474.20, 1391.10, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1515.50, 1431.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1474.20, 1431.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1432.90, 1431.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1432.90, 1391.10, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1432.90, 1351.10, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(6959, -1432.90, 1311.20, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1391.70, 1431.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1350.40, 1431.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1309.10, 1431.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1267.80, 1431.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1226.50, 1431.10, 14.80, 0.00, 0.00, 359.98);
    CreateDynamicObject(6959, -1185.20, 1431.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(5184, -1229.40, 1432.00, 33.50, 0.00, 0.00, 179.95);
    CreateDynamicObject(6959, -1185.20, 1391.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1432.90, 1271.30, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1432.90, 1231.30, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1391.60, 1231.30, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1350.30, 1231.30, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1350.30, 1191.30, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(6959, -1350.20, 1151.40, 14.80, 0.00, 0.00, 179.99);
    CreateDynamicObject(5184, -1225.70, 1309.80, 33.40, 0.00, 0.00, 359.95);
    CreateDynamicObject(6959, -1185.20, 1351.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1185.20, 1311.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(5184, -1183.40, 1355.90, 33.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(6959, -1226.50, 1311.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1226.50, 1271.00, 14.80, 0.00, 0.00, 359.98);
    CreateDynamicObject(6959, -1226.50, 1231.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1226.40, 1191.30, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1226.50, 1151.30, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1267.80, 1151.30, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1309.10, 1151.30, 14.80, 0.00, 0.00, 359.98);
    CreateDynamicObject(6959, -1309.00, 1191.30, 14.80, 0.00, 0.00, 359.98);
    CreateDynamicObject(6959, -1309.00, 1231.30, 14.80, 0.00, 0.00, 359.98);
    CreateDynamicObject(6959, -1267.70, 1191.30, 14.80, 0.00, 0.00, 359.98);
    CreateDynamicObject(6959, -1267.80, 1231.30, 14.80, 0.00, 0.00, 359.98);
    CreateDynamicObject(6959, -1267.80, 1271.30, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1267.80, 1311.30, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1309.10, 1271.20, 14.80, 0.00, 0.00, 359.98);
    CreateDynamicObject(6959, -1350.40, 1271.20, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1391.70, 1271.20, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1391.70, 1311.20, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1391.60, 1351.20, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1391.60, 1391.20, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1350.40, 1311.20, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1350.30, 1351.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1350.30, 1391.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1309.00, 1391.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1267.70, 1391.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1226.40, 1391.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1226.30, 1351.00, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1267.60, 1351.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1308.90, 1351.10, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(6959, -1309.10, 1311.20, 14.80, 0.00, 0.00, 359.99);
    CreateDynamicObject(982, -1370.80, 1168.10, 15.40, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1370.80, 1198.50, 15.40, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1370.80, 1193.70, 15.40, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1383.80, 1211.30, 15.40, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1409.40, 1211.30, 15.40, 0.00, 0.00, 89.99);
    CreateDynamicObject(982, -1435.00, 1211.30, 15.40, 0.00, 0.00, 89.99);
    CreateDynamicObject(982, -1439.80, 1211.30, 15.40, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1452.60, 1224.10, 15.40, 0.00, 0.00, 179.99);
    CreateDynamicObject(982, -1452.60, 1249.70, 15.40, 0.00, 0.00, 179.99);
    CreateDynamicObject(982, -1452.60, 1275.30, 15.40, 0.00, 0.00, 179.99);
    CreateDynamicObject(982, -1452.60, 1300.90, 15.40, 0.00, 0.00, 179.99);
    CreateDynamicObject(982, -1452.60, 1318.50, 15.40, 0.00, 0.00, 179.99);
    CreateDynamicObject(982, -1465.40, 1331.30, 15.40, 0.00, 0.00, 269.99);
    CreateDynamicObject(982, -1491.00, 1331.30, 15.40, 0.00, 0.00, 269.98);
    CreateDynamicObject(982, -1516.60, 1331.30, 15.40, 0.00, 0.00, 269.98);
    CreateDynamicObject(982, -1542.20, 1331.30, 15.40, 0.00, 0.00, 269.98);
    CreateDynamicObject(982, -1564.60, 1331.30, 15.40, 0.00, 0.00, 269.98);
    CreateDynamicObject(982, -1577.40, 1344.10, 15.40, 0.00, 0.00, 179.98);
    CreateDynamicObject(982, -1577.40, 1369.70, 15.40, 0.00, 0.00, 179.98);
    CreateDynamicObject(982, -1577.40, 1395.30, 15.40, 0.00, 0.00, 179.98);
    CreateDynamicObject(982, -1577.40, 1420.90, 15.40, 0.00, 0.00, 179.98);
    CreateDynamicObject(982, -1577.40, 1438.50, 15.40, 0.00, 0.00, 179.98);
    CreateDynamicObject(982, -1564.60, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1539.00, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1513.40, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1487.80, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1462.20, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1436.60, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1411.00, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1385.40, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1359.80, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1334.20, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1308.60, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1283.00, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1257.40, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1231.80, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1206.20, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1180.60, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1177.40, 1451.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1164.60, 1438.50, 15.40, 0.00, 0.00, 359.98);
    CreateDynamicObject(982, -1164.60, 1412.90, 15.40, 0.00, 0.00, 359.98);
    CreateDynamicObject(982, -1164.60, 1387.30, 15.40, 0.00, 0.00, 359.98);
    CreateDynamicObject(982, -1164.60, 1361.70, 15.40, 0.00, 0.00, 359.98);
    CreateDynamicObject(982, -1164.60, 1336.10, 15.40, 0.00, 0.00, 359.98);
    CreateDynamicObject(982, -1164.60, 1310.50, 15.40, 0.00, 0.00, 359.98);
    CreateDynamicObject(982, -1164.60, 1304.10, 15.40, 0.00, 0.00, 359.98);
    CreateDynamicObject(982, -1177.40, 1291.30, 15.40, 0.00, 0.00, 269.98);
    CreateDynamicObject(982, -1193.40, 1291.30, 15.40, 0.00, 0.00, 269.97);
    CreateDynamicObject(982, -1206.20, 1278.50, 15.40, 0.00, 0.00, 359.97);
    CreateDynamicObject(982, -1206.20, 1252.90, 15.40, 0.00, 0.00, 359.97);
    CreateDynamicObject(982, -1206.20, 1227.30, 15.40, 0.00, 0.00, 359.97);
    CreateDynamicObject(982, -1206.20, 1201.70, 15.40, 0.00, 0.00, 359.97);
    CreateDynamicObject(982, -1206.20, 1176.10, 15.40, 0.00, 0.00, 359.97);
    CreateDynamicObject(982, -1206.20, 1150.50, 15.40, 0.00, 0.00, 359.97);
    CreateDynamicObject(982, -1206.20, 1144.10, 15.40, 0.00, 0.00, 359.97);
    CreateDynamicObject(982, -1219.00, 1131.30, 15.40, 0.00, 0.00, 269.97);
    CreateDynamicObject(982, -1244.60, 1131.30, 15.40, 0.00, 0.00, 269.97);
    CreateDynamicObject(982, -1270.20, 1131.30, 15.40, 0.00, 0.00, 269.97);
    CreateDynamicObject(982, -1295.80, 1131.30, 15.40, 0.00, 0.00, 269.96);
    CreateDynamicObject(982, -1321.40, 1131.30, 15.40, 0.00, 0.00, 269.97);
    CreateDynamicObject(982, -1347.00, 1131.30, 15.40, 0.00, 0.00, 269.97);
    CreateDynamicObject(982, -1358.20, 1131.30, 15.40, 0.00, 0.00, 269.97);
    CreateDynamicObject(983, -1371.00, 1134.50, 15.40, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1358.10, 1211.30, 15.40, 0.00, 0.00, 89.99);
    CreateDynamicObject(982, -1332.50, 1211.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1306.90, 1211.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1269.30, 1211.30, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1294.10, 1198.50, 15.40, 0.00, 0.00, 179.96);
    CreateDynamicObject(982, -1294.10, 1172.90, 15.40, 0.00, 0.00, 179.96);
    CreateDynamicObject(982, -1294.10, 1166.50, 15.40, 0.00, 0.00, 179.96);
    CreateDynamicObject(982, -1306.90, 1153.70, 15.40, 0.00, 0.00, 269.96);
    CreateDynamicObject(982, -1370.80, 1166.50, 15.40, 0.00, 0.00, 179.96);
    CreateDynamicObject(982, -1358.00, 1153.70, 15.40, 0.00, 0.00, 269.96);
    CreateDynamicObject(982, -1350.00, 1153.70, 15.40, 0.00, 0.00, 269.96);
    CreateDynamicObject(1696, -1297.10, 1157.30, 14.70, 340.75, 0.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1163.40, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1169.50, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1175.60, 14.70, 340.74, 80.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1181.70, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1187.80, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1193.90, 14.70, 340.74, 80.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1199.90, 14.70, 340.74, 80.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1206.00, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1297.10, 1208.70, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1208.70, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1202.60, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1196.50, 14.70, 340.74, 80.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1190.40, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1184.30, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1178.20, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1172.10, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1166.00, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1159.90, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1302.50, 1157.30, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1157.30, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1163.40, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1169.50, 14.70, 340.74, 80.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1175.60, 14.70, 340.74, 80.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1181.70, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1187.80, 14.70, 340.74, 80.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1193.90, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1200.00, 14.70, 340.74, 80.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1206.10, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(1696, -1307.90, 1208.70, 14.70, 340.75, 96.00, 0.00);
    CreateDynamicObject(970, -1310.30, 1155.80, 15.30, 0.00, 0.00, 90.00);
    CreateDynamicObject(970, -1310.30, 1159.90, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1164.00, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1168.10, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1172.20, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1176.30, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1192.80, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1196.90, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1201.00, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1205.10, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(970, -1310.30, 1209.20, 15.30, 0.00, 0.00, 89.99);
    CreateDynamicObject(780, -1303.00, 1203.60, 14.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(780, -1303.00, 1203.60, 14.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(782, -1302.30, 1166.20, 14.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(782, -1302.30, 1166.20, 14.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(782, -1302.50, 1184.70, 14.90, 0.00, 0.00, 90.00);
    CreateDynamicObject(9682, -1376.70, 1167.60, 1.30, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1343.60, 1153.70, 15.40, 0.00, 0.00, 269.96);
    CreateDynamicObject(8843, -1333.50, 1195.90, 14.80, 1.00, 0.00, 90.00);
    CreateDynamicObject(8843, -1358.40, 1188.90, 14.80, 1.00, 0.00, 179.99);
    CreateDynamicObject(8843, -1349.90, 1166.30, 14.80, 1.00, 0.00, 269.99);
    CreateDynamicObject(8843, -1327.30, 1167.40, 14.80, 1.00, 0.00, 180.00);
    CreateDynamicObject(8843, -1322.10, 1154.80, 14.80, 1.00, 0.00, 359.98);
    CreateDynamicObject(982, -1243.70, 1211.30, 15.40, 0.00, 0.00, 89.97);
    CreateDynamicObject(982, -1218.10, 1211.30, 15.40, 0.00, 0.00, 89.97);
    CreateDynamicObject(6910, -1246.60, 1182.60, 19.50, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1282.10, 1198.50, 15.40, 0.00, 0.00, 179.97);
    CreateDynamicObject(982, -1282.10, 1182.50, 15.40, 0.00, 0.00, 179.96);
    CreateDynamicObject(5401, -1277.20, 1195.50, 16.80, 0.00, 0.00, 280.00);
    CreateDynamicObject(5401, -1277.10, 1188.00, 16.80, 0.00, 0.00, 279.99);
    CreateDynamicObject(982, -1282.10, 1144.10, 15.40, 0.00, 0.00, 179.96);
    CreateDynamicObject(1673, -1309.60, 1221.00, 18.50, 0.00, 0.00, 270.00);
    CreateDynamicObject(1673, -1310.50, 1221.70, 18.50, 0.00, 0.00, 89.99);
    CreateDynamicObject(982, -1322.90, 1231.40, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1297.30, 1231.40, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1348.50, 1231.40, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1374.10, 1231.40, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1399.70, 1231.40, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(983, -1415.50, 1232.50, 15.50, 0.00, 0.00, 70.00);
    CreateDynamicObject(983, -1420.60, 1236.10, 15.50, 0.00, 0.00, 39.99);
    CreateDynamicObject(983, -1423.20, 1241.70, 15.50, 0.00, 0.00, 9.98);
    CreateDynamicObject(983, -1423.20, 1248.00, 15.50, 0.00, 0.00, 349.98);
    CreateDynamicObject(983, -1420.60, 1253.60, 15.50, 0.00, 0.00, 319.97);
    CreateDynamicObject(983, -1415.50, 1257.10, 15.50, 0.00, 0.00, 288.97);
    CreateDynamicObject(983, -1409.30, 1257.60, 15.50, 0.00, 0.00, 259.96);
    CreateDynamicObject(983, -1403.70, 1255.00, 15.50, 0.00, 0.00, 229.95);
    CreateDynamicObject(983, -1398.80, 1250.90, 15.50, 0.00, 0.00, 229.94);
    CreateDynamicObject(983, -1393.90, 1246.80, 15.50, 0.00, 0.00, 229.94);
    CreateDynamicObject(983, -1389.00, 1242.70, 15.50, 0.00, 0.00, 229.94);
    CreateDynamicObject(983, -1384.10, 1238.60, 15.50, 0.00, 0.00, 229.94);
    CreateDynamicObject(983, -1378.90, 1234.90, 15.50, 0.00, 0.00, 239.19);
    CreateDynamicObject(983, -1430.10, 1211.90, 15.50, 0.00, 0.00, 79.98);
    CreateDynamicObject(983, -1436.20, 1213.50, 15.50, 0.00, 0.00, 69.97);
    CreateDynamicObject(983, -1442.00, 1216.20, 15.50, 0.00, 0.00, 59.97);
    CreateDynamicObject(983, -1447.20, 1219.80, 15.50, 0.00, 0.00, 49.97);
    CreateDynamicObject(983, -1451.10, 1224.80, 15.50, 0.00, 0.00, 25.96);
    CreateDynamicObject(983, -1452.00, 1260.80, 15.50, 0.00, 0.00, 349.95);
    CreateDynamicObject(983, -1449.80, 1266.70, 15.50, 0.00, 0.00, 327.95);
    CreateDynamicObject(983, -1445.30, 1271.00, 15.50, 0.00, 0.00, 299.95);
    CreateDynamicObject(983, -1439.50, 1273.70, 15.50, 0.00, 0.00, 289.94);
    CreateDynamicObject(983, -1433.50, 1275.90, 15.50, 0.00, 0.00, 289.93);
    CreateDynamicObject(983, -1427.50, 1278.10, 15.50, 0.00, 0.00, 289.93);
    CreateDynamicObject(983, -1421.30, 1279.70, 15.50, 0.00, 0.00, 279.18);
    CreateDynamicObject(983, -1414.90, 1280.20, 15.50, 0.00, 0.00, 269.93);
    CreateDynamicObject(983, -1408.50, 1280.20, 15.50, 0.00, 0.00, 269.93);
    CreateDynamicObject(983, -1402.10, 1279.60, 15.50, 0.00, 0.00, 259.43);
    CreateDynamicObject(983, -1396.20, 1277.40, 15.50, 0.00, 0.00, 239.68);
    CreateDynamicObject(983, -1391.00, 1273.70, 15.50, 0.00, 0.00, 229.67);
    CreateDynamicObject(983, -1391.00, 1273.70, 15.50, 0.00, 0.00, 229.91);
    CreateDynamicObject(983, -1386.10, 1269.60, 15.50, 0.00, 0.00, 229.90);
    CreateDynamicObject(983, -1381.20, 1265.50, 15.50, 0.00, 0.00, 229.90);
    CreateDynamicObject(983, -1376.30, 1261.40, 15.50, 0.00, 0.00, 229.90);
    CreateDynamicObject(983, -1371.10, 1257.70, 15.50, 0.00, 0.00, 239.90);
    CreateDynamicObject(983, -1365.30, 1255.00, 15.50, 0.00, 0.00, 249.90);
    CreateDynamicObject(983, -1359.10, 1253.40, 15.50, 0.00, 0.00, 261.15);
    CreateDynamicObject(983, -1352.70, 1252.90, 15.50, 0.00, 0.00, 270.14);
    CreateDynamicObject(983, -1373.10, 1232.40, 15.50, 0.00, 0.00, 255.19);
    CreateDynamicObject(982, -1348.50, 1231.40, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1336.80, 1252.80, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(982, -1319.20, 1252.80, 15.40, 0.00, 0.00, 89.98);
    CreateDynamicObject(969, -1291.20, 1238.00, 0.00, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1303.10, 1252.80, 15.40, 0.00, 0.00, 270.00);
    CreateDynamicObject(983, -1296.90, 1253.90, 15.40, 0.00, 0.00, 289.99);
    CreateDynamicObject(983, -1291.40, 1257.10, 15.40, 0.00, 0.00, 309.99);
    CreateDynamicObject(983, -1287.40, 1261.90, 15.40, 0.00, 0.00, 329.98);
    CreateDynamicObject(983, -1285.20, 1267.80, 15.40, 0.00, 0.00, 349.97);
    CreateDynamicObject(983, -1285.20, 1274.10, 15.40, 0.00, 0.00, 9.96);
    CreateDynamicObject(983, -1287.40, 1280.00, 15.40, 0.00, 0.00, 30.45);
    CreateDynamicObject(983, -1291.80, 1284.40, 15.40, 0.00, 0.00, 59.94);
    CreateDynamicObject(983, -1297.70, 1286.60, 15.40, 0.00, 0.00, 79.93);
    CreateDynamicObject(983, -1304.00, 1286.60, 15.40, 0.00, 0.00, 99.93);
    CreateDynamicObject(983, -1309.90, 1284.50, 15.40, 0.00, 0.00, 119.92);
    CreateDynamicObject(983, -1314.70, 1280.50, 15.40, 0.00, 0.00, 139.90);
    CreateDynamicObject(983, -1318.40, 1275.30, 15.40, 0.00, 0.00, 149.90);
    CreateDynamicObject(983, -1321.60, 1269.80, 15.40, 0.00, 0.00, 149.89);
    CreateDynamicObject(983, -1324.80, 1264.30, 15.40, 0.00, 0.00, 149.89);
    CreateDynamicObject(983, -1328.50, 1259.10, 15.40, 0.00, 0.00, 139.39);
    CreateDynamicObject(983, -1333.40, 1255.10, 15.40, 0.00, 0.00, 117.88);
    CreateDynamicObject(983, -1339.40, 1253.20, 15.40, 0.00, 0.00, 97.37);
    CreateDynamicObject(983, -1287.90, 1232.50, 15.40, 0.00, 0.00, 289.99);
    CreateDynamicObject(983, -1282.10, 1235.20, 15.40, 0.00, 0.00, 299.99);
    CreateDynamicObject(983, -1276.90, 1238.80, 15.40, 0.00, 0.00, 309.98);
    CreateDynamicObject(983, -1272.40, 1243.30, 15.40, 0.00, 0.00, 319.97);
    CreateDynamicObject(983, -1268.70, 1248.50, 15.40, 0.00, 0.00, 329.97);
    CreateDynamicObject(983, -1266.00, 1254.30, 15.40, 0.00, 0.00, 339.96);
    CreateDynamicObject(983, -1264.30, 1260.50, 15.40, 0.00, 0.00, 349.96);
    CreateDynamicObject(983, -1263.70, 1266.80, 15.40, 0.00, 0.00, 359.95);
    CreateDynamicObject(983, -1263.70, 1273.20, 15.40, 0.00, 0.00, 359.95);
    CreateDynamicObject(983, -1263.70, 1279.60, 15.40, 0.00, 0.00, 359.95);
    CreateDynamicObject(983, -1264.20, 1285.90, 15.40, 0.00, 0.00, 9.68);
    CreateDynamicObject(983, -1265.80, 1292.10, 15.40, 0.00, 0.00, 19.67);
    CreateDynamicObject(983, -1268.50, 1297.90, 15.40, 0.00, 0.00, 29.67);
    CreateDynamicObject(983, -1272.50, 1302.70, 15.40, 0.00, 0.00, 49.66);
    CreateDynamicObject(983, -1277.70, 1306.40, 15.40, 0.00, 0.00, 59.65);
    CreateDynamicObject(983, -1283.40, 1309.10, 15.40, 0.00, 0.00, 69.64);
    CreateDynamicObject(983, -1289.50, 1310.80, 15.40, 0.00, 0.00, 79.64);
    CreateDynamicObject(983, -1295.90, 1311.40, 15.40, 0.00, 0.00, 89.64);
    CreateDynamicObject(983, -1302.30, 1311.40, 15.40, 0.00, 0.00, 89.64);
    CreateDynamicObject(983, -1308.70, 1311.50, 15.40, 0.00, 0.00, 89.64);
    CreateDynamicObject(983, -1315.10, 1311.00, 15.40, 0.00, 0.00, 99.64);
    CreateDynamicObject(983, -1321.30, 1309.40, 15.40, 0.00, 0.00, 109.64);
    CreateDynamicObject(983, -1326.80, 1306.30, 15.40, 0.00, 0.00, 129.63);
    CreateDynamicObject(983, -1330.90, 1301.50, 15.40, 0.00, 0.00, 149.62);
    CreateDynamicObject(983, -1334.20, 1296.00, 15.40, 0.00, 0.00, 149.61);
    CreateDynamicObject(983, -1337.40, 1290.50, 15.40, 0.00, 0.00, 149.61);
    CreateDynamicObject(983, -1340.60, 1285.00, 15.40, 0.00, 0.00, 149.61);
    CreateDynamicObject(983, -1343.80, 1279.50, 15.40, 0.00, 0.00, 149.61);
    CreateDynamicObject(983, -1348.20, 1275.20, 15.40, 0.00, 0.00, 119.61);
    CreateDynamicObject(983, -1354.10, 1274.10, 15.40, 0.00, 0.00, 79.60);
    CreateDynamicObject(983, -1359.70, 1276.70, 15.40, 0.00, 0.00, 49.60);
    CreateDynamicObject(982, -1370.30, 1288.60, 15.40, 0.00, 0.00, 39.98);
    CreateDynamicObject(982, -1384.90, 1309.50, 15.40, 0.00, 0.00, 29.97);
    CreateDynamicObject(982, -1399.90, 1286.90, 15.40, 0.00, 0.00, 29.97);
    CreateDynamicObject(982, -1412.70, 1309.10, 15.40, 0.00, 0.00, 29.97);
    CreateDynamicObject(982, -1397.70, 1331.70, 15.40, 0.00, 0.00, 29.97);
    CreateDynamicObject(983, -1421.20, 1322.60, 15.40, 0.00, 0.00, 39.60);
    CreateDynamicObject(983, -1425.70, 1327.10, 15.40, 0.00, 0.00, 49.59);
    CreateDynamicObject(983, -1430.90, 1330.80, 15.40, 0.00, 0.00, 59.59);
    CreateDynamicObject(983, -1436.60, 1333.50, 15.40, 0.00, 0.00, 69.58);
    CreateDynamicObject(983, -1442.70, 1335.20, 15.40, 0.00, 0.00, 79.57);
    CreateDynamicObject(983, -1449.00, 1335.80, 15.40, 0.00, 0.00, 89.57);
    CreateDynamicObject(982, -1464.80, 1338.10, 15.40, 0.00, 0.00, 79.96);
    CreateDynamicObject(983, -1406.10, 1345.20, 15.40, 0.00, 0.00, 39.58);
    CreateDynamicObject(983, -1410.60, 1349.80, 15.40, 0.00, 0.00, 49.57);
    CreateDynamicObject(983, -1415.80, 1353.50, 15.40, 0.00, 0.00, 59.56);
    CreateDynamicObject(983, -1421.60, 1356.30, 15.40, 0.00, 0.00, 69.56);
    CreateDynamicObject(983, -1427.70, 1358.00, 15.40, 0.00, 0.00, 79.55);
    CreateDynamicObject(983, -1434.00, 1359.20, 15.40, 0.00, 0.00, 79.55);
    CreateDynamicObject(983, -1440.30, 1359.80, 15.40, 0.00, 0.00, 89.55);
    CreateDynamicObject(982, -1456.10, 1362.00, 15.40, 0.00, 0.00, 79.96);
    CreateDynamicObject(982, -1481.30, 1366.50, 15.40, 0.00, 0.00, 79.95);
    CreateDynamicObject(982, -1490.00, 1342.60, 15.40, 0.00, 0.00, 79.95);
    CreateDynamicObject(983, -1497.00, 1369.30, 15.40, 0.00, 0.00, 79.55);
    CreateDynamicObject(983, -1503.10, 1371.00, 15.40, 0.00, 0.00, 69.55);
    CreateDynamicObject(983, -1508.80, 1373.70, 15.40, 0.00, 0.00, 59.54);
    CreateDynamicObject(983, -1514.00, 1377.40, 15.40, 0.00, 0.00, 49.53);
    CreateDynamicObject(983, -1518.50, 1382.00, 15.40, 0.00, 0.00, 39.52);
    CreateDynamicObject(983, -1521.60, 1387.50, 15.40, 0.00, 0.00, 19.52);
    CreateDynamicObject(983, -1522.60, 1393.70, 15.40, 0.00, 0.00, 359.51);
    CreateDynamicObject(983, -1521.40, 1399.90, 15.40, 0.00, 0.00, 339.52);
    CreateDynamicObject(983, -1518.20, 1405.40, 15.40, 0.00, 0.00, 319.51);
    CreateDynamicObject(983, -1513.10, 1408.90, 15.40, 0.00, 0.00, 289.50);
    CreateDynamicObject(983, -1506.90, 1409.90, 15.40, 0.00, 0.00, 269.50);
    CreateDynamicObject(983, -1501.00, 1408.20, 15.40, 0.00, 0.00, 239.49);
    CreateDynamicObject(983, -1496.20, 1404.10, 15.40, 0.00, 0.00, 219.49);
    CreateDynamicObject(983, -1493.10, 1398.60, 15.40, 0.00, 0.00, 199.48);
    CreateDynamicObject(983, -1491.50, 1392.40, 15.40, 0.00, 0.00, 189.47);
    CreateDynamicObject(983, -1490.50, 1386.10, 15.40, 0.00, 0.00, 189.47);
    CreateDynamicObject(983, -1488.90, 1380.00, 15.40, 0.00, 0.00, 199.47);
    CreateDynamicObject(983, -1485.80, 1374.50, 15.40, 0.00, 0.00, 219.46);
    CreateDynamicObject(983, -1481.30, 1370.00, 15.40, 0.00, 0.00, 230.71);
    CreateDynamicObject(983, -1475.90, 1366.80, 15.40, 0.00, 0.00, 248.95);
    CreateDynamicObject(983, -1469.80, 1364.80, 15.40, 0.00, 0.00, 254.94);
    CreateDynamicObject(983, -1505.70, 1345.40, 15.40, 0.00, 0.00, 79.52);
    CreateDynamicObject(983, -1511.80, 1347.10, 15.40, 0.00, 0.00, 69.51);
    CreateDynamicObject(983, -1517.60, 1349.80, 15.40, 0.00, 0.00, 59.51);
    CreateDynamicObject(983, -1522.80, 1353.50, 15.40, 0.00, 0.00, 49.50);
    CreateDynamicObject(983, -1527.30, 1358.10, 15.40, 0.00, 0.00, 39.50);
    CreateDynamicObject(983, -1531.00, 1363.40, 15.40, 0.00, 0.00, 29.50);
    CreateDynamicObject(983, -1534.10, 1369.00, 15.40, 0.00, 0.00, 29.49);
    CreateDynamicObject(983, -1536.80, 1374.80, 15.40, 0.00, 0.00, 19.49);
    CreateDynamicObject(983, -1538.90, 1380.80, 15.40, 0.00, 0.00, 19.48);
    CreateDynamicObject(983, -1540.50, 1387.00, 15.40, 0.00, 0.00, 9.48);
    CreateDynamicObject(983, -1541.60, 1393.30, 15.40, 0.00, 0.00, 9.48);
    CreateDynamicObject(984, -1542.20, 1402.90, 15.40, 0.00, 0.00, 0.00);
    CreateDynamicObject(984, -1540.00, 1415.30, 15.40, 0.00, 0.00, 340.00);
    CreateDynamicObject(984, -1533.70, 1426.20, 15.40, 0.00, 0.00, 319.99);
    CreateDynamicObject(984, -1523.60, 1433.30, 15.40, 0.00, 0.00, 289.99);
    CreateDynamicObject(984, -1511.20, 1435.50, 15.40, 0.00, 0.00, 269.98);
    CreateDynamicObject(984, -1498.80, 1433.30, 15.40, 0.00, 0.00, 249.98);
    CreateDynamicObject(984, -1487.90, 1427.00, 15.40, 0.00, 0.00, 229.97);
    CreateDynamicObject(984, -1478.90, 1418.00, 15.40, 0.00, 0.00, 219.97);
    CreateDynamicObject(984, -1472.60, 1407.10, 15.40, 0.00, 0.00, 199.96);
    CreateDynamicObject(984, -1469.30, 1394.80, 15.40, 0.00, 0.00, 189.95);
    CreateDynamicObject(983, -1467.10, 1385.50, 15.40, 0.00, 0.00, 199.46);
    CreateDynamicObject(983, -1464.00, 1380.00, 15.40, 0.00, 0.00, 219.46);
    CreateDynamicObject(983, -1459.20, 1375.90, 15.40, 0.00, 0.00, 239.45);
    CreateDynamicObject(983, -1453.30, 1373.70, 15.40, 0.00, 0.00, 259.45);
    CreateDynamicObject(983, -1447.00, 1373.60, 15.40, 0.00, 0.00, 279.44);
    CreateDynamicObject(983, -1441.10, 1375.70, 15.40, 0.00, 0.00, 299.43);
    CreateDynamicObject(983, -1436.20, 1379.70, 15.40, 0.00, 0.00, 319.42);
    CreateDynamicObject(983, -1436.20, 1379.70, 15.40, 0.00, 0.00, 319.41);
    CreateDynamicObject(982, -1425.90, 1391.90, 15.40, 0.00, 0.00, 139.97);
    CreateDynamicObject(982, -1409.40, 1411.50, 15.40, 0.00, 0.00, 139.95);
    CreateDynamicObject(983, -1434.10, 1360.90, 15.40, 0.00, 0.00, 289.43);
    CreateDynamicObject(983, -1428.70, 1363.90, 15.40, 0.00, 0.00, 309.42);
    CreateDynamicObject(983, -1424.10, 1368.40, 15.40, 0.00, 0.00, 319.42);
    CreateDynamicObject(982, -1413.80, 1380.60, 15.40, 0.00, 0.00, 139.95);
    CreateDynamicObject(982, -1397.30, 1400.20, 15.40, 0.00, 0.00, 139.95);
    CreateDynamicObject(984, -1396.30, 1425.40, 15.40, 0.00, 0.00, 310.00);
    CreateDynamicObject(984, -1385.90, 1432.70, 15.40, 0.00, 0.00, 299.99);
    CreateDynamicObject(984, -1374.30, 1438.10, 15.40, 0.00, 0.00, 289.98);
    CreateDynamicObject(984, -1362.00, 1441.40, 15.40, 0.00, 0.00, 279.98);
    CreateDynamicObject(984, -1349.30, 1442.50, 15.40, 0.00, 0.00, 269.98);
    CreateDynamicObject(984, -1384.10, 1414.10, 15.40, 0.00, 0.00, 309.97);
    CreateDynamicObject(984, -1373.20, 1420.40, 15.40, 0.00, 0.00, 289.96);
    CreateDynamicObject(984, -1360.90, 1423.70, 15.40, 0.00, 0.00, 279.96);
    CreateDynamicObject(984, -1348.20, 1424.80, 15.40, 0.00, 0.00, 269.95);
    CreateDynamicObject(982, -1329.00, 1424.80, 15.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(982, -1330.10, 1442.50, 15.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(982, -1304.50, 1442.50, 15.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(982, -1278.90, 1442.50, 15.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(982, -1253.30, 1442.50, 15.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(982, -1303.40, 1424.80, 15.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(982, -1277.80, 1424.80, 15.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(982, -1252.20, 1424.80, 15.40, 0.00, 0.00, 89.95);
    CreateDynamicObject(983, -1236.20, 1424.70, 15.50, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1230.00, 1423.60, 15.50, 0.00, 0.00, 69.99);
    CreateDynamicObject(983, -1224.60, 1420.50, 15.50, 0.00, 0.00, 49.99);
    CreateDynamicObject(983, -1220.50, 1415.70, 15.50, 0.00, 0.00, 29.99);
    CreateDynamicObject(983, -1218.30, 1409.80, 15.50, 0.00, 0.00, 9.99);
    CreateDynamicObject(983, -1218.30, 1403.50, 15.50, 0.00, 0.00, 349.98);
    CreateDynamicObject(983, -1220.50, 1397.50, 15.50, 0.00, 0.00, 329.97);
    CreateDynamicObject(983, -1224.60, 1392.70, 15.50, 0.00, 0.00, 309.97);
    CreateDynamicObject(983, -1230.10, 1389.50, 15.50, 0.00, 0.00, 289.96);
    CreateDynamicObject(983, -1236.30, 1388.40, 15.50, 0.00, 0.00, 269.96);
    CreateDynamicObject(984, -1234.10, 1442.50, 15.40, 0.00, 0.00, 90.00);
    CreateDynamicObject(984, -1221.40, 1441.40, 15.40, 0.00, 0.00, 79.99);
    CreateDynamicObject(984, -1209.10, 1438.10, 15.40, 0.00, 0.00, 69.99);
    CreateDynamicObject(984, -1198.20, 1431.80, 15.40, 0.00, 0.00, 49.98);
    CreateDynamicObject(984, -1190.10, 1422.10, 15.40, 0.00, 0.00, 29.98);
    CreateDynamicObject(984, -1186.90, 1410.10, 15.40, 0.00, 0.00, 359.98);
    CreateDynamicObject(984, -1189.10, 1397.70, 15.40, 0.00, 0.00, 339.98);
    CreateDynamicObject(984, -1195.40, 1386.80, 15.40, 0.00, 0.00, 319.97);
    CreateDynamicObject(984, -1205.10, 1378.70, 15.40, 0.00, 0.00, 299.97);
    CreateDynamicObject(984, -1216.60, 1373.40, 15.40, 0.00, 0.00, 289.97);
    CreateDynamicObject(984, -1228.90, 1370.10, 15.40, 0.00, 0.00, 279.96);
    CreateDynamicObject(984, -1241.60, 1369.00, 15.40, 0.00, 0.00, 269.95);
    CreateDynamicObject(984, -1245.80, 1389.60, 15.40, 0.00, 0.00, 259.95);
    CreateDynamicObject(984, -1258.10, 1392.90, 15.40, 0.00, 0.00, 249.94);
    CreateDynamicObject(984, -1270.50, 1395.10, 15.40, 0.00, 0.00, 269.93);
    CreateDynamicObject(984, -1282.90, 1392.90, 15.40, 0.00, 0.00, 289.92);
    CreateDynamicObject(984, -1293.00, 1385.80, 15.40, 0.00, 0.00, 319.92);
    CreateDynamicObject(984, -1298.20, 1374.60, 15.40, 0.00, 0.00, 349.91);
    CreateDynamicObject(984, -1297.20, 1362.30, 15.40, 0.00, 0.00, 19.90);
    CreateDynamicObject(984, -1290.90, 1351.40, 15.40, 0.00, 0.00, 39.90);
    CreateDynamicObject(984, -1281.90, 1342.40, 15.40, 0.00, 0.00, 49.89);
    CreateDynamicObject(983, -1251.00, 1370.10, 15.50, 0.00, 0.00, 249.96);
    CreateDynamicObject(983, -1256.80, 1372.70, 15.50, 0.00, 0.00, 239.95);
    CreateDynamicObject(983, -1262.70, 1374.90, 15.50, 0.00, 0.00, 259.94);
    CreateDynamicObject(983, -1269.00, 1374.90, 15.50, 0.00, 0.00, 279.94);
    CreateDynamicObject(983, -1274.90, 1372.80, 15.50, 0.00, 0.00, 299.93);
    CreateDynamicObject(983, -1278.80, 1368.20, 15.50, 0.00, 0.00, 339.92);
    CreateDynamicObject(983, -1279.30, 1362.00, 15.50, 0.00, 0.00, 9.92);
    CreateDynamicObject(983, -1276.70, 1356.40, 15.50, 0.00, 0.00, 39.91);
    CreateDynamicObject(983, -1272.70, 1351.50, 15.50, 0.00, 0.00, 39.91);
    CreateDynamicObject(984, -1265.70, 1345.00, 15.40, 0.00, 0.00, 49.88);
    CreateDynamicObject(984, -1272.90, 1333.40, 15.40, 0.00, 0.00, 39.87);
    CreateDynamicObject(984, -1265.60, 1323.00, 15.40, 0.00, 0.00, 29.86);
    CreateDynamicObject(984, -1260.20, 1311.40, 15.40, 0.00, 0.00, 19.86);
    CreateDynamicObject(984, -1257.00, 1299.10, 15.40, 0.00, 0.00, 9.85);
    CreateDynamicObject(984, -1255.50, 1286.40, 15.40, 0.00, 0.00, 3.84);
    CreateDynamicObject(984, -1255.90, 1336.70, 15.40, 0.00, 0.00, 49.87);
    CreateDynamicObject(984, -1246.90, 1327.70, 15.40, 0.00, 0.00, 39.87);
    CreateDynamicObject(984, -1239.60, 1317.30, 15.40, 0.00, 0.00, 29.86);
    CreateDynamicObject(984, -1234.20, 1305.70, 15.40, 0.00, 0.00, 19.86);
    CreateDynamicObject(984, -1230.90, 1293.40, 15.40, 0.00, 0.00, 9.85);
    CreateDynamicObject(984, -1229.80, 1280.70, 15.40, 0.00, 0.00, 359.84);
    CreateDynamicObject(984, -1230.10, 1267.90, 15.40, 0.00, 0.00, 357.84);
    CreateDynamicObject(984, -1255.80, 1273.70, 15.40, 0.00, 0.00, 353.84);
    CreateDynamicObject(984, -1258.30, 1261.20, 15.40, 0.00, 0.00, 343.84);
    CreateDynamicObject(984, -1262.90, 1249.30, 15.40, 0.00, 0.00, 333.84);
    CreateDynamicObject(983, -1267.70, 1241.10, 15.40, 0.00, 0.00, 320.00);
    CreateDynamicObject(983, -1272.20, 1236.60, 15.40, 0.00, 0.00, 309.99);
    CreateDynamicObject(983, -1277.70, 1233.50, 15.40, 0.00, 0.00, 287.98);
    CreateDynamicObject(983, -1281.40, 1232.40, 15.40, 0.00, 0.00, 287.98);
    CreateDynamicObject(984, -1231.70, 1255.30, 15.40, 0.00, 0.00, 347.84);
    CreateDynamicObject(984, -1235.50, 1243.10, 15.40, 0.00, 0.00, 337.83);
    CreateDynamicObject(984, -1241.30, 1231.80, 15.40, 0.00, 0.00, 327.82);
    CreateDynamicObject(984, -1249.00, 1221.60, 15.40, 0.00, 0.00, 317.82);
    CreateDynamicObject(984, -1259.00, 1214.10, 15.40, 0.00, 0.00, 295.81);
    CreateDynamicObject(1237, -1282.10, 1211.30, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1294.10, 1211.30, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1282.10, 1156.90, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1282.10, 1169.70, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1319.70, 1153.70, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1330.80, 1153.70, 14.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(3881, -1365.80, 1138.30, 16.60, 0.00, 0.00, 270.00);
    CreateDynamicObject(3882, -1365.20, 1138.00, 15.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(3337, -1310.00, 1187.10, 14.00, 0.00, 0.00, 179.99);
    CreateDynamicObject(3337, -1310.00, 1182.10, 14.00, 0.00, 0.00, 179.99);
    CreateDynamicObject(6958, -1541.10, 1145.60, 13.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(9191, -1360.90, 1153.70, 11.50, 0.00, 0.00, 0.00);
    CreateDynamicObject(9191, -1344.20, 1153.70, 11.50, 0.00, 0.00, 0.00);
    CreateDynamicObject(9191, -1339.20, 1153.70, 11.50, 0.00, 0.00, 0.00);
    CreateDynamicObject(9191, -1311.30, 1153.70, 11.50, 0.00, 0.00, 0.00);
    CreateDynamicObject(9191, -1302.50, 1153.70, 11.50, 0.00, 0.00, 0.00);
    CreateDynamicObject(9191, -1294.00, 1161.70, 11.50, 0.00, 0.00, 90.00);
    CreateDynamicObject(9191, -1294.00, 1178.60, 11.50, 0.00, 0.00, 89.99);
    CreateDynamicObject(9191, -1294.00, 1195.40, 11.50, 0.00, 0.00, 89.99);
    CreateDynamicObject(9191, -1294.00, 1202.70, 11.50, 0.00, 0.00, 89.99);
    CreateDynamicObject(9191, -1310.40, 1162.50, 11.50, 0.00, 0.00, 269.99);
    CreateDynamicObject(9191, -1310.40, 1179.30, 11.50, 0.00, 0.00, 269.99);
    CreateDynamicObject(9191, -1310.40, 1196.10, 11.50, 0.00, 0.00, 269.99);
    CreateDynamicObject(9191, -1310.40, 1202.80, 11.50, 0.00, 0.00, 269.99);
    CreateDynamicObject(9191, -1318.80, 1211.30, 11.50, 0.00, 0.00, 359.99);
    CreateDynamicObject(9191, -1335.70, 1211.30, 11.50, 0.00, 0.00, 359.98);
    CreateDynamicObject(9191, -1352.50, 1211.30, 11.50, 0.00, 0.00, 359.98);
    CreateDynamicObject(9191, -1362.60, 1211.30, 11.50, 0.00, 0.00, 359.98);
    CreateDynamicObject(9191, -1370.80, 1203.30, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(9191, -1370.80, 1186.40, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(9191, -1370.80, 1169.60, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(9191, -1370.80, 1163.90, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(9191, -1282.10, 1148.10, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(9191, -1282.10, 1139.60, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(9191, -1282.10, 1178.30, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(9191, -1282.10, 1195.10, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(9191, -1282.10, 1203.10, 11.50, 0.00, 0.00, 89.98);
    CreateDynamicObject(7662, -1309.20, 1167.80, 14.30, 0.00, 0.00, 0.00);
    CreateDynamicObject(8991, -1309.50, 1202.30, 15.60, 0.00, 0.00, 270.00);
    CreateDynamicObject(8991, -1309.50, 1168.70, 15.50, 0.00, 0.00, 270.00);
    CreateDynamicObject(8991, -1309.00, 1168.60, 15.50, 0.00, 0.00, 89.99);
    CreateDynamicObject(8991, -1309.00, 1202.20, 15.60, 0.00, 0.00, 89.99);
    CreateDynamicObject(1280, -1303.50, 1198.40, 15.30, 0.00, 0.00, 0.00);
    CreateDynamicObject(1280, -1302.90, 1198.40, 15.30, 0.00, 0.00, 180.00);
    CreateDynamicObject(1280, -1303.00, 1191.40, 15.30, 0.00, 0.00, 179.99);
    CreateDynamicObject(1280, -1303.70, 1191.40, 15.30, 0.00, 0.00, 359.99);
    CreateDynamicObject(1280, -1303.70, 1179.70, 15.30, 0.00, 0.00, 359.99);
    CreateDynamicObject(1280, -1303.10, 1179.70, 15.30, 0.00, 0.00, 179.99);
    CreateDynamicObject(1280, -1303.10, 1172.70, 15.30, 0.00, 0.00, 179.98);
    CreateDynamicObject(1280, -1303.70, 1172.70, 15.30, 0.00, 0.00, 359.98);
    CreateDynamicObject(3398, -1412.30, 1231.90, 16.90, 0.00, 0.00, 330.00);
    CreateDynamicObject(3398, -1416.50, 1255.40, 16.90, 0.00, 0.00, 220.00);
    CreateDynamicObject(3398, -1422.80, 1241.80, 16.90, 0.00, 0.00, 279.99);
    CreateDynamicObject(3398, -1392.50, 1232.40, 16.90, 0.00, 0.00, 359.99);
    CreateDynamicObject(3398, -1402.10, 1251.60, 16.90, 0.00, 0.00, 139.98);
    CreateDynamicObject(3398, -1321.60, 1253.00, 16.90, 0.00, 0.00, 359.98);
    CreateDynamicObject(3398, -1300.20, 1253.60, 16.90, 0.00, 0.00, 29.98);
    CreateDynamicObject(3398, -1287.40, 1264.40, 16.90, 0.00, 0.00, 79.98);
    CreateDynamicObject(3398, -1289.20, 1282.20, 16.90, 0.00, 0.00, 159.97);
    CreateDynamicObject(3398, -1306.80, 1285.80, 16.90, 0.00, 0.00, 209.96);
    CreateDynamicObject(3398, -1341.20, 1286.60, 16.90, 0.00, 0.00, 59.96);
    CreateDynamicObject(3398, -1350.80, 1274.70, 16.90, 0.00, 0.00, 359.95);
    CreateDynamicObject(3398, -1365.80, 1285.40, 16.90, 0.00, 0.00, 309.96);
    CreateDynamicObject(3398, -1379.00, 1300.00, 16.90, 0.00, 0.00, 299.95);
    CreateDynamicObject(3398, -1412.00, 1306.40, 16.90, 0.00, 0.00, 119.94);
    CreateDynamicObject(3398, -1419.60, 1320.60, 16.90, 0.00, 0.00, 129.94);
    CreateDynamicObject(3398, -1431.40, 1331.00, 16.90, 0.00, 0.00, 149.94);
    CreateDynamicObject(3398, -1445.80, 1335.50, 16.90, 0.00, 0.00, 179.92);
    CreateDynamicObject(3398, -1483.10, 1367.70, 16.90, 0.00, 0.00, 349.92);
    CreateDynamicObject(3398, -1501.40, 1371.10, 16.90, 0.00, 0.00, 339.91);
    CreateDynamicObject(3398, -1516.80, 1381.30, 16.90, 0.00, 0.00, 309.90);
    CreateDynamicObject(3398, -1518.90, 1403.50, 16.90, 0.00, 0.00, 229.89);
    CreateDynamicObject(3398, -1504.20, 1409.10, 16.90, 0.00, 0.00, 169.88);
    CreateDynamicObject(3398, -1492.70, 1395.10, 16.90, 0.00, 0.00, 89.88);
    CreateDynamicObject(3398, -1465.40, 1383.20, 16.90, 0.00, 0.00, 299.88);
    CreateDynamicObject(3398, -1453.30, 1374.60, 16.90, 0.00, 0.00, 359.87);
    CreateDynamicObject(3398, -1438.60, 1378.30, 16.90, 0.00, 0.00, 39.87);
    CreateDynamicObject(3398, -1413.50, 1380.60, 16.90, 0.00, 0.00, 229.86);
    CreateDynamicObject(3398, -1412.50, 1409.50, 16.90, 0.00, 0.00, 49.86);
    CreateDynamicObject(3398, -1387.00, 1410.20, 16.90, 0.00, 0.00, 229.86);
    CreateDynamicObject(3398, -1372.80, 1419.40, 16.90, 0.00, 0.00, 199.86);
    CreateDynamicObject(3398, -1354.80, 1423.60, 16.90, 0.00, 0.00, 179.85);
    CreateDynamicObject(3398, -1327.70, 1443.40, 16.90, 0.00, 0.00, 359.85);
    CreateDynamicObject(3398, -1300.80, 1423.70, 16.90, 0.00, 0.00, 179.84);
    CreateDynamicObject(3398, -1274.10, 1443.70, 16.90, 0.00, 0.00, 359.83);
    CreateDynamicObject(3398, -1249.30, 1423.80, 16.90, 0.00, 0.00, 179.82);
    CreateDynamicObject(3398, -1228.30, 1422.60, 16.90, 0.00, 0.00, 149.82);
    CreateDynamicObject(3398, -1220.10, 1410.60, 16.90, 0.00, 0.00, 89.81);
    CreateDynamicObject(3398, -1224.10, 1394.70, 16.90, 0.00, 0.00, 39.80);
    CreateDynamicObject(3398, -1239.60, 1389.90, 16.90, 0.00, 0.00, 349.80);
    CreateDynamicObject(3398, -1260.00, 1373.80, 16.90, 0.00, 0.00, 159.79);
    CreateDynamicObject(3398, -1271.90, 1373.70, 16.90, 0.00, 0.00, 199.78);
    CreateDynamicObject(3398, -1278.90, 1364.20, 16.90, 0.00, 0.00, 279.77);
    CreateDynamicObject(3398, -1272.00, 1351.30, 16.90, 0.00, 0.00, 309.76);
    CreateDynamicObject(3398, -1269.30, 1327.00, 16.90, 0.00, 0.00, 129.76);
    CreateDynamicObject(3398, -1240.70, 1321.80, 16.90, 0.00, 0.00, 299.75);
    CreateDynamicObject(3398, -1257.20, 1294.80, 16.90, 0.00, 0.00, 99.75);
    CreateDynamicObject(3398, -1229.30, 1277.30, 16.90, 0.00, 0.00, 269.75);
    CreateDynamicObject(3398, -1261.30, 1254.60, 16.90, 0.00, 0.00, 69.75);
    CreateDynamicObject(3398, -1248.70, 1218.50, 16.90, 0.00, 0.00, 229.75);
    CreateDynamicObject(3398, -1279.30, 1235.30, 16.90, 0.00, 0.00, 19.75);
    CreateDynamicObject(3398, -1310.10, 1153.80, 16.90, 0.00, 0.00, 269.74);
    CreateDynamicObject(3398, -1294.90, 1154.00, 16.90, 0.00, 0.00, 49.74);
    CreateDynamicObject(3398, -1370.00, 1154.50, 16.90, 0.00, 0.00, 129.73);
    CreateDynamicObject(3398, -1370.30, 1208.70, 16.90, 0.00, 0.00, 29.72);
    CreateDynamicObject(3398, -1311.50, 1210.40, 16.90, 0.00, 0.00, 319.72);
    CreateDynamicObject(1676, -1252.20, 1182.60, 16.20, 0.00, 0.00, 270.00);
    CreateDynamicObject(1262, -1310.10, 1221.00, 21.00, 0.00, 0.00, 270.00);
    CreateDynamicObject(1262, -1310.10, 1221.50, 21.00, 0.00, 0.00, 269.99);
    CreateDynamicObject(1262, -1310.10, 1220.50, 21.00, 0.00, 0.00, 269.99);
    CreateDynamicObject(1262, -1310.00, 1211.40, 21.00, 0.00, 0.00, 269.99);
    CreateDynamicObject(1262, -1310.00, 1231.20, 21.00, 0.00, 0.00, 269.99);
    CreateDynamicObject(8331, -1310.80, 1214.60, 7.60, 0.00, 0.00, 20.00);
    CreateDynamicObject(2728, -1390.90, 1136.60, 16.80, 90.00, 0.00, 180.59);
    CreateDynamicObject(2728, -1390.70, 1154.50, 16.80, 90.00, 0.00, 180.59);
    CreateDynamicObject(1676, -1241.20, 1182.60, 16.20, 0.00, 0.00, 269.99);
    CreateDynamicObject(713, -1260.70, 1186.90, 15.10, 0.00, 0.00, 0.00);
    CreateDynamicObject(713, -1260.30, 1169.40, 15.10, 0.00, 0.00, 100.00);

    //Монстер трасса
    CreateDynamicObject(8148, 2578.88, -1863.72, 2.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(8148, 2570.38, -1863.46, 2.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(18451, 2574.60, -1789.73, 1.05, 0.00, 0.00, 179.25);
    CreateDynamicObject(18566, 2574.93, -1795.16, 0.97, 0.00, 0.00, 0.00);
    CreateDynamicObject(18566, 2574.98, -1796.44, 0.82, 0.00, 0.00, 0.00);
    CreateDynamicObject(18566, 2574.88, -1801.39, 0.70, 0.00, 0.00, 182.75);
    CreateDynamicObject(3594, 2574.72, -1806.31, 1.08, 0.00, 0.00, 274.00);
    CreateDynamicObject(3594, 2574.72, -1809.34, 1.16, 0.00, 0.00, 274.00);
    CreateDynamicObject(3594, 2574.79, -1812.37, 1.31, 0.00, 0.00, 274.00);
    CreateDynamicObject(3594, 2574.77, -1815.47, 1.31, 0.00, 0.00, 274.00);
    CreateDynamicObject(18253, 2574.73, -1832.45, 1.19, 0.00, 0.00, 0.00);
    CreateDynamicObject(1245, 2575.07, -1822.74, 2.54, 0.00, 0.00, 92.25);
    CreateDynamicObject(1245, 2572.19, -1822.78, 2.54, 0.00, 0.00, 92.00);
    CreateDynamicObject(1633, 2574.64, -1843.39, 4.79, 0.00, 0.00, 180.25);
    CreateDynamicObject(18566, 2574.31, -1827.94, 4.33, 0.00, 0.00, 182.75);
    CreateDynamicObject(18566, 2574.56, -1832.51, 4.33, 0.00, 0.00, 182.75);
    CreateDynamicObject(18566, 2574.59, -1837.61, 4.28, 0.00, 0.00, 182.75);
    CreateDynamicObject(1322, 2571.55, -1782.94, 1.90, 0.00, 0.00, 88.25);
    CreateDynamicObject(3578, 2576.38, -1851.69, 5.23, 0.00, 0.00, 269.75);
    CreateDynamicObject(3578, 2572.90, -1851.70, 5.23, 0.00, 0.00, 269.75);
    CreateDynamicObject(3578, 2572.85, -1862.07, 5.23, 0.00, 0.00, 269.75);
    CreateDynamicObject(3578, 2576.30, -1862.10, 5.23, 0.00, 0.00, 269.75);
    CreateDynamicObject(3578, 2572.79, -1871.78, 3.43, 0.00, 21.25, 269.75);
    CreateDynamicObject(3578, 2576.22, -1871.79, 3.43, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2574.77, -1878.58, 2.59, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.77, -1879.08, 3.01, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.78, -1879.60, 3.44, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.78, -1880.23, 3.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.86, -1880.83, 4.29, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.86, -1881.45, 5.14, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.87, -1882.70, 5.31, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.93, -1884.13, 5.01, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.90, -1885.93, 5.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.91, -1887.85, 4.71, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.87, -1889.82, 4.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.84, -1891.67, 4.64, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.80, -1893.82, 4.89, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2572.87, -1898.59, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2576.66, -1898.57, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2577.21, -1898.57, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2577.76, -1898.57, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2573.46, -1898.58, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2574.04, -1898.58, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2574.61, -1898.58, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2575.21, -1898.57, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2575.78, -1898.57, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2576.38, -1898.57, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2572.28, -1898.58, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(3578, 2571.65, -1898.58, 3.08, 0.00, 21.25, 269.74);
    CreateDynamicObject(18566, 2574.29, -1878.12, 3.12, 0.00, 0.00, 180.25);
    CreateDynamicObject(18566, 2574.85, -1884.49, 6.12, 0.00, 0.00, 180.24);
    CreateDynamicObject(18566, 2574.92, -1889.85, 5.94, 0.00, 0.00, 180.24);
    CreateDynamicObject(12957, 2572.58, -1905.69, 3.33, 0.00, 0.00, 0.00);
    CreateDynamicObject(12957, 2576.23, -1905.66, 3.33, 0.00, 0.00, 338.00);
    CreateDynamicObject(12957, 2575.15, -1912.83, 3.33, 0.00, 0.00, 286.00);
    CreateDynamicObject(12957, 2575.81, -1919.37, 3.33, 0.00, 0.00, 331.99);
    CreateDynamicObject(12957, 2572.68, -1919.43, 3.33, 0.00, 0.00, 353.99);
    CreateDynamicObject(3578, 2574.46, -1865.21, 6.26, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.71, -1860.22, 5.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.86, -1855.97, 5.61, 0.00, 0.00, 0.00);
    CreateDynamicObject(3867, 1838.93, -1436.28, 17.45, 0.00, 0.00, 90.25);
    CreateDynamicObject(3743, 2577.92, -1929.19, 4.09, 0.00, 0.00, 0.00);
    CreateDynamicObject(3743, 2575.97, -1929.31, 4.09, 0.00, 0.00, 0.00);
    CreateDynamicObject(3743, 2573.97, -1929.34, 4.09, 0.00, 0.00, 0.00);
    CreateDynamicObject(3743, 2572.02, -1929.34, 4.09, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.93, -1935.40, 7.27, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.94, -1936.83, 7.27, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.95, -1938.83, 7.27, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.96, -1941.83, 7.27, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.98, -1944.05, 7.27, 0.00, 0.00, 0.00);
    CreateDynamicObject(18275, 2574.68, -1783.70, 2.89, 0.00, 0.00, 0.00);
    CreateDynamicObject(16092, 2563.25, -1783.80, 0.64, 0.00, 0.00, 271.00);
    CreateDynamicObject(983, 2557.34, -1787.62, 1.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 2557.33, -1794.04, 1.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, 2557.33, -1800.43, 1.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(984, 2563.71, -1803.63, 1.28, 0.00, 0.00, 269.75);
    CreateDynamicObject(3578, 2574.94, -1942.93, 7.97, 0.00, 0.00, 0.00);
    CreateDynamicObject(8148, 2578.87, -1941.84, 2.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(8148, 2570.39, -1941.56, 2.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.98, -1945.30, 8.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.97, -1946.38, 8.82, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.95, -1947.63, 8.82, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.94, -1948.88, 7.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.92, -1950.40, 8.74, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.91, -1951.65, 9.02, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.90, -1952.80, 7.89, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.89, -1953.55, 7.89, 0.00, 0.00, 0.00);
    CreateDynamicObject(3578, 2574.90, -1954.40, 7.89, 0.00, 0.00, 0.00);
    CreateDynamicObject(984, 2575.98, -1960.69, 6.67, 11.99, 2.04, 359.57);
    CreateDynamicObject(984, 2574.52, -1960.74, 6.67, 12.00, 360.00, 360.00);
    CreateDynamicObject(3578, 2576.67, -1971.97, 4.54, 0.00, 0.00, 269.75);
    CreateDynamicObject(3578, 2573.65, -1971.90, 4.54, 0.00, 0.00, 269.75);
    CreateDynamicObject(984, 2575.30, -1960.75, 6.67, 11.99, 2.04, 359.57);
    CreateDynamicObject(984, 2573.78, -1960.67, 6.67, 11.99, 2.04, 359.57);
    CreateDynamicObject(984, 2576.69, -1960.83, 6.67, 11.99, 2.04, 359.57);
    CreateDynamicObject(984, 2577.39, -1960.87, 6.67, 11.99, 2.04, 359.57);
    CreateDynamicObject(984, 2572.95, -1960.62, 6.67, 11.99, 2.04, 359.57);
    CreateDynamicObject(3578, 2573.58, -1981.60, 4.54, 0.00, 0.00, 269.75);
    CreateDynamicObject(3578, 2576.66, -1981.69, 4.54, 0.00, 0.00, 269.75);
    CreateDynamicObject(997, 2570.58, -1995.93, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2573.73, -1995.95, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2576.86, -1995.92, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2576.87, -1997.57, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2573.77, -1997.55, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2570.70, -1997.55, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2570.68, -1998.90, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2573.78, -1998.90, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2576.88, -1998.88, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2570.67, -2000.27, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2573.77, -2000.29, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2576.87, -2000.26, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2576.86, -2002.23, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2573.78, -2002.21, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(997, 2570.68, -2002.19, 2.73, 0.00, 0.00, 0.00);
    CreateDynamicObject(1633, 2574.94, -1992.77, 2.61, 0.00, 0.00, 180.25);
    CreateDynamicObject(3578, 2576.62, -1991.12, 2.34, 0.00, 26.00, 269.75);
    CreateDynamicObject(3578, 2573.52, -1991.02, 2.34, 0.00, 26.00, 269.74);
    CreateDynamicObject(13640, 2576.52, -2012.30, 3.88, 0.00, 0.00, 268.99);
    CreateDynamicObject(13640, 2572.01, -2012.20, 3.88, 0.00, 0.00, 268.99);
    CreateDynamicObject(13640, 2572.01, -2013.77, 5.35, 0.00, 0.00, 268.99);
    CreateDynamicObject(13640, 2577.11, -2013.87, 5.35, 0.00, 0.00, 268.99);
    CreateDynamicObject(18275, 2574.81, -2019.19, 8.05, 0.00, 0.00, 0.00);
    CreateDynamicObject(13640, 2576.66, -2010.28, 3.88, 0.00, 0.00, 268.99);
    CreateDynamicObject(13640, 2572.24, -2010.18, 3.88, 0.00, 0.00, 268.99);
    CreateDynamicObject(3525, 2574.83, -1921.22, 2.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2572.66, -1921.40, 2.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2573.36, -1913.58, 2.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2575.72, -1907.60, 2.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2572.70, -1907.71, 2.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2573.98, -1904.17, 1.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2576.46, -1913.83, 1.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2574.23, -1917.55, 1.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2576.81, -1789.96, 0.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2576.29, -1789.94, 0.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2576.25, -1790.71, 0.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2577.03, -1790.63, 0.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2577.09, -1789.48, 0.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(3525, 2576.37, -1789.44, 0.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(1773, 2576.15, -1912.77, 3.47, 0.00, 90.00, 180.00);
    CreateVehicle(444, 2563.2875976563, -1800.3154296875, 2.065623998642, 0, -1, -1, 60000);
    CreateVehicle(444, 2567.2612304688, -1800.3273925781, 2.065623998642, 0, -1, -1, 60000);
    CreateVehicle(444, 2559.3647460938, -1800.3032226563, 2.065623998642, 0, -1, -1, 60000);
    CreateVehicle(444, 2559.4455566406, -1793.7419433594, 2.065623998642, 0, -1, -1, 60000);
    CreateVehicle(444, 2567.3637695313, -1787.4835205078, 2.065623998642, 0, -1, -1, 60000);
    CreateVehicle(444, 2563.2861328125, -1787.4840087891, 2.065623998642, 0, -1, -1, 60000);
    CreateVehicle(444, 2563.294921875, -1793.8082275391, 2.065623998642, 0, -1, -1, 60000);
    CreateVehicle(444, 2567.2446289063, -1793.8782958984, 2.065623998642, 0, -1, -1, 60000);
    //Красивая окружность у WangCars №1
    CreateObject(1459, -1633.80004883, 579.50000000, 40.00000000, 0.00000000, 0.00000000, 314.00000000); //object(dyn_roadbarrier_6) (2)
    CreateObject(10975, -2039.09997559, 263.89999390, 43.50000000, 0.00000000, 0.00000000, 0.00000000); //object(shoppie6_sfs01) (1)
    CreateObject(3749, -2004.69995117, 307.29998779, 39.79999924, 0.00000000, 0.00000000, 0.00000000); //object(clubgate01_lax) (1)
    CreateObject(979, -1991.80004883, 310.60000610, 35.00000000, 0.00000000, 0.00000000, 18.00000000); //object(sub_roadleft) (2)
    CreateObject(979, -1982.80004883, 311.10000610, 35.00000000, 0.00000000, 0.00000000, 347.99560547); //object(sub_roadleft) (3)
    CreateObject(979, -2018.50000000, 307.70001221, 35.22999954, 0.00000000, 0.00000000, 17.99560547); //object(sub_roadleft) (4)
    CreateObject(3749, -2006.69995117, 118.69999695, 32.40000153, 0.00000000, 0.00000000, 0.00000000); //object(clubgate01_lax) (2)
    CreateObject(979, -2020.59997559, 118.59999847, 27.50000000, 0.00000000, 0.00000000, 157.99194336); //object(sub_roadleft) (5)
    CreateObject(3749, -1998.59997559, 106.90000153, 32.40000153, 0.00000000, 0.00000000, 270.00000000); //object(clubgate01_lax) (3)
    CreateObject(979, -1992.50000000, 97.19999695, 27.50000000, 0.00000000, 0.00000000, 177.98889160); //object(sub_roadleft) (6)
    CreateObject(979, -1983.40002441, 96.90000153, 27.50000000, 0.00000000, 0.00000000, 177.98498535); //object(sub_roadleft) (7)
    CreateObject(979, -1978.59997559, 101.40000153, 27.50000000, 0.00000000, 0.00000000, 267.98400879); //object(sub_roadleft) (8)
    CreateObject(979, -1978.40002441, 106.50000000, 27.50000000, 0.00000000, 0.00000000, 267.98400879); //object(sub_roadleft) (9)
    CreateObject(11417, -2020.80004883, 195.89999390, 31.79999924, 0.00000000, 0.00000000, 0.00000000); //object(xenonsign2_sfse) (1)
    CreateObject(979, -2048.60009766, 118.69999695, 28.79999924, 0.00000000, 0.00000000, 177.98400879); //object(sub_roadleft) (10)
    CreateObject(979, -2057.50000000, 119.00000000, 29.00000000, 0.00000000, 0.00000000, 177.98400879); //object(sub_roadleft) (11)
    CreateObject(17575, -2003.69995117, 367.00000000, 37.70000076, 0.00000000, 0.00000000, 270.00000000); //object(burgho01_lae2) (1)
    CreateObject(17575, -2003.80004883, 384.60000610, 37.70000076, 0.00000000, 0.00000000, 270.00000000); //object(burgho01_lae2) (2)
    CreateObject(17575, -2003.69995117, 402.29998779, 37.70000076, 0.00000000, 0.00000000, 270.00000000); //object(burgho01_lae2) (3)
    CreateObject(17575, -2003.69995117, 420.50000000, 37.70000076, 0.00000000, 0.00000000, 270.00000000); //object(burgho01_lae2) (4)
    CreateObject(17575, -2003.80004883, 438.20001221, 37.70000076, 0.00000000, 0.00000000, 270.00000000); //object(burgho01_lae2) (5)
    CreateObject(978, -2011.90002441, 355.70001221, 35.00000000, 0.00000000, 0.00000000, 270.00000000); //object(sub_roadright) (2)
    CreateObject(978, -2011.90002441, 347.60000610, 35.00000000, 0.00000000, 0.00000000, 270.00000000); //object(sub_roadright) (3)
    CreateObject(978, -2011.90002441, 339.29998779, 35.00000000, 0.00000000, 0.00000000, 270.00000000); //object(sub_roadright) (4)
    CreateObject(978, -2011.90002441, 334.50000000, 35.00000000, 0.00000000, 0.00000000, 270.00000000); //object(sub_roadright) (5)
    CreateObject(978, -2016.50000000, 329.89999390, 35.00000000, 0.00000000, 0.00000000, 180.00000000); //object(sub_roadright) (6)
    CreateObject(1237, -2021.19995117, 330.10000610, 34.29999924, 0.00000000, 0.00000000, 0.00000000); //object(strtbarrier01) (1)
    CreateObject(672, -2014.59997559, 333.29998779, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (1)
    CreateObject(672, -2014.40002441, 339.79998779, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (2)
    CreateObject(672, -2014.50000000, 344.29998779, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (3)
    CreateObject(672, -2014.40002441, 349.29998779, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (4)
    CreateObject(672, -2014.30004883, 353.89999390, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (5)
    CreateObject(672, -2013.69995117, 454.50000000, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (6)
    CreateObject(672, -2013.50000000, 464.70001221, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (7)
    CreateObject(672, -1994.69995117, 453.39999390, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (8)
    CreateObject(672, -1994.80004883, 462.29998779, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (9)
    CreateObject(672, -2013.09997559, 476.39999390, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (10)
    CreateObject(672, -2013.19995117, 488.70001221, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (11)
    CreateObject(672, -1994.80004883, 470.79998779, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (12)
    CreateObject(672, -1995.09997559, 478.29998779, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (13)
    CreateObject(672, -1995.00000000, 486.50000000, 34.20000076, 0.00000000, 0.00000000, 94.02099609); //object(sm_veg_tree5) (14)
    //Гора Чиллиад
    AddStaticVehicleEx(562, -2324.63598633, -1559.01293945, 483.24499512, 242.00000000, 1, 1, 15); //Elegy
    AddStaticVehicleEx(562, -2290.82788086, -1565.56701660, 483.33200073, 151.99572754, 1, 1, 15); //Elegy
    AddStaticVehicleEx(560, -2315.46606445, -1574.49401855, 483.48300171, 151.99987793, 1, 1, 15); //Sultan
    AddStaticVehicleEx(560, -2303.02001953, -1587.08398438, 483.46301270, 333.99584961, 1, 1, 15); //Sultan
    AddStaticVehicleEx(587, -2328.68896484, -1550.52404785, 483.33401489, 6.00000000, -1, -1, 15); //Euros
    AddStaticVehicleEx(426, -2340.53710938, -1582.44201660, 483.45700073, 242.00000000, -1, -1, 15); //Premier
    AddStaticVehicleEx(426, -2342.20996094, -1585.82995605, 483.45700073, 241.99584961, -1, -1, 15); //Premier
    AddStaticVehicleEx(426, -2344.01904297, -1589.29895020, 483.45700073, 241.99584961, -1, -1, 15); //Premier
    AddStaticVehicleEx(487, -2267.37011719, -1576.73303223, 483.87600708, 60.00000000, -1, -1, 15); //Maverick
    AddStaticVehicleEx(487, -2280.84790039, -1603.02001953, 483.88198853, 62.00000000, -1, -1, 15); //Maverick
    AddStaticVehicleEx(487, -2273.52392578, -1589.57604980, 483.88198853, 59.99633789, -1, -1, 15); //Maverick
    AddStaticVehicleEx(560, -2304.55102539, -1554.96801758, 483.36999512, 151.99584961, 1, 1, 15); //Sultan
    AddStaticVehicleEx(529, -2324.68896484, -1665.24194336, 483.03500366, 328.00000000, -1, -1, 15); //Willard
    CreateDynamicObject(1217, -2309.57006836, -1592.34704590, 483.03799438, 0.00000000, 0.00000000, 0.00000000); //object(barrel2) (2)
    CreateDynamicObject(3425, -2287.08007812, -1639.30395508, 493.06698608, 0.00000000, 0.00000000, 74.00000000); //object(nt_windmill) (1)
    CreateDynamicObject(6959, -2328.27709961, -1581.35705566, 482.66799927, 0.00000000, 0.00000000, 332.00000000); //object(vegasnbball1) (1)
    CreateDynamicObject(6959, -2292.77001953, -1600.18200684, 482.64801025, 0.00000000, 0.00000000, 331.99584961); //object(vegasnbball1) (2)
    CreateDynamicObject(17575, -2322.21191406, -1574.20300293, 486.36898804, 0.00000000, 0.00000000, 242.00000000); //object(burgho01_lae2) (1)
    CreateDynamicObject(17575, -2307.82495117, -1547.97204590, 486.25601196, 0.00000000, 0.00000000, 241.99584961); //object(burgho01_lae2) (2)
    CreateDynamicObject(1217, -2310.25097656, -1592.01696777, 483.03799438, 0.00000000, 0.00000000, 0.00000000); //object(barrel2) (3)
    CreateDynamicObject(6959, -2278.62915039, -1573.64001465, 482.64199829, 0.00000000, 0.00000000, 331.99584961); //object(vegasnbball1) (4)
    CreateDynamicObject(6959, -2314.19995117, -1554.61096191, 482.55499268, 0.00000000, 0.00000000, 331.99584961); //object(vegasnbball1) (5)
    CreateDynamicObject(705, -2256.20703125, -1568.84802246, 482.59100342, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (1)
    CreateDynamicObject(705, -2284.76904297, -1623.00500488, 482.61700439, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (2)
    CreateDynamicObject(705, -2338.93188477, -1578.85498047, 482.63699341, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (3)
    CreateDynamicObject(705, -2283.41992188, -1553.88000488, 482.59100342, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (4)
    CreateDynamicObject(705, -2321.91796875, -1530.48706055, 483.50201416, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (5)
    CreateDynamicObject(3877, -2277.79907227, -1614.86303711, 484.28298950, 0.00000000, 0.00000000, 332.00000000); //object(sf_rooflite) (6)
    CreateDynamicObject(3877, -2274.92895508, -1609.69702148, 484.28298950, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (7)
    CreateDynamicObject(3877, -2272.05200195, -1604.31494141, 484.28298950, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (8)
    CreateDynamicObject(3877, -2269.08105469, -1598.52294922, 484.28298950, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (9)
    CreateDynamicObject(3877, -2266.32202148, -1593.26599121, 484.28298950, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (10)
    CreateDynamicObject(3877, -2263.44995117, -1588.01794434, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (11)
    CreateDynamicObject(3877, -2260.89208984, -1582.97705078, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (12)
    CreateDynamicObject(3877, -2257.76000977, -1577.19799805, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (13)
    CreateDynamicObject(3877, -2254.78906250, -1571.64099121, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (14)
    CreateDynamicObject(3877, -2258.62207031, -1562.10705566, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (15)
    CreateDynamicObject(3877, -2263.55102539, -1559.45605469, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (16)
    CreateDynamicObject(3877, -2269.18701172, -1556.45898438, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (17)
    CreateDynamicObject(3877, -2274.08398438, -1553.87902832, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (18)
    CreateDynamicObject(3877, -2280.16699219, -1550.62304688, 484.27700806, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (19)
    CreateDynamicObject(3877, -2300.22900391, -1539.90405273, 484.18899536, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (20)
    CreateDynamicObject(3877, -2305.18310547, -1537.22094727, 484.18899536, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (21)
    CreateDynamicObject(3877, -2333.35009766, -1547.47094727, 484.18899536, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (22)
    CreateDynamicObject(3877, -2335.31494141, -1551.21203613, 484.18899536, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (23)
    CreateDynamicObject(3877, -2330.98095703, -1543.06799316, 484.18899536, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (24)
    CreateDynamicObject(3877, -2328.83398438, -1539.12402344, 484.18899536, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (25)
    CreateDynamicObject(1217, -2310.16894531, -1592.71704102, 483.03799438, 0.00000000, 0.00000000, 0.00000000); //object(barrel2) (4)
    CreateDynamicObject(1217, -2287.90600586, -1557.68994141, 483.03201294, 0.00000000, 0.00000000, 0.00000000); //object(barrel2) (5)
    CreateDynamicObject(3877, -2280.66894531, -1620.39001465, 484.28298950, 0.00000000, 0.00000000, 331.99584961); //object(sf_rooflite) (26)
    CreateDynamicObject(18368, -2281.33911133, -1650.69104004, 477.19900513, 0.00000000, 0.00000000, 346.00000000); //object(cs_mountplat) (1)
    CreateDynamicObject(705, -2288.59692383, -1671.01000977, 481.57901001, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (6)
    CreateDynamicObject(705, -2285.26806641, -1677.62402344, 481.08300781, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (7)
    CreateDynamicObject(705, -2280.27905273, -1683.29101562, 480.31698608, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (8)
    CreateDynamicObject(705, -2275.06591797, -1688.60095215, 479.71899414, 0.00000000, 0.00000000, 343.49853516); //object(sm_veg_tree7vbig) (9)
    CreateDynamicObject(17575, -2349.10107422, -1657.32897949, 486.43499756, 0.00000000, 0.00000000, 235.99584961); //object(burgho01_lae2) (5)
    //Аэро ЛВ
    AddStaticVehicle(562, 1580.6519775, 1347.5899658, 10.7419996, 234.0000000, -1, -1); //Elegy
    AddStaticVehicle(562, 1581.1719971, 1352.2950439, 10.7419996, 232.0000000, -1, -1); //Elegy
    AddStaticVehicle(565, 1579.6429443, 1343.8050537, 10.6800003, 236.0000000, -1, -1); //Flash
    AddStaticVehicle(565, 1578.5629883, 1320.2810059, 10.6709995, 355.9973145, -1, -1); //Flash
    CreateDynamicObject(18822, 2054.1589355, 1055.2239990, 29.1050014, 90.0000000, 0.0000000, 334.0000000); //object(tube50mglass45bend1) (1)
    CreateDynamicObject(18818, 2045.9169922, 958.9337158, 29.2299995, 90.0000000, 0.0000000, 264.0000000); //object(tube50mglasst1) (1)
    CreateDynamicObject(18826, 2223.9755859, 952.9960938, 21.8759995, 59.9963379, 173.9959717, 353.9959717); //object(tube50mglass180bend) (1)
    CreateDynamicObject(18809, 2186.1784668, 944.1009521, 29.2390003, 90.0000000, 0.0000000, 84.0000000); //object(tube50mglass1) (2)
    CreateDynamicObject(18809, 2137.0268555, 949.2769775, 29.1998005, 90.0000000, 0.0000000, 83.9959717); //object(tube50mglass1) (3)
    CreateDynamicObject(18809, 2087.9003906, 954.4479980, 29.2000046, 90.0000000, 0.0000000, 83.9959717); //object(tube50mglass1) (4)
    CreateDynamicObject(18809, 2043.3486328, 1009.2851562, 29.1450005, 90.0000000, 0.0000000, 173.9959717); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 2084.2011719, 1093.7760010, 29.0860004, 90.0000000, 0.0000000, 135.9959717); //object(tube50mglass1) (6)
    CreateDynamicObject(18822, 2113.4189453, 1132.5540771, 29.0000000, 90.0000000, 0.0000000, 155.9953613); //object(tube50mglass45bend1) (2)
    CreateDynamicObject(18822, 2113.3857422, 1178.6025391, 28.9390011, 90.0000000, 0.0000000, 203.9941406); //object(tube50mglass45bend1) (3)
    CreateDynamicObject(18822, 2089.0039062, 1221.0870361, 28.9920006, 90.0000000, 0.0000000, 23.9941406); //object(tube50mglass45bend1) (4)
    CreateDynamicObject(18809, 2081.4309082, 1268.9250488, 28.9569988, 90.0000000, 0.0000000, 179.9959717); //object(tube50mglass1) (7)
    CreateDynamicObject(18809, 2081.4011230, 1318.6101074, 28.8999729, 90.0000000, 0.0000000, 179.9945068); //object(tube50mglass1) (8)
    CreateDynamicObject(18809, 2081.3991699, 1368.1959229, 28.8869991, 90.0000000, 0.0000000, 179.9945068); //object(tube50mglass1) (9)
    CreateDynamicObject(18809, 2081.3999023, 1417.7309570, 28.8790016, 90.0000000, 0.0000000, 179.9945068); //object(tube50mglass1) (10)
    CreateDynamicObject(18809, 2081.4069824, 1466.6350098, 28.8640003, 90.0000000, 0.0000000, 179.9945068); //object(tube50mglass1) (11)
    CreateDynamicObject(18809, 2081.4121094, 1516.4060059, 28.8800468, 90.0000000, 0.0000000, 179.9945068); //object(tube50mglass1) (12)
    CreateDynamicObject(18809, 2081.3984375, 1564.7304688, 28.8659992, 90.0000000, 0.0000000, 179.9945068); //object(tube50mglass1) (15)
    CreateDynamicObject(18809, 2081.4311523, 1613.5329590, 28.8439999, 90.0000000, 0.0000000, 179.9945068); //object(tube50mglass1) (16)
    CreateDynamicObject(18822, 2076.3000488, 1661.2419434, 28.8290005, 90.0000000, 0.0000000, 197.9941406); //object(tube50mglass45bend1) (5)
    CreateDynamicObject(18822, 2045.0870361, 1694.8149414, 28.8000507, 90.0000000, 0.0000000, 247.9901123); //object(tube50mglass45bend1) (6)
    CreateDynamicObject(18809, 1996.3950195, 1702.4530029, 28.7479992, 90.0000000, 0.0000000, 267.9945068); //object(tube50mglass1) (17)
    CreateDynamicObject(18809, 1946.5000000, 1704.0920410, 28.7660007, 90.0000000, 0.0000000, 267.9895020); //object(tube50mglass1) (18)
    CreateDynamicObject(18809, 1896.7989502, 1705.8559570, 28.7819996, 90.0000000, 0.0000000, 267.9895020); //object(tube50mglass1) (19)
    CreateDynamicObject(18809, 1847.1490479, 1707.5429688, 28.7500000, 90.0000000, 0.0000000, 267.9895020); //object(tube50mglass1) (20)
    CreateDynamicObject(18809, 1797.5129395, 1709.3029785, 28.7589989, 90.0000000, 0.0000000, 267.9895020); //object(tube50mglass1) (21)
    CreateDynamicObject(18809, 1747.8489990, 1711.0729980, 28.6999493, 90.0000000, 0.0000000, 267.9895020); //object(tube50mglass1) (22)
    CreateDynamicObject(18822, 1699.0179443, 1707.6199951, 28.6998997, 90.0000000, 0.0000000, 285.9888916); //object(tube50mglass45bend1) (7)
    CreateDynamicObject(18809, 1656.3070068, 1683.9539795, 28.6989994, 90.0000000, 0.0000000, 305.9895020); //object(tube50mglass1) (23)
    CreateDynamicObject(18809, 1616.1419678, 1654.7810059, 28.6310005, 90.0000000, 0.0000000, 305.9895020); //object(tube50mglass1) (24)
    CreateDynamicObject(18822, 1573.4449463, 1630.6319580, 19.9909992, 70.0000000, 0.0000000, 105.9851685); //object(tube50mglass45bend1) (9)
    CreateDynamicObject(18826, 2020.6409912, 927.0469971, 37.6919975, 59.9963379, 173.9959717, 267.9959717); //object(tube50mglass180bend) (1)
    CreateDynamicObject(18809, 2010.8520508, 963.9993286, 45.0600014, 90.0000000, 0.0000000, 173.9959717); //object(tube50mglass1) (5)
    CreateDynamicObject(18826, 2001.8549805, 1000.9909058, 53.5699997, 300.0091553, 173.9959717, 73.9949951); //object(tube50mglass180bend) (1)
    CreateDynamicObject(18826, 1971.5469971, 985.4280396, 69.3639984, 59.9908447, 173.9959717, 267.9949951); //object(tube50mglass180bend) (1)
    CreateDynamicObject(18809, 1961.8509521, 1022.5399780, 76.6259995, 90.0000000, 0.0000000, 173.9959717); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 1967.1040039, 1072.1059570, 76.6470032, 90.0000000, 0.0000000, 173.9959717); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 1972.3089600, 1121.6639404, 76.6439972, 90.0000000, 0.0000000, 173.9959717); //object(tube50mglass1) (5)
    CreateDynamicObject(18822, 1972.2719727, 1170.2239990, 76.5999374, 90.0000000, 0.0000000, 191.9941406); //object(tube50mglass45bend1) (3)
    CreateDynamicObject(18822, 1947.5579834, 1209.9510498, 76.5340042, 90.0000000, 0.0000000, 231.9915771); //object(tube50mglass45bend1) (3)
    CreateDynamicObject(18809, 1904.0250244, 1230.3879395, 76.4998016, 90.0000000, 0.0000000, 251.9959717); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 1856.9470215, 1245.7059326, 76.4409943, 90.0000000, 0.0000000, 251.9934082); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 1810.3879395, 1260.8349609, 76.4360046, 90.0000000, 0.0000000, 251.9934082); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 1763.7939453, 1275.9934082, 76.4270020, 90.0000000, 0.0000000, 251.9934082); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 1717.0460205, 1291.2059326, 76.3991013, 90.0000000, 0.0000000, 251.9934082); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 1670.4229736, 1306.3599854, 76.4000015, 90.0000000, 0.0000000, 251.9934082); //object(tube50mglass1) (5)
    CreateDynamicObject(18809, 1622.5830078, 1321.9938965, 76.4999008, 90.0000000, 0.0000000, 251.9934082); //object(tube50mglass1) (5)
    CreateDynamicObject(18826, 1583.8649902, 1321.2110596, 69.1100006, 59.9908447, 173.9959717, 161.9949951); //object(tube50mglass180bend) (1)
    CreateDynamicObject(18826, 1603.7590332, 1311.4500732, 53.2849998, 59.9853516, 173.9959717, 335.9934082); //object(tube50mglass180bend) (1)
    CreateDynamicObject(18826, 1585.5980225, 1324.3669434, 37.3079987, 59.9798584, 173.9959717, 143.9893799); //object(tube50mglass180bend) (1)
    CreateDynamicObject(18826, 1601.2159424, 1307.7760010, 21.4829998, 59.9743652, 173.9959717, 313.9868164); //object(tube50mglass180bend) (1)
    CreateDynamicObject(3524, 1610.3420410, 1327.9580078, 12.7100000, 0.0000000, 0.0000000, 240.0000000); //object(skullpillar01_lvs) (1)
    CreateDynamicObject(3524, 1600.6850586, 1320.6860352, 12.7170000, 0.0000000, 0.0000000, 199.9963379); //object(skullpillar01_lvs) (2)
    CreateDynamicObject(3524, 1550.8129883, 1621.2860107, 12.7060003, 0.0000000, 0.0000000, 285.9963379); //object(skullpillar01_lvs) (3)
    CreateDynamicObject(3524, 1552.2469482, 1632.2030029, 12.7060003, 0.0000000, 0.0000000, 207.9960938); //object(skullpillar01_lvs) (4)
    CreateDynamicObject(3524, 2215.2429199, 963.5590210, 12.7060003, 0.0000000, 0.0000000, 277.9931641); //object(skullpillar01_lvs) (5)
    CreateDynamicObject(3524, 2217.3269043, 973.9260254, 12.5570002, 0.0000000, 0.0000000, 187.9925537); //object(skullpillar01_lvs) (6)
    CreateDynamicObject(19279, 1609.7320557, 1327.6319580, 10.0699997, 0.0000000, 0.0000000, 0.0000000); //object(lcsmalllight1) (1)
    CreateDynamicObject(19279, 1601.3950195, 1321.2099609, 10.0760002, 0.0000000, 0.0000000, 82.0000000); //object(lcsmalllight1) (2)
    CreateDynamicObject(19125, 1577.4443359, 1341.3007812, 10.5530005, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (1)
    CreateDynamicObject(19129, 1606.5009766, 1324.7790527, 9.8909998, 0.0000000, 0.0000000, 358.0000000); //object(dancefloor2) (1)
    CreateDynamicObject(18794, 1492.4659424, 1378.4410400, 8.9619999, 0.0000000, 0.0000000, 136.0000000); //object(mroadbend15deg1) (1)
    CreateDynamicObject(19129, 1607.1910400, 1344.7349854, 9.8959999, 0.0000000, 0.0000000, 357.9949951); //object(dancefloor2) (2)
    CreateDynamicObject(19129, 1607.8959961, 1364.6839600, 9.8959999, 0.0000000, 0.0000000, 357.9949951); //object(dancefloor2) (3)
    CreateDynamicObject(19129, 1586.5820312, 1325.5100098, 9.9090004, 0.0000000, 0.0000000, 357.9949951); //object(dancefloor2) (4)
    CreateDynamicObject(19129, 1587.2929688, 1345.3869629, 9.9180002, 0.0000000, 0.0000000, 357.9949951); //object(dancefloor2) (5)
    CreateDynamicObject(19129, 1587.9940186, 1365.3830566, 9.9189997, 0.0000000, 0.0000000, 357.9949951); //object(dancefloor2) (6)
    CreateDynamicObject(18791, 1538.4849854, 1342.3220215, 9.5389996, 0.0000000, 0.0000000, 336.0000000); //object(mroadbend45deg) (1)
    CreateDynamicObject(713, 1576.9648438, 1345.4785156, 9.8549995, 0.0000000, 0.0000000, 155.4730225); //object(veg_bevtree1) (1)
    CreateDynamicObject(713, 1576.8540039, 1356.6140137, 9.8579998, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (2)
    CreateDynamicObject(713, 1577.1199951, 1366.5479736, 9.8649998, 0.0000000, 0.0000000, 155.4785156); //object(veg_bevtree1) (3)
    CreateDynamicObject(713, 1577.4843750, 1376.2343750, 9.8529997, 0.0000000, 0.0000000, 155.4730225); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1612.4630127, 1375.6300049, 9.8280001, 0.0000000, 0.0000000, 161.4785156); //object(veg_bevtree1) (5)
    CreateDynamicObject(713, 1617.8809814, 1331.2600098, 9.8100004, 0.0000000, 0.0000000, 73.4770508); //object(veg_bevtree1) (6)
    CreateDynamicObject(713, 1618.1910400, 1341.9150391, 9.8100004, 0.0000000, 0.0000000, 73.4765625); //object(veg_bevtree1) (7)
    CreateDynamicObject(713, 1618.8380127, 1354.3559570, 9.8109999, 0.0000000, 0.0000000, 73.4710693); //object(veg_bevtree1) (8)
    CreateDynamicObject(713, 1619.0219727, 1366.9310303, 9.8149996, 0.0000000, 0.0000000, 73.4765625); //object(veg_bevtree1) (9)
    CreateDynamicObject(16139, 1549.1132812, 1366.6328125, 4.8670001, 0.0000000, 0.0000000, 327.9968262); //object(des_rockgp2_19) (1)
    CreateDynamicObject(19125, 1577.0379639, 1325.7669678, 10.5439997, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (2)
    CreateDynamicObject(19125, 1473.0195312, 1386.5107422, 15.8199997, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (3)
    CreateDynamicObject(19125, 1483.7829590, 1397.6290283, 15.8920002, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (4)
    CreateDynamicObject(16139, 1482.2500000, 1428.1611328, 4.8670001, 0.0000000, 0.0000000, 303.9862061); //object(des_rockgp2_19) (2)
    CreateDynamicObject(16139, 1512.6899414, 1393.0129395, 4.8670001, 0.0000000, 0.0000000, 313.9948730); //object(des_rockgp2_19) (3)
    CreateDynamicObject(16139, 1453.6484375, 1455.8134766, 4.8670001, 0.0000000, 0.0000000, 303.9862061); //object(des_rockgp2_19) (4)
    CreateDynamicObject(16139, 1568.0939941, 1306.8709717, 4.8670001, 0.0000000, 0.0000000, 153.9948730); //object(des_rockgp2_19) (5)
    CreateDynamicObject(16139, 1456.2810059, 1370.5179443, 4.8670001, 0.0000000, 0.0000000, 149.9948730); //object(des_rockgp2_19) (6)
    CreateDynamicObject(16139, 1527.8000488, 1320.5150146, 4.8670001, 0.0000000, 0.0000000, 153.9948730); //object(des_rockgp2_19) (7)
    CreateDynamicObject(16139, 1488.1020508, 1347.6240234, 4.8670001, 0.0000000, 0.0000000, 135.9948730); //object(des_rockgp2_19) (8)
    CreateDynamicObject(19290, 1576.5240479, 1333.6149902, 9.9080000, 0.0000000, 0.0000000, 0.0000000); //object(pointlight10) (1)
    CreateDynamicObject(19290, 1571.7010498, 1334.0749512, 9.9080000, 0.0000000, 0.0000000, 0.0000000); //object(pointlight10) (2)
    CreateDynamicObject(19290, 1566.7989502, 1334.5670166, 9.9080000, 0.0000000, 0.0000000, 0.0000000); //object(pointlight10) (3)
    CreateDynamicObject(19290, 1560.8299561, 1335.4239502, 9.9080000, 0.0000000, 0.0000000, 0.0000000); //object(pointlight10) (4)
    CreateDynamicObject(19297, 1478.5240479, 1391.9499512, 15.0340004, 0.0000000, 0.0000000, 0.0000000); //object(pointlight17) (1)
    CreateDynamicObject(10789, 1467.9799805, 1402.6820068, 10.0050001, 0.0000000, 0.0000000, 316.0000000); //object(xenonroof_sfse) (1)
    CreateDynamicObject(10789, 1447.8730469, 1422.0400391, 10.0050001, 0.0000000, 0.0000000, 315.9992676); //object(xenonroof_sfse) (2)
    CreateDynamicObject(10789, 1427.8039551, 1441.3830566, 10.0050001, 0.0000000, 0.0000000, 315.9942627); //object(xenonroof_sfse) (3)
    CreateDynamicObject(16139, 1358.5219727, 1404.3289795, 4.8670001, 0.0000000, 0.0000000, 149.9908752); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1434.8399658, 1475.7399902, 4.8670001, 0.0000000, 0.0000000, 307.9908447); //object(des_rockgp2_19) (10)
    CreateDynamicObject(16139, 1409.0240479, 1420.0190430, 4.8670001, 0.0000000, 0.0000000, 123.9909058); //object(des_rockgp2_19) (11)
    CreateDynamicObject(16139, 1387.4746094, 1439.9453125, 4.8670001, 0.0000000, 0.0000000, 125.9857178); //object(des_rockgp2_19) (12)
    CreateDynamicObject(16139, 1365.0699463, 1476.4890137, 4.8670001, 0.0000000, 0.0000000, 115.9908447); //object(des_rockgp2_19) (13)
    CreateDynamicObject(16139, 1433.1629639, 1395.6090088, 4.8670001, 0.0000000, 0.0000000, 123.9909058); //object(des_rockgp2_19) (14)
    CreateDynamicObject(1540, 1424.1519775, 1453.2609863, 17.4880009, 0.0000000, 0.0000000, 315.9945068); //object(vegasmotsigncj) (1)
    CreateDynamicObject(10789, 1407.6162109, 1460.5917969, 10.0050001, 0.0000000, 0.0000000, 315.9887695); //object(xenonroof_sfse) (4)
    CreateDynamicObject(18795, 1383.3620605, 1484.2449951, 11.7200003, 0.0000000, 0.0000000, 135.9997559); //object(mroadbend15deg2) (2)
    CreateDynamicObject(19125, 1392.4370117, 1464.6579590, 13.1870003, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (3)
    CreateDynamicObject(19125, 1403.1450195, 1475.8800049, 13.1940002, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (3)
    CreateDynamicObject(18795, 1362.8189697, 1517.6429443, 11.7199993, 0.0000000, 0.0000000, 121.9997559); //object(mroadbend15deg2) (3)
    CreateDynamicObject(18795, 1350.7769775, 1555.6940918, 11.7199993, 0.0000000, 0.0000000, 107.9977112); //object(mroadbend15deg2) (4)
    CreateDynamicObject(16139, 1489.5030518, 1499.2490234, 4.8670001, 0.0000000, 0.0000000, 175.9899902); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1496.9410400, 1543.6359863, 4.8670001, 0.0000000, 0.0000000, 163.9909668); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1331.3959961, 1551.4730225, 4.8670001, 0.0000000, 0.0000000, 91.9908447); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1343.5720215, 1513.4000244, 4.8670001, 0.0000000, 0.0000000, 101.9908447); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1404.9680176, 1494.9189453, 4.8670001, 0.0000000, 0.0000000, 297.9908447); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1306.2070312, 1393.8630371, 4.8670001, 0.0000000, 0.0000000, 149.9908752); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1305.6209717, 1368.8530273, 4.8670001, 0.0000000, 0.0000000, 149.9908752); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1305.3570557, 1351.2860107, 4.8670001, 0.0000000, 0.0000000, 149.9908752); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1316.9399414, 1368.4899902, 4.8670001, 0.0000000, 0.0000000, 149.9908752); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1381.9940186, 1534.3840332, 4.8670001, 0.0000000, 0.0000000, 279.9908447); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1378.2020264, 1552.2600098, 4.8670001, 0.0000000, 0.0000000, 279.9865723); //object(des_rockgp2_19) (9)
    CreateDynamicObject(18800, 1370.1799316, 1606.7999268, 23.7249985, 0.0000000, 0.0000000, 94.0000000); //object(mroadhelix1) (1)
    CreateDynamicObject(18800, 1458.8000488, 1648.7110596, 17.6049995, 0.0000000, 0.0000000, 247.9945068); //object(mroadhelix1) (2)
    CreateDynamicObject(18794, 1396.4599609, 1558.7130127, 35.3660011, 0.0000000, 0.0000000, 274.0000000); //object(mroadbend15deg1) (2)
    CreateDynamicObject(18789, 1405.7929688, 1424.9000244, 46.2999687, 0.0000000, 0.0000000, 94.0000000); //object(mroad150m) (1)
    CreateDynamicObject(18794, 1399.1689453, 1519.2200928, 40.5559998, 0.0000000, 0.0000000, 273.9990234); //object(mroadbend15deg1) (3)
    CreateDynamicObject(18800, 1435.8649902, 1322.4229736, 34.1080856, 0.0000000, 0.0000000, 273.9990234); //object(mroadhelix1) (3)
    CreateDynamicObject(18789, 1451.2230225, 1427.5870361, 22.7089996, 0.0000000, 0.0000000, 94.0000000); //object(mroad150m) (2)
    CreateDynamicObject(18786, 1480.8909912, 1526.2290039, 12.3129997, 0.0000000, 0.0000000, 177.9995117); //object(funboxramp3) (1)
    CreateDynamicObject(18800, 1421.3925781, 1527.5000000, 10.5030003, 0.0000000, 0.0000000, 93.9990234); //object(mroadhelix1) (4)
    CreateDynamicObject(1633, 1452.2030029, 1358.4169922, 24.3530006, 0.0000000, 0.0000000, 4.0000000); //object(landjump) (1)
    CreateDynamicObject(1633, 1456.3459473, 1358.6879883, 24.3530006, 0.0000000, 0.0000000, 3.9990234); //object(landjump) (2)
    CreateDynamicObject(1633, 1460.4090576, 1358.9709473, 24.3530006, 0.0000000, 0.0000000, 3.9990234); //object(landjump) (3)
    CreateDynamicObject(1633, 1445.8220215, 1453.7099609, 24.3530006, 0.0000000, 0.0000000, 3.9990234); //object(landjump) (4)
    CreateDynamicObject(1633, 1449.9670410, 1454.0090332, 24.3530006, 0.0000000, 0.0000000, 3.9990234); //object(landjump) (5)
    CreateDynamicObject(1633, 1454.0722656, 1454.3085938, 24.3530006, 0.0000000, 0.0000000, 3.9935303); //object(landjump) (6)
    CreateDynamicObject(713, 1423.1914062, 1527.6835938, 9.8199997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(4828, 1448.8798828, 1571.4257812, 14.1599998, 0.0000000, 0.0000000, 261.9964600); //object(lasairprt5) (1)
    CreateDynamicObject(1633, 1452.3719482, 1476.4050293, 24.2530003, 0.0000000, 0.0000000, 183.9935303); //object(landjump) (6)
    CreateDynamicObject(1633, 1448.2330322, 1476.1080322, 24.2530003, 0.0000000, 0.0000000, 183.9880371); //object(landjump) (6)
    CreateDynamicObject(1633, 1444.0799561, 1475.8010254, 24.2530003, 0.0000000, 0.0000000, 183.9880371); //object(landjump) (6)
    CreateDynamicObject(981, 1418.7950439, 1528.8609619, 10.5000000, 0.0000000, 0.0000000, 0.0000000); //object(helix_barrier) (1)
    CreateDynamicObject(978, 1434.2039795, 1528.5419922, 10.6610003, 0.0000000, 0.0000000, 287.9949951); //object(sub_roadright) (10)
    CreateDynamicObject(978, 1431.3449707, 1537.3759766, 10.6610003, 0.0000000, 0.0000000, 287.9901123); //object(sub_roadright) (11)
    CreateDynamicObject(978, 1427.0469971, 1545.4479980, 10.6610003, 0.0000000, 0.0000000, 307.9901123); //object(sub_roadright) (12)
    CreateDynamicObject(978, 1422.5720215, 1553.5400391, 10.6610003, 0.0000000, 0.0000000, 289.9852295); //object(sub_roadright) (13)
    CreateDynamicObject(978, 1419.8520508, 1562.4539795, 10.6610003, 0.0000000, 0.0000000, 283.9841309); //object(sub_roadright) (14)
    CreateDynamicObject(978, 1418.1169434, 1571.5229492, 10.6610003, 0.0000000, 0.0000000, 277.9801025); //object(sub_roadright) (15)
    CreateDynamicObject(978, 1413.9420166, 1579.2099609, 10.6610003, 0.0000000, 0.0000000, 317.9760742); //object(sub_roadright) (16)
    CreateDynamicObject(979, 1432.6719971, 1592.8339844, 10.6529999, 0.0000000, 0.0000000, 123.9999695); //object(sub_roadleft) (2)
    CreateDynamicObject(979, 1437.5520020, 1584.9410400, 10.6529999, 0.0000000, 0.0000000, 119.9957275); //object(sub_roadleft) (3)
    CreateDynamicObject(979, 1442.2309570, 1576.8649902, 10.6529999, 0.0000000, 0.0000000, 119.9926758); //object(sub_roadleft) (4)
    CreateDynamicObject(979, 1449.9470215, 1544.4699707, 10.6610003, 0.0000000, 0.0000000, 111.9926758); //object(sub_roadleft) (5)
    CreateDynamicObject(979, 1446.4790039, 1553.1469727, 10.6610003, 0.0000000, 0.0000000, 111.9891052); //object(sub_roadleft) (6)
    CreateDynamicObject(979, 1444.6009521, 1562.1059570, 10.6529999, 0.0000000, 0.0000000, 91.9891052); //object(sub_roadleft) (7)
    CreateDynamicObject(979, 1444.4069824, 1566.9219971, 10.6529999, 0.0000000, 0.0000000, 91.9885254); //object(sub_roadleft) (8)
    CreateDynamicObject(978, 1407.0579834, 1585.4270020, 10.6529999, 0.0000000, 0.0000000, 317.9718018); //object(sub_roadright) (17)
    CreateDynamicObject(978, 1402.9520264, 1593.1879883, 10.6529999, 0.0000000, 0.0000000, 277.9718018); //object(sub_roadright) (18)
    CreateDynamicObject(978, 1403.2769775, 1602.3439941, 10.6529999, 0.0000000, 0.0000000, 257.9705811); //object(sub_roadright) (19)
    CreateDynamicObject(978, 1406.7230225, 1610.8590088, 10.6529999, 0.0000000, 0.0000000, 237.9699707); //object(sub_roadright) (20)
    CreateDynamicObject(978, 1413.0200195, 1617.3740234, 10.6610003, 0.0000000, 0.0000000, 213.9693604); //object(sub_roadright) (21)
    CreateDynamicObject(978, 1421.5400391, 1620.3070068, 10.6610003, 0.0000000, 0.0000000, 183.9642334); //object(sub_roadright) (22)
    CreateDynamicObject(1633, 1454.1120605, 1365.0600586, 24.3530006, 0.0000000, 0.0000000, 183.9880371); //object(landjump) (6)
    CreateDynamicObject(978, 1430.8310547, 1620.9709473, 10.6529999, 0.0000000, 0.0000000, 183.9605713); //object(sub_roadright) (23)
    CreateDynamicObject(978, 1440.0970459, 1621.6120605, 10.6610003, 0.0000000, 0.0000000, 183.9605713); //object(sub_roadright) (24)
    CreateDynamicObject(978, 1449.2469482, 1620.6560059, 10.6610003, 0.0000000, 0.0000000, 163.9605713); //object(sub_roadright) (25)
    CreateDynamicObject(978, 1457.5610352, 1616.6090088, 10.6529999, 0.0000000, 0.0000000, 143.9599609); //object(sub_roadright) (26)
    CreateDynamicObject(978, 1464.4570312, 1610.3850098, 10.6529999, 0.0000000, 0.0000000, 131.9593506); //object(sub_roadright) (27)
    CreateDynamicObject(978, 1468.5310059, 1602.3940430, 10.6529999, 0.0000000, 0.0000000, 101.9567566); //object(sub_roadright) (28)
    CreateDynamicObject(978, 1472.0860596, 1594.0329590, 10.6529999, 0.0000000, 0.0000000, 123.9531555); //object(sub_roadright) (29)
    CreateDynamicObject(979, 1451.6259766, 1539.5620117, 10.6610003, 0.0000000, 0.0000000, 267.9891357); //object(sub_roadleft) (9)
    CreateDynamicObject(979, 1450.9890137, 1548.8120117, 10.6610003, 0.0000000, 0.0000000, 279.9840088); //object(sub_roadleft) (10)
    CreateDynamicObject(979, 1449.3691406, 1557.9882812, 10.6610003, 0.0000000, 0.0000000, 279.9755859); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1448.1760254, 1564.8089600, 10.6529999, 0.0000000, 0.0000000, 279.9810791); //object(sub_roadleft) (12)
    CreateDynamicObject(979, 1433.9040527, 1594.1500244, 10.6610003, 0.0000000, 0.0000000, 313.9810791); //object(sub_roadleft) (13)
    CreateDynamicObject(979, 1440.2919922, 1587.4930420, 10.6529999, 0.0000000, 0.0000000, 313.9782715); //object(sub_roadleft) (14)
    CreateDynamicObject(979, 1445.1429443, 1582.4739990, 10.6529999, 0.0000000, 0.0000000, 313.9782715); //object(sub_roadleft) (15)
    CreateDynamicObject(979, 1450.8349609, 1575.4909668, 10.6529999, 0.0000000, 0.0000000, 303.9782715); //object(sub_roadleft) (16)
    CreateDynamicObject(978, 1475.9029541, 1585.6230469, 10.6529999, 0.0000000, 0.0000000, 103.9477539); //object(sub_roadright) (30)
    CreateDynamicObject(978, 1478.1503906, 1576.5488281, 10.6529999, 0.0000000, 0.0000000, 103.9416199); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1479.6130371, 1567.3680420, 10.6529999, 0.0000000, 0.0000000, 93.9471436); //object(sub_roadright) (32)
    CreateDynamicObject(978, 1477.8769531, 1558.5300293, 10.6529999, 0.0000000, 0.0000000, 63.9440918); //object(sub_roadright) (33)
    CreateDynamicObject(978, 1474.5729980, 1549.8649902, 10.6529999, 0.0000000, 0.0000000, 73.9425049); //object(sub_roadright) (34)
    CreateDynamicObject(978, 1472.4689941, 1540.7679443, 10.6529999, 0.0000000, 0.0000000, 79.9414062); //object(sub_roadright) (36)
    CreateDynamicObject(979, 1466.2969971, 1517.5439453, 10.6529999, 0.0000000, 0.0000000, 347.9840088); //object(sub_roadleft) (17)
    CreateDynamicObject(979, 1457.1159668, 1519.5129395, 10.6610003, 0.0000000, 0.0000000, 347.9809570); //object(sub_roadleft) (18)
    CreateDynamicObject(979, 1450.3470459, 1520.9399414, 10.6610003, 0.0000000, 0.0000000, 347.9809570); //object(sub_roadleft) (19)
    CreateDynamicObject(981, 1463.8134766, 1516.9365234, 10.4200001, 0.0000000, 0.0000000, 353.9959717); //object(helix_barrier) (3)
    CreateDynamicObject(981, 1478.1500244, 1552.1159668, 10.4200001, 0.0000000, 0.0000000, 247.9959717); //object(helix_barrier) (5)
    CreateDynamicObject(18783, 1500.6530762, 1525.5249023, 12.3129997, 0.0000000, 0.0000000, 358.0000000); //object(funboxtop1) (1)
    CreateDynamicObject(18783, 1520.5537109, 1524.7968750, 12.3529997, 0.0000000, 0.0000000, 357.9949951); //object(funboxtop1) (2)
    CreateDynamicObject(18786, 1528.3599854, 1504.4539795, 12.3629999, 0.0000000, 0.0000000, 267.9949951); //object(funboxramp3) (1)
    CreateDynamicObject(16139, 1467.0970459, 1478.0989990, 4.8670001, 0.0000000, 0.0000000, 63.9862061); //object(des_rockgp2_19) (2)
    CreateDynamicObject(16139, 1526.8066406, 1541.2773438, 4.8670001, 0.0000000, 0.0000000, 153.9843750); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1546.2989502, 1518.4919434, 4.8670001, 0.0000000, 0.0000000, 73.9809570); //object(des_rockgp2_19) (9)
    CreateDynamicObject(18783, 1529.0140381, 1524.5319824, 12.3520002, 0.0000000, 0.0000000, 357.9949951); //object(funboxtop1) (2)
    CreateDynamicObject(981, 1497.0670166, 1491.1619873, 9.8199997, 0.0000000, 0.0000000, 33.9959717); //object(helix_barrier) (3)
    CreateDynamicObject(981, 1476.0810547, 1458.1700439, 9.8199997, 0.0000000, 0.0000000, 77.9916992); //object(helix_barrier) (3)
    CreateDynamicObject(981, 1486.9300537, 1434.0749512, 9.8199997, 0.0000000, 0.0000000, 145.9864502); //object(helix_barrier) (3)
    CreateDynamicObject(981, 1503.7080078, 1410.6309814, 9.8369999, 0.0000000, 0.0000000, 107.9863586); //object(helix_barrier) (3)
    CreateDynamicObject(981, 1518.7490234, 1398.9489746, 9.8699999, 0.0000000, 0.0000000, 149.9846191); //object(helix_barrier) (3)
    CreateDynamicObject(981, 1548.8869629, 1395.6199951, 9.8540001, 0.0000000, 0.0000000, 199.9798584); //object(helix_barrier) (3)
    CreateDynamicObject(16139, 1559.0899658, 1388.5109863, 4.8670001, 0.0000000, 0.0000000, 15.9968262); //object(des_rockgp2_19) (1)
    CreateDynamicObject(18786, 1568.3229980, 1487.2929688, 12.2269993, 0.0000000, 0.0000000, 267.9949951); //object(funboxramp3) (1)
    CreateDynamicObject(18783, 1569.0389404, 1507.1419678, 12.2299995, 0.0000000, 0.0000000, 357.9949951); //object(funboxtop1) (2)
    CreateDynamicObject(18783, 1569.7979736, 1527.0389404, 12.3249998, 0.0000000, 0.0000000, 357.9949951); //object(funboxtop1) (2)
    CreateDynamicObject(18786, 1569.3149414, 1515.9069824, 17.1299992, 0.0000000, 0.0000000, 267.9949951); //object(funboxramp3) (1)
    CreateDynamicObject(18783, 1570.5229492, 1547.0179443, 12.2129993, 0.0000000, 0.0000000, 357.9949951); //object(funboxtop1) (2)
    CreateDynamicObject(18786, 1570.3680420, 1540.6839600, 17.1229992, 0.0000000, 0.0000000, 87.9949951); //object(funboxramp3) (1)
    CreateDynamicObject(18786, 1571.2259521, 1567.0129395, 12.2199993, 0.0000000, 0.0000000, 87.9945068); //object(funboxramp3) (1)
    CreateDynamicObject(8339, 1539.4150391, 1453.7270508, 13.8290005, 0.0000000, 0.0000000, 0.0000000); //object(vgsfrates11) (1)
    CreateDynamicObject(978, 1539.9599609, 1475.7760010, 10.6709995, 0.0000000, 0.0000000, 85.9416504); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1553.7130127, 1474.4840088, 10.6709995, 0.0000000, 0.0000000, 215.9379883); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1536.6005859, 1458.8642578, 10.6840000, 0.0000000, 0.0000000, 41.9348145); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1540.6059570, 1485.0620117, 10.6719999, 0.0000000, 0.0000000, 85.9405518); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1541.1199951, 1492.0310059, 10.6789999, 0.0000000, 0.0000000, 85.9405518); //object(sub_roadright) (31)
    CreateDynamicObject(19125, 1557.7285156, 1477.7080078, 10.3879995, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (1)
    CreateDynamicObject(19125, 1549.6960449, 1471.2769775, 10.3979998, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (1)
    CreateDynamicObject(979, 1513.6049805, 1497.5129395, 10.6879997, 0.0000000, 0.0000000, 209.9755859); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1505.4870605, 1492.8559570, 10.6759996, 0.0000000, 0.0000000, 209.9707031); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1497.5760498, 1487.9580078, 10.6580000, 0.0000000, 0.0000000, 213.9707031); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1490.9399414, 1481.5629883, 10.6680002, 0.0000000, 0.0000000, 233.9697266); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1485.3349609, 1474.1149902, 10.6680002, 0.0000000, 0.0000000, 231.9648438); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1481.0109863, 1465.9940186, 10.6680002, 0.0000000, 0.0000000, 251.9598389); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1479.0670166, 1456.9890137, 10.6610003, 0.0000000, 0.0000000, 263.9549561); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1480.1459961, 1448.0000000, 10.6610003, 0.0000000, 0.0000000, 289.9520264); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1485.2779541, 1440.6180420, 10.6610003, 0.0000000, 0.0000000, 319.9511719); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1492.4499512, 1434.5830078, 10.6610003, 0.0000000, 0.0000000, 319.9493408); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1498.9000244, 1427.8690186, 10.6639996, 0.0000000, 0.0000000, 307.9493408); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1503.3489990, 1419.8349609, 10.6669998, 0.0000000, 0.0000000, 289.9467773); //object(sub_roadleft) (11)
    CreateDynamicObject(713, 1553.7709961, 1483.0670166, 9.8249998, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1544.4746094, 1475.3701172, 9.8290005, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1543.7740479, 1483.7080078, 9.8299999, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(979, 1507.6579590, 1411.6800537, 10.6789999, 0.0000000, 0.0000000, 305.9456787); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1513.9489746, 1404.9410400, 10.6980000, 0.0000000, 0.0000000, 319.9417725); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1521.5279541, 1399.6309814, 10.7100000, 0.0000000, 0.0000000, 329.9383545); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1529.5720215, 1394.9840088, 10.7089996, 0.0000000, 0.0000000, 329.9359131); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1537.9300537, 1394.1860352, 10.7030001, 0.0000000, 0.0000000, 19.9359131); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1546.7330322, 1397.3669434, 10.6960001, 0.0000000, 0.0000000, 19.9346924); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1555.5539551, 1400.5649414, 10.6899996, 0.0000000, 0.0000000, 19.9346924); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1564.3593750, 1403.7382812, 10.6829996, 0.0000000, 0.0000000, 19.9346924); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1573.3690186, 1404.9840088, 10.6800003, 0.0000000, 0.0000000, 355.9346924); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1581.8399658, 1402.0379639, 10.6800003, 0.0000000, 0.0000000, 325.9295654); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1589.5909424, 1396.7659912, 10.6739998, 0.0000000, 0.0000000, 325.9259033); //object(sub_roadleft) (11)
    CreateDynamicObject(713, 1586.0019531, 1485.8189697, 9.8269997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1598.9630127, 1470.2039795, 9.8190002, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(979, 1595.9620361, 1460.3959961, 10.6630001, 0.0000000, 0.0000000, 129.9346924); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1589.9160156, 1467.5880127, 10.6680002, 0.0000000, 0.0000000, 129.9297791); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1583.8979492, 1474.7580566, 10.6689997, 0.0000000, 0.0000000, 129.9297791); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1579.4699707, 1482.7419434, 10.6719999, 0.0000000, 0.0000000, 107.9298096); //object(sub_roadleft) (11)
    CreateDynamicObject(978, 1532.2230225, 1437.4980469, 10.6899996, 0.0000000, 0.0000000, 125.9405823); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1539.4169922, 1432.6779785, 10.6870003, 0.0000000, 0.0000000, 165.9362793); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1545.4310303, 1435.9659424, 10.6780005, 0.0000000, 0.0000000, 249.9320068); //object(sub_roadright) (31)
    CreateDynamicObject(18800, 1438.0340576, 1719.2290039, 17.6049995, 0.0000000, 0.0000000, 67.9943848); //object(mroadhelix1) (2)
    CreateDynamicObject(979, 1577.5579834, 1346.1960449, 10.8290005, 0.0000000, 0.0000000, 267.9383545); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1577.8940430, 1355.5279541, 10.8290005, 0.0000000, 0.0000000, 267.9345703); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1578.2020264, 1364.8690186, 10.8299999, 0.0000000, 0.0000000, 267.9345703); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1578.4620361, 1371.8210449, 10.8299999, 0.0000000, 0.0000000, 267.9345703); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1583.2960205, 1376.2840576, 10.8299999, 0.0000000, 0.0000000, 177.9345703); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1613.2969971, 1373.8170166, 10.8070002, 0.0000000, 0.0000000, 177.9345703); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1617.7719727, 1368.9320068, 10.8070002, 0.0000000, 0.0000000, 87.9345703); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1617.4229736, 1359.5560303, 10.8070002, 0.0000000, 0.0000000, 87.9290771); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1617.0789795, 1350.1839600, 10.8070002, 0.0000000, 0.0000000, 87.9290771); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1616.7449951, 1340.8599854, 10.8070002, 0.0000000, 0.0000000, 87.9290771); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1616.4090576, 1331.4909668, 10.8020000, 0.0000000, 0.0000000, 87.9290771); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1600.3280029, 1315.4670410, 10.8020000, 0.0000000, 0.0000000, 357.9290771); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1590.9699707, 1315.8399658, 10.8199997, 0.0000000, 0.0000000, 357.9290771); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1576.7390137, 1320.8780518, 10.8199997, 0.0000000, 0.0000000, 269.9290771); //object(sub_roadleft) (11)
    CreateDynamicObject(16139, 1551.8719482, 1553.5670166, 4.8670001, 0.0000000, 0.0000000, 243.9843750); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1556.6989746, 1591.8900146, 4.8670001, 0.0000000, 0.0000000, 243.9788818); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1600.7010498, 1574.5080566, 4.8670001, 0.0000000, 0.0000000, 243.9788818); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1603.9040527, 1618.2230225, 4.8670001, 0.0000000, 0.0000000, 249.9788818); //object(des_rockgp2_19) (9)
    CreateDynamicObject(16139, 1588.4659424, 1550.4100342, 4.8670001, 0.0000000, 0.0000000, 63.9788818); //object(des_rockgp2_19) (9)
    CreateDynamicObject(979, 1592.0080566, 1640.1240234, 10.6610003, 0.0000000, 0.0000000, 119.9346924); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1585.6290283, 1646.4859619, 10.6610003, 0.0000000, 0.0000000, 149.9322510); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1577.5109863, 1651.1879883, 10.6610003, 0.0000000, 0.0000000, 149.9304199); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1568.7960205, 1653.5469971, 10.6610003, 0.0000000, 0.0000000, 179.9304199); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1559.4589844, 1653.5400391, 10.6610003, 0.0000000, 0.0000000, 179.9285889); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1550.0789795, 1653.5500488, 10.6610003, 0.0000000, 0.0000000, 179.9285889); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1540.7600098, 1653.5660400, 10.6610003, 0.0000000, 0.0000000, 179.9285889); //object(sub_roadleft) (11)
    CreateDynamicObject(713, 1582.4959717, 1656.0939941, 9.8199997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1565.7729492, 1658.6500244, 9.8199997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1544.0119629, 1658.1230469, 9.8199997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(979, 1531.7099609, 1651.9820557, 10.6610003, 0.0000000, 0.0000000, 199.9285889); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1485.3879395, 1637.3320312, 10.6529999, 0.0000000, 0.0000000, 183.9206543); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1478.4420166, 1636.8509521, 10.6529999, 0.0000000, 0.0000000, 183.9166260); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1469.3719482, 1636.0689697, 10.6529999, 0.0000000, 0.0000000, 185.9166260); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1460.0639648, 1635.1109619, 10.6529999, 0.0000000, 0.0000000, 185.9161377); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1525.8239746, 1645.7650146, 10.6610003, 0.0000000, 0.0000000, 251.9237061); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1522.9169922, 1636.8609619, 10.6610003, 0.0000000, 0.0000000, 251.9219971); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1520.6600342, 1628.1149902, 10.6610003, 0.0000000, 0.0000000, 259.9219971); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1519.8330078, 1619.0269775, 10.6610003, 0.0000000, 0.0000000, 269.9171143); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1519.9949951, 1609.8769531, 10.6610003, 0.0000000, 0.0000000, 271.9171143); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1517.2650146, 1601.5389404, 10.6610003, 0.0000000, 0.0000000, 231.9171143); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1510.0529785, 1599.3489990, 10.6610003, 0.0000000, 0.0000000, 161.9158936); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1503.2139893, 1604.7110596, 10.6610003, 0.0000000, 0.0000000, 121.9110413); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1499.8070068, 1613.1899414, 10.6610003, 0.0000000, 0.0000000, 101.9097900); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1498.6960449, 1622.3780518, 10.6610003, 0.0000000, 0.0000000, 91.9091797); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1494.3940430, 1635.0169678, 10.6529999, 0.0000000, 0.0000000, 145.9011230); //object(sub_roadleft) (11)
    CreateDynamicObject(979, 1498.5460205, 1627.1929932, 10.6610003, 0.0000000, 0.0000000, 91.9061279); //object(sub_roadleft) (11)
    CreateDynamicObject(978, 1548.4279785, 1617.4210205, 10.6610003, 0.0000000, 0.0000000, 61.9348145); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1545.6020508, 1608.7099609, 10.6610003, 0.0000000, 0.0000000, 81.9299316); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1542.4780273, 1600.1619873, 10.6610003, 0.0000000, 0.0000000, 57.9250488); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1537.4079590, 1592.2139893, 10.7600002, 0.0000000, 0.0000000, 57.9199219); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1535.6519775, 1583.7889404, 10.6610003, 0.0000000, 0.0000000, 97.9199219); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1535.3079834, 1574.5689697, 10.6610003, 0.0000000, 0.0000000, 77.9156494); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1530.6450195, 1567.1479492, 10.6610003, 0.0000000, 0.0000000, 37.9150391); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1522.3260498, 1563.6619873, 10.6610003, 0.0000000, 0.0000000, 7.9138184); //object(sub_roadright) (31)
    CreateDynamicObject(713, 1540.1300049, 1573.2590332, 9.8199997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1532.3310547, 1560.5329590, 9.8199997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(19125, 1498.0760498, 1631.9119873, 10.3850002, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (1)
    CreateDynamicObject(19125, 1490.2089844, 1637.4189453, 10.3769999, 0.0000000, 0.0000000, 0.0000000); //object(bollardlight5) (1)
    CreateDynamicObject(978, 1513.1330566, 1562.3950195, 10.6560001, 0.0000000, 0.0000000, 7.9101562); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1504.3409424, 1563.7810059, 10.6610003, 0.0000000, 0.0000000, 333.9101562); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1495.9580078, 1567.8859863, 10.6529999, 0.0000000, 0.0000000, 333.9074707); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1487.5699463, 1572.0090332, 10.6529999, 0.0000000, 0.0000000, 333.9074707); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1482.1359863, 1578.5219727, 10.6529999, 0.0000000, 0.0000000, 285.9074707); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1479.5860596, 1587.4449463, 10.6529999, 0.0000000, 0.0000000, 285.9027100); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1477.0520020, 1596.3389893, 10.6529999, 0.0000000, 0.0000000, 285.9027100); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1473.0360107, 1604.5749512, 10.6529999, 0.0000000, 0.0000000, 305.9027100); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1467.5520020, 1612.1629639, 10.6529999, 0.0000000, 0.0000000, 305.8978271); //object(sub_roadright) (31)
    CreateDynamicObject(978, 1460.5100098, 1617.4510498, 10.6529999, 0.0000000, 0.0000000, 339.8978271); //object(sub_roadright) (31)
    CreateDynamicObject(8339, 1509.5749512, 1626.3979492, 13.8179998, 0.0000000, 0.0000000, 0.0000000); //object(vgsfrates11) (2)
    CreateDynamicObject(713, 1525.4010010, 1654.3199463, 9.8199997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    CreateDynamicObject(713, 1511.1230469, 1603.8010254, 9.8199997, 0.0000000, 0.0000000, 155.4675293); //object(veg_bevtree1) (4)
    //Дрифт 13
    CreateDynamicObject(8171, -709.26000000, 1961.38000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -709.27000000, 1823.22000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -669.37000000, 1956.58000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -629.43000000, 1956.58000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -669.42000000, 1818.32000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -629.39000000, 1818.31000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -749.24000000, 1957.77000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -789.18000000, 1957.78000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -749.22000000, 1819.54000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -789.16000000, 1819.52000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -789.12000000, 1681.29000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -749.19000000, 1681.40000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -709.25000000, 1685.04000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -669.35000000, 1680.03000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(8171, -629.42000000, 1680.11000000, 3.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(16092, -796.63000000, 1929.81000000, 3.31000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -789.08000000, 1916.60000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -803.71000000, 1916.89000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(4004, -708.52000000, 1893.83000000, 14.73000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -791.07000000, 1862.35000000, 3.62000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -791.07000000, 1862.35000000, 4.79000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -764.20000000, 1871.12000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -778.30000000, 1849.53000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -764.22000000, 1845.48000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -772.52000000, 1822.91000000, 3.62000000, 0.00000000, 0.00000000, -40.00000000); //
    CreateDynamicObject(982, -787.67000000, 1827.94000000, 3.62000000, 0.00000000, 0.00000000, -47.00000000); //
    CreateDynamicObject(982, -797.02000000, 1806.39000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -780.77000000, 1800.39000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -780.80000000, 1774.82000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -797.03000000, 1780.73000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -797.06000000, 1755.13000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -790.15000000, 1731.73000000, 3.62000000, 0.00000000, 0.00000000, 33.00000000); //
    CreateDynamicObject(982, -773.75000000, 1751.22000000, 3.62000000, 0.00000000, 0.00000000, 33.00000000); //
    CreateDynamicObject(982, -781.33000000, 1740.89000000, 3.62000000, 0.00000000, 0.00000000, 33.00000000); //
    CreateDynamicObject(982, -781.31000000, 1740.98000000, 4.81000000, 0.00000000, 0.00000000, 33.00000000); //
    CreateDynamicObject(982, -783.10000000, 1708.07000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -766.84000000, 1727.85000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -766.87000000, 1702.28000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -783.15000000, 1682.50000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -770.47000000, 1669.67000000, 3.62000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -757.67000000, 1682.47000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -757.63000000, 1708.09000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -757.61000000, 1733.66000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -757.62000000, 1759.30000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -757.55000000, 1784.90000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -757.53000000, 1810.47000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -757.57000000, 1836.11000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -754.41000000, 1848.93000000, 3.55000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -747.98000000, 1848.92000000, 3.55000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -760.97000000, 1867.91000000, 3.55000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -754.49000000, 1867.74000000, 3.55000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -743.26000000, 1867.77000000, 3.55000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -736.89000000, 1867.80000000, 3.55000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -733.72000000, 1870.96000000, 3.55000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -733.72000000, 1877.31000000, 3.55000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -733.75000000, 1883.72000000, 3.55000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -744.77000000, 1836.12000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -733.64000000, 1854.88000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -733.67000000, 1829.28000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -744.72000000, 1810.58000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -733.66000000, 1803.68000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -744.69000000, 1785.03000000, 3.62000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -741.43000000, 1772.21000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -735.01000000, 1772.21000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -730.46000000, 1790.83000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -724.06000000, 1790.82000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -728.63000000, 1772.21000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -717.67000000, 1790.84000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -714.47000000, 1787.67000000, 3.65000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -714.46000000, 1781.29000000, 3.65000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -714.46000000, 1774.88000000, 3.65000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -714.47000000, 1768.50000000, 3.65000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -714.48000000, 1762.10000000, 3.65000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -717.68000000, 1758.89000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -724.08000000, 1758.92000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -730.53000000, 1758.85000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -733.68000000, 1755.71000000, 3.65000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -744.68000000, 1759.38000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -744.69000000, 1743.33000000, 3.65000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -741.51000000, 1740.14000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -735.10000000, 1740.16000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -728.66000000, 1740.16000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -730.47000000, 1752.40000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -724.12000000, 1752.47000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -717.72000000, 1752.53000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -722.28000000, 1740.16000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -715.90000000, 1740.11000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -711.34000000, 1752.48000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -704.93000000, 1752.47000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -698.51000000, 1752.43000000, 3.65000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -712.71000000, 1727.31000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -695.32000000, 1739.60000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -682.61000000, 1726.86000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -699.88000000, 1714.54000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -675.74000000, 1708.52000000, 3.64000000, 0.00000000, 0.00000000, 62.00000000); //
    CreateDynamicObject(982, -641.76000000, 1701.47000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -641.78000000, 1726.46000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -654.60000000, 1714.07000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -654.64000000, 1739.56000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -669.77000000, 1739.65000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -669.82000000, 1765.26000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -654.61000000, 1765.16000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -654.59000000, 1790.80000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -682.61000000, 1778.02000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -667.41000000, 1803.65000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -695.52000000, 1790.80000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -680.22000000, 1816.44000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -695.51000000, 1816.44000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -695.57000000, 1842.07000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -667.47000000, 1829.26000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -682.72000000, 1854.84000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -654.65000000, 1842.09000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -669.93000000, 1867.63000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -669.91000000, 1893.15000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -654.61000000, 1867.66000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -654.63000000, 1893.28000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -654.65000000, 1918.88000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -670.13000000, 1918.85000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -670.16000000, 1944.43000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -654.59000000, 1944.48000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -654.55000000, 1969.98000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -667.31000000, 1982.65000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -683.16000000, 1957.18000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -708.88000000, 1957.18000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -692.91000000, 1982.69000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -718.43000000, 1982.61000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -744.13000000, 1982.62000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -734.49000000, 1957.18000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -760.14000000, 1957.18000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -769.77000000, 1982.63000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(982, -795.37000000, 1982.64000000, 3.64000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -789.09000000, 1933.61000000, 3.34000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -789.05000000, 1940.02000000, 3.34000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -789.03000000, 1946.39000000, 3.34000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -789.01000000, 1952.75000000, 3.34000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -773.03000000, 1954.08000000, 3.34000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(983, -785.81000000, 1955.90000000, 3.34000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(983, -782.62000000, 1952.72000000, 3.34000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -803.51000000, 1943.55000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(982, -803.52000000, 1969.13000000, 3.64000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -803.49000000, 1982.06000000, 3.91000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -788.74000000, 1955.78000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -782.68000000, 1955.95000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -773.19000000, 1957.20000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -803.50000000, 1862.63000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -778.31000000, 1862.21000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -778.58000000, 1837.10000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -764.30000000, 1832.69000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -780.72000000, 1813.09000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -797.00000000, 1819.14000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -788.41000000, 1751.96000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -780.79000000, 1761.94000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -797.08000000, 1743.27000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -783.24000000, 1721.13000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -766.80000000, 1740.55000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -766.87000000, 1689.86000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -757.77000000, 1670.00000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -783.08000000, 1669.74000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -757.55000000, 1848.81000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -744.84000000, 1848.82000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -751.41000000, 1867.68000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -746.31000000, 1867.59000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -733.76000000, 1790.93000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -725.38000000, 1772.48000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -733.51000000, 1758.74000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -733.53000000, 1752.49000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -712.79000000, 1740.12000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -695.75000000, 1752.38000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -695.29000000, 1726.79000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -712.70000000, 1714.66000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -687.15000000, 1714.57000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -664.33000000, 1702.71000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -654.61000000, 1701.41000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -659.62000000, 1702.13000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -654.62000000, 1726.70000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -669.87000000, 1727.07000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -669.79000000, 1778.25000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -654.62000000, 1803.60000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -680.23000000, 1803.74000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -695.34000000, 1778.08000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -679.98000000, 1829.22000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -695.41000000, 1854.75000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -669.85000000, 1854.83000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -654.63000000, 1829.30000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -670.20000000, 1957.06000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -654.61000000, 1982.71000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(3877, -705.66000000, 1982.69000000, 4.41000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -692.82000000, 1955.45000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -671.44000000, 1955.23000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -682.05000000, 1956.30000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -703.35000000, 1956.40000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -713.39000000, 1956.43000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -723.93000000, 1956.21000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -736.12000000, 1956.38000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -747.89000000, 1956.52000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -759.04000000, 1956.37000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -771.53000000, 1956.56000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -783.78000000, 1955.17000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -787.81000000, 1954.99000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -788.29000000, 1945.05000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -788.44000000, 1932.23000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -788.47000000, 1939.15000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -788.32000000, 1950.67000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -787.90000000, 1918.33000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -787.99000000, 1926.28000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -788.20000000, 1910.65000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -788.20000000, 1910.65000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -781.14000000, 1861.22000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -787.35000000, 1861.35000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -793.78000000, 1861.70000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -800.11000000, 1861.67000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -780.80000000, 1835.88000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -785.20000000, 1831.23000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -789.74000000, 1827.07000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -793.98000000, 1822.97000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -798.06000000, 1805.17000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -797.91000000, 1792.44000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -797.97000000, 1774.94000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -798.00000000, 1759.24000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -798.57000000, 1743.63000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -774.33000000, 1730.40000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.32000000, 1738.09000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.71000000, 1745.99000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.93000000, 1752.98000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.94000000, 1759.90000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.97000000, 1768.86000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.66000000, 1777.80000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.78000000, 1787.48000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.69000000, 1796.19000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.98000000, 1808.88000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.87000000, 1820.65000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.85000000, 1831.37000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -756.85000000, 1846.06000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -745.49000000, 1845.37000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(4021, -683.92000000, 1868.97000000, 9.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(4048, -711.68000000, 1823.98000000, 14.85000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(4123, -720.16000000, 1684.08000000, 14.15000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(4178, -661.97000000, 1691.32000000, 6.69000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(4193, -637.19000000, 1746.96000000, 16.81000000, 0.00000000, 0.00000000, -90.00000000); //
    CreateDynamicObject(5060, -665.73000000, 1815.95000000, 5.45000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -678.83000000, 1825.94000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -668.82000000, 1827.73000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -673.97000000, 1827.34000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -672.21000000, 1857.48000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -672.21000000, 1857.48000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -692.87000000, 1857.07000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -652.36000000, 1764.04000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -652.49000000, 1770.61000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -652.40000000, 1776.95000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -652.42000000, 1782.75000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -652.48000000, 1787.86000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -652.45000000, 1792.91000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -652.16000000, 1798.01000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -652.11000000, 1802.71000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(710, -659.16000000, 1804.44000000, 6.00000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(981, -652.37000000, 1844.68000000, 3.68000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(981, -652.46000000, 1877.17000000, 3.68000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(981, -652.51000000, 1909.07000000, 3.68000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(981, -652.66000000, 1942.48000000, 3.68000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(981, -671.58000000, 1940.02000000, 3.68000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(981, -671.56000000, 1909.73000000, 3.68000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(981, -652.53000000, 1971.57000000, 3.68000000, 0.00000000, 0.00000000, 90.00000000); //
    CreateDynamicObject(981, -669.36000000, 1983.94000000, 3.68000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(981, -699.65000000, 1984.06000000, 3.68000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(981, -729.91000000, 1984.09000000, 3.68000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(981, -760.68000000, 1984.06000000, 3.68000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(981, -791.46000000, 1983.97000000, 3.68000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -790.79000000, 1931.00000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -792.07000000, 1930.66000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -793.57000000, 1930.64000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -795.00000000, 1930.66000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -796.56000000, 1930.72000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -798.05000000, 1930.69000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -799.54000000, 1930.70000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -801.04000000, 1930.74000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    CreateDynamicObject(1262, -802.50000000, 1930.70000000, 10.82000000, 0.00000000, 0.00000000, 0.00000000); //
    //Дрифт 14
    CreateDynamicObject(987, -1474.59, 287.56, 52.81, 0.00, 0.00, 90.00);
    CreateDynamicObject(987, -1474.57, 299.47, 52.81, 0.00, 0.00, 90.00);
    CreateDynamicObject(987, -1474.55, 311.36, 52.81, 0.00, 0.00, 90.00);
    CreateDynamicObject(987, -1474.53, 323.29, 52.81, 0.00, 0.00, 90.00);
    CreateDynamicObject(987, -1474.54, 335.18, 52.81, 0.00, 0.00, 90.00);
    CreateDynamicObject(987, -1474.60, 342.14, 52.81, 0.00, 0.00, 90.00);
    CreateDynamicObject(987, -1474.55, 354.20, 52.81, 0.00, 0.00, 180.00);
    CreateDynamicObject(987, -1486.47, 354.19, 52.81, 0.00, 0.00, 180.00);
    CreateDynamicObject(987, -1504.90, 354.30, 52.81, 0.00, 0.00, 180.00);
    CreateDynamicObject(987, -1516.82, 354.34, 52.81, 0.00, 0.00, 180.00);
    CreateDynamicObject(987, -1528.70, 354.35, 52.81, 0.00, 0.00, 180.00);
    CreateDynamicObject(987, -1540.59, 354.41, 52.81, 0.00, 0.00, 180.00);
    CreateDynamicObject(987, -1552.59, 354.42, 52.81, 0.00, 0.00, 180.00);
    CreateDynamicObject(987, -1555.62, 354.38, 52.81, 0.00, 0.00, 180.00);
    CreateDynamicObject(987, -1567.57, 354.45, 52.81, 0.00, 0.00, -90.00);
    CreateDynamicObject(987, -1567.64, 342.49, 52.81, 0.00, 0.00, -90.00);
    CreateDynamicObject(987, -1567.56, 330.51, 52.81, 0.00, 0.00, -90.00);
    CreateDynamicObject(987, -1567.64, 342.49, 52.81, 0.00, 0.00, -90.00);
    CreateDynamicObject(987, -1567.53, 318.57, 52.81, 0.00, 0.00, -90.00);
    CreateDynamicObject(987, -1567.52, 306.64, 52.81, 0.00, 0.00, -90.00);
    CreateDynamicObject(987, -1567.53, 299.38, 52.81, 0.00, 0.00, -90.00);
    CreateDynamicObject(987, -1567.58, 287.40, 52.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(987, -1555.62, 287.37, 52.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(987, -1543.67, 287.36, 52.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(987, -1531.76, 287.30, 52.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(987, -1519.82, 287.33, 52.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(987, -1508.01, 287.25, 52.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(987, -1496.05, 287.25, 52.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(987, -1486.33, 287.30, 52.81, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1498.39, 354.32, 53.35, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1498.39, 354.32, 54.42, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1498.39, 354.32, 55.47, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1498.39, 354.32, 56.54, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1498.39, 354.32, 57.56, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1504.83, 354.35, 53.35, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1504.83, 354.35, 54.46, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1504.83, 354.35, 55.49, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1504.83, 354.35, 56.59, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1504.83, 354.35, 57.68, 0.00, 0.00, 0.00);
    CreateDynamicObject(10245, -1501.19, 366.78, 48.69, 0.00, 0.00, -47.00);
    CreateDynamicObject(10245, -1500.87, 381.44, 40.85, 0.00, 0.00, -47.00);
    CreateDynamicObject(10245, -1481.03, 361.21, 37.53, 0.00, 0.00, -135.00);
    CreateDynamicObject(10245, -1466.09, 361.44, 29.78, 0.00, 0.00, -135.00);
    CreateDynamicObject(8150, -1406.39, 335.08, 31.16, 0.00, 0.00, 0.00);
    CreateDynamicObject(8150, -1342.93, 390.34, 31.09, 0.00, 0.00, 90.00);
    CreateDynamicObject(8150, -1406.10, 446.83, 31.09, 0.00, 0.00, 180.00);
    CreateDynamicObject(3749, -1476.34, 447.38, 34.25, 0.00, 0.00, 0.00);
    CreateDynamicObject(0, -1476.55, 456.99, 13.04, 0.00, 0.00, 0.00);
    CreateDynamicObject(18768, -1476.66, 456.91, 29.32, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1460.45, 449.80, 30.58, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1460.43, 456.17, 30.58, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1460.47, 462.55, 30.58, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1460.44, 468.93, 30.58, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1460.41, 469.95, 30.58, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1463.62, 473.15, 30.58, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1470.03, 473.15, 30.58, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1476.46, 473.12, 30.58, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1482.89, 473.11, 30.58, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1489.33, 473.07, 30.58, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1492.56, 469.90, 30.58, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1492.56, 463.48, 30.58, 0.00, 0.00, 0.00);
    CreateDynamicObject(18769, -1476.53, 431.11, 28.68, 4.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.60, 437.78, 29.26, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.59, 431.36, 29.26, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.59, 431.36, 30.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.60, 437.76, 30.53, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1463.47, 440.96, 30.53, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1463.47, 440.96, 29.25, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1460.25, 444.17, 29.26, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1460.25, 444.17, 30.52, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1463.37, 428.14, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1456.97, 428.17, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1463.45, 417.73, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1450.67, 417.74, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1479.41, 369.73, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1479.41, 369.73, 30.93, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1457.05, 417.76, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1466.64, 414.50, 29.68, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1444.40, 418.57, 29.70, 0.00, 0.00, 105.00);
    CreateDynamicObject(983, -1444.31, 428.94, 29.70, 0.00, 0.00, 105.00);
    CreateDynamicObject(983, -1438.35, 420.68, 29.70, 0.00, 0.00, 113.00);
    CreateDynamicObject(983, -1438.31, 431.06, 29.70, 0.00, 0.00, 113.00);
    CreateDynamicObject(983, -1432.65, 433.91, 29.70, 0.00, 0.00, 120.00);
    CreateDynamicObject(983, -1432.67, 423.52, 29.70, 0.00, 0.00, 120.00);
    CreateDynamicObject(983, -1427.23, 426.88, 29.70, 0.00, 0.00, 124.00);
    CreateDynamicObject(983, -1422.06, 430.70, 29.70, 0.00, 0.00, 129.00);
    CreateDynamicObject(983, -1427.45, 437.54, 29.70, 0.00, 0.00, 129.00);
    CreateDynamicObject(983, -1424.12, 442.69, 29.70, 0.00, 0.00, 165.00);
    CreateDynamicObject(983, -1417.08, 434.72, 29.70, 0.00, 0.00, 129.00);
    CreateDynamicObject(983, -1411.46, 436.74, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1405.06, 436.76, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1398.69, 436.77, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1382.71, 436.77, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1367.08, 435.25, 29.70, 0.00, 0.00, 62.00);
    CreateDynamicObject(983, -1361.38, 432.25, 29.70, 0.00, 0.00, 62.00);
    CreateDynamicObject(983, -1355.75, 429.20, 29.70, 0.00, 0.00, 62.00);
    CreateDynamicObject(983, -1352.88, 424.53, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.87, 418.14, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.87, 411.74, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.90, 405.35, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.87, 398.97, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.88, 392.57, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.89, 386.17, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.86, 379.77, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1356.09, 376.56, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1362.46, 376.53, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1352.81, 366.59, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1356.08, 369.77, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1365.64, 373.36, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1359.21, 366.54, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1365.65, 366.99, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1365.67, 360.60, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1359.17, 360.14, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.82, 360.22, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1365.64, 354.21, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1359.16, 353.77, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1352.82, 353.77, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1356.06, 350.60, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1368.87, 351.02, 29.70, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1384.89, 350.98, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1410.54, 350.95, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1436.18, 350.93, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1463.44, 356.51, 29.68, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1463.48, 350.14, 29.68, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1463.41, 343.85, 29.68, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1463.47, 337.47, 29.68, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1446.69, 365.82, 29.68, 0.00, 0.00, -46.00);
    CreateDynamicObject(983, -1461.56, 365.82, 29.68, 0.00, 0.00, -33.00);
    CreateDynamicObject(983, -1457.44, 370.70, 29.68, 0.00, 0.00, -47.00);
    CreateDynamicObject(983, -1452.76, 375.03, 29.68, 0.00, 0.00, -47.00);
    CreateDynamicObject(983, -1442.08, 370.22, 29.68, 0.00, 0.00, -46.00);
    CreateDynamicObject(983, -1448.10, 379.44, 29.68, 0.00, 0.00, -46.00);
    CreateDynamicObject(983, -1444.69, 382.70, 29.68, 0.00, 0.00, -46.00);
    CreateDynamicObject(983, -1439.20, 384.86, 29.68, 0.00, 0.00, -90.00);
    CreateDynamicObject(983, -1436.62, 372.40, 29.68, 0.00, 0.00, -90.00);
    CreateDynamicObject(983, -1430.25, 372.39, 29.68, 0.00, 0.00, -90.00);
    CreateDynamicObject(983, -1432.79, 384.89, 29.68, 0.00, 0.00, -90.00);
    CreateDynamicObject(983, -1426.42, 384.87, 29.68, 0.00, 0.00, -90.00);
    CreateDynamicObject(982, -1414.30, 372.47, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1410.43, 384.83, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1388.72, 372.50, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(983, -1397.65, 388.06, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1375.89, 375.77, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1375.92, 388.52, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1375.92, 394.93, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1375.96, 401.32, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(982, -1388.89, 405.27, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1410.46, 391.32, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1409.92, 405.28, 29.69, 0.00, 0.00, 90.00);
    CreateDynamicObject(982, -1435.07, 392.03, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1435.04, 393.33, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1435.05, 394.62, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1435.04, 395.89, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1435.00, 397.14, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1434.99, 398.43, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1434.92, 399.69, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1434.97, 400.93, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1434.98, 402.18, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1434.98, 403.43, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(982, -1434.95, 404.66, 31.38, 11.00, 90.00, 90.00);
    CreateDynamicObject(983, -1375.99, 402.09, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1466.79, 417.73, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1466.79, 417.73, 30.15, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1466.48, 428.00, 28.99, 0.00, 0.00, 0.30);
    CreateDynamicObject(1237, -1466.48, 428.00, 30.04, 0.00, 0.00, 0.30);
    CreateDynamicObject(1237, -1447.38, 417.74, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1447.43, 428.25, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1435.48, 432.49, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1429.85, 425.07, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1425.00, 439.65, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1423.21, 445.97, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1414.54, 436.72, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1369.95, 436.62, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1353.14, 427.65, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1353.04, 376.73, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1352.85, 369.75, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1359.26, 369.66, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1365.79, 376.56, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1365.62, 350.99, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1359.18, 350.76, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1352.90, 350.56, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1237, -1448.97, 351.01, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1463.27, 359.54, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1463.22, 363.28, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1448.92, 363.62, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1459.88, 368.42, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1439.71, 372.34, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1442.43, 385.00, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1397.74, 384.90, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1397.78, 391.19, 28.99, 0.00, 0.00, 3.78);
    CreateDynamicObject(1237, -1422.88, 405.23, 28.99, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1423.33, 391.30, 28.99, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1447.57, 391.33, 33.51, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1447.57, 391.33, 32.46, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1447.57, 391.33, 31.60, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1447.57, 391.33, 30.80, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1447.57, 391.33, 30.02, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1447.57, 391.33, 29.28, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1447.57, 391.33, 28.81, 0.00, 0.00, 3.96);
    CreateDynamicObject(1237, -1447.43, 405.33, 33.51, 0.00, 0.00, 4.02);
    CreateDynamicObject(1237, -1447.43, 405.33, 32.59, 0.00, 0.00, 4.02);
    CreateDynamicObject(1237, -1447.43, 405.33, 31.71, 0.00, 0.00, 4.02);
    CreateDynamicObject(1237, -1447.43, 405.33, 30.88, 0.00, 0.00, 4.02);
    CreateDynamicObject(1237, -1447.43, 405.33, 29.99, 0.00, 0.00, 4.02);
    CreateDynamicObject(1237, -1447.43, 405.33, 29.13, 0.00, 0.00, 4.02);
    CreateDynamicObject(1237, -1447.43, 405.33, 28.54, 0.00, 0.00, 4.02);
    CreateDynamicObject(18646, -1447.43, 405.29, 34.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(18646, -1447.56, 391.29, 34.80, 0.00, 0.00, 0.00);
    CreateDynamicObject(18850, -1493.60, 310.06, 48.06, 0.00, 0.00, 0.00);
    CreateDynamicObject(10245, -1483.58, 335.29, 55.32, 0.00, 0.00, -47.00);
    CreateDynamicObject(19129, -1476.58, 379.47, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(19129, -1476.43, 419.28, 29.07, 0.00, 0.00, -0.24);
    CreateDynamicObject(19129, -1486.32, 419.32, 31.63, 90.00, 0.00, 90.00);
    CreateDynamicObject(19129, -1486.37, 399.35, 31.63, 90.00, 0.00, 90.00);
    CreateDynamicObject(19129, -1486.42, 379.39, 31.63, 90.00, 0.00, 90.00);
    CreateDynamicObject(700, -1466.11, 439.66, 29.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1465.73, 434.15, 29.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1465.85, 429.29, 29.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1465.99, 416.94, 29.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1455.28, 416.63, 29.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1454.43, 429.33, 29.21, 0.00, 0.00, -0.54);
    CreateDynamicObject(700, -1455.28, 416.63, 29.21, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1441.57, 430.74, 29.21, 0.00, 0.00, -0.54);
    CreateDynamicObject(700, -1438.18, 419.95, 29.21, 0.00, 0.00, -0.54);
    CreateDynamicObject(8171, -1410.84, 352.95, 29.11, 0.00, 0.00, 90.00);
    CreateDynamicObject(8171, -1412.41, 390.60, 29.11, 0.00, 0.00, 90.00);
    CreateDynamicObject(8171, -1410.72, 428.91, 29.11, 0.00, 0.00, 90.00);
    CreateDynamicObject(716, -1413.29, 435.30, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1398.29, 435.40, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1384.12, 435.43, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1371.42, 435.36, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1353.93, 425.76, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1354.06, 410.20, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1354.06, 395.16, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1354.19, 378.09, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1364.69, 377.80, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1355.98, 368.27, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1355.93, 360.06, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1356.05, 352.24, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1368.32, 352.10, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1384.02, 352.04, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1398.48, 352.10, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1412.79, 352.08, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1429.32, 351.97, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1447.05, 352.03, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1464.46, 337.33, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1464.47, 344.29, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1464.50, 350.86, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1464.59, 356.67, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1464.63, 365.77, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1457.60, 373.47, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1450.19, 380.08, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1443.58, 386.87, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1443.55, 389.04, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1435.02, 388.91, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1426.82, 389.04, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1418.02, 388.69, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1410.22, 389.06, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1402.43, 389.26, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1434.98, 386.77, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1426.78, 386.88, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1418.04, 386.87, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1410.23, 386.90, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(718, -1402.46, 387.13, 28.86, 0.00, 0.00, 0.00);
    CreateDynamicObject(3443, -1391.84, 421.73, 32.00, 0.00, 0.00, -90.00);
    CreateDynamicObject(716, -1371.23, 426.76, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1371.76, 418.94, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1371.54, 411.31, 28.98, 0.00, 0.00, 0.00);
    CreateDynamicObject(716, -1379.01, 408.01, 28.92, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1411.15, 417.60, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1411.34, 407.90, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1407.71, 390.50, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1427.24, 390.51, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1407.82, 386.45, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1427.24, 390.51, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1427.44, 386.23, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1429.63, 371.66, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1410.00, 371.67, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1390.52, 371.64, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1375.41, 371.63, 30.62, 0.00, 0.00, 0.00);
    CreateDynamicObject(3660, -1366.87, 360.84, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1357.61, 360.24, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1356.17, 360.22, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1354.13, 360.23, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1358.65, 360.26, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1358.65, 360.26, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1366.92, 382.06, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1354.12, 386.42, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1366.92, 382.06, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1354.11, 405.99, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3660, -1354.10, 417.95, 30.62, 0.00, 0.00, 90.00);
    CreateDynamicObject(3761, -1374.08, 432.24, 31.09, 0.00, 0.00, 0.00);
    CreateDynamicObject(3761, -1374.22, 424.75, 31.09, 0.00, 0.00, 0.54);
    CreateDynamicObject(3763, -1364.10, 409.28, 62.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(3819, -1356.99, 423.60, 29.95, 0.00, 0.00, 180.00);
    CreateDynamicObject(3819, -1356.98, 415.02, 29.95, 0.00, 0.00, 180.00);
    CreateDynamicObject(3819, -1356.95, 406.42, 29.95, 0.00, 0.00, 180.00);
    CreateDynamicObject(3819, -1356.99, 397.87, 29.95, 0.00, 0.00, 180.00);
    CreateDynamicObject(3819, -1356.97, 389.29, 29.95, 0.00, 0.00, 180.00);
    CreateDynamicObject(3819, -1356.96, 380.75, 29.95, 0.00, 0.00, 180.00);
    CreateDynamicObject(3819, -1369.87, 366.14, 29.95, 0.00, 0.00, 180.00);
    CreateDynamicObject(3819, -1369.77, 355.60, 29.95, 0.00, 0.00, 180.00);
    CreateDynamicObject(3819, -1373.43, 376.85, 29.95, 0.00, 0.00, 0.00);
    CreateDynamicObject(3819, -1373.45, 385.42, 29.95, 0.00, 0.00, 0.00);
    CreateDynamicObject(3819, -1373.46, 394.04, 29.95, 0.00, 0.00, 0.00);
    CreateDynamicObject(3819, -1373.45, 402.63, 29.95, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1371.23, 407.32, 29.29, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1370.85, 398.29, 29.29, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1370.91, 389.74, 29.29, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1370.89, 381.22, 29.29, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1370.84, 372.59, 29.29, 0.00, 0.00, 0.00);
    CreateDynamicObject(3281, -1448.83, 358.26, 29.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(3281, -1448.86, 361.85, 29.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(3281, -1448.83, 354.69, 29.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(3281, -1448.87, 352.87, 29.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(3281, -1463.28, 361.31, 29.79, 0.00, 0.00, 90.00);
    CreateDynamicObject(3287, -1470.85, 344.05, 33.69, 0.00, 0.00, 0.00);
    CreateDynamicObject(3287, -1470.46, 354.45, 33.69, 0.00, 0.00, 0.00);
    CreateDynamicObject(11417, -1489.37, 457.39, 46.67, 0.00, 0.00, 0.00);
    CreateDynamicObject(3443, -1456.20, 402.70, 32.00, 0.00, 0.00, -90.00);
    CreateDynamicObject(983, -1466.57, 372.97, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.54, 379.35, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.56, 385.73, 29.70, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.54, 385.72, 30.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.54, 385.72, 32.16, 0.00, 0.00, 0.00);
    CreateDynamicObject(983, -1466.55, 379.33, 30.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(19129, -1505.69, 446.22, 41.59, 0.00, 0.00, -0.24);
    CreateDynamicObject(19129, -1496.95, 426.76, 41.52, 0.00, 0.00, -0.12);
    CreateDynamicObject(3443, -1506.31, 440.12, 44.43, 0.00, 0.00, 0.00);
    CreateDynamicObject(19129, -1514.33, 426.86, 41.52, 0.00, 0.00, -0.12);
    CreateDynamicObject(19129, -1514.41, 407.11, 41.33, 0.00, 0.00, -0.06);
    CreateDynamicObject(19129, -1496.97, 407.08, 41.33, 0.00, 0.00, -0.06);
    CreateDynamicObject(700, -1493.96, 397.03, 41.44, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1517.71, 396.99, 41.44, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1510.73, 397.06, 41.44, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1502.42, 396.96, 41.44, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1498.00, 396.85, 41.44, 0.00, 0.00, 0.00);
    CreateDynamicObject(700, -1514.39, 397.02, 41.44, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1466.51, 427.94, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1466.89, 417.80, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1447.51, 417.85, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1447.44, 428.26, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1429.94, 425.05, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1435.52, 432.37, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1424.98, 439.62, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1423.23, 445.92, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1414.63, 436.73, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1398.64, 436.75, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1384.20, 436.76, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1369.97, 436.71, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1353.21, 427.76, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1352.89, 414.93, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1352.84, 402.30, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1352.84, 389.33, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1352.96, 376.67, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1352.78, 369.69, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1359.18, 369.63, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1365.63, 376.59, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1352.80, 350.60, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1365.70, 350.88, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1359.28, 350.61, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1375.40, 350.96, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1391.51, 350.95, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1405.80, 350.98, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1420.75, 350.96, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1438.85, 350.97, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1449.06, 350.92, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1449.06, 363.71, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1439.91, 372.42, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1442.45, 384.72, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1459.78, 368.44, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1463.23, 359.53, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1463.14, 363.25, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1397.77, 391.25, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1397.70, 384.88, 31.24, 0.00, 0.00, 1.02);
    CreateDynamicObject(1232, -1423.22, 391.33, 31.24, 0.00, 0.00, 1.02);
    CreateDynamicObject(1232, -1422.76, 405.28, 31.24, 0.00, 0.00, 1.02);
    CreateDynamicObject(1232, -1447.32, 405.33, 36.70, 0.00, 0.00, 1.02);
    CreateDynamicObject(1232, -1447.52, 391.28, 36.70, 0.00, 0.00, 1.02);
    CreateDynamicObject(1255, -1421.79, 426.86, 29.72, 0.00, 0.00, 0.00);
    CreateDynamicObject(1255, -1421.83, 424.92, 29.72, 0.00, 0.00, 0.00);
    CreateDynamicObject(1255, -1421.72, 428.63, 29.72, 0.00, 0.00, 0.00);
    CreateDynamicObject(1257, -1433.06, 436.22, 30.29, 0.00, 0.00, 120.00);
    CreateDynamicObject(1280, -1404.11, 425.90, 29.41, 0.00, 0.00, 0.00);
    CreateDynamicObject(1280, -1404.15, 429.78, 29.41, 0.00, 0.00, 0.00);
    CreateDynamicObject(1280, -1404.11, 433.94, 29.41, 0.00, 0.00, 0.00);
    CreateDynamicObject(1281, -1411.73, 421.53, 29.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(1281, -1416.94, 424.99, 29.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(1281, -1410.34, 427.91, 29.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(1281, -1414.93, 432.36, 29.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(1281, -1408.34, 434.46, 29.90, 0.00, 0.00, 0.00);
    CreateDynamicObject(1346, -1400.77, 424.39, 30.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(1443, -1400.86, 424.33, 32.38, 0.00, 0.00, 273.00);
    CreateDynamicObject(1543, -1410.95, 421.89, 29.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(1543, -1410.97, 421.59, 29.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(1543, -1410.78, 421.78, 29.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(1543, -1409.79, 427.80, 29.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(1543, -1416.43, 424.89, 29.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(1543, -1416.28, 425.13, 29.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(1543, -1417.29, 424.68, 29.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(1543, -1416.95, 424.72, 29.87, 0.00, 0.00, 0.00);
    CreateDynamicObject(1544, -1417.90, 425.03, 29.89, 0.00, 0.00, 0.00);
    CreateDynamicObject(1544, -1417.83, 424.87, 29.89, 0.00, 0.00, 0.00);
    CreateDynamicObject(1550, -1413.51, 422.34, 29.43, 0.00, 0.00, 0.00);
    CreateDynamicObject(1583, -1393.81, 419.75, 30.16, 0.00, 0.00, -90.00);
    CreateDynamicObject(1597, -1426.92, 420.29, 31.61, 0.00, 0.00, 0.00);
    CreateDynamicObject(1598, -1420.63, 418.71, 29.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(1598, -1419.78, 418.72, 29.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(1598, -1417.47, 418.74, 29.45, 0.00, 0.00, 0.00);
    CreateDynamicObject(1676, -1418.89, 408.13, 30.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(1676, -1411.09, 408.17, 30.63, 0.00, 0.00, 0.00);
    CreateDynamicObject(2858, -1414.48, 432.38, 29.92, 0.00, 0.00, 0.00);
    CreateDynamicObject(2858, -1415.63, 432.37, 29.92, 0.00, 0.00, 0.00);
    CreateDynamicObject(2896, -1428.30, 422.67, 29.64, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1423.46, 424.24, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1419.41, 424.23, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1415.38, 424.22, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1411.26, 424.21, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1407.35, 424.22, 29.11, 0.00, 0.00, 0.12);
    CreateDynamicObject(2898, -1411.26, 424.21, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1406.35, 424.21, 29.11, 0.00, 0.00, 0.12);
    CreateDynamicObject(2898, -1410.38, 429.64, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1406.34, 429.62, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1414.47, 429.63, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1406.29, 433.99, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1410.11, 433.96, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1413.15, 433.94, 29.11, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1415.71, 433.31, 29.11, 0.00, 0.00, -47.00);
    CreateDynamicObject(2898, -1419.22, 430.21, 29.11, 0.00, 0.00, -47.00);
    CreateDynamicObject(2898, -1422.95, 426.78, 29.11, 0.00, 0.00, -47.00);
    CreateDynamicObject(2898, -1417.69, 427.56, 29.11, 0.00, 0.00, -47.00);
    CreateDynamicObject(1237, -1453.89, 428.13, 28.99, 0.00, 0.00, 0.00);
    CreateDynamicObject(1232, -1453.81, 428.15, 31.24, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1483.64, 406.85, 29.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1483.63, 402.30, 29.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1483.65, 396.96, 29.07, 0.00, 0.00, 0.00);
    CreateDynamicObject(2898, -1483.63, 391.73, 29.07, 0.00, 0.00, 0.00);
    // база клана ММ
    CreateObject(3749, 1523.49, 2773.16, 15.65, -360.00, 360.00, 91.00);
    CreateObject(7505, 1197.23, 2723.77, 11.21, 0.00, 0.00, 0.00);
    CreateObject(7505, 1116.42, 2800.34, 12.42, 178.00, -178.00, 91.00);
    CreateObject(7505, 1192.02, 2872.89, 13.87, 360.00, 360.00, 185.00);
    CreateObject(7505, 1115.11, 2857.67, 11.59, 0.00, 0.08, 270.72);
    CreateObject(7505, 1264.18, 2878.51, 12.21, 0.00, 0.00, -175.90);
    CreateObject(7505, 1355.38, 2885.17, 10.13, 0.00, 0.00, -356.54);
    CreateObject(11103, 1432.30, 2887.79, 10.70, 0.00, 0.00, 0.00);
    CreateObject(11103, 1432.35, 2884.07, 10.75, 0.00, 0.00, 0.00);
    CreateObject(8378, 1115.47, 2756.88, 19.14, 0.00, 0.00, 91.00);
    CreateObject(8378, 1114.19, 2810.03, 16.17, 0.00, 0.00, 91.00);
    CreateObject(8378, 1113.65, 2859.47, 11.16, 0.00, 0.00, 91.00);
    CreateObject(8378, 1145.91, 2870.85, 10.91, 0.00, 0.00, 4.00);
    CreateObject(8378, 1212.33, 2875.48, 11.72, 0.00, 0.00, 4.00);
    CreateObject(8378, 1276.51, 2879.89, 11.26, 0.00, 0.00, 4.00);
    CreateObject(8378, 1342.92, 2884.42, 17.76, 0.00, 0.00, 4.00);
    CreateObject(8378, 1407.10, 2888.89, 14.09, 0.00, 0.00, 4.00);
    CreateObject(3279, 1528.92, 2756.68, 9.80, 0.00, 0.00, 91.00);
    CreateObject(3279, 1467.07, 2729.64, 9.81, 0.00, 0.00, 91.00);
    CreateObject(3279, 1388.99, 2729.17, 9.80, 0.00, 0.00, 0.00);
    CreateObject(3279, 1130.85, 2732.99, 9.24, 0.00, 0.00, 0.00);
    CreateObject(3279, 1120.67, 2864.84, 9.42, 0.00, 0.00, 0.00);
    CreateObject(3279, 1284.58, 2875.42, 9.80, 0.00, 0.00, 0.00);
    CreateObject(3279, 1430.29, 2884.88, 9.30, 0.00, 0.00, 178.00);
    CreateObject(3881, 1528.95, 2765.37, 11.59, 0.00, 0.00, 273.00);
    CreateObject(3881, 1529.47, 2781.36, 11.58, 0.00, 0.00, 91.00);
    CreateObject(8313, 1179.17, 2722.93, 11.16, 0.00, 0.00, 105.00);
    CreateObject(8313, 1205.97, 2722.56, 9.80, 0.00, 0.00, 287.00);
    CreateObject(8313, 1232.80, 2722.74, 9.81, 0.00, 0.00, 105.00);
    CreateObject(8313, 1259.59, 2722.02, 9.82, 0.00, 0.00, 105.00);
    CreateObject(8313, 1286.34, 2721.59, 9.82, 0.00, 0.00, 105.00);
    CreateObject(8313, 1313.23, 2722.77, 9.82, 0.00, 0.00, 113.00);
    CreateObject(8313, 1338.93, 2725.67, 9.81, 0.00, 0.00, 113.00);
    CreateObject(8313, 1365.14, 2726.38, 9.81, 0.00, 0.00, 103.00);
    CreateObject(8313, 1391.79, 2725.19, 9.81, 0.00, 0.00, 105.00);
    CreateObject(8313, 1418.32, 2724.51, 9.81, 0.00, 0.00, 105.00);
    CreateObject(8313, 1444.97, 2723.94, 9.80, 0.00, 0.00, 105.00);
    CreateObject(8313, 1471.69, 2724.48, 9.81, 0.00, 0.00, -69.00);
    CreateObject(8313, 1498.22, 2725.57, 9.81, 0.00, 0.00, 105.00);
    CreateObject(8313, 1525.14, 2724.80, 9.82, 0.00, 0.00, 105.00);
    CreateObject(8313, 1534.02, 2736.73, 9.82, 0.00, 0.00, 200.00);
    CreateObject(8313, 1529.53, 2749.86, 9.81, 0.00, 0.00, 40.00);
    CreateObject(10831, 1518.07, 2833.21, 14.17, 0.00, 0.00, 273.00);
    CreateObject(652, 1515.78, 2765.46, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1510.34, 2763.59, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1510.41, 2759.58, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1509.27, 2757.11, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1507.38, 2751.64, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1503.78, 2746.41, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1497.64, 2741.45, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1488.93, 2739.82, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1477.47, 2740.50, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1469.94, 2744.56, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1463.20, 2753.78, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1460.63, 2764.25, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1460.83, 2782.28, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1461.68, 2793.43, 9.80, 0.00, 0.00, 0.00);
    CreateObject(652, 1466.13, 2799.82, 9.80, 0.00, 0.00, 0.00);
    CreateObject(652, 1478.55, 2805.65, 9.73, 0.00, 0.00, 0.00);
    CreateObject(652, 1492.75, 2806.10, 9.79, 0.00, 0.00, 0.00);
    CreateObject(652, 1502.41, 2798.74, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1507.50, 2791.23, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1511.36, 2782.54, 9.81, 0.00, 0.00, 0.00);
    CreateObject(652, 1516.02, 2779.33, 9.81, 0.00, 0.00, 0.00);
    CreateVehicle(560, 1460.3381, 2767.2371, 10.3889, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1460.0737, 2778.8018, 10.3946, 265.0000, -1, -1, 100);
    CreateObject(3885, 1529.99, 2765.03, 13.93, 0.00, 0.00, 76.00);
    CreateObject(3885, 1529.63, 2781.88, 14.01, 0.00, 0.00, 69.00);
    CreateObject(8378, 1150.55, 2724.03, 13.32, 0.00, 0.00, 0.00);
    CreateObject(8378, 1217.74, 2723.99, 13.27, 0.00, 0.00, 0.00);
    CreateObject(8378, 1284.58, 2724.00, 13.27, 0.00, 0.00, 0.00);
    CreateObject(8378, 1351.89, 2724.01, 12.46, 0.00, 0.00, 0.00);
    CreateObject(8378, 1418.71, 2724.10, 12.36, 0.00, 0.00, 0.00);
    CreateObject(8378, 1486.09, 2724.11, 9.81, 0.00, 0.00, 0.00);
    CreateObject(8378, 1501.10, 2724.09, 9.82, 0.00, 0.00, 0.00);
    CreateObject(19076, 1484.51, 2774.58, 9.33, 0.00, 0.00, 0.00);
    CreateObject(19129, 1515.83, 2736.56, 9.81, 0.00, 0.00, 0.00);
    CreateObject(19056, 1483.68, 2772.58, 10.45, 0.00, 0.00, 0.00);
    CreateObject(986, 1534.94, 2727.37, 9.81, 0.00, -0.40, 88.24);
    CreateObject(986, 1535.12, 2735.32, 9.82, 0.00, 0.00, 89.00);
    CreateObject(986, 1535.08, 2743.26, 9.82, 0.00, 0.00, 91.00);
    CreateObject(986, 1534.92, 2751.21, 9.82, 0.00, 0.00, 91.00);
    CreateObject(986, 1534.76, 2759.08, 9.82, 0.00, 0.00, 91.00);
    CreateObject(986, 1530.75, 2763.71, 9.82, 0.00, 0.00, 171.00);
    CreateObject(8378, 1534.32, 2816.87, 9.80, 0.00, 0.00, 91.00);
    CreateObject(986, 1531.57, 2783.75, 10.59, 0.00, 0.00, 0.00);
    //База клана LSNews
    CreateObject(2990, 1109.34, -1841.90, 16.31, 0.00, 0.00, 0.00);
    CreateObject(2990, 1099.22, -1841.91, 16.27, 0.00, 0.00, 0.00);
    CreateObject(2990, 1089.29, -1841.90, 16.32, 0.00, 0.00, 0.00);
    CreateObject(2990, 1079.32, -1841.90, 16.30, 0.00, 0.00, 0.00);
    CreateObject(2990, 1076.08, -1841.90, 16.34, 0.00, 0.00, 0.00);
    CreateObject(2990, 1069.10, -1837.33, 16.36, 0.00, 0.00, 114.00);
    CreateObject(2990, 1065.55, -1829.11, 16.36, 0.00, 0.00, 113.00);
    CreateObject(2990, 1063.08, -1823.38, 16.37, 0.00, 0.00, 113.00);
    CreateObject(2990, 1058.14, -1814.85, 16.53, 0.00, 0.00, 127.00);
    CreateObject(2990, 1052.16, -1806.89, 16.58, 0.00, 0.00, 127.00);
    CreateObject(2990, 1046.61, -1799.93, 16.60, 0.00, 0.00, 130.00);
    CreateObject(2990, 1044.65, -1791.32, 16.40, 0.00, 0.00, 77.16);
    CreateObject(2990, 1046.45, -1783.58, 16.34, 0.00, 0.00, 76.00);
    CreateObject(2990, 1047.56, -1773.81, 16.28, 0.00, 0.00, 91.00);
    CreateObject(2990, 1047.42, -1763.92, 16.24, 0.00, 0.00, 91.00);
    CreateObject(2990, 1047.26, -1754.02, 16.18, 0.00, 0.00, 91.00);
    CreateObject(2990, 1047.08, -1744.10, 16.23, 0.00, 0.00, 91.00);
    CreateObject(2990, 1046.90, -1734.16, 16.26, 0.00, 0.00, 91.00);
    CreateObject(2990, 1046.81, -1727.13, 16.13, 0.00, 0.00, 91.00);
    CreateObject(2990, 1051.68, -1722.14, 15.87, 0.00, 0.00, 0.00);
    CreateObject(2990, 1061.61, -1722.15, 15.86, 0.00, 0.00, 0.00);
    CreateObject(2990, 1071.51, -1722.14, 16.24, 0.00, 0.00, 0.00);
    CreateObject(2990, 1081.40, -1722.18, 16.11, 0.00, 0.00, 0.00);
    CreateObject(2990, 1091.27, -1722.18, 16.23, 0.00, 0.00, 0.00);
    CreateObject(2990, 1101.20, -1722.21, 16.15, 0.00, 0.00, 0.00);
    CreateObject(2990, 1111.15, -1722.19, 16.21, 0.00, 0.00, 0.00);
    CreateObject(2990, 1121.07, -1722.17, 16.15, 0.00, 0.00, 0.00);
    CreateObject(2990, 1131.01, -1722.19, 16.17, 0.00, 0.00, 0.00);
    CreateObject(2990, 1140.92, -1722.21, 16.55, 0.00, 0.00, 0.00);
    CreateObject(2990, 1150.88, -1722.22, 16.61, 0.00, 0.00, 0.00);
    CreateObject(2990, 1159.85, -1722.26, 16.68, 0.00, 0.00, 0.00);
    CreateObject(2990, 1164.92, -1727.23, 16.40, 0.00, 0.00, 91.00);
    CreateObject(2990, 1164.96, -1730.77, 16.46, 0.00, 0.00, 91.00);
    CreateObject(2990, 1164.90, -1750.98, 16.18, 0.00, 0.00, 90.00);
    CreateObject(2990, 1164.95, -1760.91, 16.20, 0.00, 0.00, 90.00);
    CreateObject(2990, 1165.02, -1770.79, 16.15, 0.00, 0.00, 91.00);
    CreateObject(2990, 1165.10, -1777.73, 16.32, 0.00, 0.00, 90.00);
    CreateObject(713, 1120.48, -1753.86, 12.56, 0.00, 0.00, 0.00);
    CreateObject(713, 1128.36, -1754.65, 12.57, 0.00, 0.00, 0.00);
    CreateObject(713, 1139.31, -1756.00, 12.57, 0.00, 0.00, 0.00);
    CreateObject(713, 1159.41, -1726.93, 12.86, 0.00, 0.00, 0.00);
    CreateObject(713, 1146.39, -1726.51, 12.84, 0.00, 0.00, 0.00);
    CreateObject(713, 1134.79, -1726.89, 12.83, 0.00, 0.00, 0.00);
    CreateObject(713, 1119.83, -1728.02, 12.81, 0.00, 0.00, 0.00);
    CreateObject(713, 1071.26, -1726.14, 12.62, 0.00, 0.00, 0.00);
    CreateObject(713, 1108.47, -1761.77, 12.55, 0.00, 0.00, 0.00);
    CreateObject(713, 1109.31, -1770.50, 12.55, 0.00, 0.00, 0.00);
    CreateObject(713, 1051.46, -1738.97, 12.67, 0.00, 0.00, 0.00);
    CreateObject(713, 1052.51, -1763.65, 12.63, 0.00, 0.00, 0.00);
    CreateVehicle(560, 1062.3787, -1737.2671, 12.8813, 265.0000, -1, -1, 100);
    CreateVehicle(560, 1061.9897, -1740.4552, 12.8375, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.1102, -1743.2478, 12.8433, 265.0000, -1, -1, 100);
    CreateVehicle(560, 1062.1609, -1746.2856, 12.9326, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.3185, -1748.9795, 12.8936, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.2883, -1751.8541, 12.8796, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.4849, -1754.9818, 12.8157, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.2561, -1758.0393, 12.8094, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.2942, -1760.6044, 12.9156, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.6385, -1763.6411, 12.8271, 265.0000, -1, -1, 100);
    CreateVehicle(560, 1062.7075, -1766.8527, 12.7712, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.6882, -1769.5945, 12.7145, 273.0000, -1, -1, 100);
    CreateVehicle(560, 1062.6510, -1772.3960, 12.7123, 265.0000, -1, -1, 100);
    CreateVehicle(560, 1061.9690, -1775.4072, 12.7566, 273.0000, -1, -1, 100);

    //пляж ЛС
    CreateObject(14838, 266.32, -1858.99, 9.72, 0.00, 0.00, 84.00);
    CreateObject(10120, 280.40, -1992.92, 5.33, 0.00, 0.00, 178.00);
    CreateObject(18850, 271.67, -2103.46, -1.98, 0.00, 0.00, 0.00);
    CreateObject(19129, 293.27, -1855.35, 2.52, 0.00, 0.00, 0.00);
    CreateObject(19129, 318.58, -1858.10, 2.26, 0.00, 0.00, 0.00);
    CreateObject(1633, 297.90, -1867.40, 2.97, 0.00, 0.00, 91.00);
    CreateObject(1633, 290.47, -1867.55, 5.06, 0.00, 0.00, 91.00);
    CreateObject(1633, 282.96, -1867.73, 7.16, 0.00, 0.00, 91.00);
    CreateObject(1523, 277.45, -1868.51, 8.17, 0.00, 0.00, 84.00);
    CreateObject(705, 312.27, -1832.86, 2.80, 0.00, 0.00, 0.00);
    CreateObject(705, 311.66, -1840.69, 2.61, 0.00, 0.00, 0.00);
    CreateObject(705, 311.22, -1846.81, 2.55, 0.00, 0.00, 0.00);
    CreateObject(705, 299.31, -1832.68, 2.72, 0.00, 0.00, 0.00);
    CreateObject(705, 300.12, -1841.09, 2.54, 0.00, 0.00, 0.00);
    CreateObject(705, 317.35, -1847.04, 2.37, 0.00, 0.00, 0.00);
    CreateObject(705, 329.91, -1848.79, 1.80, 0.00, 0.00, 0.00);
    CreateObject(705, 333.27, -1856.70, 1.47, 0.00, 0.00, 0.00);
    CreateObject(705, 334.54, -1866.96, 1.17, 0.00, 0.00, 0.00);
    CreateObject(705, 324.40, -1873.68, 1.63, 0.00, 0.00, 0.00);
    CreateObject(705, 293.37, -1873.71, 1.51, 0.00, 0.00, 0.00);
    CreateObject(705, 291.43, -1840.33, 2.15, 0.00, 0.00, 0.00);
    CreateObject(705, 279.03, -1842.08, 2.07, 0.00, 0.00, 0.00);
    CreateVehicle(487, 272.0534, -2102.4990, 11.3459, 273.0000, -1, -1, 100);
    CreateObject(1523, 280.29, -1868.46, 8.17, 0.00, 0.00, 91.00);
    CreateObject(1523, 280.42, -1868.44, 8.18, 0.00, 0.00, 91.00);
    CreateObject(1523, 280.19, -1868.49, 8.30, 0.00, 0.00, 91.00);
    CreateObject(1523, 280.04, -1868.49, 8.31, 0.00, 0.00, 84.00);
    CreateObject(955, 277.02, -1864.31, 8.51, 0.00, 0.00, 258.00);
    CreateObject(955, 260.44, -1848.38, 8.57, 0.00, 0.00, 353.00);
    CreateObject(14537, 214.35, -1857.90, 4.22, 0.00, 0.00, 0.00);
    CreateObject(7416, 215.72, -1874.00, 22.58, 0.00, 0.00, 0.00);
    CreateObject(1486, 297.45, -1872.95, 2.50, 0.00, 0.00, 0.00);
    CreateObject(16151, 280.19, -1859.13, 8.53, 0.00, 0.00, 353.00);
    CreateObject(14582, 306.13, -1875.60, 4.95, 0.00, 0.00, 287.00);
    CreateObject(705, 314.66, -1874.91, 1.54, 0.00, 0.00, 0.00);
    CreateObject(19059, 273.56, -1848.27, 11.54, 0.00, 0.00, 0.00);
    CreateObject(19159, 270.86, -1850.14, 11.80, 0.00, 0.00, 0.00);
    CreateObject(18779, 242.72, -1812.22, 12.76, 0.00, 0.00, 91.00);
    CreateObject(18844, 207.92, -1855.69, 86.45, 0.00, 0.00, 0.00);
    CreateObject(18836, 207.39, -1874.63, 28.45, 33.00, -4.00, 0.00);
    //аэропорт лс
    CreateObject(4825, 1831.09, -2436.16, 10.08, 0.00, 0.00, 0.00);
    CreateObject(13666, 1863.22, -2539.47, 17.73, 0.00, 2.00, 91.00);
    CreateObject(18779, 1784.34, -2541.00, 22.50, 0.00, 0.00, 0.00);
    CreateObject(18780, 1595.50, -2536.33, 24.09, 0.00, 0.00, 178.00);
    CreateObject(18781, 2029.51, -2540.69, 23.29, 0.00, 0.00, 91.00);
    CreateObject(18783, 2015.96, -2628.47, 14.93, 0.00, 0.00, 91.00);
    CreateObject(18784, 1997.20, -2628.56, 19.68, 0.00, 0.00, 178.00);
    CreateObject(18785, 1978.63, -2627.54, 24.11, 0.00, 0.00, 265.00);
    CreateObject(18786, 1960.39, -2626.13, 28.50, 0.00, 0.00, -4.00);
    CreateObject(18808, 1929.52, -2627.35, 39.81, 0.00, 105.00, -360.00);
    CreateObject(18809, 1881.69, -2627.35, 52.77, 0.00, 105.00, 0.00);
    CreateObject(18812, 1841.65, -2632.47, 69.01, 0.00, -62.00, 14.00);
    CreateObject(18840, 1814.02, -2633.33, 74.65, 4.00, -55.00, 360.00);
    CreateObject(18835, 1799.31, -2634.88, 105.84, 0.00, 0.00, 0.00);
    CreateObject(18787, 2031.01, -2628.00, 14.97, 0.00, 0.00, 91.00);
    //Ворота баз
    gates2 = CreateObject(980, 1525.13, 2773.46, 12.22, 0.00, 0.00, 273.00);

    return 1;
}

public OnGameModeExit() {
    for (new i; i < MAX_PLAYERS; i++) SaveAccount(i);
    for (new i; i < MAX_PLAYERS; i++) OnPlayerSave(i);
    return true;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) {
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid) {
    return 1;
}
public OnPlayerConnect(playerid) {
    new string[128];
    format(string, sizeof(string), AccauntBD, PlayerName(playerid));
    if (fexist(string)) {
        ShowPlayerLoginDialog(playerid);
    } else {
        ShowPlayerRegisterDialog(playerid);
    }
    PlayerInfo[playerid][pMoney] = 0;
    PlayerInfo[playerid][pAdmin] = 0;
    Logged[playerid] = 0;
    /*if(strfind(PlayerName(playerid), "CM_", true) == -1) SendClientMessage(playerid,0xFFFFFFAA,"Иди нахуй ебучий читер!") && Ban(playerid);
    if(strfind(PlayerName(playerid), "_CM_", true) == -1) SendClientMessage(playerid,0xFFFFFFAA,"Иди нахуй ебучий читер!") && Ban(playerid);
    if(strfind(PlayerName(playerid), "[CM]", true) == -1) SendClientMessage(playerid,0xFFFFFFAA,"Иди нахуй ебучий читер!") && Ban(playerid);
    */
    new ip[3][16];
    GetPlayerIp(playerid, ip[0], 16);
    for (new i, m = GetMaxPlayers(), x; i != m; i++) {
        if (!IsPlayerConnected(i) || i == playerid) continue;
        GetPlayerIp(i, ip[2], 16);
        if (!strcmp(ip[0], ip[2], true)) x++;
        if (x > 2) return Kick(i);
    }
    new x;
    TextDrawHideForPlayer(playerid, DriftTD[x]);
    TextDrawHideForPlayer(playerid, DriftTD2[x]);
    TextDrawHideForPlayer(playerid, Textdraw0);
    SendClientMessage(playerid, COLOR_GREENISHGOLD, "");

    new PlayerName[MAX_PLAYER_NAME];



    SM_HA[playerid] = TextDrawCreate(201.000000, 372.000000, "_");
    TextDrawAlignment(SM_HA[playerid], 0);
    TextDrawBackgroundColor(SM_HA[playerid], 0x000000ff);
    TextDrawFont(SM_HA[playerid], 1);
    TextDrawLetterSize(SM_HA[playerid], 0.500000, 1.5);
    TextDrawColor(SM_HA[playerid], 0xffffffff);
    TextDrawSetOutline(SM_HA[playerid], 1);
    TextDrawSetProportional(SM_HA[playerid], 1);
    TextDrawSetShadow(SM_HA[playerid], 1);
    //new PlName[MAX_PLAYER_NAME],count;
    //GetPlayerName(playerid,PlName,sizeof(PlName));
    //for (new i; i < strlen(PlName); i++)
    //{
    //   if (PlName[i] >= '0' && PlName[i] <= '9')
    // {
    //   count++;
    // if(count == 5)
    //{
    //   SendClientMessage(playerid,0xE0EA64AA,"В вашем нике больше 4 цифр!");
    //  Kick(playerid);
    // break;
    //}
    //}
    //}
    new RandomR = random(sizeof(RandomRadio));
    format(string, sizeof(string), "%s", RandomRadio[RandomR]);
    PlayAudioStreamForPlayer(playerid, string);
    SetTimerEx("Record", 5000, false, "d", playerid);
    h[playerid] = 21;
    m[playerid] = 20;
    //new str[128];
    SetPlayerCameraPos(playerid, 1419.7111, -1206.9725, 227.9327);
    SetPlayerCameraLookAt(playerid, 1479.3287, -1271.3838, 227.9327);
    //format(str,128,"{00FF00}%s {9999FF}вошёл {FFFF33}на {33CCFF}сервер", PlayerName(playerid));
    //SendClientMessageToAll(COLOR_ORANGE,str);
    SendClientMessage(playerid, COLOR_RED, "Добро пожаловать, на наш Дрифт сервер!");
    SendClientMessage(playerid, COLOR_ORANGE, ">>> Rcon админ: LOD <<<");
    SendClientMessage(playerid, COLOR_RED, "Для вызова помощи используйте:");
    SendClientMessage(playerid, 0x00FF00AA, ">>> /команды, /создатель /админка /update - посмотреть обновления версии мода <<<");
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "Меню можно вызвать: на левый ALT (пешком) на 2 ( в машине)");
    SendClientMessage(playerid, 0x00FF00AA, ">>> /hh сказать всем привет! /bb сказать всем пока! <<<");
    SendClientMessage(playerid, 0x00FF00AA, "=============ПРИЯТНОЙ==ВАМ==ИГРЫ====================");

    //Иконки на карте
    //	SetPlayerMapIcon(playerid,номер иконки,координаты,id иконки,0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 0, 2025.5804, 1007.8265, 10.8203, 25, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 1, 2189.6609, 1677.3126, 11.3131, 25, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 2, 2536.4409, 2081.6021, 10.8203, 6, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 3, 2157.1365, 941.1958, 10.8203, 6, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 5, -1507.9429, 2608.5994, 55.8359, 6, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 6, -2625.8647, 210.6339, 4.6173, 6, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 8, 238.7927, -177.8448, 1.5781, 6, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 9, 2401.8452, -1979.5873, 13.5469, 6, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 10, 1364.5735, -1278.8613, 13.5469, 6, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 11, 1545.9814, -1675.3253, 13.5614, 30, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 12, -1619.5039, 684.9335, 7.1901, 30, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 13, 2295.0627, 2457.1348, 10.8203, 30, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 14, 631.0374, -572.1962, 16.3359, 30, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 15, -325.1331, 1533.0276, 75.3594, 53, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 16, -2207.1196, -991.9159, 36.8409, 53, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 17, 1583.3257, -2375.7019, 13.3750, 53, 0xFFFFFFFF);
    SetPlayerMapIcon(playerid, 18, 1241.1146, -745.0139, 95.0895, 53, 0xFFFFFFFF);
    //-----------------------ТЕКСТ-ДРАВЫ-----------------------------------------|
    //Текст-драв: сайта samp.adbil.ru
    //	TextDrawCreate(501, 110, "samp.adbil.ru");
    //Текст-драв: Название сервера
    mod = TextDrawCreate(500, 110, "Drift World v3.7");
    TextDrawAlignment(mod, 1);
    TextDrawFont(mod, 1);
    TextDrawSetOutline(mod, 2);
    TextDrawLetterSize(mod, 0.35, 1);
    TextDrawColor(mod, 0x8DFF00FF);
    TextDrawSetShadow(mod, 1);
    TextDrawShowForPlayer(playerid, mod);
    //Name
    nameddd = TextDrawCreate(540, 100, "NDS");
    TextDrawAlignment(nameddd, 1);
    TextDrawFont(nameddd, 1);
    TextDrawSetOutline(nameddd, 2);
    TextDrawLetterSize(nameddd, 0.35, 1);
    TextDrawColor(nameddd, 0x8DFF00FF);
    TextDrawSetShadow(nameddd, 1);
    TextDrawShowForPlayer(playerid, nameddd);
    //==============================================================================
    // Удаленые обьекты
    RemoveBuildingForPlayer(playerid, 9965, -1535.4219, 1168.6641, 18.2031, 0.25);
    RemoveBuildingForPlayer(playerid, 9951, -1535.4219, 1168.6641, 18.2031, 0.25);
    RemoveBuildingForPlayer(playerid, 17924, 2586.3125, -1595.7578, 4.9922, 0.25);
    RemoveBuildingForPlayer(playerid, 17939, 2582.1563, -1670.7422, 5.7344, 0.25);
    RemoveBuildingForPlayer(playerid, 17525, 2586.3125, -1595.7578, 4.9922, 0.25);
    RemoveBuildingForPlayer(playerid, 17913, 2431.0547, -1677.4297, 20.3125, 0.25);
    RemoveBuildingForPlayer(playerid, 17968, 2442.3672, -1641.8438, 26.8984, 0.25);
    RemoveBuildingForPlayer(playerid, 17898, 2431.0391, -1603.4922, 20.2031, 0.25);
    //---------------------------------------------------------------------------|
    return 1;
}
public OnPlayerDisconnect(playerid, reason) {
    //new str[128];
    //format(str,128,"{00FF00}%s {9999FF}покинул {33CCFF}сервер {FF0000}(Выход)", PlayerName(playerid));
    //SendClientMessageToAll(COLOR_RED,str);
    //oplayers--;
    new str[128];
    if (Logged[playerid] == 1) OnPlayerSave(playerid);
    if (Logged[playerid] == 1) SaveAccount(playerid);
    return true;
}

public OnPlayerSpawn(playerid) {
    if (Logged[playerid] == 0) Kick(playerid);
    if (Logged[playerid] == 1) {
        if (PlayerInfo[playerid][pBan] == 1) {
            SendClientMessage(playerid, COLOR_SYSTEM, "Аккаунт с данным ником забанен, пиши в группе - vk.com/ndrift , в теме о разбанах заявку");
            Kick(playerid);
        }
        SetTimerEx("Spawn", 500, false, "i", playerid);
        StopAudioStreamForPlayer(playerid);
        new rand = random(sizeof(RandomSpawn));
        SetPlayerPos(playerid, RandomSpawn[rand][0], RandomSpawn[rand][1], RandomSpawn[rand][2]);
        GivePlayerWeapon(playerid, 24, 100);
        GivePlayerWeapon(playerid, 31, 100);
        GivePlayerWeapon(playerid, 25, 100);
        GivePlayerWeapon(playerid, 28, 100);
        SetPlayerInterior(playerid, 0);
        SetPVarInt(playerid, "K_Times", 0);
    }
    return true;
}

public OnPlayerDeath(playerid, killerid, reason) {
    Scoress[killerid]++;
    GameTextForPlayer(playerid, "~r~ymep", 3000, 2);
    GameTextForPlayer(killerid, "~r~+1000", 2000, 1);
    GiveMoney(killerid, 1000);
    SendDeathMessage(killerid, playerid, reason);
    SetPVarInt(playerid, "K_Times", GetPVarInt(playerid, "K_Times") + 1);
    if (GetPVarInt(playerid, "K_Times") > 1) return Ban(playerid); //больше одной смерти перед спавном - кик
    return true;
}

stock PlayerName(playerid) {
    new pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, sizeof(pname));
    return pname;
}
public SendAdminMessage(color, string[]) {
    for (new i = 0; i < MAX_PLAYERS; i++) {
        if (IsPlayerConnected(i)) {
            if (PlayerInfo[i][pAdmin] >= 1) {
                SendClientMessage(i, color, string);
            }
        }
    }
}
public OnPlayerCommandText(playerid, cmdtext[]) {
    new string[256];
    new playermoney;
    new sendername[MAX_PLAYER_NAME];
    new giveplayer[MAX_PLAYER_NAME];
    new cmd[256];
    new giveplayerid, moneys, idx;
    new Message[256];
    new gMessage[256];
    new pName[MAX_PLAYER_NAME + 1];
    new iName[MAX_PLAYER_NAME + 1];
    new tmp[256];
    cmd = strtok(cmdtext, idx);
    if (Logged[playerid] == 0) SendClientMessage(playerid, COLOR_RED, "Сначало нужно пройти регистрация/авторизацию.");
    if ((GetTickCount() - GetPVarInt(playerid, "Flood_Command")) <= 2000) return SendClientMessage(playerid, -1, "Использовать команды разрешено не чаще,чем раз в 2 сек.."); //антифлуд
    SetPVarInt(playerid, "Flood_Command", GetTickCount()); //антифлуд
    if (Logged[playerid] == 1) {
        if (strcmp(cmd, "/a", true) == 0) {
            if (IsPlayerConnected(playerid)) {
                GetPlayerName(playerid, sendername, sizeof(sendername));
                new length = strlen(cmdtext);
                while ((idx < length) && (cmdtext[idx] <= ' ')) {
                    idx++;
                }
                new offset = idx;
                new result[64];
                while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
                    result[idx - offset] = cmdtext[idx];
                    idx++;
                }
                result[idx - offset] = EOS;
                if (!strlen(result)) {
                    SendClientMessage(playerid, COLOR_YELLOW, " Подсказка: /a [текст]");
                    return 1;
                }
                new arank[64];
                if (PlayerInfo[playerid][pAdmin] >= 5) { arank = "Главный Администратор Проекта"; } else if (PlayerInfo[playerid][pAdmin] == 4) { arank = "Зам.Гл.Админа"; } else if (PlayerInfo[playerid][pAdmin] == 3) { arank = "Админ"; } else if (PlayerInfo[playerid][pAdmin] == 2) { arank = "Модератор"; } else if (PlayerInfo[playerid][pAdmin] == 1) { arank = "Хелпер"; } else { arank = "Хэлпер"; }

                format(string, sizeof(string), "*** %s %s[%d]: %s. ***", arank, sendername, playerid, result);
                if (PlayerInfo[playerid][pAdmin] >= 1) {
                    SendAdminMessage(COLOR_GREEN, string);
                }
                printf("%s %s[%d]: %s", arank, sendername, playerid, result);
            }
            return 1;
        }

        if (strcmp("/cc", cmdtext, true, 3) == 0) {
            if (IsPlayerConnected(playerid)) {
                if (PlayerInfo[playerid][pAdmin] >= 1) {
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    for (new i = 0; i < 16; i++) SendClientMessageToAll(COLOR_SYSTEM, " ");
                    format(string, sizeof(string), "{FF0000}Администратор %s очистил чат.", sendername);
                    SendClientMessageToAll(COLOR_SYSTEM, string);
                    return 1;
                }
            }
            return 1;
        }
        if (strcmp(cmd, "/ban", true) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 3) {
                new tmp2[256];
                tmp = strtok(cmdtext, idx);
                tmp2 = strtok(cmdtext, idx);
                if ((!strlen(tmp)) || (!strlen(tmp2)) || (!IsNumeric(tmp)) || (!IsNumeric(tmp2))) {
                    SendClientMessage(playerid, COLOR_GREY, "Используй: /ban [id] [дни] [причина]");
                    return 1;
                }
                if (IsPlayerConnected(playerid)) {
                    new playeri, day, y, xsd, d, yy, mm, dd, nameme[MAX_PLAYER_NAME];
                    playeri = strval(tmp);
                    day = strval(tmp2);
                    if (IsPlayerConnected(playeri)) {
                        if (PlayerInfo[playerid][pAdmin] < PlayerInfo[playeri][pAdmin]) {
                            SendClientMessage(playerid, COLOR_GREY, "Нельзя забанить админа который старше вас!");
                            return 1;
                        }
                        if (day <= 0) {
                            SendClientMessage(playerid, COLOR_GREY, "Дни бана должны быть больше 0!");
                            return 1;
                        }
                        new length = strlen(cmdtext);
                        while ((idx < length) && (cmdtext[idx] <= ' ')) {
                            idx++;
                        }
                        new offset = idx;
                        new result[64];
                        while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
                            result[idx - offset] = cmdtext[idx];
                            idx++;
                        }
                        result[idx - offset] = EOS;
                        new playername[MAX_PLAYER_NAME];
                        GetPlayerName(playeri, nameme, sizeof(nameme));
                        GetPlayerName(playerid, playername, sizeof(playername));
                        GetPlayerName(playeri, sendername, sizeof(sendername));
                        if (!strlen(result)) {
                            format(string, sizeof(string), "{FF0000}Администратор %s забанил %s на %d дней. Причина: Нет причины", playername, sendername, day);
                            SendClientMessageToAll(COLOR_LIGHTRED, string);
                        } else {
                            format(string, sizeof(string), "{FF0000}Администратор %s забанил %s на %d дней. Причина: %s", playername, sendername, day, (result));
                            SendClientMessageToAll(COLOR_LIGHTRED, string);
                        }
                        getdate(y, xsd, d);
                        dd = d;
                        mm = xsd;
                        yy = y;
                        dd = dd + day;
                        while (dd > GetDayMount(xsd, y)) {
                            mm++;
                            if (mm > 12) {
                                mm = 1;
                                yy++;
                            }
                            dd = dd - GetDayMount(mm, yy);
                        }
                        format(string, sizeof(string), "%d,%d,%d", dd, mm, yy);
                        new File = ini_openFile("tempbans.ini");
                        ini_setString(File, nameme, string);
                        ini_closeFile(File);
                        PlayerInfo[playeri][pBan] = 1;
                        OnPlayerSave(playeri);
                        Ban(playeri);

                    } else {
                        SendClientMessage(playerid, COLOR_GREY, "Игрок оффлайн!");
                    }
                }
            } else {
                SendClientMessage(playerid, COLOR_GREY, "Нет полномочия на эту команду!");
            }
            return 1;
        }
        if (strcmp("/makeadmin", cmdtext, true, 10) == 0) {
            if (IsPlayerConnected(playerid)) {
                tmp = strtok(cmdtext, idx);
                if (!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_SYSTEM, "[Используй]: /makeadmin [ID/Имя] [Lvl (0-4)]");
                    return 1;
                }
                new para1;
                new level;
                para1 = ReturnUser(tmp);
                tmp = strtok(cmdtext, idx);
                level = strval(tmp);
                if (level > 5 || level < 0) { SendClientMessage(playerid, COLOR_SYSTEM, "[Сервер]: Lvl Админки может быть от 0 до 5"); return 1; }
                if (PlayerInfo[playerid][pAdmin] >= 5 || IsPlayerAdmin(playerid)) {
                    if (IsPlayerConnected(para1)) {
                        if (para1 != INVALID_PLAYER_ID) {
                            GetPlayerName(para1, giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            PlayerInfo[para1][pAdmin] = level;
                            printf("[Сервер]: %s продвинул %s на %d уровень админки.", sendername, giveplayer, level);
                            format(string, sizeof(string), "[Сервер]: {FF0000}Вам были выданы админ права %d -ого уровня админом %s ", level, sendername);
                            SendClientMessage(para1, COLOR_SYSTEM, string);
                            format(string, sizeof(string), "[Сервер]: {FF0000}Вы выдали игроку %s админ права %d уровня.", giveplayer, level);
                            SendClientMessage(playerid, COLOR_SYSTEM, string);
                            OnPlayerSave(playerid);
                        }
                    }
                } else {
                    SendClientMessage(playerid, COLOR_SYSTEM, "[Сервер]: Недостаточно прав!");
                }
            }
            return 1;
        }
        if (strcmp(cmd, "/freeze", true) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 1) {
                tmp = strtok(cmdtext, idx);
                if (!strlen(tmp)) return SendClientMessage(playerid, COLOR_WHITE, " Введите: /freeze [id]");
                new playa;
                playa = ReturnUser(tmp);
                //if(PlayerInfo[playa][pAdmin] > 0) return SendClientMessage(playerid, COLOR_GRAD2, "[Сервер:] {FF0000}Администратор не может быть заморожен!");
                if (PlayerInfo[playerid][pAdmin] >= 1) {
                    if (IsPlayerConnected(playa)) {
                        if (playa != INVALID_PLAYER_ID) {
                            GetPlayerName(playa, giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            TogglePlayerControllable(playa, 0);
                            format(string, sizeof(string), "[Сервер]{FF0000}Администратор{CD0000} %s {FF0000}заморозил игрока {CD0000}%s", sendername, giveplayer);
                            printf("%s", string);
                            format(string, sizeof(string), "[Сервер]: {FF0000}Игрок {CD0000}%s {FF0000}был заморожен администратором {CD0000}%s", giveplayer, sendername);
                            SendClientMessageToAll(COLOR_RED, string);
                        }
                    }
                } else {
                    SendClientMessage(playerid, COLOR_GRAD1, "[Сервер:] Вы не уполномочены использовать эту команду!");
                }
            }
            return true;
        }
        new specplayerid;
        if (strcmp(cmd, "/spec", true) == 0) {
            tmp = strtok(cmdtext, idx);
            GetPlayerName(specplayerid, giveplayer, sizeof(giveplayer));
            if (!strlen(tmp)) {
                SendClientMessage(playerid, COLOR_WHITE, "Используй: /spec [playerid]");
                return 1;
            }
            specplayerid = strval(tmp);
            if (!IsPlayerConnected(specplayerid)) {
                SendClientMessage(playerid, COLOR_RED, "Не активный игрок.");
                return 1;
            }
            if (PlayerInfo[playerid][pAdmin] >= 2) //проверка на админа[ставим свою]
            {
                TogglePlayerSpectating(playerid, 1);
                PlayerSpectatePlayer(playerid, specplayerid);
                SetPlayerInterior(playerid, GetPlayerInterior(specplayerid));
                gSpectateID[playerid] = specplayerid;
                gSpectateType[playerid] = ADMIN_SPEC_TYPE_PLAYER;
                SpecHATimer[playerid] = SetTimerEx("SpecHArefresh", 500, true, "ff", playerid, specplayerid); //запускаем таймер с TextDraw
                TextDrawShowForPlayer(playerid, SM_HA[playerid]); //высвечиваем TextDraw
            }
            if (IsPlayerInAnyVehicle(specplayerid)) //если игрок в транспорте, то слежка ведётся за машиной...[ну как то так]
            {
                SetPlayerInterior(playerid, GetPlayerInterior(specplayerid));
                TogglePlayerSpectating(playerid, 1);
                PlayerSpectateVehicle(playerid, GetPlayerVehicleID(specplayerid));
                gSpectateID[playerid] = specplayerid;
                gSpectateType[playerid] = ADMIN_SPEC_TYPE_VEHICLE;
            }
            return 1;
        }
        if (strcmp(cmd, "/specoff", true) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 2) //проверка на админа
            {
                TogglePlayerSpectating(playerid, 0);
                gSpectateID[playerid] = INVALID_PLAYER_ID;
                gSpectateType[playerid] = ADMIN_SPEC_TYPE_NONE;
                TextDrawHideForPlayer(playerid, SM_HA[playerid]); //Спрячем TextDraw
                KillTimer(SpecHATimer[playerid]); //Остановим таймер
            }
            return 1;
        }
        if (strcmp(cmd, "/unfreeze", true) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 1) {
                tmp = strtok(cmdtext, idx);
                if (!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_WHITE, " Введите: /unfreeze [id]");
                    return true;
                }
                new playa;
                playa = ReturnUser(tmp);
                if (PlayerInfo[playerid][pAdmin] >= 1) {
                    if (IsPlayerConnected(playa)) {
                        if (playa != INVALID_PLAYER_ID) {
                            GetPlayerName(playa, giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            TogglePlayerControllable(playa, 1);
                            format(string, sizeof(string), "[Сервер]{FF0000}Администратор{CD0000} %s {FF0000}разморозил игрока {CD0000}%s", sendername, giveplayer);
                            printf("%s", string);
                            format(string, sizeof(string), "[Сервер]{FF0000}Администратор{CD0000} %s {FF0000}разморозил игрока {CD0000}%s ", sendername, giveplayer);
                            SendClientMessageToAll(COLOR_RED, string);
                        }
                    }
                } else {
                    SendClientMessage(playerid, COLOR_SYSTEM, "Вы не уполномочены использовать эту команду!");
                }
            }
            return true;
        }
        if (strcmp(cmd, "/get", true) == 0) {
            if (IsPlayerConnected(playerid)) {
                tmp = strtok(cmdtext, idx);
                if (!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_SYSTEM, " {ffffff}[Используй]: /get [ID персонажа/Имя персонажа]");
                    return 1;
                }
                new Float:plocx, Float:plocy, Float:plocz;
                new plo;
                plo = ReturnUser(tmp);
                if (IsPlayerConnected(plo)) {
                    if (plo != INVALID_PLAYER_ID) {
                        if (PlayerInfo[playerid][pAdmin] >= 1) {
                            GetPlayerPos(playerid, plocx, plocy, plocz);
                            if (GetPlayerState(plo) == 2) {
                                new tmpcar = GetPlayerVehicleID(plo);
                                SetVehiclePos(tmpcar, plocx, plocy + 4, plocz);
                            } else {
                                SetPlayerPos(plo, plocx, plocy + 2, plocz);
                            }
                            SetPlayerInterior(plo, GetPlayerInterior(playerid));
                            SetPlayerVirtualWorld(plo, GetPlayerVirtualWorld(playerid));
                            SendClientMessage(plo, COLOR_SYSTEM, "* Вы были телепортированы Администрацией");
                        } else {
                            SendClientMessage(playerid, COLOR_SYSTEM, "*  Вы не уполномочены использовать эту команду!");
                        }
                    }
                } else {
                    format(string, sizeof(string), "   %d не активный игрок.", plo);
                    SendClientMessage(playerid, COLOR_SYSTEM, string);
                }
            }
            return 1;
        }
        if (strcmp(cmd, "/gm", true) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 2) {
                tmp = strtok(cmdtext, idx);
                if (strlen(tmp) && IsPlayerNPC(strval(tmp))) return 1;
                if (!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_SYSTEM, " Использование: /gm ID");
                } else {
                    if (!IsPlayerConnected(strval(tmp))) {
                        SendClientMessage(playerid, COLOR_SYSTEM, " Неверный ID.");
                    } else {
                        SetPlayerHealth(strval(tmp), 999999);
                        SetPlayerArmour(strval(tmp), 999999);
                        format(string, sizeof(string), "%s получил GM от администрации", PlayerName(strval(tmp)));
                        SendClientMessageToAll(0xFF0000FF, string);
                    }
                    return 1;
                }
            }
            return 1;
        }
        if (strcmp(cmd, "/time", true) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 3) {
                ShowPlayerDialog(playerid, 150, DIALOG_STYLE_LIST, "Изменение времени", "00:00\n01:00\n02:00\n03:00\n04:00\n05:00\n06:00\n07:00\n08:00\n09:00\n10:00\n11:00\n12:00\n13:00\n14:00\n15:00\n16:00\n17:00\n18:00\n19:00\n20:00\n21:00", "Принять", "Отмена");
                return 1;
            }
            return 1;
        }
        if (strcmp(cmd, "/disarm", true) == 0) {
            tmp = strtok(cmdtext, idx);
            if (!strlen(tmp)) {
                SendClientMessage(playerid, COLOR_GRAD2, "ИНФО: /disarm [ID/Ник]");
                return 1;
            }
            giveplayerid = ReturnUser(tmp);
            tmp = strtok(cmdtext, idx);
            if (PlayerInfo[playerid][pAdmin] >= 2) {
                if (IsPlayerConnected(giveplayerid)) {
                    if (giveplayerid != INVALID_PLAYER_ID) {
                        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        printf("AC:%s has disarm %s", sendername, giveplayer);
                        format(string, sizeof(string), "Вы были разоружены админом %s", sendername);
                        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
                        format(string, sizeof(string), "Вы разоружили %s.", giveplayer);
                        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        ResetPlayerWeapons(giveplayerid);
                    } else {
                        SendClientMessage(playerid, COLOR_GREY, "Этот игрок оффлайн");
                        return 1;
                    }
                }
            } else {
                SendClientMessage(playerid, COLOR_GRAD1, "Вы не имеете право пользоваться этой командой");
            }
            return 1;
        }
        if (!strcmp(cmd, "/slap")) {
            if (PlayerInfo[playerid][pAdmin] <= 2) return true;
            new ebaaa;
            tmp = strtok(cmdtext, idx);
            if (!strlen(tmp)) return SendClientMessage(playerid, COLOR_RED, "Используйте: /slap [id]");
            ebaaa = ReturnUser(tmp);
            new Float:x, Float:y, Float:z, Float:hp, Float:armor;
            GetPlayerHealth(ebaaa, hp);
            GetPlayerArmour(ebaaa, armor);
            SetPlayerArmour(ebaaa, 0);
            SetPlayerHealth(ebaaa, 100);
            GetPlayerPos(ebaaa, x, y, z);
            SetPlayerPos(ebaaa, x, y, z + 8);
            CreateExplosion(x, y, z + 8, 8, 0.1);
            return true;
        }
        if (strcmp(cmd, "/kick", true) == 0) {
            if (IsPlayerConnected(playerid)) {
                tmp = strtok(cmdtext, idx);
                if (!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /kick [playerid/PartOfName] [reason]");
                    return 1;
                }
                giveplayerid = ReturnUser(tmp);
                if (PlayerInfo[playerid][pAdmin] >= 2) {
                    if (IsPlayerConnected(giveplayerid)) {
                        if (giveplayerid != INVALID_PLAYER_ID) {
                            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
                            GetPlayerName(playerid, sendername, sizeof(sendername));
                            new length = strlen(cmdtext);
                            while ((idx < length) && (cmdtext[idx] <= ' ')) {
                                idx++;
                            }
                            new offset = idx;
                            new result[64];
                            while ((idx < length) && ((idx - offset) < (sizeof(result) - 1))) {
                                result[idx - offset] = cmdtext[idx];
                                idx++;
                            }
                            result[idx - offset] = EOS;
                            if (!strlen(result)) {
                                SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /kick [playerid/PartOfName] [reason]");
                                return 1;
                            }
                            new year, month, day;
                            getdate(year, month, day);
                            format(string, sizeof(string), "%s кикнут админом %s.Причина: %s (%d-%d-%d)", giveplayer, sendername, (result), month, day, year);

                            format(string, sizeof(string), "%s кикнут админом %s.Причина: %s", giveplayer, sendername, (result));
                            SendClientMessageToAll(COLOR_LIGHTRED, string);
                            Kick(giveplayerid);
                            return 1;
                        }
                    } else {
                        format(string, sizeof(string), "   %d не верный id.", giveplayerid);
                        SendClientMessage(playerid, COLOR_GRAD1, string);
                    }
                }
            }
            return 1;
        }
        if (strcmp("/healall", cmdtext, true, 10) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 2) {
                for (new i = 0; i < MAX_PLAYERS; i++) {
                    SetPlayerHealth(i, 100.0);
                }
                SendClientMessageToAll(COLOR_RED, "Админ выдал всем полное здоровье!");
            }
            return 1;
        }
        if (strcmp("/armourall", cmdtext, true, 10) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 3) {
                for (new i = 0; i < MAX_PLAYERS; i++) {
                    SetPlayerArmour(i, 100.0);
                }
                SendClientMessageToAll(COLOR_RED, "Админ выдал всем полную броню!");
            }
            return 1;
        }
        if (strcmp(cmd, "/akill", true) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 3) {
                tmp = strtok(cmdtext, idx);
                if (strlen(tmp) && IsPlayerNPC(strval(tmp))) return 1;
                if (!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_SYSTEM, " Использование: /akill ID");
                } else {
                    if (!IsPlayerConnected(strval(tmp))) {
                        SendClientMessage(playerid, COLOR_SYSTEM, " Неверный ID.");
                    } else {
                        SetPlayerHealth(strval(tmp), 0);
                        format(string, sizeof(string), "%s был убит администратором %s", PlayerName(strval(tmp)));
                        SendClientMessageToAll(0xFF0000FF, string);
                    }
                    return 1;
                }
            }
            return 1;
        }
        if (strcmp(cmd, "/goto", true) == 0) {
            if (PlayerInfo[playerid][pAdmin] >= 1) {
                tmp = strtok(cmdtext, idx);
                if (!strlen(tmp)) return SendClientMessage(playerid, COLOR_SYSTEM, "[Используй]: /goto [ID/Имя]");
                new GotoId = strval(tmp);
                if (GotoId == playerid) return SendClientMessage(playerid, COLOR_SYSTEM, "[Сервер]: Ты не можешь телепортироваться к себе.");
                new Float:x, Float:y, Float:z;
                GetPlayerPos(GotoId, x, y, z);
                SetPlayerPos(playerid, x, y, z);
            } else {
                SendClientMessage(playerid, COLOR_SYSTEM, "[Сервер]: Недостаточно прав!");
            }
            return 1;
        }
        if (strcmp(cmd, "/GiveMoney", true) == 0) {
            if (IsPlayerConnected(playerid)) {
                tmp = strtok(cmdtext, idx);
                if (!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_GRAD2, " Используйте: /GiveMoney [playerid/PartOfName] [money]");
                    return 1;
                }
                new playa;
                new money;
                playa = ReturnUser(tmp);
                tmp = strtok(cmdtext, idx);
                money = strval(tmp);
                if (PlayerInfo[playerid][pAdmin] >= 5) {
                    if (IsPlayerConnected(playa)) {
                        if (playa != INVALID_PLAYER_ID) {
                            GiveMoney(playa, money);
                            OnPlayerSave(playa);
                        }
                    }
                } else {
                    SendClientMessage(playerid, COLOR_GRAD1, "** У Вас недостаточно прав для того, чтобы использовать эту команду!");
                }
            }
            return 1;
        }
        if (strcmp("/ahelp", cmdtext, true, 10) == 0) {
            new stadm[2500];
            for (new i; i < sizeof(Adm); i++) {
                strcat(stadm, Adm[i]);
                ShowPlayerDialog(playerid, 211, DIALOG_STYLE_MSGBOX, "{ffff33}Админ команды:", stadm, "Готово", "");
            }
            return 1;
        }
        if (strcmp(cmd, "/ascore", true) == 0) {
            if (IsPlayerAdmin(playerid)) {
                new tmp[256], tmp2[256];
                tmp = strtok(cmdtext, idx);
                tmp2 = strtok(cmdtext, idx);
                if (!strlen(tmp) || !strlen(tmp2)) return SendClientMessage(playerid, 0xFFFF00FF, "/ascore [id игрока][очки]");
                Scoress[strval(tmp)] = strval(tmp2);
            }
            return true;
        }
        if (strcmp(cmdtext, "/создатель", true) == 0) {
            ShowPlayerDialog(playerid, 1200, DIALOG_STYLE_MSGBOX, "{FFFF66}Информация о моде, и создателе:", "{FF0000}Мод: Drift World\nАвтор мода: LOD от студии {Nation World Studio}\nОткрытие проекта произошло в июне 2012 года.\nСайт: vk.com/ndrift\nОфициальный игровой сервер samp:\n31.131.251.131:7012\nПриятной вам игры.", "Ок", "");
            return 1;
        }
        if (!strcmp(cmdtext, "/hh", true, 3)) // сравниваем только первые три символа
        {
            new str[64];
            GetPlayerName(playerid, str, sizeof(str));
            format(str, sizeof(str), "%s приветствует всех!", str, cmdtext[4]);
            SendClientMessageToAll(0x00FF00, str);
            return 1;
        }
        if (!strcmp(cmdtext, "/bb", true, 3)) // сравниваем только первые три символа
        {
            new str[64];
            GetPlayerName(playerid, str, sizeof(str));
            format(str, sizeof(str), "%s прощается со всеми!", str, cmdtext[4]);
            SendClientMessageToAll(0xFFFF00, str);
            return 1;
        }
        //-----------------------------------------------------------Новые команды , и анимки)))
        //Ворота базы
        if (strcmp("/ba1", cmdtext, true, 10) == 0) {
            if (gates2 == 0) {
                MoveObject(gates, -2116.69995117, -80.30000305, 37.09999847, 5);
                SendClientMessage(playerid, 0x00FF00AA, "Вы открыли базу.");
                gates2 = 1;
            } else {
                MoveObject(gates, -2126.60009766, -80.50000000, 37.09999847, 5);
                SendClientMessage(playerid, 0x00FF00AA, "Вы закрыли базу.");
                gates2 = 0;
            }
            return 1;
        }

        if (strcmp("/rules", cmdtext, true, 10) == 0) {
            new String[2048];
            strins(String, "{FF0000} Здравствуйте! Сейчас я ознакомлю вас с правилами сервера.   \n", strlen(String));
            strins(String, "\n", strlen(String));
            strins(String, "{FF2C00}Читайте нормально. Чтобы потом не возникало вопросов.\n", strlen(String));
            strins(String, "{FF5000}На сервере запрещено!!!\n", strlen(String));
            strins(String, "{FF8700}1. Читёрство.\n", strlen(String));
            strins(String, "{FFA700}2. Запрещено использовать ники кланов. Типо [ADM] , [Admins] \n", strlen(String));
            strins(String, "{FFDC00}если вы не админ.\n", strlen(String));
            strins(String, "{FFFB00}3. Запрещен спид-хак. Если вы его используете то вас кикает автоматически.\n", strlen(String));
            strins(String, "{C4FF00}4. Запрещены оскорбления в  сторону админов. Они  тоже такие же люди как и вы.\n", strlen(String));
            strins(String, "{7BFF00}5. Запрещены CLEO типо как телепорт по клику.\n", strlen(String));
            strins(String, "{00FF00}6. Запрещено оскорблять админов и игроков а также их родных!\n", strlen(String));
            strins(String, "{FFA700}7. Спорить с администратором нельзя! Администрация всегда права!\n", strlen(String));
            strins(String, "{FFA700}8. Запрещена реклама посторонних ресурсов! Противоречие этому правилу карается баном!\n", strlen(String));
            strins(String, "{00FF1E}ПРАВИЛА СО ВРЕМЕНЕМ ОБНОВЛЯЮТСЯ!!!\n", strlen(String));
            strins(String, "{00FF3B}ПОЖАЛУЙСТА ПОСЕТИТЕ НАШ САЙТ vk.com/ndrift\n", strlen(String));
            strins(String, "{FFFFFF} *******ПРИЯТНОЙ ВАМ ИГРЫ! ЗА ПРОСМОТР ИНФОРМАЦИИ ВЫ ПОЛУЧИЛИ +10000 :D \n", strlen(String));
            strins(String, "{FFFFFF}                              * Всего доброго! ;)\n", strlen(String));
            strins(String, "\n", strlen(String));
            ShowPlayerDialog(playerid, 1002, DIALOG_STYLE_MSGBOX, "{FFFFFF}Правила сервера!", String, "Ок", "");
            if (rules == 0) {
                GiveMoney(playerid, 10000);
                rules = 1;
            }

            return 1;
        }
        if (strcmp("/админка", cmdtext, true, 10) == 0) {
            ShowPlayerDialog(playerid, 1060, DIALOG_STYLE_MSGBOX, "{FFFF66}Цены на админки:", "{FF0000}Уровень 1: 100 р\nУровень 2: 200 р\nУровень 3: 300 р\n\nКоманды вы можете посмотреть у нас на сайте vk.com/ndrift", "Ок", "Ок");
            return 1;
        }


        //Конец новых команд------------------------------------------------------------------


        if (strcmp(cmdtext, "/команды", true) == 0) {
            SendClientMessage(playerid, 0xFF8000AA, "Чтобы взять машину:");
            SendClientMessage(playerid, 0x00FF00AA, "			Нажмите 2");
            SendClientMessage(playerid, 0x00FF00AA, "     	Выбрать пункт 'Автомобили'.");
            SendClientMessage(playerid, 0xFF8000AA, "Телепортация:");
            SendClientMessage(playerid, 0x00FF00AA, "     	Нажмите левый ALT(если вы пешком) или 2(если вы в машине);");
            SendClientMessage(playerid, 0x00FF00AA, "     	1.Выбрать пункт 'Телепорты';");
            SendClientMessage(playerid, 0x00FF00AA, "     	2.Drift-трассы: '/d1-9'(без пробела);");
            SendClientMessage(playerid, 0x00FF00AA, "     	2.Drag-трассы: '/drag1-3'(без пробела);");
            SendClientMessage(playerid, 0xFF8000AA, "Тюнинг:");
            SendClientMessage(playerid, 0x00FF00AA, "     	Нажать кнопку 2;");
            SendClientMessage(playerid, 0x00FF00AA, "     	Выбрать пункт 'Тюнинг';");
            SendClientMessage(playerid, 0x00FF00AA, "     	Далее выбираете ту деталь, которая вам нужна.");
            SendClientMessage(playerid, 0xFF8000AA, "Сменить скин и прочее:");
            SendClientMessage(playerid, 0x00FF00AA, "     	Нажите левый ALT(если вы пешком) или 2(если вы в машине);");
            SendClientMessage(playerid, 0x00FF00AA, "     	Выбрать пункт 'Управление персонажем';");
            SendClientMessage(playerid, 0x00FF00AA, "     	Далее выбираете то, что вам нужно.");
            SendClientMessage(playerid, 0xFF8000AA, "Дополнительно:");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/count' - вызвать отсчёт;");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/dt [id]*' - режим дрифт-тренировки;");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/pm' - отправить личное сообщение;");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/gang - меню системы банд;");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/music - включить радио;");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/musicoff - выключить радио;");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/pay - отправить денежные средства другому игроку");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/hh - поздороваться со всеми");
            SendClientMessage(playerid, 0x00FF00AA, "     	'/bb - попрощатся со всеми");
            SendClientMessage(playerid, 0xFFFF00AA, "     	0 - общий мир. Далее - ваши отдельные.");
            return 1;
        }

        //Конец анимаций!!!

        if (strcmp(cmdtext, "/d1", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -325.1331, 1533.0276, 75.3594);
            else SetPlayerPos(playerid, -325.1331, 1533.0276, 75.3594);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Большое Ухо");
            return 1;
        }
        if (!strcmp(cmd, "/gang", true)) {
            ShowPlayerDialog(playerid, 10011, DIALOG_STYLE_LIST, "{00FF00}Система банд", "Создать банду\nНазначить скины\nНазначить место спавна\nНазначить уровень\nПригласить в банду\nКикнуть из банды\nИзменить цвет банды\nУйти из банды", "Выбрать", "Отмена");
            return 1;
        }
        if (strcmp(cmdtext, "/kva", true) == 0) {
            SetPlayerPos(playerid, 1018.2896, -1169.0984, 50.9513);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать ко мне на Хату");
            return 1;
        }

        if (strcmp(cmdtext, "/d2", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -2207.1196, -991.9159, 36.8409);
            else SetPlayerPos(playerid, -2207.1196, -991.9159, 36.8409);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Холм SF");
            return 1;
        }

        if (strcmp(cmdtext, "/d3", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1583.4438476563, -2376.037109375, 15.782542228699);
            else SetPlayerPos(playerid, 1583.4438476563, -2376.037109375, 15.782542228699);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать в Аэропорт Лос Сантоса");
            return 1;
        }

        if (strcmp(cmdtext, "/drag1", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1668, -240, 14.010653495789);
            else SetPlayerPos(playerid, -1668, -240, 15.0);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Взлётную полосу Аэропорта SF");
            return 1;
        }

        if (strcmp(cmdtext, "/d4", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1241.1146, -745.0139, 95.0895);
            else SetPlayerPos(playerid, 1241.1146, -745.0139, 95.0895);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Гору Вайнвуд");
            return 1;
        }

        if (strcmp(cmdtext, "/d5", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -884.28814697266, 550.00549316406, 5.3881149291992);
            else SetPlayerPos(playerid, -884.28814697266, 550.00549316406, 5.3881149291992);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Островок раздолья");
            return 1;
        }

        if (strcmp(cmdtext, "/d6", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -113.16453552, 583.32196045, 3.14548969);
            else SetPlayerPos(playerid, -113.16453552, 583.32196045, 3.14548969);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать в Форт Карсон");
            return 1;
        }

        if (strcmp(cmdtext, "/d7", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1685.10925293, 944.96972656, 10.53941059);
            else SetPlayerPos(playerid, 1685.10925293, 944.96972656, 10.53941059);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Парковку");
            return 1;
        }

        if (strcmp(cmdtext, "/d8", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1574.58410645, 713.25219727, 10.66216087);
            else SetPlayerPos(playerid, 1574.58410645, 713.25219727, 10.66216087);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Склад-симметрия");
            return 1;
        }

        if (strcmp(cmdtext, "/drag2", true) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1195.292114, 16.669136, 14.148437);
            else SetPlayerPos(playerid, -1195.292114, 16.669136, 14.148437);
            SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Пирс в Аэропорту SF");
            return 1;
        }
        if (strcmp("/count", cmdtext, true, 10) == 0) {
            if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) return SendClientMessage(playerid, 0xFF0000AA, "[INFO]: Вы должны быть в тачке");
            new Float: X, Float:Y, Float: Z;
            GetPlayerPos(playerid, X, Y, Z);
            countdown[playerid] = 11;
            for (new i = 0; i < MAX_PLAYERS; i++)
                if (IsPlayerInRangeOfPoint(i, 15.0, X, Y, Z)) {
                    if (GetPlayerState(i) != PLAYER_STATE_ONFOOT && countdown[i] == -1) countdown[i] = 11;
                }
            return 1;
        }
        if (strcmp(cmdtext, "/update", true) == 0) {
            ShowPlayerDialog(playerid, 8000, DIALOG_STYLE_LIST, "{00FF00}Версия мода v3.7", "В этой версии добавлено:\nОбновление защиты\nУбран (лишний) маппинг с локации Ухо", "OK", "OK");
            return 1;
        }

        /*if(strcmp(cmd, "/pay", true) == 0) {
                
                tmp = strtok(cmdtext, idx);

                if(!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_WHITE, "Сервер: /pay [id] [количество]");
                    return 1;
                }
                giveplayerid = strval(tmp);

                tmp = strtok(cmdtext, idx);
                if(!strlen(tmp)) {
                    SendClientMessage(playerid, COLOR_WHITE, "Сервер: /pay [id] [количество]");
                    return 1;
                }
                 moneys = strval(tmp);

             


                if (IsPlayerConnected(giveplayerid)) {
                    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
                    GetPlayerName(playerid, sendername, sizeof(sendername));
                    playermoney = GiveMoney(playerid);
                    if (moneys > 0 && playermoney >= moneys) {
                        GiveMoney(playerid, (0 - moneys));
                        printf("money 1");
                        GiveMoney(giveplayerid, moneys);
                        printf("money 2");
                        format(string, sizeof(string), "Отправлено %s(%d), $%d.", giveplayer,giveplayerid, moneys);
                        printf("money 3");
        				SendClientMessage(playerid, COLOR_YELLOW, string);
                        printf("money 4");
        				format(string, sizeof(string), "Вы получили $%d от %s(player: %d).", moneys, sendername, playerid);
                        printf("money 5");
        				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
                        printf("money 6");
        				printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
                        printf("money 7");
        			}
                    else {
                        SendClientMessage(playerid, COLOR_YELLOW, "Неверная сумма.");
                    }
                }
                else {
                        format(string, sizeof(string), "Игрока с id %d нету в игре ", giveplayerid);
                        SendClientMessage(playerid, COLOR_YELLOW, string);
                    }
                return 1;
            }*/
        if (strcmp("/pm", cmd, true) == 0) {
            tmp = strtok(cmdtext, idx);

            if (!strlen(tmp) || strlen(tmp) > 5) {
                SendClientMessage(playerid, 0xAA3333AA, "{FF8C00}Используйте /pm [id] [сообщение]");
                return 1;
            }
            new id = strval(tmp);
            gMessage = strrest(cmdtext, idx);

            if (!strlen(gMessage)) {
                SendClientMessage(playerid, 0xAA3333AA, "{FF8C00}Используйте /pm [id] [сообщение]");
                return 1;
            }

            if (!IsPlayerConnected(id)) {
                SendClientMessage(playerid, 0xAA3333AA, "Игрок не существует");
                return 1;
            }

            if (playerid != id) {
                GetPlayerName(id, iName, sizeof(iName));
                GetPlayerName(playerid, pName, sizeof(pName));
                format(Message, sizeof(Message), "{FF8C00}PM к %s(ID:%d): %s", iName, id, gMessage);
                SendClientMessage(playerid, 0xFFFF00AA, Message);
                format(Message, sizeof(Message), "{FF8C00}PM от %s(ID:%d): %s", pName, playerid, gMessage);
                SendClientMessage(id, 0xFFFF00AA, Message);
                PlayerPlaySound(id, 1085, 0.0, 0.0, 0.0);

                printf("PM: %s", Message);

            } else {
                SendClientMessage(playerid, 0xFFFF00AA, "{808080}Нельзя отправить PM самому себе!");
            }
            return 1;
        }





        dcmd(dt, 2, cmdtext);
        return 1;
    }
    return false;
}
public OnPlayerText(playerid, text[]) {
    if (Logged[playerid] == 0) SendClientMessage(playerid, -1, "Сначало нужно пройти регистрация/авторизацию.");

    if ((GetTickCount() - GetPVarInt(playerid, "Flood_Command")) <= 500) //антифлуд
    {
        SendClientMessageToAll(0xFFFFFFFF, "Игрок кикнут.Причина: Флуд.");
        Kick(playerid); //антифлуд
    }
    SetPVarInt(playerid, "Flood_Command", GetTickCount()); //антифлуд

    if (Logged[playerid] == 1) {
        new string[256];


        if (PGang[playerid] > 0) {
            new hex1[MAX_PLAYERS];
            hex1[playerid] = HexToInt(GColor[PGang[playerid]]);
            SetPlayerColor(playerid, hex1[playerid]);
            format(string, sizeof(string), "[Банда: %s]%s[%d]:{FFFFFF} %s", GName[PGang[playerid]], PlayerName(playerid), playerid, text);
            SendClientMessageToAll(GetPlayerColor(playerid), string);
            return false;
        }
        if (PGang[playerid] == 0) {
            SetPlayerChatBubble(playerid, text, 0x00FF00AA, 250.0, 8000);
            new sendername[32];
            GetPlayerName(playerid, sendername, 32);
            format(string, sizeof(string), "%s[%d]", sendername, playerid);
            SetPlayerName(playerid, string);
            format(string, 128, "%s", text);
            SendPlayerMessageToAll(playerid, string);
            SetPlayerName(playerid, sendername);
        }
    }
    return 0;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) {

    if ((newkeys == KEY_SUBMISSION)) {
        if (IsPlayerInAnyVehicle(playerid))
            ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");
    }
    if ((newkeys == 1024)) {
        if (!IsPlayerInAnyVehicle(playerid))
            ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");
    }
    if (newkeys == 1 || newkeys == 9 || newkeys == 33 && oldkeys != 1 || oldkeys != 9 || oldkeys != 33) {
        new Car = GetPlayerVehicleID(playerid), Model = GetVehicleModel(Car);
        switch (Model) {
            case 446, 432, 448, 452, 424, 453, 454, 461, 462, 463, 468, 471, 430, 472, 449, 473, 481, 484, 493, 495, 509, 510, 521, 538, 522, 523, 532, 537, 570, 581, 586, 590, 569, 595, 604, 611 : return 0;
        }
        AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
    }
    return 1;
}
stock GetDayMount(mount, yer) {
    switch (mount) {
        case 1 : return 31;
        case 2 :  {
            if ((yer - 8) % 4 == 0) {
                return 29;
            } else {
                return 28;
            }
        }
        case 3 : return 31;
        case 4 : return 30;
        case 5 : return 31;
        case 6 : return 30;
        case 7 : return 31;
        case 8 : return 31;
        case 9 : return 30;
        case 10 : return 31;
        case 11 : return 30;
        case 12 : return 31;
    }
    return 1;
}
stock IsAnAdmin(playerid) {
    if (IsPlayerConnected(playerid)) {
        new admin = PlayerInfo[playerid][pAdmin];
        if (admin == 1 || admin == 2 || admin == 3 || admin == 4 || admin == 5 || admin == 6 || admin == 7 | ) {
            return 1;
        }
    }
    return 0;
}
forward GangLoad();
public GangLoad() {
    new file, f[256];
    for (new i; i < MAX_GANGS; i++) {
        format(f, 256, "gangs/gang/%i.ini", i);
        file = ini_openFile(f);
        if (file == INI_OK) {
            ini_getString(file, "Gang name", name[i]);
            format(GName[i], 256, name[i]);
            ini_getString(file, "Gang color", col[i]);
            format(GColor[i], 10, col[i]);
            ini_getFloat(file, "SpawnX", GSpawnX[i]);
            ini_getFloat(file, "SpawnY", GSpawnY[i]);
            ini_getFloat(file, "SpawnZ", GSpawnZ[i]);
            ini_getInteger(file, "Skin1", GSkin[i][0]);
            ini_getInteger(file, "Skin2", GSkin[i][1]);
            ini_getInteger(file, "Skin3", GSkin[i][2]);
            ini_getInteger(file, "Skin4", GSkin[i][3]);
            ini_getInteger(file, "Skin5", GSkin[i][4]);
            ini_getInteger(file, "Skin6", GSkin[i][5]);
            Gang[i] = 1;
            ini_closeFile(file);
        }
    }
    return false;
}

forward Spawn(playerid);
public Spawn(playerid) {
    if (GSkin[PGang[playerid]][GangLvl[playerid] - 1] > 0) {
        SetPlayerSkin(playerid, GSkin[PGang[playerid]][GangLvl[playerid] - 1]);
    }
    if (GSpawnX[PGang[playerid]] != 0.0 && GSpawnY[PGang[playerid]] != 0.0 && GSpawnZ[PGang[playerid]] != 0.0) {
        SetPlayerPos(playerid, GSpawnX[PGang[playerid]], GSpawnY[PGang[playerid]], GSpawnZ[PGang[playerid]]);
    }
}

stock GetFreeGang() {
    for (new i = 1; i < MAX_GANGS; i++) {
        if (Gang[i] == 0) return i;
    }
    return false;
}

forward LoadAccount(playerid);
public LoadAccount(playerid) {
    new f[256], hex[MAX_PLAYERS];
    format(f, 256, "/gangs/user/%s.ini", PlayerName(playerid));
    new file = ini_openFile(f);
    if (file == INI_OK) {
        ini_getInteger(file, "Score", Scoress[playerid]);
        ini_getInteger(file, "Gang", PGang[playerid]);
        ini_getInteger(file, "GangLvl", GangLvl[playerid]);
        if (PGang[playerid] > 0) {
            hex[playerid] = HexToInt(GColor[PGang[playerid]]);
            SetPlayerColor(playerid, hex[playerid]);
        }
        ini_closeFile(file);
        return true;
    } else {
        ini_closeFile(file);
        file = ini_createFile(f);
        ini_setInteger(file, "Score", 0);
        ini_setInteger(file, "Gang", 0);
        ini_setInteger(file, "GangLvl", 0);
        ini_closeFile(file);
        return true;
    }
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {

    new carid = GetPlayerVehicleID(playerid);
    new engine, lights, alarm, doors, bonnet, boot, objective;

    new string[256];
    new tmp[256];

    if (dialogid == DIALOG_LOGIN) {
        if (!response) Kick(playerid);
        if (strlen(inputtext) == 0) return ShowPlayerLoginDialog(playerid);
        OnPlayerLogged(playerid, inputtext);
        return 1;
    }
    if (dialogid == DIALOG_REGISTER) {
        if (!response) Kick(playerid);
        if (strlen(inputtext) == 0) return ShowPlayerRegisterDialog(playerid);
        OnPlayerRegistered(playerid, inputtext);
        return 1;
    }
    if (dialogid == 150) //Смена времени
    {
        if (response) {
            if (listitem == 0) {
                SetWorldTime(0);
            }
            if (listitem == 1) {
                SetWorldTime(1);
            }
            if (listitem == 2) {
                SetWorldTime(2);
            }
            if (listitem == 3) {
                SetWorldTime(3);
            }
            if (listitem == 4) {
                SetWorldTime(4);
            }
            if (listitem == 5) {
                SetWorldTime(5);
            }
            if (listitem == 6) {
                SetWorldTime(6);
            }
            if (listitem == 7) {
                SetWorldTime(7);
            }
            if (listitem == 8) {
                SetWorldTime(8);
            }
            if (listitem == 9) {
                SetWorldTime(9);
            }
            if (listitem == 10) {
                SetWorldTime(10);
            }
            if (listitem == 11) {
                SetWorldTime(11);
            }
            if (listitem == 12) {
                SetWorldTime(12);
            }
            if (listitem == 13) {
                SetWorldTime(13);
            }
            if (listitem == 14) {
                SetWorldTime(14);
            }
            if (listitem == 15) {
                SetWorldTime(15);
            }
            if (listitem == 16) {
                SetWorldTime(16);
            }
            if (listitem == 17) {
                SetWorldTime(17);
            }
            if (listitem == 18) {
                SetWorldTime(18);
            }
            if (listitem == 19) {
                SetWorldTime(19);
            }
            if (listitem == 20) {
                SetWorldTime(20);
            }
            if (listitem == 21) {
                SetWorldTime(21);
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        }
    }

    if (dialogid == 10011) {
        if (response) {
            switch (listitem) {
                case 0 :  {
                    if (PGang[playerid] == 0 && PlayerInfo[playerid][pMoney] >= 1000000)
                    //if(PGang[playerid] == 0 && Scores[playerid] >= 500 && GetPlayerMoney(playerid) >= 1000000)
                    {
                        ShowPlayerDialog(playerid, 10020, DIALOG_STYLE_INPUT, "Создание банды", "Введите название банды в нижнее поле:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны выйти из своей банды, и у вас должно быть как минимум 0 очков и 1000000$.");
                }
                case 1 :  {
                    if (PGang[playerid] != 0 && GangLvl[playerid] == 6) {
                        ShowPlayerDialog(playerid, 10021, DIALOG_STYLE_LIST, "Назначение скинов банды", "Нуб\nИгрок\nПро игрок\nЭлита\nЗам лидера\nЛидер", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
                }
                case 2 :  {
                    if (PGang[playerid] != 0 && GangLvl[playerid] == 6) {
                        ShowPlayerDialog(playerid, 10022, DIALOG_STYLE_MSGBOX, "Назначение спавна банды", "Вы точно хотите назначить место спавна на этом месте?", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
                }
                case 3 :  {
                    if (PGang[playerid] != 0 && GangLvl[playerid] == 6) {
                        ShowPlayerDialog(playerid, 10023, DIALOG_STYLE_INPUT, "Назначение уровня", "Введите id игрока, которому хотите назначит уровень:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
                }
                case 4 :  {
                    if (PGang[playerid] != 0 && GangLvl[playerid] >= 4) {
                        ShowPlayerDialog(playerid, 10024, DIALOG_STYLE_INPUT, "Приглашение в банду", "Введите id игрока, которого хотите пригласить:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть как минимум 4 уровень.");
                }
                case 5 :  {
                    if (PGang[playerid] != 0 && GangLvl[playerid] >= 5) {
                        ShowPlayerDialog(playerid, 10025, DIALOG_STYLE_INPUT, "Кик из банды", "Введите id игрока, которого хотите кикнуть:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть как минимум 5 уровень.");
                }
                case 6 :  {
                    if (PGang[playerid] != 0 && GangLvl[playerid] == 6) {
                        ShowPlayerDialog(playerid, 10026, DIALOG_STYLE_INPUT, "Смена цвета банды", "Введите 6 символов формата RRGGBB:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
                }
                case 7 :  {
                    if (PGang[playerid] > 0) {
                        ShowPlayerDialog(playerid, 10027, DIALOG_STYLE_MSGBOX, "Уход из банды", "Вы точно хотите выйти из банды?", "Да", "Нет");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде!");
                }
            }
        }
    } else if (dialogid == 10020) {
        if (response) {
            if (!strlen(inputtext)) return ShowPlayerDialog(playerid, 10028, DIALOG_STYLE_INPUT, "Создание банды", "Введите название банды:", "Принять", "Отмена");
            format(GangName[playerid], 256, inputtext);
            ShowPlayerDialog(playerid, 10028, DIALOG_STYLE_INPUT, "Создание банды", "Введите цвет банды:", "Принять", "Отмена");
        }
    } else if (dialogid == 10028) {
        if (response) {
            if (!strlen(inputtext)) return ShowPlayerDialog(playerid, 10029, DIALOG_STYLE_INPUT, "Создание банды", "Введите цвет банды в нижнее поле:", "Принять", "Отмена");
            if (strlen(inputtext) != 6) {
                SendClientMessage(playerid, 0xFF0000, "Значение должно быть из 6 символов формата RRGGBB!");
                return ShowPlayerDialog(playerid, 10030, DIALOG_STYLE_INPUT, "Создание банды", "Введите цвет банды:", "Принять", "Отмена");
            }
            new f[256];
            format(f, 256, "gangs/gang/%i.ini", GetFreeGang());
            new cfile = ini_createFile(f);
            if (cfile == INI_OK) {
                GangLvl[playerid] = 6;
                PGang[playerid] = GetFreeGang();
                format(GName[PGang[playerid]], 256, GangName[playerid]);
                format(GColor[PGang[playerid]], 10, "%sFF", inputtext);
                new hex[MAX_PLAYERS];
                hex[playerid] = HexToInt(GColor[PGang[playerid]]);
                SetPlayerColor(playerid, hex[playerid]);
                Gang[GetFreeGang()] = 1;
                GiveMoney(playerid, -1000000);
                format(string, sizeof(string), "Банда успешно создана!\r\nНазвание банды: %s\r\nЦвет банды: %s", GName[PGang[playerid]], GColor[PGang[playerid]]);
                ShowPlayerDialog(playerid, 10031, DIALOG_STYLE_MSGBOX, "Создание банды", string, "Принять", "");
                ini_setString(cfile, "Gang name", GName[PGang[playerid]]);
                ini_setString(cfile, "Gang color", GColor[PGang[playerid]]);
                ini_setFloat(cfile, "SpawnX", 0.0);
                ini_setFloat(cfile, "SpawnY", 0.0);
                ini_setFloat(cfile, "SpawnZ", 0.0);
                ini_setInteger(cfile, "Skin1", 0);
                ini_setInteger(cfile, "Skin2", 0);
                ini_setInteger(cfile, "Skin2", 0);
                ini_setInteger(cfile, "Skin3", 0);
                ini_setInteger(cfile, "Skin4", 0);
                ini_setInteger(cfile, "Skin5", 0);
                ini_setInteger(cfile, "Skin6", 0);
                ini_closeFile(cfile);
            }
        }
    } else if (dialogid == 10024) {
        if (response) {
            if (!strlen(inputtext)) return ShowPlayerDialog(playerid, 10032, DIALOG_STYLE_INPUT, "Приглашение в банду", "Введите id игрока, которого хотите пригласить:", "Принять", "Отмена");
            if (IsPlayerConnected(strval(inputtext))) {
                if (PGang[strval(inputtext)] == 0) {
                    format(string, sizeof(string), "%s пригласил Вас в банду %s", PlayerName(playerid), GName[PGang[playerid]]);
                    ShowPlayerDialog(strval(inputtext), 10032, DIALOG_STYLE_MSGBOX, "Приглашение в банду", string, "Принять", "Отказать");
                    format(string, sizeof(string), "Лидер %s пригласил %s в банду.", PlayerName(playerid), PlayerName(id[playerid]));
                    for (new i; i < MAX_PLAYERS; i++) {
                        if (PGang[i] == PGang[playerid]) {

                            SendClientMessage(i, 0xFF0000FF, string);
                        }
                    }
                    tgang[strval(inputtext)] = PGang[playerid];
                } else return SendClientMessage(playerid, 0xFFFFFFFF, "Этот игрок уже в банде!");
            } else return SendClientMessage(playerid, 0xFFFFFFFF, "Этот игрок не в игре!");
        }
    } else if (dialogid == 10032) {
        if (response) {
            PGang[playerid] = tgang[playerid];
            GangLvl[playerid] = 1;
            new hex[MAX_PLAYERS];
            hex[playerid] = HexToInt(GColor[PGang[playerid]]);
            SetPlayerColor(playerid, hex[playerid]);
            format(string, sizeof(string), "Вы вступили в банду {FF0000}%s", GName[PGang[playerid]]);
            SendClientMessage(playerid, 0xFFFFFFFF, string);
            format(string, sizeof(string), "%s вступил в банду!", PlayerName(playerid));
            for (new i; i < MAX_PLAYERS; i++) {
                if (PGang[i] == PGang[playerid]) {
                    SendClientMessage(i, 0xFFFF00FF, string);
                }
            }
        } else {
            tgang[playerid] = 0;
        }
    } else if (dialogid == 10025) {
        if (response) {
            if (!strlen(inputtext)) return ShowPlayerDialog(playerid, 10027, DIALOG_STYLE_INPUT, "Выгнать из банды", "Введите id игрока, которого хотите выгнать:", "Принять", "Отмена");
            if (IsPlayerConnected(strval(inputtext))) {
                if (PGang[strval(inputtext)] == PGang[playerid]) {
                    PGang[strval(inputtext)] = 0;
                    GangLvl[strval(inputtext)] = 0;
                    format(string, 256, "Вы были выгнаны из банды игроком %s", PlayerName(playerid));
                    SendClientMessage(playerid, 0xFF0000FF, string);
                } else return SendClientMessage(playerid, 0xFFFFFFFF, "Этот игрок не в вашей банде!");
            } else return SendClientMessage(playerid, 0xFFFFFFFF, "Этот игрок не в игре!");
        }
    } else if (dialogid == 10026) {
        if (response) {
            if (!strlen(inputtext)) return ShowPlayerDialog(playerid, 10033, DIALOG_STYLE_INPUT, "Смена цвета банды", "Введите 6 символов формата RRGGBB:", "Принять", "Отмена");
            if (strlen(inputtext) != 6) {
                SendClientMessage(playerid, 0xFF0000FF, "Значение должно быть из 6 символов формата RRGGBB!");
                return ShowPlayerDialog(playerid, 10034, DIALOG_STYLE_INPUT, "Смена цвета банды", "Введите 6 символов формата RRGGBB:", "Принять", "Отмена");
            }
            format(GColor[PGang[playerid]], 10, "%sFF", inputtext);
            format(string, sizeof(string), "Теперь цвет вашей банды: %s", GColor[PGang[playerid]]);
            SendClientMessage(playerid, 0xFFFFFFFF, string);
            new f[256];
            format(f, 256, "gangs/gang/%i.ini", PGang[playerid]);
            new file = ini_openFile(f);
            if (file == INI_OK) {
                ini_setString(file, "Gang color", GColor[PGang[playerid]]);
                ini_closeFile(file);
            }
        }
    } else if (dialogid == 10027) {
        if (response) {
            format(string, sizeof(string), "%s ушёл из банды!", PlayerName(playerid));
            for (new i; i < MAX_PLAYERS; i++) {
                if (PGang[i] == PGang[playerid] && i != playerid) {
                    SendClientMessage(i, 0xFFFF00, string);
                }
            }
            PGang[playerid] = 0;
            GangLvl[playerid] = 0;
        }
    } else if (dialogid == 10022) {
        if (response) {
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            GSpawnX[PGang[playerid]] = x;
            GSpawnY[PGang[playerid]] = y;
            GSpawnZ[PGang[playerid]] = z;
            new f[256];
            format(f, 256, "gangs/gang/%i.ini", PGang[playerid]);
            new file = ini_openFile(f);
            if (file == INI_OK) {
                ini_setFloat(file, "SpawnX", x);
                ini_setFloat(file, "SpawnY", y);
                ini_setFloat(file, "SpawnZ", z);
                ini_closeFile(file);
            }
        }
    } else if (dialogid == 10021) {
        if (response) {
            switch (listitem) {
                case 0 : gangskin[playerid] = 1;
                case 1 : gangskin[playerid] = 2;
                case 2 : gangskin[playerid] = 3;
                case 3 : gangskin[playerid] = 4;
                case 4 : gangskin[playerid] = 5;
                case 5 : gangskin[playerid] = 6;
            }
            ShowPlayerDialog(playerid, 10035, DIALOG_STYLE_INPUT, "Назначение скинов банде", "Введите в окошко ID скина, который хотите назначить:", "Принять", "Отмена");
        }
    } else if (dialogid == 10035) {
        if (response) {
            if (!strlen(inputtext) && strval(inputtext) > 0) return ShowPlayerDialog(playerid, 10036, DIALOG_STYLE_INPUT, "Назначение скинов банде", "Введите в окошко ID скина, который хотите назначить:", "Принять", "Отмена");
        }
        //new level;
        //tmp = strtok(cmdtext, idx);
        new level = strval(tmp);
        //	if(level > 299 || level < 1) { SendClientMessage(playerid, 0xFF0000FF, "Неправильный ID скина!"); return 1; }
        {
            new f[256];
            format(f, 256, "gangs/gang/%i.ini", PGang[playerid]);
            new file = ini_openFile(f);
            if (file == INI_OK) {
                format(string, 256, "Skin%i", gangskin[playerid]);
                ini_setInteger(file, string, strval(inputtext));
                ini_closeFile(file);
                format(string, sizeof(string), "Скин успешно установлен! ID скина: %i", strval(inputtext));
                SendClientMessage(playerid, 0xFFFF00FF, string);
                GSkin[PGang[playerid]][gangskin[playerid] - 1] = strval(inputtext);
                for (new i; i < MAX_PLAYERS; i++) {
                    if (PGang[i] == PGang[playerid] && GangLvl[i] == gangskin[playerid]) {
                        SetPlayerSkin(i, strval(inputtext));
                    }
                }
                gangskin[playerid] = 0;
            }
        }
    } else if (dialogid == 10023) {
        if (response) {
            if (!strlen(inputtext)) return ShowPlayerDialog(playerid, 10037, DIALOG_STYLE_INPUT, "Назначение уровня", "Введите id игрока, которому хотите назначит уровень:", "Принять", "Отмена");
            if (PGang[strval(inputtext)] != PGang[playerid]) {
                SendClientMessage(playerid, 0xFFFF00FF, "Игрок не в вашей банде!");
                return ShowPlayerDialog(playerid, 10038, DIALOG_STYLE_INPUT, "Назначение уровня", "Введите id игрока, которому хотите назначит уровень:", "Принять", "Отмена");
            }
            id[playerid] = strval(inputtext);
            ShowPlayerDialog(playerid, 10039, DIALOG_STYLE_LIST, "Назначение уровня", "Нуб\nИгрок\nПро игрок\nЭлита\nЗам лидера\nЛидер", "Принять", "Отмена");
        }
    } else if (dialogid == 10039) {
        if (response) {
            switch (listitem) {
                case 0 : GangLvl[id[playerid]] = 1;
                case 1 : GangLvl[id[playerid]] = 2;
                case 2 : GangLvl[id[playerid]] = 3;
                case 3 : GangLvl[id[playerid]] = 4;
                case 4 : GangLvl[id[playerid]] = 5;
                case 5 : GangLvl[id[playerid]] = 6;
            }
            format(string, sizeof(string), "Вы выдали игроку %s уровень %i", PlayerName(id[playerid]), GangLvl[id[playerid]]);
            SendClientMessage(playerid, 0xFFFF00FF, string);
            format(string, sizeof(string), "Лидер %s выдал Вам уровень %i", PlayerName(playerid), GangLvl[id[playerid]]);
            SendClientMessage(id[playerid], 0xFFFF00FF, string);
            if (GSkin[PGang[playerid]][GangLvl[id[playerid]]] > 0) SetPlayerSkin(id[playerid], GSkin[PGang[playerid]][GangLvl[id[playerid]] - 1]);
            id[playerid] = -1;
        }
    }

    if (dialogid == 0) //так же не моё, из AutoMenu

    {
        if (response) {
            if (listitem == 0) //капот отк
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, lights, alarm, doors, true, boot, objective);
            } else if (listitem == 1) //багажник отк
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, true, objective);
            } else if (listitem == 2) //свет вкл
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, true, alarm, doors, bonnet, boot, objective);
            } else if (listitem == 3) //сигнал вкл
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, lights, true, doors, bonnet, boot, objective);
            } else if (listitem == 4) //двери блок
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, lights, alarm, true, bonnet, boot, objective);
            } else if (listitem == 5) //мотор старт
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, true, lights, alarm, doors, bonnet, boot, objective);
            } else if (listitem == 6) //капот зак
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, lights, alarm, doors, false, boot, objective);
            } else if (listitem == 7) //багажник зак
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, false, objective);
            } else if (listitem == 8) //свет выкл
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, false, alarm, doors, bonnet, boot, objective);
            } else if (listitem == 9) //сигнал выкл
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, lights, false, doors, bonnet, boot, objective);
            } else if (listitem == 10) //двери откр
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, engine, lights, alarm, false, bonnet, boot, objective);
            } else if (listitem == 11) //мотор стоп
            {
                GetVehicleParamsEx(carid, engine, lights, alarm, doors, bonnet, boot, objective);
                SetVehicleParamsEx(carid, false, lights, alarm, doors, bonnet, boot, objective);
            } else if (listitem == 12) {
                ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, ".::Неоновая подсветка::.", ".::{FF3300}Красный::.\n.::{0033CC}Синий::.\n.::{33FF00}Зелёный::.\n.::{FFFF00}Желтый::.\n.::{FEBFEF}Розовый::.\n.::Белый::.\nУдалить Неон", "Выбрать", "Отмена");
            } else if (listitem == 13) //смена номера
            {
                ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, ".::{FFFF00}Смена номера::.", ".::{0033CC}Введите номера авто в окошко::.", ".::Готово::.", ".::Отмена::.");
            } else if (listitem == 13) //смена номера
            {
                new one = CreateObject(18646, 0, 0, 0, 0, 0, 0, 100.0);
                AttachObjectToVehicle(one, GetPlayerVehicleID(playerid), -0.4, -0.1, 0.87, 0.0, 0.0, 0.0);
                return 1;
            }
        }
    }
    if (dialogid == 1) {
        if (response) {
            if (listitem == 0) {
                DestroyObject(neon[playerid][0]);
                DestroyObject(neon[playerid][1]);
                neon[playerid][0] = CreateObject(18647, 0, 0, 0, 0, 0, 0, 100.0);
                neon[playerid][1] = CreateObject(18647, 0, 0, 0, 0, 0, 0, 100.0);
                AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            } else if (listitem == 1) {
                DestroyObject(neon[playerid][0]);
                DestroyObject(neon[playerid][1]);
                neon[playerid][0] = CreateObject(18648, 0, 0, 0, 0, 0, 0, 100.0);
                neon[playerid][1] = CreateObject(18648, 0, 0, 0, 0, 0, 0, 100.0);
                AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            } else if (listitem == 2) {
                DestroyObject(neon[playerid][0]);
                DestroyObject(neon[playerid][1]);
                neon[playerid][0] = CreateObject(18649, 0, 0, 0, 0, 0, 0, 100.0);
                neon[playerid][1] = CreateObject(18649, 0, 0, 0, 0, 0, 0, 100.0);
                AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            } else if (listitem == 3) {
                DestroyObject(neon[playerid][0]);
                DestroyObject(neon[playerid][1]);
                neon[playerid][0] = CreateObject(18650, 0, 0, 0, 0, 0, 0, 100.0);
                neon[playerid][1] = CreateObject(18650, 0, 0, 0, 0, 0, 0, 100.0);
                AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            } else if (listitem == 4) {
                DestroyObject(neon[playerid][0]);
                DestroyObject(neon[playerid][1]);
                neon[playerid][0] = CreateObject(18651, 0, 0, 0, 0, 0, 0, 100.0);
                neon[playerid][1] = CreateObject(18651, 0, 0, 0, 0, 0, 0, 100.0);
                AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            } else if (listitem == 5) {
                DestroyObject(neon[playerid][0]);
                DestroyObject(neon[playerid][1]);
                neon[playerid][0] = CreateObject(18652, 0, 0, 0, 0, 0, 0, 100.0);
                neon[playerid][1] = CreateObject(18652, 0, 0, 0, 0, 0, 0, 100.0);
                AttachObjectToVehicle(neon[playerid][0], GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                AttachObjectToVehicle(neon[playerid][1], GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
            } else if (listitem == 6) {
                DestroyObject(neon[playerid][0]);
                DestroyObject(neon[playerid][1]);
            }
        }
    }
    if (dialogid == 2) {
        if (response) {
            if (!strlen(inputtext)) {
                ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, ".::{FFFF00}Смена номера::.", "Введите номера авто в окошко", "Готово", "Отмена");
                return 1;
            }
            if (strlen(inputtext) > 10) {
                ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, ".::{FFFF00}Смена номера::.", "Cлишком длинный номер!\nВведите номера авто в окошко", "Готово", "Отмена");
                return 1;
            }
            new Float:x, Float:y, Float:z, Float:ang;
            SetVehicleNumberPlate(GetPlayerVehicleID(playerid), inputtext);
            GetVehiclePos(GetPlayerVehicleID(playerid), x, y, z);
            GetVehicleZAngle(GetPlayerVehicleID(playerid), ang);
            SetVehicleToRespawn(GetPlayerVehicleID(playerid));
            SetVehiclePos(GetPlayerVehicleID(playerid), x, y, z);
            PutPlayerInVehicle(playerid, GetPlayerVehicleID(playerid), 0);
            SetVehicleZAngle(GetPlayerVehicleID(playerid), ang);
        }
    }

    if (dialogid == 3) //главное меню
    {
        if (response) {
            if (listitem == 0) {
                if (IsPlayerInAnyVehicle(playerid)) {
                    if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "{99FFFF}Тюнинг меню", "{FF00CC}Диски \n{FFFF66}Гидравлика \n{FF0000}Архангел Тюнинг \n{33FF33}Цвет \n{3399FF}Винилы\nНеон\n{33FF33}Сменить номер ", "Выбрать", "Назад");
                    else SendClientMessage(playerid, COLOR_RED, "Ты не водитель тачки!");
                } else SendClientMessage(playerid, COLOR_RED, "Ты не в тачке.");
            }
            if (listitem == 1) //remont
            {
                SetVehicleZAngle(GetPlayerVehicleID(playerid), 0.0);
            }
            if (listitem == 2) {
                new text[1000];
                strcat(text, "{0099FF}Ухо\n");
                strcat(text, "{FF33CC}Холм SF\n");
                strcat(text, "{99CC33}Аэропорт LS\n");
                strcat(text, "Гора Вайнвуд\n");
                strcat(text, "{FFFF33}Островок\n");
                strcat(text, "{FF00FF}Форт Карсон\n");
                strcat(text, "{FFCCFF}Парковка\n");
                strcat(text, "{00FF00}Склад-Симметрия\n");
                strcat(text, "{CCFF66}Драг 1\n");
                strcat(text, "{CCFF66}Драг 2\n");
                strcat(text, "{3366CC}Военная база\n");
                strcat(text, "{9999FF}Лас Вентурас\n");
                strcat(text, "{0033FF}Лос Сантос\n");
                strcat(text, "{00CC00}Сан Фиеро\n");
                strcat(text, "{66FFFF}Космос\n");
                strcat(text, "{FF9933}Купить Бомбу\n");
                strcat(text, "{FFFF66}Небоскреб LS\n");
                strcat(text, "{FF33FF}Дрифт 9\n");
                strcat(text, "Дрифт 10\n");
                strcat(text, "Зона домов\n");
                strcat(text, "Дрифт 11\n");
                strcat(text, "{0099FF}Драг 3\n");
                strcat(text, "{FF33CC}Дрифт 12\n");
                strcat(text, "{0099FF}Драг 4\n");
                strcat(text, "{FF33CC}Драг 5\n");
                strcat(text, "{99CC33}Пещера=)\n");
                strcat(text, "{FFFF33}Vip Островок\n");
                strcat(text, "Пляж ЛС\n");
                strcat(text, "{FFFF66}Wang Cars\n");
                strcat(text, "Гора {FF0000}Chiliad\n");
                strcat(text, "{FFFF66}Four DragonS\n");
                strcat(text, "{FF0000}Дрифт 13\n");
                strcat(text, "{3366CC}Дрифт 14\n");
                strcat(text, "Клуб {FF0000}ДжиZZи=)\n");
                strcat(text, "Квартиры в LoS SanToS\n");
                strcat(text, "Спуск\n");
                strcat(text, "{FFFF66}Клуб в ЛС\n");
                strcat(text, "{66FFFF}Монстер трасса\n");
                strcat(text, "{55CCFF}VIP остров 2\n");
                strcat(text, "Спринт 1\n");
                strcat(text, "{00CC00}Дрифт 15\n");
                strcat(text, "{FFFF66}Дрифт Джиззи\n");
                strcat(text, "Спринт 2");
                ShowPlayerDialog(playerid, 5, DIALOG_STYLE_LIST, "{66FFFF}Телепорты", text, "Выбрать", "Назад");
            }
            if (listitem == 3) //авто
            {
                if (IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0x21DD00FF, "Вы уже в транспорте");
                ShowPlayerDialog(playerid, 9, DIALOG_STYLE_LIST, "Спавн машин", "Елегия\nСултан\nИнфернус\nБанши\nБуфалло\nХантли\nЧеетан\nТуризмо\nСламван\nБладе\nБуллет\nДжестер\nХотринг\nБадито\nВинстдор\nСтрееч\nСабра\nПолиция\nКартинг\nСуперGT\nНРГ-500\nСанчез\nЛясик\nЛясик2\nВирго\nКлевер\nФеникс\nВосьмерка\nНива\nСпортЛодка\nДжип\nДжип2\nСтратум\nВерталет 4-х местный\nМини-фургон\nМини-фургон2\nМаздаRX8\nКвадрацикл\nХамер\nРадиоВерт\nРадиоСамолет\nУранус\nКлуб\nМонстер\nМерит", "ОК", "Назад");
                return 1;
            }
            if (listitem == 4) ShowPlayerDialog(playerid, 8, DIALOG_STYLE_LIST, "{FFFF00}Управление Персонажем", "{FFCC00}Пополнить броню\n{FFCCFF}Пополнить жизни\n{00FF00}Сменить скин\n{00FF00}Самоубийство\n{FFFF33}Анимации\n{00FF00}Смена цвета ника\n{00FF00}Сменить погоду\n{99CC33}Сменить время суток\n{00FF00}Стили боя", "OK", "Назад");
            if (listitem == 5) return OnPlayerCommandText(playerid, "/count");
            if (listitem == 6) {
                if (!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xFFFFFFFF, "Вы должны быть в машине!");
                ShowPlayerDialog(playerid, 0, DIALOG_STYLE_LIST, "Авто-Меню", "Открыть капот\nОткрыть багажник\nВключить свет\nВключить сигнализацию\nЗакрыть двери\nЗапустить мотор\
				\nЗакрыть капот\nЗакрыть багажник\nВыключить свет\nВыключить сигнализацию\nОткрыть двери\nЗаглушить мотор", "Выбрать", "Отмена");
            }
            if (listitem == 7) ShowPlayerDialog(playerid, 55, DIALOG_STYLE_LIST, "{66FFFF}О сервере", "{0099FF}Правила сервера\n{3366FF}Команды сервера\n{FF33CC}О Админке\n{99CC33}О Моде\nАкции!!!!\n{99CC33}Админы\nУслуги", "Выбрать", "Назад");
            if (listitem == 8) return OnPlayerCommandText(playerid, "/gang");
            if (listitem == 9) ShowPlayerDialog(playerid, 61, DIALOG_STYLE_LIST, "{66FFFF}Трассы", "{0099FF}Супер трасса!\n{FF33CC}Дрифт трасса №1", "Выбрать", "Назад");
            if (listitem == 10) ShowPlayerDialog(playerid, 18, DIALOG_STYLE_LIST, "{00FF00}Радио", "{0099FF}Pop\n{FF33CC}Disco\n{0099FF}Club\n{00FF00}Alternative\n{FFCC00}RnB\nОстановить музыку", "Выбрать", "Назад");
            if (listitem == 11) ShowPlayerDialog(playerid, 19, DIALOG_STYLE_LIST, "{99CC33}Репорт", "Для того что бы отправить жалобу на игрока если он нарушитель введите:\n /report id жалоба\nГде:\nid - id нарушителя\nжалоба - текст самой жалобы", "Выбрать", "Назад");
        }
    }

    if (dialogid == 8) //upravl persom
    {
        if (response) {
            if (listitem == 0) {
                SetPlayerArmour(playerid, 100);
                ShowPlayerDialog(playerid, 8, DIALOG_STYLE_LIST, "{FFFF00}Управление Персонажем", "{FFCC00}Пополнить броню\n{FFCCFF}Пополнить жизни\n{00FF00}Сменить скин\n{00FF00}Самоубийство\n{FFFF33}Анимации", "OK", "Назад");
                PlayerPlaySound(playerid, 1149, 0.0, 0.0, 0.0);
            }
            if (listitem == 3) {
                SetPlayerHealth(playerid, 0);
                PlayerPlaySound(playerid, 1149, 0.0, 0.0, 0.0);
            }
            if (listitem == 1) {
                SetPlayerHealth(playerid, 100);
                ShowPlayerDialog(playerid, 8, DIALOG_STYLE_LIST, "{FFFF00}Управление Персонажем", "{FFCC00}Пополнить броню\n{FFCCFF}Пополнить жизни\n{00FF00}Сменить скин\n{00FF00}Самоубийство\n{FFFF33}Анимации", "OK", "Назад");
                PlayerPlaySound(playerid, 1149, 0.0, 0.0, 0.0);
            }
            if (listitem == 2) ShowPlayerDialog(playerid, 10, DIALOG_STYLE_INPUT, "Смена скина", "Введите ID", "OK", "назад");
            if (listitem == 4) ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "{33FFFF}Меню Анимации", "{99FF33}Напитки и Cигареты\n{99FF33}Танцевать\n{99FF33}Звонить\n{99FF33}Остановить анимацию", "OK", "Назад");
            if (listitem == 5) ShowPlayerDialog(playerid, 70, DIALOG_STYLE_LIST, "{FFFF00}Cмена цвета ника", "{FF0000}Красный\n{0000FF}Синий\n{00FF00}Зелёный\n{F0E68C}Песочный\n{C0C0C0}Серый\n{00FFFF}Голубой\n{FFFF00}Жёлтый\n{00FA9A}Салатовый\n{FF00FF}Розовый", "OK", "Назад");
            if (listitem == 6) ShowPlayerDialog(playerid, 71, DIALOG_STYLE_LIST, "{FFFF00}Смена погоды", "{FFFF00}Гроза\n{FFFF00}Туман\n{FFFF00}Ясное небо\n{FFFF00}Жара\n{FFFF00}Пасмурная\n{FFFF00}Дождливая\n{FFFF00}Ясное - небо, Жара\n{FFFF00}Песчаная буря\n{FFFF00}Туман с легка зелёный", "Сменить", "Назад");
            if (listitem == 7) ShowPlayerDialog(playerid, 101, DIALOG_STYLE_LIST, "{FFFF00}Смена время суток", "1:00\n2:00\n3:00\n4:00\n5:00\n6:00\n7:00\n8:00\n9:00\n10:00\n11:00\n12:00\n13:00\n14:00\n15:00\n16:00\n17:00\n18:00\n19:00\n20:00\n21:00\n22:00\n23:00\n24:00", "Сменить", "Назад");
            if (listitem == 8) ShowPlayerDialog(playerid, 152, DIALOG_STYLE_LIST, "{FFFF00}Смена стиля боя", "{FFFF00}Бокс\n{FFFF00}Каратэ\n{FFFF00}Уличный бой\n{FFFF00}ГабРик\n{FFFF00}Смешанная борьба", "Сменить", "Назад");
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");

    }
    if (dialogid == 152) //Смена стиля боя
    {
        if (response) {
            if (listitem == 0) {
                SetPlayerFightingStyle(playerid, FIGHT_STYLE_BOXING);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы выбрали стиль Бокс.");
                SendClientMessage(playerid, 0xFFFFFFAA, "Для использования нажимайте правую кнопку мыши и F.");
            }
            if (listitem == 1) {
                SetPlayerFightingStyle(playerid, FIGHT_STYLE_KUNGFU);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы выбрали стиль Каратэ.");
                SendClientMessage(playerid, 0xFFFFFFAA, "Для использования нажимайте правую кнопку мыши и F");
            }
            if (listitem == 2) {
                SetPlayerFightingStyle(playerid, FIGHT_STYLE_KNEEHEAD);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы выбрали стиль Уличный Бой.");
                SendClientMessage(playerid, 0xFFFFFFAA, "Для использования нажимайте правую кнопку мыши и F.");
            }
            if (listitem == 3) {
                SetPlayerFightingStyle(playerid, FIGHT_STYLE_GRABKICK);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы выбрали стиль ГрабКик.");
                SendClientMessage(playerid, 0xFFFFFFAA, "Для использования нажимайте правую кнопку мыши и F.");
            }
            if (listitem == 4) {
                SetPlayerFightingStyle(playerid, FIGHT_STYLE_ELBOW);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы выбрали стиль Смешанная Борьба.");
                SendClientMessage(playerid, 0xFFFFFFAA, "Для использования нажимайте правую кнопку мыши и F.");
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");

    }
    if (dialogid == 101) //Смена времени суток
    {
        if (response) {
            if (listitem == 0) {
                SetPlayerTime(playerid, 1, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 1:00");
            }
            if (listitem == 1) {
                SetPlayerTime(playerid, 2, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 2:00");
            }
            if (listitem == 2) {
                SetPlayerTime(playerid, 3, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 3:00");
            }
            if (listitem == 3) {
                SetPlayerTime(playerid, 1, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 4:00");
            }
            if (listitem == 4) {
                SetPlayerTime(playerid, 5, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 5:00");
            }
            if (listitem == 5) {
                SetPlayerTime(playerid, 6, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 6:00");
            }
            if (listitem == 6) {
                SetPlayerTime(playerid, 7, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 7:00");
            }
            if (listitem == 7) {
                SetPlayerTime(playerid, 8, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 8:00");
            }
            if (listitem == 8) {
                SetPlayerTime(playerid, 9, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 9:00");
            }
            if (listitem == 9) {
                SetPlayerTime(playerid, 10, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 10:00");
            }
            if (listitem == 10) {
                SetPlayerTime(playerid, 11, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 11:00");
            }
            if (listitem == 11) {
                SetPlayerTime(playerid, 12, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 12:00");
            }
            if (listitem == 12) {
                SetPlayerTime(playerid, 13, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 13:00");
            }
            if (listitem == 13) {
                SetPlayerTime(playerid, 14, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 14:00");
            }
            if (listitem == 14) {
                SetPlayerTime(playerid, 15, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 15:00");
            }
            if (listitem == 15) {
                SetPlayerTime(playerid, 16, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 16:00");
            }
            if (listitem == 16) {
                SetPlayerTime(playerid, 17, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 17:00");
            }
            if (listitem == 17) {
                SetPlayerTime(playerid, 18, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 18:00");
            }
            if (listitem == 18) {
                SetPlayerTime(playerid, 19, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 19:00");
            }
            if (listitem == 19) {
                SetPlayerTime(playerid, 20, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 20:00");
            }
            if (listitem == 20) {
                SetPlayerTime(playerid, 21, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 21:00");
            }
            if (listitem == 21) {
                SetPlayerTime(playerid, 22, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 22:00");
            }
            if (listitem == 22) {
                SetPlayerTime(playerid, 23, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 23:00");
            }
            if (listitem == 23) {
                SetPlayerTime(playerid, 24, 0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Время установлено на 24:00");
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");

    }
    if (dialogid == 71) //Смена погоды
    {
        if (response) {
            if (listitem == 0) {
                SetPlayerWeather(playerid, 08);
            }
            if (listitem == 1) {
                SetPlayerWeather(playerid, 09);
            }
            if (listitem == 2) {
                SetPlayerWeather(playerid, 10);
            }
            if (listitem == 3) {
                SetPlayerWeather(playerid, 11);
            }
            if (listitem == 4) {
                SetPlayerWeather(playerid, 12);
            }
            if (listitem == 5) {
                SetPlayerWeather(playerid, 16);
            }
            if (listitem == 6) {
                SetPlayerWeather(playerid, 17);
            }
            if (listitem == 7) {
                SetPlayerWeather(playerid, 19);
            }
            if (listitem == 8) {
                SetPlayerWeather(playerid, 20);
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");

    }
    if (dialogid == 70) //Смена цвета ника в диалогах
    {
        if (response) {
            if (listitem == 0) {
                SetPlayerColor(playerid, 0xFF0000AA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы устанoвили себе красный цвет ника!");
            }
            if (listitem == 1) {
                SetPlayerColor(playerid, 0x0000FFAA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы установили себе синий цвет ника!!");
            }
            if (listitem == 2) {
                SetPlayerColor(playerid, 0x00FF00AA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы установили себе зелёный цвет ника!!");
            }
            if (listitem == 3) {
                SetPlayerColor(playerid, 0xF0E68CAA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы установили себе песочный цвет ника!!");
            }
            if (listitem == 4) {
                SetPlayerColor(playerid, 0xC0C0C0AA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы установили себе серый цвет ника!!");
            }
            if (listitem == 5) {
                SetPlayerColor(playerid, 0x00FFFFAA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы установили себе голубой цвет ника!!");
            }
            if (listitem == 6) {
                SetPlayerColor(playerid, 0xFFFF00AA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы установили себе жёлтый цвет ника!!");
            }
            if (listitem == 7) {
                SetPlayerColor(playerid, 0x00FA9AAA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы установили себе салатовый цвет ника!!");
            }
            if (listitem == 8) {
                SetPlayerColor(playerid, 0xFF00FFAA);
                SendClientMessage(playerid, 0xFFFFFFAA, "Вы установили себе розовый цвет ника!!");
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");
    }
    if (dialogid == 4) //tuning menu главная
    {
        if (response) {
            if (listitem == 0) {
                ShowPlayerDialog(playerid, 11, DIALOG_STYLE_LIST, ".::{FF0000}Список дисков::.", "Shadow\nMega\nWires\nClassic\nRimshine\nCutter\nTwist\nSwitch\nGrove\nImport\nDollar\nTrance\nAtomic", "OK", "Назад");
            }
            if (listitem == 1) {
                new vehicleid = GetPlayerVehicleID(playerid);
                AddVehicleComponent(vehicleid, 1087);
                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "{99FFFF}Тюнинг меню", "{FF00CC}Диски \n{FFFF66}Гидравлика \n{FF0000}Архангел Тюнинг \n{33FF33}Цвет \n{3399FF}Винилы ", "Выбрать", "Назад");
            }
            if (listitem == 2) {
                new Car = GetPlayerVehicleID(playerid), Model = GetVehicleModel(Car);
                switch (Model) {
                    case 558, 559, 560, 561, 562, 565 : ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
                    default: SendClientMessage(playerid, 0xFFFFFFFF, "Вы должны быть в: Елегия, Стратум, Флеш, Султан, Уранус, Джастер");
                }
            }
            if (listitem == 3) ShowPlayerDialog(playerid, 13, DIALOG_STYLE_LIST, "Выбор цвета", "Красный \nГолубой \nЖелтый \nЗеленый \nСерый \nОранжевый \nЧерный \nБелый", "ОК", "Назад");
            if (listitem == 4) ShowPlayerDialog(playerid, 14, DIALOG_STYLE_LIST, "Выбор винила", "Винил №1 \nВинил №2 \nВинил №3 ", "ОК", "Назад");
            if (listitem == 5) ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Неоновая подсветка", "{FF3300}Красный\n{0033CC}Синий\n{33FF00}Зелёный\n{FFFF00}Желтый\n{FEBFEF}Розовый\nБелый\nУдалить Неон", "Выбрать", "Отмена");
            if (listitem == 6) ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "{FFFF00}Смена номера", "{0033CC}Введите номера авто в окошко", "Готово", "Отмена");
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");
    }


    if (dialogid == 11) //spisok diskov
    {
        if (response) {
            new vehicleid = GetPlayerVehicleID(playerid);

            if (listitem == 0) AddVehicleComponent(vehicleid, 1073);
            if (listitem == 1) AddVehicleComponent(vehicleid, 1074);
            if (listitem == 2) AddVehicleComponent(vehicleid, 1076);
            if (listitem == 3) AddVehicleComponent(vehicleid, 1077);
            if (listitem == 4) AddVehicleComponent(vehicleid, 1075);
            if (listitem == 5) AddVehicleComponent(vehicleid, 1079);
            if (listitem == 6) AddVehicleComponent(vehicleid, 1078);
            if (listitem == 7) AddVehicleComponent(vehicleid, 1080);
            if (listitem == 8) AddVehicleComponent(vehicleid, 1081);
            if (listitem == 9) AddVehicleComponent(vehicleid, 1082);
            if (listitem == 10) AddVehicleComponent(vehicleid, 1083);
            if (listitem == 11) AddVehicleComponent(vehicleid, 1084);
            if (listitem == 12) AddVehicleComponent(vehicleid, 1085);

            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
            ShowPlayerDialog(playerid, 11, DIALOG_STYLE_LIST, "Список дисков", "Shadow\nMega\nWires\nClassic\nRimshine\nCutter\nTwist\nSwitch\nGrove\nImport\nDollar\nTrance\nAtomic", "OK", "Назад");
        } else ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "{99FFFF}Тюнинг меню", "{FF00CC}Диски \n{FFFF66}Гидравлика \n{FF0000}Архангел Тюнинг \n{33FF33}Цвет \n{3399FF}Винилы ", "Выбрать", "Назад");
    }

    if (dialogid == 13) //colors             cveta
    {
        if (response) {
            new vehicleid = GetPlayerVehicleID(playerid);

            if (listitem == 0) ChangeVehicleColor(vehicleid, 3, 3);
            if (listitem == 1) ChangeVehicleColor(vehicleid, 79, 79);
            if (listitem == 2) ChangeVehicleColor(vehicleid, 65, 65);
            if (listitem == 3) ChangeVehicleColor(vehicleid, 86, 86);
            if (listitem == 4) ChangeVehicleColor(vehicleid, 9, 9);
            if (listitem == 5) ChangeVehicleColor(vehicleid, 6, 6);
            if (listitem == 6) ChangeVehicleColor(vehicleid, 0, 0);
            if (listitem == 7) ChangeVehicleColor(vehicleid, 1, 1);

            PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
            ShowPlayerDialog(playerid, 13, DIALOG_STYLE_LIST, "{66FFFF}Выбор цвета", "{FF0000}Красный \n{00CCFF}Голубой \n{FFFF33}Желтый \n{00FF00}Зеленый \n{CCCCCC}Серый \n{FF9933}Оранжевый \nЧерный \n{FFFFFF}Белый", "ОК", "Назад");
        } else ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "{99FFFF}Тюнинг меню", "{FF00CC}Диски \n{FFFF66}Гидравлика \n{FF0000}Архангел Тюнинг \n{33FF33}Цвет \n{3399FF}Винилы ", "Выбрать", "Назад");
    }

    if (dialogid == 9) //car spawning into
    {
        if (response) //машинное меню
        {
            new carvlad[20], Float:X, Float:Y, Float:Z, Float:Angle, id, string[256];
            GetPlayerPos(playerid, X, Y, Z);
            GetPlayerFacingAngle(playerid, Angle);
            switch (listitem) {
                case 0 : carvlad = "Elegy", id = 562;
                case 1 : carvlad = "Sultan", id = 560;
                case 2 : carvlad = "Infernus", id = 411;
                case 3 : carvlad = "Banshee", id = 429;
                case 4 : carvlad = "Buffalo", id = 402;
                case 5 : carvlad = "Huntley", id = 579;
                case 6 : carvlad = "Cheetan", id = 415;
                case 7 : carvlad = "Turismo", id = 451;
                case 8 : carvlad = "Slamvan", id = 535;
                case 9 : carvlad = "Blade", id = 536;
                case 10 : carvlad = "Bullet", id = 541;
                case 11 : carvlad = "Jester", id = 559;
                case 12 : carvlad = "Hostring", id = 502;
                case 13 : carvlad = "Bandito", id = 568;
                case 14 : carvlad = "Vinsdor", id = 555;
                case 15 : carvlad = "Strech", id = 409;
                case 16 : carvlad = "Sabra", id = 475;
                case 17 : carvlad = "CapCar", id = 596;
                case 18 : carvlad = "Kart", id = 571;
                case 19 : carvlad = "SuperGT", id = 506;
                case 20 : carvlad = "NRG-500", id = 522;
                case 21 : carvlad = "Sanchez", id = 468;
                case 22 : carvlad = "Велосипед", id = 481;
                case 23 : carvlad = "Велосипед 2", id = 510;
                case 24 : carvlad = "Virgo", id = 491;
                case 25 : carvlad = "Clover", id = 542;
                case 26 : carvlad = "Frenix", id = 603;
                case 27 : carvlad = "Восьмерка", id = 496;
                case 28 : carvlad = "Нива", id = 495;
                case 29 : carvlad = "СпртЛодка", id = 493;
                case 30 : carvlad = "Джип", id = 490;
                case 31 : carvlad = "Джип2", id = 489;
                case 32 : carvlad = "Стратум", id = 561;
                case 33 : carvlad = "Верталет2", id = 487;
                case 34 : carvlad = "Мини-фургон", id = 483;
                case 35 : carvlad = "Мини-фургон2", id = 482;
                case 36 : carvlad = "МаздаRX8", id = 477;
                case 37 : carvlad = "Квадрацикл", id = 471;
                case 38 : carvlad = "Хамер", id = 470;
                case 39 : carvlad = "РадиоВерт", id = 465;
                case 40 : carvlad = "РадиоСамолет", id = 464;
                case 41 : carvlad = "Уранус", id = 558;
                case 42 : carvlad = "Клуб", id = 589;
                case 43 : carvlad = "Монстер", id = 444;
                case 44 : carvlad = "Мерит", id = 551;
            }
            format(string, sizeof(string), "{DEB887}%s {ADFF2F}взят за {1E90FF}10000$", carvlad);
            SendClientMessage(playerid, 0x21DD00FF, string);
            if (ta4katest[playerid] == 1) DestroyVehicle(ta4ka[playerid]);
            ta4ka[playerid] = CreateVehicle(id, X, Y, Z, Angle, -1, -1, 50000);
            if (GetPlayerInterior(playerid)) LinkVehicleToInterior(ta4ka[playerid], GetPlayerInterior(playerid));
            SetVehicleVirtualWorld(ta4ka[playerid], GetPlayerVirtualWorld(playerid));
            PutPlayerInVehicle(playerid, ta4ka[playerid], 0);
            ta4katest[playerid] = 1;
            GiveMoney(playerid, -10000);
            PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
        }
        return 1;
    }

    if (dialogid == 6) //Меню анимации взято из скрипта Panther'a
    {
        if (response) {
            if (listitem == 0) ShowPlayerDialog(playerid, 15, DIALOG_STYLE_LIST, "Напитки и Cигареты", "Пиво\nСигареты\nВодка\nСпрайт\nЛечь", "OK", "Назад");
            if (listitem == 1) ShowPlayerDialog(playerid, 16, DIALOG_STYLE_LIST, "Танцевать", "Танец - 1\nТанец - 2\nТанец - 3\nТанец - 4\nРуки Вверх", "OK", "Назад");
            if (listitem == 2) ShowPlayerDialog(playerid, 17, DIALOG_STYLE_LIST, "Звонить", "Звонить\nБухой с трубой =D", "OK", "Назад");
            if (listitem == 3) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                SetPlayerDrunkLevel(playerid, 0);
                SetPlayerSpecialAction(playerid, 13 - SPECIAL_ACTION_STOPUSECELLPHONE);
                SendClientMessage(playerid, 0xFFFFFFAA, "Ты остановил анимацию можеш двигаться!");
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        } else ShowPlayerDialog(playerid, 8, DIALOG_STYLE_LIST, "{FFFF00}Управление Персонажем", "{FFCC00}Пополнить броню\n{FFCCFF}Пополнить жизни\n{00FF00}Сменить скин\n{00FF00}Самоубийство\n{FFFF33}Анимации", "OK", "Назад");
    }

    if (dialogid == 15) //anim buhlo
    {
        if (response) {
            if (listitem == 0) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_BEER);
                SendClientMessage(playerid, 0xFFFFFFAA, "Ты чё за рулём? Выпей лучьше водки!");
            }
            if (listitem == 1) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
                SendClientMessage(playerid, 0xFFFFFFAA, "Курни..!");
            }
            if (listitem == 2) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_WINE);
                SendClientMessage(playerid, 0xFFFFFFAA, "Оооо, это тема ёпт)");
            }
            if (listitem == 3) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DRINK_SPRUNK);
                SendClientMessage(playerid, 0xFFFFFFAA, "Выпей спрайту");
            }
            if (listitem == 4) {
                ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.1, 0, 1, 1, 1, 1);
                SendClientMessage(playerid, 0xFFFFFFAA, "Напился бичуга, теперь поспи, эээээххх...");
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        } else ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "{33FFFF}Меню Анимации", "{99FF33}Напитки и Cигареты\n{99FF33}Танцевать\n{99FF33}Звонить\n{99FF33}Остановить анимацию", "OK", "Назад");
    }

    if (dialogid == 55) {
        if (response) {
            if (listitem == 0) {
                return OnPlayerCommandText(playerid, "/rules");
            }
            if (listitem == 1) {
                ShowPlayerDialog(playerid, 7, DIALOG_STYLE_MSGBOX, "Команды сервера", "Используйте команды:\n/админка -узнать о стоимости админки\n/команды\n/создатель\n/pm-отправить смс в личку\n/pay - передать денежные средства другому игроку\n/rules -правила сервера!", "OK", "");
            }
            if (listitem == 2) {
                return OnPlayerCommandText(playerid, "/админка");
            }
            if (listitem == 3) {
                return OnPlayerCommandText(playerid, "/создатель");
            }
            if (listitem == 4) {
                ShowPlayerDialog(playerid, 1020, DIALOG_STYLE_MSGBOX, "{FFFF66}Акции:", "{FF0000}На данный момент акций несущевствует!\nNation Drift Server", "Ок", "");
            }
            if (listitem == 5) {
                ShowPlayerDialog(playerid, 1021, DIALOG_STYLE_MSGBOX, "{FFFF66}Админы:", "{FF0000}Главный админ:\nLOD\n\n{FFFF00}Обычные админы:\nDima_Marfin\nalex\nSharik[11RUS]\nGreen_Xyligan\nHacker_stoft\nGrizzly\n", "Ок", "");
            }
            if (listitem == 6) {
                ShowPlayerDialog(playerid, 1024, DIALOG_STYLE_MSGBOX, "{FFFF66}Услуги от {Nation World Studio}:", "{FF0000}Маппинг (малый) = 200 рублей!\nМаппинг (большой) = 400 рублей\n\nСкриптинг:\n\nСкриптёр на сервер: = 400 рублей\nКупить наш мод: = 1500 рублей (с pwn)\nNation Drift Server", "Ок", "");
            }
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");
    }
    if (dialogid == 16) //anim dance
    {
        if (response) {
            if (listitem == 0) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
                SendClientMessage(playerid, 0xFFFFFFAA, "Стиль - 1 ;D");
            }
            if (listitem == 1) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
                SendClientMessage(playerid, 0xFFFFFFAA, "Стиль - 2 ;D");
            }
            if (listitem == 2) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
                SendClientMessage(playerid, 0xFFFFFFAA, "Стиль - 3 ;D");
            }
            if (listitem == 3) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
                SendClientMessage(playerid, 0xFFFFFFAA, "Танец шлюхи - 4 ;D");
            }
            if (listitem == 4) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP);
                SendClientMessage(playerid, 0xFFFFFFAA, "Я здаюсь уёбки!");
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        } else ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "{33FFFF}Меню Анимации", "{99FF33}Напитки и Cигареты\n{99FF33}Танцевать\n{99FF33}Звонить\n{99FF33}Остановить анимацию", "OK", "Назад");
    }


    if (dialogid == 61) //Трассы
    {
        if (response) {
            if (listitem == 0) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 2406.04, 4172.15, 55.56);
                else SetPlayerPos(playerid, 2406.04, 4172.15, 55.56);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Супер трассу!");
                return 1;
            }
            if (listitem == 1) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1553.1899, 1144.7505, 6.6773);
                else SetPlayerPos(playerid, -1553.1899, 1144.7505, 6.6773);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Дрифт трассу №1!");
                return 1;
            }
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");
    }
    if (dialogid == 17) //Звонки
    {
        if (response) {
            if (listitem == 0) {
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
                SendClientMessage(playerid, 0xFFFFFFAA, "Алё?");
                GiveMoney(playerid, -50);
            }
            if (listitem == 1) {
                SetPlayerDrunkLevel(playerid, 2323000);
                SendClientMessage(playerid, 0xFFFFFFAA, "OMG Ты напился в стельку!(чтобы снять эффект выберите (Остановить анимацию)");
            }
            PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
        } else ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "{33FFFF}Меню Анимации", "{99FF33}Напитки и Cигареты\n{99FF33}Танцевать\n{99FF33}Звонить\n{99FF33}Остановить анимацию", "OK", "Назад");
    }
    if (dialogid == 18) //Радио
    {
        if (response) {
            if (listitem == 0) {
                StopAudioStreamForPlayer(playerid);
                PlayAudioStreamForPlayer(playerid, "http://radio.zaycev.fm:9002/ZaycevFM(128).m3u");
                return 1;
            }
            if (listitem == 1) {
                StopAudioStreamForPlayer(playerid);
                PlayAudioStreamForPlayer(playerid, "http://radio.zaycev.fm:9002/disco/ZaycevFM(128).m3u");
                return 1;
            }
            if (listitem == 2) {
                StopAudioStreamForPlayer(playerid);
                PlayAudioStreamForPlayer(playerid, "http://radio.zaycev.fm:9002/electronic/ZaycevFM(128).m3u");
                return 1;
            }
            if (listitem == 3) {
                StopAudioStreamForPlayer(playerid);
                PlayAudioStreamForPlayer(playerid, "http://radio.zaycev.fm:9002/alternative/ZaycevFM(128).m3u");
                return 1;
            }
            if (listitem == 4) {
                StopAudioStreamForPlayer(playerid);
                PlayAudioStreamForPlayer(playerid, "http://radio.zaycev.fm:9002/rnb/ZaycevFM(128).m3u");
                return 1;
            }
            if (listitem == 5) {
                StopAudioStreamForPlayer(playerid);
                return 1;
            }
        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");
    }
    if (dialogid == 14) //vinils
    {
        if (response) {
            new vehicleid = GetPlayerVehicleID(playerid);
            ChangeVehiclePaintjob(vehicleid, listitem + 1);
            PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
            ShowPlayerDialog(playerid, 14, DIALOG_STYLE_LIST, "Выбор винила", "Винил №1 \nВинил №2 \nВинил №3 ", "ОК", "Назад");
        } else ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "{99FFFF}Тюнинг меню", "{FF00CC}Диски \n{FFFF66}Гидравлика \n{FF0000}Архангел Тюнинг \n{33FF33}Цвет \n{3399FF}Винилы ", "Выбрать", "Назад");
    }

    if (dialogid == 12) //WAA tune
    {
        if (response) {
            if (listitem == 0) // x front
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1172);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1170);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1152);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1173);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1157);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1165);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }

            if (listitem == 1) //alien front
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1171);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1169);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1153);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1160);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1155);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1166);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }

            if (listitem == 2) //x rear
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1148);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1140);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1151);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1161);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1156);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1167);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }

            if (listitem == 3) //alien rear
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1149);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1141);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1150);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1159);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1154);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1168);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }

            if (listitem == 4) //x spoiler
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1146);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1139);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1050);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1158);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1160);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1163);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }
            if (listitem == 5) //alien spoiler
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1147);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1138);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1049);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1162);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1058);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1164);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }
            if (listitem == 6) //x side
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) {
                    AddVehicleComponent(vehicleid, 1041);
                    AddVehicleComponent(vehicleid, 1039);
                }
                if (cartype == 560) {
                    AddVehicleComponent(vehicleid, 1031);
                    AddVehicleComponent(vehicleid, 1030);
                }
                if (cartype == 565) {
                    AddVehicleComponent(vehicleid, 1052);
                    AddVehicleComponent(vehicleid, 1048);
                }
                if (cartype == 559) {
                    AddVehicleComponent(vehicleid, 1070);
                    AddVehicleComponent(vehicleid, 1072);
                }
                if (cartype == 561) {
                    AddVehicleComponent(vehicleid, 1057);
                    AddVehicleComponent(vehicleid, 1063);
                }
                if (cartype == 558) {
                    AddVehicleComponent(vehicleid, 1093);
                    AddVehicleComponent(vehicleid, 1095);
                }

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }

            if (listitem == 7) //alien side
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) {
                    AddVehicleComponent(vehicleid, 1036);
                    AddVehicleComponent(vehicleid, 1040);
                }
                if (cartype == 560) {
                    AddVehicleComponent(vehicleid, 1026);
                    AddVehicleComponent(vehicleid, 1027);
                }
                if (cartype == 565) {
                    AddVehicleComponent(vehicleid, 1051);
                    AddVehicleComponent(vehicleid, 1047);
                }
                if (cartype == 559) {
                    AddVehicleComponent(vehicleid, 1069);
                    AddVehicleComponent(vehicleid, 1071);
                }
                if (cartype == 561) {
                    AddVehicleComponent(vehicleid, 1056);
                    AddVehicleComponent(vehicleid, 1062);
                }
                if (cartype == 558) {
                    AddVehicleComponent(vehicleid, 1090);
                    AddVehicleComponent(vehicleid, 1094);
                }

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }

            if (listitem == 8) //x roof
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1035);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1033);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1052);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1068);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1061);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1091);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }

            if (listitem == 9) //alien roof
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1038);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1032);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1054);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1067);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1055);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1088);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }
            if (listitem == 10) //x echaust
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1037);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1029);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1045);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1066);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1059);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1089);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }
            if (listitem == 11) //alien echaust
            {
                new vehicleid = GetPlayerVehicleID(playerid);
                new cartype = GetVehicleModel(vehicleid);

                if (cartype == 562) AddVehicleComponent(vehicleid, 1034);
                if (cartype == 560) AddVehicleComponent(vehicleid, 1028);
                if (cartype == 565) AddVehicleComponent(vehicleid, 1046);
                if (cartype == 559) AddVehicleComponent(vehicleid, 1065);
                if (cartype == 561) AddVehicleComponent(vehicleid, 1064);
                if (cartype == 558) AddVehicleComponent(vehicleid, 1092);

                PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
                ShowPlayerDialog(playerid, 12, DIALOG_STYLE_LIST, "Тюнинг Wheel Arch Angels", "Передний бампер X-flow\nПередний бампер Alien\nЗадний бампер X-Flow\nЗадний бампер Alien\nСпойлер X-Flow \nСпойлер Alien \nБоковая юбка X-Flow \nБоковая юбка Alien\nВоздухозаборник X-Flow\nВоздухозаборник Alien\nВыхлоп X-flow\nВыхлоп Alien", "OK", "Назад");
            }
        } else ShowPlayerDialog(playerid, 4, DIALOG_STYLE_LIST, "{99FFFF}Тюнинг меню", "{FF00CC}Диски \n{FFFF66}Гидравлика \n{FF0000}Архангел Тюнинг \n{33FF33}Цвет \n{3399FF}Винилы ", "Выбрать", "Назад");
        return 1;
    }


    if (dialogid == 10) //skins
    {
        if (response) {
            if (strval(inputtext) >= 0 && strval(inputtext) <= 300) {
                SetPlayerSkin(playerid, strval(inputtext));
                PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
            }
        } else ShowPlayerDialog(playerid, 10, DIALOG_STYLE_INPUT, "Смена скина", "Введите ID", "OK", "назад");
    }

    if (dialogid == 5) {
        if (response) {
            if (listitem == 0) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -313.5638, 1525.7954, 75.3594);
                else SetPlayerPos(playerid, -313.5638, 1525.7954, 75.3594);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Ухо");
                return 1;
            }

            if (listitem == 1) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -2207.1196, -991.9159, 36.8409);
                else SetPlayerPos(playerid, -2207.1196, -991.9159, 36.8409);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Холм SF");
                return 1;
            }

            if (listitem == 2) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1583.4438476563, -2376.037109375, 15.782542228699);
                else SetPlayerPos(playerid, 1583.4438476563, -2376.037109375, 15.782542228699);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать в Аэропорт Лос Сантоса");
                return 1;
            }

            if (listitem == 3) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1241.1146, -745.0139, 95.0895);
                else SetPlayerPos(playerid, 1241.1146, -745.0139, 95.0895);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Гору Вайнвуд");
                return 1;
            }

            if (listitem == 4) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -884.28814697266, 550.00549316406, 5.3881149291992);
                else SetPlayerPos(playerid, -884.28814697266, 550.00549316406, 5.3881149291992);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Островок раздолья");
                return 1;
            }

            if (listitem == 5) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -113.16453552, 583.32196045, 3.14548969);
                else SetPlayerPos(playerid, -113.16453552, 583.32196045, 3.14548969);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Форт Карсон");
                return 1;
            }

            if (listitem == 6) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1685.10925293, 944.96972656, 10.53941059);
                else SetPlayerPos(playerid, 1685.10925293, 944.96972656, 10.53941059);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Дрифт Парковку");
                return 1;
            }

            if (listitem == 7) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1574.58410645, 713.25219727, 10.66216087);
                else SetPlayerPos(playerid, 1574.58410645, 713.25219727, 10.66216087);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Склад-симметрия");
                return 1;
            }

            if (listitem == 8) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1668, -240, 14.010653495789);
                else SetPlayerPos(playerid, -1668, -240, 15.0);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Взлётную полосу Аэропорта SF");
                return 1;
            }

            if (listitem == 9) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1195.292114, 16.669136, 14.148437);
                else SetPlayerPos(playerid, -1195.292114, 16.669136, 14.148437);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Пирс в Аэропорту SF");
                return 1;
            }

            if (listitem == 10) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 307.8760, 1970.3674, 18.7321);
                else SetPlayerPos(playerid, 307.8760, 1970.3674, 18.7321);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Военную базу ");
                return 1;
            }
            if (listitem == 11) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1726.8014, 1601.1394, 15.8388);
                else SetPlayerPos(playerid, 1726.8014, 1601.1394, 15.8388);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать в Лас Вентурас");
                return 1;
            }

            if (listitem == 12) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1444.4003, -2287.5933, 14.1771);
                else SetPlayerPos(playerid, 1444.4003, -2287.5933, 14.1771);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать в Лос Сантос");
                return 1;
            }

            if (listitem == 13) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1417.0730, -301.4812, 15.0958);
                else SetPlayerPos(playerid, -1417.0730, -301.4812, 15.0958);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать в Сан Фиеро");
                return 1;
            }

            if (listitem == 14) {
                SetPlayerPos(playerid, -1374.9382, -687.2645, 1058.4590);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать  в Космос:D");
                return 1;
            }

            if (listitem == 15) {
                SetPlayerPos(playerid, 1836.5770, -1855.6913, 14.0546);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать к установке бомбы");
                return 1;
            }

            if (listitem == 16) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1546.9347, -1362.5142, 329.6690);
                else SetPlayerPos(playerid, 1546.9347, -1362.5142, 329.6690);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Небоскреб");
                return 1;
            }

            if (listitem == 17) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 2304.3979, 1533.8732, 10.8320);
                else SetPlayerPos(playerid, 2304.3979, 1533.8732, 10.8320);
                SendClientMessage(playerid, 0xFF0000AA, "Добро пожаловать на Дрифт 9");
                return 1;
            }

            if (listitem == 18) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1570.5544, 310.0185, 7.2100);
                else SetPlayerPos(playerid, -1570.5544, 310.0185, 7.2100);
                SendClientMessage(playerid, 0xFFCC2299, ">>>>Добро пожаловать на Дрифт 10!");
                return 1;
            }
            if (listitem == 19) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1485.3896, 2829.3538, 10.8203);
                else SetPlayerPos(playerid, 1485.3896, 2829.3538, 10.8203);
                SendClientMessage(playerid, 0xFFCC2299, "Добро пожаловать на Зону домов");
                return 1;
            }

            if (listitem == 20) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 2097.5417, 1973.7672, 10.6853);
                else SetPlayerPos(playerid, 2097.5417, 1973.7672, 10.6853);
                SendClientMessage(playerid, 0xFFCC2299, "Добро пожаловать на Дрифт 11.");
                return 1;
            }
            if (listitem == 21) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1667.1711, 536.0791, 38.2471);
                else SetPlayerPos(playerid, -1667.1711, 536.0791, 38.2471);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Драг 3");
                return 1;
            }
            if (listitem == 22) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 2068.3232, 2381.8252, 45.2265);
                else SetPlayerPos(playerid, 2068.3232, 2381.8252, 45.2265);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Дрифт 12");
                return 1;
            }
            if (listitem == 23) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 414.4188, 2499.3838, 16.4844);
                else SetPlayerPos(playerid, 414.4188, 2499.3838, 16.4844);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Драг 4");
                return 1;
            }
            if (listitem == 24) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -2143.2683, 1038.7053, 79.8516);
                else SetPlayerPos(playerid, -2143.2683, 1038.7053, 79.8516);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Драг 5");
                return 1;
            }
            if (listitem == 25) {
                SetPlayerPos(playerid, -402.3530, 1226.7317, 5.1702);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать в Пещеру у Ухо=)");
                return 1;
            }
            if (listitem == 26) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1834.3633, 2155.0146, 7.1776);
                else SetPlayerPos(playerid, -1834.3633, 2155.0146, 7.1776);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Vip Островок");
                return 1;
            }
            if (listitem == 27) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 317.7850, -1797.2052, 4.6353);
                else SetPlayerPos(playerid, 317.7850, -1797.2052, 4.6353);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Пляж Лос Сантоса");
                return 1;
            }
            if (listitem == 28) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1980.0601, 253.1375, 35.1719);
                else SetPlayerPos(playerid, -1980.0601, 253.1375, 35.1719);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать в Wang Cars");
                return 1;
            }
            if (listitem == 29) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -2322.2446, -1621.0658, 483.7108);
                else SetPlayerPos(playerid, -2322.2446, -1621.0658, 483.7108);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Chiliad");
                return 1;
            }
            if (listitem == 30) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 2031.2438, 973.9511, 10.5536);
                else SetPlayerPos(playerid, 2031.2438, 973.9511, 10.5536);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Four Dragons");
                return 1;
            }
            if (listitem == 31) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -768.7189, 1932.5999, 5.5358);
                else SetPlayerPos(playerid, -768.7189, 1932.5999, 5.5358);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Дрифт 13");
                return 1;
            }
            if (listitem == 32) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -1465.1069, 422.6227, 30.1100);
                else SetPlayerPos(playerid, -1465.1069, 422.6227, 30.1100);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Дрифт 14");
                return 1;
            }
            if (listitem == 33) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -2589.0078, 1351.3533, 7.0462);
                else SetPlayerPos(playerid, -2589.0078, 1351.3533, 7.0462);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы к клубу Джиззи");
                return 1;
            }
            if (listitem == 34) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 335.7664, -1520.6439, 36.0391);
                else SetPlayerPos(playerid, 335.7664, -1520.6439, 36.0391);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы к Квартирам в LS");
                return 1;
            }
            if (listitem == 35) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1474.73, 2503.34, 332.99);
                else SetPlayerPos(playerid, 1474.73, 2503.34, 332.99);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы на Спуск");
                return 1;
            }
            if (listitem == 36) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1534.1176, -1448.0131, 12.7729);
                else SetPlayerPos(playerid, 1534.1176, -1448.0131, 12.7729);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы к Клубу в ЛС");
                return 1;
            }
            if (listitem == 37) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 2571.3940, -1771.7540, 1.1378);
                else SetPlayerPos(playerid, 2571.3940, -1771.7540, 1.1378);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы на Монстер трассу");
                return 1;
            }
            if (listitem == 38) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 829.4568, -1809.3080, 11.7524);
                else SetPlayerPos(playerid, 829.4568, -1809.3080, 11.7524);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы на VIP остров 2");
                return 1;
            }
            if (listitem == 39) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1346.1180, -2544.6279, 13.3808);
                else SetPlayerPos(playerid, 1346.1180, -2544.6279, 13.3808);
                SendClientMessage(playerid, 0xFF0000AA, " Добро пожаловать на Спринт 1");
                SetPlayerInterior(playerid, 0);
                return 1;
            }
            if (listitem == 40) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 2818.0095, 2113.6633, 10.6568);
                else SetPlayerPos(playerid, 2818.0095, 2113.6633, 10.6568);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы на Дрифт 15");
                SetPlayerInterior(playerid, 0);
                return 1;
            }

            if (listitem == 41) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), -2617.3147, 1473.1395, 5.1810);
                else SetPlayerPos(playerid, -2617.3147, 1473.1395, 5.1810);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы на Дрифт Джиззи");
                SetPlayerInterior(playerid, 0);
                return 1;
            }
            if (listitem == 42) {
                if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehiclePos(GetPlayerVehicleID(playerid), 1408.9784, -1350.5428, 8.5547);
                else SetPlayerPos(playerid, 1408.9784, -1350.5428, 8.5547);
                SendClientMessage(playerid, 0xFF0000AA, " Вы телепортированы на Спринт 2");
                SetPlayerInterior(playerid, 0);
                return 1;
            }


        } else ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "{FFFF33}Игровое меню", "{33CCFF}Тюнинг \n{FF0000}Ремонт \n{00FF00}Телепорты\n{00FF00}Взять авто за {FFFFFF}10000$ \nУправление персонажем \n{FF0000}Отсчёт\n{FFFF00}Управление авто\nО {FFFF00}сервере\n{00FF00}Система банд\n{FF0000}Трассы\n{00FF00}Радио\n{99CC33}Репорт", "Выбрать", "Выход");
    }
    return 0;
}

/*public Check()
{
	for(new i=0;i<MAX_PLAYERS;i++)
	if(IsPlayerConnected(i))
	{
		m[i]+=1;
		if (m[i] > 59)
		{
 			h[i]++; m[i] = 0;
  			if(h[i] > 23) h[i] = 0;
		}

		if(GetSpeedKM(i)>300)
		{
			switch(GetVehicleModel(GetPlayerVehicleID(i)))
			{
			    case 0,592,577,511,512,593,520,553,476,519,460,513: printf("ID%d driving %d with velocity %skm",i,GetVehicleModel(GetPlayerVehicleID(i)),GetSpeedKM(i));
				default:
				{
				    new str[150];
				    format(str,150,"%s Этот ёборь использовал спидхак, скажем ему пока:D",PlayerName(i));
				    SendClientMessageToAll(COLOR_RED,str);
					SendClientMessage(i,COLOR_RED,"Вы были кикнуты за спидхак");
					Kick(i);
				}
			}
		}
	}
}
*/
public Countdown() {

    for (new i = 0; i < MAX_PLAYERS; i++)
        if (IsPlayerConnected(i)) {
            if (countdown[i] > 0) {
                countdown[i] -= 1;
                new str[6];
                format(str, 6, "...%d", countdown[i]);
                GameTextForPlayer(i, str, 950, 4);
                PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0);
                if (countdown[i] < 4) TogglePlayerControllable(i, 0);
            }
            if (countdown[i] == 0) {
                TogglePlayerControllable(i, 1);
                GameTextForPlayer(i, "~r~GO GO GO!", 500, 4);
                PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
                countdown[i] = -1;
            }
        }
}



dcmd_dt(playerid, params[]) {
    new str[64];
    if (!strlen(params)) return SendClientMessage(playerid, 0xFFCC2299, "[Информация]: /dt [мир]"); //Grey colour
    if (strval(params) < 0) return SendClientMessage(playerid, 0xFFCC2299, "[Информация]: Число должно быть больше нуля"); //Grey colour
    new ii = strval(params);
    SetPlayerVirtualWorld(playerid, ii);
    format(str, 64, "[INFO]: Ваш мир изменён на %d", ii);
    SendClientMessage(playerid, 0xFF8040AA, str); //Grey colour
    if (ii != 0) return SendClientMessage(playerid, 0xFFCC2299, ">>>[Информация]: Вы в режиме дрифт тренировки"); //Grey colour
    SendClientMessage(playerid, 0xFFCC2299, ">>>[Информация]: Режим дрифт тренировки выключен"); //Grey colour
    return 1;
}

stock GetSpeedKM(playerid) {
    new
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    Float:PlayerSpeedDistance;

    GetVehicleVelocity(GetPlayerVehicleID(playerid), PosX, PosY, PosZ);
    PlayerSpeedDistance = floatmul(floatsqroot(floatadd(floatadd(floatpower(PosX, 2), floatpower(PosY, 2)), floatpower(PosZ, 2))), 170.0);
    new spe = floatround(PlayerSpeedDistance * 1);
    return spe;
}

//------------------------------------------------

stock strrest(const string[], & index) {
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' ')) {
        index++;
    }
    new offset = index;
    new result[128];
    while ((index < length) && ((index - offset) < (sizeof(result) - 1))) {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = EOS;
    return result;
}

stock strtok(const string[], & index) {
    new length = strlen(string);
    while ((index < length) && (string[index] <= ' ')) {
        index++;
    }

    new offset = index;
    new result[20];
    while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1))) {
        result[index - offset] = string[index];
        index++;
    }
    result[index - offset] = EOS;
    return result;
}

public OnRconLoginAttempt(ip[], password[], success) {
    if (!success) {
        new YouIP[16];
        for (new i = 0; i <= MAX_PLAYERS; i++) {
            if (IsPlayerConnected(i)) {
                GetPlayerIp(i, YouIP, sizeof(YouIP));
                if (!strcmp(ip, YouIP, true)) {
                    SendClientMessage(i, -1, "Ты забанен за попытку взлома RCON");
                    printf("IP %s был забанен за попытку взлома RCON", ip);
                    Ban(i);
                    return 1;
                }
            }
        }
    }
    return 1;
}
forward SaveAccount(playerid);
public SaveAccount(playerid) {
    new f[256];
    format(f, 256, "/gangs/user/%s.ini", PlayerName(playerid));
    new file = ini_openFile(f);
    if (file == INI_OK) {
        ini_setInteger(file, "Score", Scoress[playerid]);
        ini_setInteger(file, "Gang", PGang[playerid]);
        ini_setInteger(file, "GangLvl", GangLvl[playerid]);
        ini_closeFile(file);
    }
    return true;
}

public OnPlayerRequestClass(playerid, classid) {
    PGang[playerid] = 0;
    GangLvl[playerid] = 0;
    Scoress[playerid] = 0;
    LoadAccount(playerid);
    GangLoad();
    SetPlayerPos(playerid, 1944.9351, 986.4768, 992.4688);
    SetPlayerFacingAngle(playerid, 268.9163);
    SetPlayerCameraPos(playerid, 1948.3185, 986.4310, 992.4688);
    SetPlayerCameraLookAt(playerid, 1944.9351, 986.4768, 992.4688);
    SetPlayerInterior(playerid, 10);
    return true;
}
public Nation() {
    //SendClientMessageToAll(COLOR_RED,"По вопросам приобретения админки или базы и по другим услугам обращаться в Skype: live:skype_1983 !");
    return 1;
}
public BitHost() {
    SendClientMessageToAll(COLOR_RED, "BitHost.pro - качественный и надежный хостинг игровых серверов, хостинг для сайтов, домены, dedicated");
    SendClientMessageToAll(COLOR_RED, "BitHost.pro - лучший хостинг игровых серверов SA-MP");
    return 1;
}
public SetRealTime() //автоматическая смена времени
{
    new hours, minutes, seconds;
    gettime(hours, minutes, seconds);
    SetWorldTime(hours, minutes);
}
public OnPlayerUpdate(playerid)

{

    if (GetPlayerWeapon(playerid) == 36 || GetPlayerWeapon(playerid) == 37 || GetPlayerWeapon(playerid) == 38 || GetPlayerWeapon(playerid) == 35 || GetPlayerWeapon(playerid) == 39 || GetPlayerWeapon(playerid) == 40 || GetPlayerWeapon(playerid) == 27 || GetPlayerWeapon(playerid) == 26) //Проверка на оружие, по нему можно сделать на любое запрещеное оружие
    {

        new plname[MAX_PLAYER_NAME]; //переменная
        new string[256]; //string
        GetPlayerName(playerid, plname, sizeof(plname)); //узнаем имя игрока
        format(string, sizeof(string), "%s был кикнут. Причина: Weapon Hack", plname); //имя мы бьем через format
        SendClientMessageToAll(0xFFFFFFFF, string); //показываем всем игрокам
        Kick(playerid); //Кикаем
    }

    return true;
}

stock GetWeaponModel(weaponid) {
    switch (weaponid) {
        case 1:
            return 331;

        case 2..8:
            return weaponid + 331;

        case 9:
            return 341;

        case 10..15:
            return weaponid + 311;

        case 16..18:
            return weaponid + 326;

        case 22..29:
            return weaponid + 324;

        case 30, 31:
            return weaponid + 325;

        case 32:
            return 372;

        case 46:
            return 371;
    }
    return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
    if (newstate == PLAYER_STATE_DRIVER) {
        TextDrawShowForPlayer(playerid, DriftTD2[playerid]);
    }
    if (newstate == PLAYER_STATE_DRIVER) SetPVarInt(playerid, "VehID", GetPlayerVehicleID(playerid)); //антифлудкар
    if (oldstate == PLAYER_STATE_DRIVER) {
        if (BanCar[GetPVarInt(playerid, "VehID")]) KillTimer(TimeUpdate[playerid]);
        TimeUpdate[playerid] = SetTimerEx("UpdateVehiclePos", 10000, false, "ii", GetPVarInt(playerid, "VehID"), 1);
        BanCar[GetPVarInt(playerid, "VehID")] = true;
    }
    if (newstate == PLAYER_STATE_PASSENGER) {
        for (new i; i < 111; i++) {
            if (GetVehicleModel(GetPlayerVehicleID(playerid)) == CrashCars1[i] && GetPlayerVehicleSeat(playerid) > 1) {
                Kick(playerid);
            }
        }

        for (new i; i < 43; i++) {
            if (GetVehicleModel(GetPlayerVehicleID(playerid)) == CrashCars2[i]) {
                Kick(playerid);
            }
        }
    }
    return 1;
}
public OnPlayerPickUpPickup(playerid, pickupid) {
    if (pickupid == teleport) {
        //Куда он телепортируется
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, 346.1119, -1506.0330, 265.8616);
    }
    if (pickupid == teleport2) {
        //Телепорт из интерьера на улицу
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, 330.2132, -1517.1276, 35.8672);
    }
    if (pickupid == teleport4) {
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, 281.8485, -1867.2485, 9.1464);
        SendClientMessage(playerid, 0xFF0000FF, "");
    }
    if (pickupid == teleport3) {
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, 274.4871, -1866.6010, 8.7690);
        SendClientMessage(playerid, 0xFF0000FF, "");
    }
    if (pickupid == teleport5) {
        SetPlayerInterior(playerid, 3);
        SetPlayerPos(playerid, -2640.762939, 1406.682006, 906.460937);
        SendClientMessage(playerid, 0xFF0000FF, "");
    }
    if (pickupid == teleport6) {
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, -2624.9780, 1410.4001, 6.0951);
        SendClientMessage(playerid, 0xFF0000FF, "");
    }
    return 1;
}
public ConnectedPlayers() {
    new Connected;
    for (new i = 0; i < MAX_PLAYERS; i++)
        if (IsPlayerConnected(i) && !IsPlayerNPC(i)) Connected++;
    return Connected;
}

stock split(const strsrc[], strdest[][], delimiter) {
    new i, li;
    new aNum;
    new len;
    while (i <= strlen(strsrc)) {
        if (strsrc[i] == delimiter || i == strlen(strsrc)) {
            len = strmid(strdest[aNum], strsrc, li, i, 128);
            strdest[aNum][len] = 0;
            li = i + 1;
            aNum++;
        }
        i++;
    }
    return 1;
}
/*public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat)//антифлудкар
{
    new Float:Pos[3];
    GetVehiclePos(vehicleid, Pos[0], Pos[1], Pos[2]);
    new Float:Count[2];
    Count[0] = Difference(Pos[0],VehPos[vehicleid][0]);
    Count[1] = Difference(Pos[1],VehPos[vehicleid][1]);
    switch(GetVehicleModel(vehicleid))
    {
        case 435, 450, 584, 591, 606..608, 610..611: goto UPDATE;
    }
    if((Count[0] > 5 || Count[1] > 5) && !UseCar(vehicleid) && !BanCar[vehicleid])
    {
        SetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
        SetVehicleZAngle(vehicleid, VehPos[vehicleid][3]);
    }
    else
    {
        UPDATE:
        UpdateVehiclePos(vehicleid, 0);
    }
    return 1;
}*/
public OnVehicleStreamIn(vehicleid, forplayerid) //антифлудкар
{
    UpdateVehiclePos(vehicleid, 0);
    return 1;
}
public UpdateVehiclePos(vehicleid, type) {
    if (type == 1) {
        /*if(!StopCar(vehicleid))
        {
            SetTimerEx("UpdateVehiclePos", 10000, false, "ii", vehicleid, 1);
            return 1;
        }*/
        BanCar[vehicleid] = false;
    }
    GetVehiclePos(vehicleid, VehPos[vehicleid][0], VehPos[vehicleid][1], VehPos[vehicleid][2]);
    GetVehicleZAngle(vehicleid, VehPos[vehicleid][3]);
    return 1;
}

stock Difference(Float:Value1, Float:Value2) {
    return floatround((Value1 > Value2) ? (Value1 - Value2) : (Value2 - Value1));
}

stock bool: UseCar(carid) {
    for (new i; i != GetMaxPlayers(); i++) {
        if (!IsPlayerConnected(i)) continue;
        if (IsPlayerInVehicle(i, carid)) return true;
    }
    return false;
}

stock SetVehiclePostion(vehicleid, Float:X, Float:Y, Float:Z) {
    SetVehiclePos(vehicleid, X, Y, Z);
    UpdateVehiclePos(vehicleid, 0);
}

public OnVehicleMod(playerid, vehicleid, componentid) //античит на тюнинг
{
    if (!tunings(playerid)) {
        RemoveVehicleComponent(vehicleid, componentid);
        return Kick(playerid);
    }
    return 1;
}

stock HexToInt(string[]) {
    if (string[0] == 0) return 0;
    new i;
    new cur = 1;
    new res = 0;
    for (i = strlen(string); i > 0; i--) {
        if (string[i - 1] < 58) res = res + cur * (string[i - 1] - 48);
        else res = res + cur * (string[i - 1] - 65 + 10);
        cur = cur * 16;
    }
    return res;
}
public Favorit() {
    SendClientMessageToAll(COLOR_RED, "Понравился сервер?! Добавь его в избранные! IP: 31.131.251.131:7012 !");
    return 1;
}
stock bool: StopCar(carid) {
    new Float:Pos[3];
    GetVehicleVelocity(carid, Pos[0], Pos[1], Pos[2]);
    if (Pos[0] == 0.0 && Pos[1] == 0.0 && Pos[2] == 0.0) return true;
    return false;
}
public SpecHArefresh(playerid, specplayerid) {
    new SM_HAstring[256];
    new Float:armour, Float:health;
    new ping = GetPlayerPing(specplayerid);
    new giveplayer[MAX_PLAYER_NAME];
    GetPlayerHealth(specplayerid, health);
    GetPlayerArmour(specplayerid, armour);
    GetPlayerName(specplayerid, giveplayer, sizeof(giveplayer));
    format(SM_HAstring, sizeof(SM_HAstring), "Name: ~w~%s[%d]~n~~r~Health: %.0f ~n~~w~Armour: %.0f~n~~b~Ping: %d", giveplayer, specplayerid, health, armour, ping);
    TextDrawSetString(SM_HA[playerid], SM_HAstring);
    return 1;
}
stock pName(playerid) {
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, name, sizeof(name));
    return name;
}
//Дрифт очки
IsCar(vid) {
    new model = GetVehicleModel(vid);
    switch (model) {
        case 443:
            return 0;
        case 448:
            return 0;
        case 461:
            return 0;
        case 462:
            return 0;
        case 463:
            return 0;
        case 468:
            return 0;
        case 521:
            return 0;
        case 522:
            return 0;
        case 523:
            return 0;
        case 581:
            return 0;
        case 586:
            return 0;
        case 481:
            return 0;
        case 509:
            return 0;
        case 510:
            return 0;
        case 430:
            return 0;
        case 446:
            return 0;
        case 452:
            return 0;
        case 453:
            return 0;
        case 454:
            return 0;
        case 472:
            return 0;
        case 473:
            return 0;
        case 484:
            return 0;
        case 493:
            return 0;
        case 595:
            return 0;
        case 417:
            return 0;
        case 425:
            return 0;
        case 447:
            return 0;
        case 465:
            return 0;
        case 469:
            return 0;
        case 487:
            return 0;
        case 488:
            return 0;
        case 497:
            return 0;
        case 501:
            return 0;
        case 548:
            return 0;
        case 563:
            return 0;
        case 406:
            return 0;
        case 444:
            return 0;
        case 556:
            return 0;
        case 557:
            return 0;
        case 573:
            return 0;
        case 460:
            return 0;
        case 464:
            return 0;
        case 476:
            return 0;
        case 511:
            return 0;
        case 512:
            return 0;
        case 513:
            return 0;
        case 519:
            return 0;
        case 520:
            return 0;
        case 539:
            return 0;
        case 553:
            return 0;
        case 577:
            return 0;
        case 592:
            return 0;
        case 593:
            return 0;
        case 471:
            return 0;
    }
    return 1;
}
forward AngleUpdate();
public AngleUpdate() {
    for (new g = 0; g < 200; g++) {
        new Float:x, Float:y, Float:z;
        if (IsPlayerInAnyVehicle(g)) GetVehiclePos(GetPlayerVehicleID(g), x, y, z);
        else GetPlayerPos(g, x, y, z);
        ppos[g][0] = x;
        ppos[g][1] = y;
        ppos[g][2] = z;
    }
}
Float:GetPlayerTheoreticAngle(i) {
    new Float:sin;
    new Float:dis;
    new Float:angle2;
    new Float:x, Float:y, Float:z;
    new Float:tmp3;
    new Float:tmp4;
    new Float:MindAngle;
    if (IsPlayerConnected(i)) {
        GetPlayerPos(i, x, y, z);
        dis = floatsqroot(floatpower(floatabs(floatsub(x, ppos[i][0])), 2) + floatpower(floatabs(floatsub(y, ppos[i][1])), 2));
        if (IsPlayerInAnyVehicle(i)) GetVehicleZAngle(GetPlayerVehicleID(i), angle2);
        else GetPlayerFacingAngle(i, angle2);
        if (x > ppos[i][0]) { tmp3 = x - ppos[i][0]; } else { tmp3 = ppos[i][0] - x; }
        if (y > ppos[i][1]) { tmp4 = y - ppos[i][1]; } else { tmp4 = ppos[i][1] - y; }
        if (ppos[i][1] > y && ppos[i][0] > x) { //1
            sin = asin(tmp3 / dis);
            MindAngle = floatsub(floatsub(floatadd(sin, 90), floatmul(sin, 2)), -90.0);
        }
        if (ppos[i][1] < y && ppos[i][0] > x) { //2
            sin = asin(tmp3 / dis);
            MindAngle = floatsub(floatadd(sin, 180), 180.0);
        }
        if (ppos[i][1] < y && ppos[i][0] < x) { //3
            sin = acos(tmp4 / dis);
            MindAngle = floatsub(floatadd(sin, 360), floatmul(sin, 2));
        }
        if (ppos[i][1] > y && ppos[i][0] < x) { //4
            sin = asin(tmp3 / dis);
            MindAngle = floatadd(sin, 180);
        }
    }
    if (MindAngle == 0.0) {
        return angle2;
    } else
        return MindAngle;
}
public PodsumowanieDriftu(playerid) {
    PunktyDriftuGracza[playerid] = 0;

    GiveMoney(playerid, DriftPointsNow[playerid]);
    SetPlayerScore(playerid, 0 + GetMoney(playerid, DriftPointsNow[playerid]));
    DriftPointsNow[playerid] = 0;

    SetTimer("DMCDP", 10, false);
}

Float:ReturnPlayerAngle(playerid) {
    new Float:Ang;
    if (IsPlayerInAnyVehicle(playerid)) GetVehicleZAngle(GetPlayerVehicleID(playerid), Ang);
    else GetPlayerFacingAngle(playerid, Ang);
    return Ang;
}
public LicznikDriftu() {
    new Float:Angle1, Float:Angle2, Float:BySpeed, s[256];
    new Float:Z;
    new Float:X;
    new Float:Y;
    new Float:SpeedX;
    for (new g = 0; g < 200; g++) {
        GetPlayerPos(g, X, Y, Z);
        SpeedX = floatsqroot(floatadd(floatadd(floatpower(floatabs(floatsub(X, SavedPos[g][sX])), 2), floatpower(floatabs(floatsub(Y, SavedPos[g][sY])), 2)), floatpower(floatabs(floatsub(Z, SavedPos[g][sZ])), 2)));
        Angle1 = ReturnPlayerAngle(g);
        Angle2 = GetPlayerTheoreticAngle(g);
        BySpeed = floatmul(SpeedX, 12);
        if (GetPlayerState(g) == PLAYER_STATE_DRIVER && IsCar(GetPlayerVehicleID(g)) && floatabs(floatsub(Angle1, Angle2)) > DRIFT_MINKAT && floatabs(floatsub(Angle1, Angle2)) < DRIFT_MAXKAT && BySpeed > DRIFT_SPEED) {
            if (PunktyDriftuGracza[g] > 0) KillTimer(PunktyDriftuGracza[g]);
            PunktyDriftuGracza[g] = 0;
            DriftPointsNow[g] += floatval(floatabs(floatsub(Angle1, Angle2)) * 3 * (BySpeed * 0.1)) / 10;
            PunktyDriftuGracza[g] = SetTimerEx("PodsumowanieDriftu", 1500, 0, "d", g);
        }
        if (DriftPointsNow[g] > 0) {
            format(s, sizeof(s), "Drift Points~y~: %d", DriftPointsNow[g]);
            TextDrawSetString(DriftTD2[g], s);
        }
        SavedPos[g][sX] = X;
        SavedPos[g][sY] = Y;
        SavedPos[g][sZ] = Z;
    }
}
floatval(Float:val) {
    new str[256];
    format(str, 256, "%.0f", val);
    return todec(str);
}
todec(str[]) { return strval(str); }

forward DMCDP(playerid);
public DMCDP(playerid) {
    TextDrawSetString(DriftTD[playerid], " ");
    TextDrawSetString(DriftTD2[playerid], " ");
    return 1;
} //Дрифт очки
public OnPlayerLogged(playerid, password[]) {
    new string[128];
    format(string, sizeof(string), AccauntBD, PlayerName(playerid));
    new iniFile = ini_openFile(string);
    ini_getString(iniFile, "Password", string);
    if (strcmp(string, password, true, 10) == 0) {
        ini_getInteger(iniFile, "Money", PlayerInfo[playerid][pMoney]);
        ini_getInteger(iniFile, "Ban", PlayerInfo[playerid][pBan]);
        ini_getInteger(iniFile, "Admin123451", PlayerInfo[playerid][pAdmin]);
        ini_closeFile(iniFile);
        Logged[playerid] = 1;
    } else {
        ShowPlayerLoginDialog(playerid);
        SendClientMessage(playerid, COLOR_RED, "Неверный пароль. Попробуйте еще раз");
        ini_closeFile(iniFile);
    }
    return 1;
}
public OnPlayerRegistered(playerid, password[]) {
    new IP[24], strdate[24], string[128];
    new year, month, day;
    getdate(year, month, day);
    GetPlayerIp(playerid, IP, sizeof(IP));

    format(string, sizeof(string), AccauntBD, PlayerName(playerid));
    new iniFile = ini_createFile(string);
    if (iniFile < 0)
        iniFile = ini_openFile(string);
    ini_setString(iniFile, "Password", password);
    format(strdate, sizeof(strdate), "%d/%d/%d", day, month, year);
    ini_setString(iniFile, "RegDate", strdate);
    ini_setString(iniFile, "IP", IP);
    ini_setInteger(iniFile, "Money", 50000);
    ini_setInteger(iniFile, "Ban", 0);
    ini_setInteger(iniFile, "Admin123451", 0);
    ini_closeFile(iniFile);
    OnPlayerLogged(playerid, password);
    format(string, sizeof(string), "Вы зарегистрировались и автоматически залогинились. Ваш пароль: %s", password);
    SendClientMessage(playerid, COLOR_ORANGE, string);
    Logged[playerid] = 1;
    return 1;
}

public OnPlayerSave(playerid) {
    new string[128];
    format(string, sizeof(string), AccauntBD, PlayerName(playerid));
    new iniFile = ini_openFile(string);
    ini_setInteger(iniFile, "Money", GetMoney(playerid));
    ini_setInteger(iniFile, "Admin123451", PlayerInfo[playerid][pAdmin]);
    ini_setInteger(iniFile, "Ban", PlayerInfo[playerid][pBan]);
    ini_closeFile(iniFile);
    return 1;
}
public ShowPlayerRegisterDialog(playerid) {
    new string[256];
    format(string, sizeof(string), "Добро пожаловать на сервер!\nПожалуйста зарегистрируйтесь ваш ник '%s'\nвведите пароль и нажмите 'Ок'", PlayerName(playerid));
    ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "Регистрация:", string, "Ок", "Выход");
    return 1;
}

public ShowPlayerLoginDialog(playerid) {
    new string[256];
    format(string, sizeof(string), "Здраствуйте %s вы здесь уже зарегистрированы\nпожалуйтса введите свой пароль\nуказанный при регистрации в окошко ниже", PlayerName(playerid));
    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, "Авторизация:", string, "Ок", "Выход");
    return 1;
}