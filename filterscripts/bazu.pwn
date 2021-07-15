#include <a_samp>
#include <streamer>
#pragma tabsize 0

new open1;

new gate1; //lsnews
new gate2; //lrucs
new gate3; //a
public OnFilterScriptInit() {
    print("--------------------------------------");
    print("----------------UCH-------------------");
    print("--------------------------------------");
    print("--------------By LOD-----------------");
    print("--------------------------------------");
    gate1 = CreateObject(980, 1164.9944, -1740.3716, 15.0070, 0.0000, 0.0000, -91.0000); //lsnews
    gate2 = CreateObject(980, -1703.01, 1340.57, 8.89, 0.00, 0.00, 134.17); //lrucs
    //lrucs
    CreateDynamicObject(987, -1700.12, 1337.70, 6.18, 0.00, 0.00, 316.28);
    CreateDynamicObject(987, -1714.20, 1351.81, 6.18, 0.00, 0.00, 315.15);
    CreateDynamicObject(987, -1667.78, 1341.15, 6.04, 0.00, 0.00, 45.68);
    CreateDynamicObject(987, -1684.46, 1328.22, 6.04, 0.00, 0.00, 45.68);
    CreateDynamicObject(987, -1648.31, 1360.74, 6.04, 0.00, 0.00, 45.68);
    CreateDynamicObject(987, -1634.27, 1383.08, 6.04, 0.00, 0.00, 315.68);
    CreateDynamicObject(987, -1633.99, 1382.83, 7.72, 0.00, 0.00, 315.68);
    CreateDynamicObject(987, -1683.64, 1412.03, 6.18, 0.00, 0.00, 0.00);

    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[]) {
    if (strcmp(cmdtext, "/3332", true) == 0) {
        MoveObject(gate1, 1164.9944, -1740.3716, 15.0070 - 10, 1, 0.0000, 0.0000, -91.0000);
        return 1;
    }
    if (strcmp(cmdtext, "/6565", true) == 0) {
        MoveObject(gate1, 1164.9944, -1740.3716, 15.0070, 3, 0.0000, 0.0000, -91.0000);
        return 1;
    }

    if (strcmp(cmdtext, "/opleften", true) == 0) //lrucs
    {
        if (open1 == 0) {
            MoveObject(gate2, -1703.01, 1340.57, 3.00, 1, 0.00, 0.00, 134.17);
            open1 = 1;
        } else if (open1 == 1) {
            MoveObject(gate2, -1703.01, 1340.57, 8.89, 3, 0.00, 0.00, 134.17);
            open1 = 0;
        }
    }
    if (strcmp(cmdtext, "/a", true) == 0) {
        MoveObject(gate3, -2126.6001, -80.5000, 37.1000 - 10, 1, 0.0000, 0.0000, 0.0000); //открываем ворота
    }
    if (strcmp(cmdtext, "/aa", true) == 0) {
        MoveObject(gate3, -2126.6001, -80.5000, 37.1000, 3, 0.0000, 0.0000, 0.0000); //закрываем
    }

    return 0;
}