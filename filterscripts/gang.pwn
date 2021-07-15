#include <a_samp>
#include <mxINI>
#define MAX_GANGS 10000
new tgang[MAX_PLAYERS], Scores[MAX_PLAYERS], name[MAX_GANGS][256], col[MAX_GANGS][256], gangskin[MAX_PLAYERS], id[MAX_PLAYERS] = -1;
new GangName[MAX_GANGS][256], Gang[MAX_GANGS],
    GangLvl[MAX_PLAYERS], GName[MAX_GANGS][256],
    GColor[MAX_GANGS][100], PGang[MAX_PLAYERS],
    Float:GSpawnX[MAX_GANGS], Float:GSpawnY[MAX_GANGS],
    Float:GSpawnZ[MAX_GANGS], GSkin[MAX_GANGS][7];
public OnGameModeInit() {

}
public OnFilterScriptInit() {
    GangLoad();
    print("\n--------------------------------------------");
    print("	GangSystem успешно загружена! ");
    print("--------------------------------------------\n");
    return true;
}

public OnFilterScriptExit() {
    for (new i; i < MAX_PLAYERS; i++) SaveAccount(i);
    return true;
}

public OnPlayerDisconnect(playerid, reason) {
    SaveAccount(playerid);
    return true;
}

public OnPlayerRequestClass(playerid, classid) {
    PGang[playerid] = 0;
    GangLvl[playerid] = 0;
    Scores[playerid] = 0;
    LoadAccount(playerid);
    return true;
}

public OnPlayerSpawn(playerid) {
    SetTimerEx("Spawn", 500, false, "i", playerid);

    return true;
}

public OnPlayerDeath(playerid, killerid, reason) {
    Scores[killerid]++;
    return true;
}

public OnPlayerText(playerid, text[]) {
    new string[256];
    if (PGang[playerid] > 0) {
        GetPlayerColor(playerid);
        format(string, sizeof(string), "[Банда: %s]%s[%d]:{FFFFFF} %s", GName[PGang[playerid]], PlayerName(playerid), playerid, text);
        SendClientMessageToAll(GetPlayerColor(playerid), string);
        return false;
    }
    return true;
}

public OnPlayerCommandText(playerid, cmdtext[]) {

    new cmd[256], idx;
    cmd = strtok(cmdtext, idx);
    if (strcmp(cmd, "/ascore", true) == 0) {
        if (IsPlayerAdmin(playerid)) {
            new tmp[256], tmp2[256];
            tmp = strtok(cmdtext, idx);
            tmp2 = strtok(cmdtext, idx);
            if (!strlen(tmp) || !strlen(tmp2)) return SendClientMessage(playerid, 0xFFFF00FF, "/ascore [id игрока][очки]");
            Scores[strval(tmp)] = strval(tmp2);
        }
        return true;
    }


    return false;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    new string[256];
    new tmp[256];
    if (dialogid == 10011) {
        if (response) {
            switch (listitem) {
                case 0: {
                    if (PGang[playerid] == 0 && PlayerInfo[playerid][pMoney] >= 10)
                    //if(PGang[playerid] == 0 && Scores[playerid] >= 500 && GetPlayerMoney(playerid) >= 1000000)
                    {
                        ShowPlayerDialog(playerid, 10020, DIALOG_STYLE_INPUT, "Создание банды", "Введите название банды в нижнее поле:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны выйти из своей банды, и у вас должно быть как минимум 0 очков и 1000000$.");
                }
                case 1: {
                    if (PGang[playerid] != 0 && GangLvl[playerid] == 6) {
                        ShowPlayerDialog(playerid, 10021, DIALOG_STYLE_LIST, "Назначение скинов банды", "Нуб\nИгрок\nПро игрок\nЭлита\nЗам лидера\nЛидер", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
                }
                case 2: {
                    if (PGang[playerid] != 0 && GangLvl[playerid] == 6) {
                        ShowPlayerDialog(playerid, 10022, DIALOG_STYLE_MSGBOX, "Назначение спавна банды", "Вы точно хотите назначить место спавна на этом месте?", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
                }
                case 3: {
                    if (PGang[playerid] != 0 && GangLvl[playerid] == 6) {
                        ShowPlayerDialog(playerid, 10023, DIALOG_STYLE_INPUT, "Назначение уровня", "Введите id игрока, которому хотите назначит уровень:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
                }
                case 4: {
                    if (PGang[playerid] != 0 && GangLvl[playerid] >= 4) {
                        ShowPlayerDialog(playerid, 10024, DIALOG_STYLE_INPUT, "Приглашение в банду", "Введите id игрока, которого хотите пригласить:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть как минимум 4 уровень.");
                }
                case 5: {
                    if (PGang[playerid] != 0 && GangLvl[playerid] >= 5) {
                        ShowPlayerDialog(playerid, 10025, DIALOG_STYLE_INPUT, "Кик из банды", "Введите id игрока, которого хотите кикнуть:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть как минимум 5 уровень.");
                }
                case 6: {
                    if (PGang[playerid] != 0 && GangLvl[playerid] == 6) {
                        ShowPlayerDialog(playerid, 10026, DIALOG_STYLE_INPUT, "Смена цвета банды", "Введите 6 символов формата RRGGBB:", "Принять", "Отмена");
                    } else return SendClientMessage(playerid, 0xFF0000FF, "Вы должны состоять в банде, и у вас должен быть уровень лидера.");
                }
                case 7: {
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
                GivePlayerMoney(playerid, -100);
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
    return true;
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
        ini_getInteger(file, "Score", Scores[playerid]);
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

forward SaveAccount(playerid);
public SaveAccount(playerid) {
    new f[256];
    format(f, 256, "/gangs/user/%s.ini", PlayerName(playerid));
    new file = ini_openFile(f);
    if (file == INI_OK) {
        ini_setInteger(file, "Score", Scores[playerid]);
        ini_setInteger(file, "Gang", PGang[playerid]);
        ini_setInteger(file, "GangLvl", GangLvl[playerid]);
        ini_closeFile(file);
    }
    return true;
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

stock PlayerName(playerid) {
    new pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, sizeof(pname));
    return pname;
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