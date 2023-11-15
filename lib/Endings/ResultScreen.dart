import 'package:PlanTodo/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.teal,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("당신의 성격 유형은..."),
                  Text(
                    "OTCP - IS",
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "AbrilFatface"),
                  ),
                  Text("의미없고 있어보이는 네 알파벳입니다!"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1.1,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "성격 유형 : \"비범해지고 싶은 평범한 사람\"",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "\"비범해지고 싶은 평범한 사람\"의 유형은 진정한 일반인이라고 할 수 있습니다. 주변에 친구가 있지만 친한 친구는 많지 않으며, 소중한 친구들에게 신경을 쏟습니다. 계획을 세우는 날에는 계획을 잘 이행하지만, 까먹고 계획을 세우지 않은 날은 이행하지 못하죠. "),
                    ),
                    ResultScreenWidget(
                      inputTitle: "극심한 고통으로부터의 탈피",
                      inputDescription:
                          "이들은 극심한 고통이 있을 때는 회피하려고 하는 경향이 있습니다. 따라서 자신만의 선을 넘은 고통이 가해지면 그 자리에서 벗어나거나 상대와의 자리에서 끝까지 버팁니다. 때로는 어디로 튈지 모르는 생각을 하곤 합니다.",
                    ),
                    ResultScreenWidget(
                      inputTitle: "진로에 대한 고민",
                      inputDescription:
                          "만약, 나이가 어리거나 대학생이라면 진로 혹은 인생에 대한 고민을 가집니다. 미래에 대한 불확실성이 때로는 스스로를 심연에 가두기도하죠. 해당 감정은 오래 가기도 하고 오래 가지 않기도 합니다. 이는 누구와 함께 있느냐에 따라서 달라지죠.\n\n 주변에서는 당신을 보며 당신만의 매력을 가졌다고 합니다. 당신만의 매력을 발견하고, 밀고 나가세요. 어느 순간 당신을 꽃밭을 걷고 있을 것입니다.",
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "당신과 유형이 같은 유명인",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ResultTile(inputname: "스티브 잡스"),
                              ResultTile(inputname: "세종대왕"),
                              ResultTile(inputname: "스탠리 큐브릭"),
                              ResultTile(inputname: "토니 스타크"),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text("솔직히 저도 모릅니다. 위 사람들은 가상의 인물이거나 해당 검사를 받아본 적이 없기 때문이죠!", textAlign: TextAlign.center,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false);
              },
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(child: Text("돌아가기")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultTile extends StatelessWidget {
  final String inputname;

  ResultTile({required this.inputname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.height * 0.19,
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Icon(Icons.account_circle, size: 80.0,),
            ),
            Text(inputname),
          ],
        ),
      ),
    );
  }
}

class ResultScreenWidget extends StatelessWidget {
  final String inputTitle;
  final String inputDescription;
  ResultScreenWidget(
      {required this.inputTitle, required this.inputDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputTitle,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(inputDescription),
        ],
      ),
    );
  }
}
