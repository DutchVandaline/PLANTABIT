import 'DataBase/DataBase.dart';
import 'DataBase/PlantDataBase.dart';

String plantName = "몬스테라";
String plantEngName = 'Monstera';
String plantDetail =
    "열대 아메리카에서 자생하는 몬스테라(Monstera)는 잎의 독특한 문양이 특징입니다. 성숙한 몬스테라의 경우 군데 군데 구멍이 있으며, 지름 1m 정도의 둥근 모양입니다. 종에 따라 갈라진 잎이 자라나기도, 하나의 잎이 생장 과정에서 갈라지기도 합니다. 멕시코가 원산지인 이 식물은 습기가 많은 곳에서 잘 자라며, 열매가 맺히기도 합니다.";

List<Plant> plantList = [
  Plant(
    fullState: 0,
    currentState: 0,
    startingdate: "",
  ),
];

List<String> exceptionList = [
  "usetumbler",
  "nostrawget",
  "useecobag",
  "reduceOnceUse",
  "getmobilereciept"
];

String fightClubWhatTodo = "🥊 파이트클럽";
String fightClubMemo = """
The first rule of Fight Club is you do not talk about Fight Club.
The second rule of Fight Club is: you DO NOT talk about Fight Club!
Third rule of Fight Club: someone yells \"stop!\", goes limp, taps out, the fight is over.
Fourth rule: only two guys to a fight.
Fifth rule: one fight at a time, fellas.
Sixth rule: No shirts, no shoes.
Seventh rule: fights will go on as long as they have to.
And the eighth and final rule: if this is your first time at Fight Club, you have to fight.""";

List defaultInput = [
  WhatTodo(
    id: "usetumbler",
    whatTodo: "🌿 일회 • 다회용 용기 대신 텀블러 사용하기",
    finished: 0,
    waterStat: 13,
    nutritionStat: 7,
    pointStat: 10,
    show: 0,
    changedDate: "20211210",
    memo:
        "텀블러 사용을 일상화합시다. 텀블러를 이용하면, 200~300원 정도 할인해주는 매장이 많습니다. 일회용 • 다회용 용기보다 보온, 보냉 효과가 뛰어냐며 쓰레기가 발생하지 않아 친환경적입니다.",
  ),
  WhatTodo(
    id: "nostrawget",
    whatTodo: "🪴 플라스틱 빨대 받지 않기",
    finished: 0,
    waterStat: 13,
    nutritionStat: 7,
    pointStat: 10,
    show: 0,
    changedDate: "20211210",
    memo:
        "플라스틱 빨대 사용을 최소화합시다. 플라스틱은 한때 신의 선물이라고 불렸습니다. 이제는 플라스틱이 사용되지 않은 물건을 찾아보기가 힘들죠. 플라스틱은 환경 호르몬이 발생합니다. 또한, 미세 플라스틱이 되어서 우리 몸에 축적되죠.",
  ),
  WhatTodo(
    id: "useecobag",
    whatTodo: "🌱 에코백 사용하기",
    finished: 0,
    waterStat: 8,
    nutritionStat: 12,
    pointStat: 10,
    show: 0,
    changedDate: "20211210",
    memo:
        "에코백은 패션의 아이템이자, 환경을 보호할 수 있는 좋은 도구입니다. 비닐, 종이 혹은 플라스틱으로 만들어진 가방 대신, 에코백에 담아서 환경을 보호해주세요.",
  ),
  WhatTodo(
    id: "getmobilereciept",
    whatTodo: "🌲 전자영수증으로 받기",
    finished: 0,
    waterStat: 8,
    nutritionStat: 12,
    pointStat: 10,
    show: 0,
    changedDate: "20211210",
    memo:
        "종이 영수증 대신 전자 영수증으로 수령해주세요! 전자 영수증을 수령하면 불필요한 종이 낭비를 막을 수 있습니다. 또한, 언제 어디서나 지출 내역을 확인할 수 있기 때문에 경제적인 소비가 가능해요! ",
  ),
];

List<String> todoSampleList = [
  "📖 자기 전에 책 읽기",
  "💪 운동하기",
  "🎬 매일 영화보기",
  "✒️ 매일 글쓰기",
  "📑 공부하기",
  "💋 집중하기",
  "🍺 술 마시지 않기"
];
