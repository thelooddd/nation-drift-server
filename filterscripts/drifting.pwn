#include a_samp
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
public OnFilterScriptInit() {
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
    return 1;
}
IsCar(vid) {
    new model = GetVehicleModel(vid);
    switch (model) {
        case 443 :return 0;
        case 448 :return 0;
        case 461 :return 0;
        case 462 :return 0;
        case 463 :return 0;
        case 468 :return 0;
        case 521 :return 0;
        case 522 :return 0;
        case 523 :return 0;
        case 581 :return 0;
        case 586 :return 0;
        case 481 :return 0;
        case 509 :return 0;
        case 510 :return 0;
        case 430 :return 0;
        case 446 :return 0;
        case 452 :return 0;
        case 453 :return 0;
        case 454 :return 0;
        case 472 :return 0;
        case 473 :return 0;
        case 484 :return 0;
        case 493 :return 0;
        case 595 :return 0;
        case 417 :return 0;
        case 425 :return 0;
        case 447 :return 0;
        case 465 :return 0;
        case 469 :return 0;
        case 487 :return 0;
        case 488 :return 0;
        case 497 :return 0;
        case 501 :return 0;
        case 548 :return 0;
        case 563 :return 0;
        case 406 :return 0;
        case 444 :return 0;
        case 556 :return 0;
        case 557 :return 0;
        case 573 :return 0;
        case 460 :return 0;
        case 464 :return 0;
        case 476 :return 0;
        case 511 :return 0;
        case 512 :return 0;
        case 513 :return 0;
        case 519 :return 0;
        case 520 :return 0;
        case 539 :return 0;
        case 553 :return 0;
        case 577 :return 0;
        case 592 :return 0;
        case 593 :return 0;
        case 471 :return 0;
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

    GivePlayerMoney(playerid, DriftPointsNow[playerid]);
    SetPlayerScore(playerid, 0 + GetPlayerMoney(playerid, DriftPointsNow[playerid]));
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
floatval(Float:val) { new str[256];
    format(str, 256, "%.0f", val); return todec(str); }
todec(str[]) { return strval(str); }
public OnPlayerStateChange(playerid, newstate, oldstate) {
    if (newstate == PLAYER_STATE_DRIVER) {
        TextDrawShowForPlayer(playerid, DriftTD2[playerid]);
    }
    return 1;
}

forward DMCDP(playerid);
public DMCDP(playerid) {
    TextDrawSetString(DriftTD[playerid], " ");
    TextDrawSetString(DriftTD2[playerid], " ");
    return 1;
}


public OnPlayerConnect(playerid) {
    new x;
    TextDrawHideForPlayer(playerid, DriftTD[x]);
    TextDrawHideForPlayer(playerid, DriftTD2[x]);
    TextDrawHideForPlayer(playerid, Textdraw0);
    SendClientMessage(playerid, COLOR_GREENISHGOLD, "");
    return 1;
}
public OnPlayerCommandText(playerid, cmdtext[]) {
    new x;

    if (strcmp("/dp-off", cmdtext, true, 10) == 0) {
        SendClientMessage(playerid, COLOR_GREENISHGOLD, "�� ��������� ����� �������");
        TextDrawHideForPlayer(playerid, DriftTD2[x]);
        return 1;
    }

    if (strcmp("/dp-on", cmdtext, true, 10) == 0) {
        SendClientMessage(playerid, COLOR_GREENISHGOLD, "�� �������� ����� �������");
        TextDrawShowForPlayer(playerid, DriftTD2[x]);
        return 1;
    }
    return 0;
}