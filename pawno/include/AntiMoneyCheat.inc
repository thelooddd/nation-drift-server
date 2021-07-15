#include <a_samp>

//new Money[MAX_PLAYERS];
/* ВНЕСТИ В МОД!!!!
public OnGameModeInit() {
	SetTimer("Loshadka",2000,1);
	return 1;
}
*/

forward Loshadka();
public Loshadka() {
	for(new i =0;i<MAX_PLAYERS;i++) {
		if(GetPlayerMoney(i) != PlayerInfo[i][pMoney]) {
			GivePlayerMoney(i,PlayerInfo[i][pMoney]-GetPlayerMoney(i));
			//SendClientMessage(i,0xFEFEFEFF,"Не шали с читами тута");
		}
	}
}
stock ResetPlMon(playerid) {
	Money[playerid] =0;
	GivePlayerMoney(playerid,0-GetPlayerMoney(playerid));
	return 1;
}
stock GiveMoney(playerid,a) {
	PlayerInfo[playerid][pMoney] += a;
	GivePlayerMoney(playerid,a);
	return 1;
}
