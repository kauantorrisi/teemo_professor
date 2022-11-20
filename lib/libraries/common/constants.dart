// ignore_for_file: non_constant_identifier_names

String API_KEY = 'RGAPI-17826a0f-a65a-4dfb-9cb5-cb046543738c';

String LOL_URL = 'https://br1.api.riotgames.com/';

String DATA_DRAGON_URL = 'http://ddragon.leagueoflegends.com/';

String LOL_SUMMONERBYNAME = '${LOL_URL}lol/summoner/v4/summoners/by-name/';

String LOL_SUMMONERBYPUUID = '${LOL_URL}lol/summoner/v4/summoners/by-puuid/';

String LOL_SUMMONERCHAMPIONSMATERYBYID =
    '${LOL_URL}lol/champion-mastery/v4/champion-masteries/by-summoner/';

String LOL_SUMMONERTOTALMATERYPOINTS =
    '${LOL_URL}lol/champion-mastery/v4/scores/by-summoner/';

String LOL_SUMMONERRANKEDINFO = '${LOL_URL}lol/league/v4/entries/by-summoner/';

String LOL_RANKEDCHALLENGERSOLOQINFO =
    '${LOL_URL}lol/league/v4/challengerleagues/by-queue/RANKED_SOLO_5x5';

String LOL_RANKEDCHALLENGERFLEXINFO =
    '${LOL_URL}lol/league/v4/challengerleagues/by-queue/RANKED_FLEX_SR';

String LOL_LISTMATCHIDSBYPUUID =
    'https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/';

String LOL_MATCHBYID =
    'https://americas.api.riotgames.com/lol/match/v5/matches/';

String LOL_SUMMONERICONS = '${DATA_DRAGON_URL}cdn/12.21.1/img/profileicon/';

String URL_CHAMPIONSLIST =
    '${DATA_DRAGON_URL}cdn/12.20.1/data/pt_BR/champion.json';

String URL_CHAMPION = '${DATA_DRAGON_URL}cdn/12.20.1/data/pt_BR/champion/';

String URL_IMGSQUARE = '${DATA_DRAGON_URL}cdn/12.20.1/img/champion/';

String URL_IMGSPLASHART = '${DATA_DRAGON_URL}cdn/img/champion/splash/';

String URL_ITENSIMAGE = '${DATA_DRAGON_URL}cdn/12.21.1/img/item/';

String URL_SUMMONERSPELLS =
    '${DATA_DRAGON_URL}cdn/12.21.1/data/pt_BR/summoner.json';

String URL_IMGSPELLSSUMMONER = '${DATA_DRAGON_URL}cdn/12.21.1/img/spell/';
