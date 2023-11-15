import 'package:PlanTodo/Endings/AddPurchaseScreen.dart';
import 'package:PlanTodo/Endings/BuyBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantabitPremium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).indicatorColor,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 8.0),
                    child: Text(
                      "시도 떄도 없이 등장하는 결제창!",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).primaryColorLight,
                    width: 1.2,
                  )),
                ),
              ),
              PremiumSelect(
                inputName: "Plus Plantabit",
                inputPrice: 7900,
                beforePrice: 79000,
                inputPremium: [
                  PremiumListWidget(
                    inputPremium: "앱 내의 모든 화면에 무제한 접근합니다!",
                  ),
                  PremiumListWidget(
                    inputPremium: "광고는 없지만, 광고를 제거합니다!",
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              PremiumSelect(
                inputName: "Premium Plantabit",
                inputPrice: 12800,
                beforePrice: 128000,
                inputPremium: [
                  PremiumListWidget(
                    inputPremium: "앱 내의 모든 화면에 무제한 접근합니다!",
                  ),
                  PremiumListWidget(
                    inputPremium: "광고는 없지만, 광고를 제거합니다!",
                  ),
                  PremiumListWidget(
                    inputPremium: "Plus와 크게 차이없는 구성입니다!",
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              PremiumSelect(
                inputName: "Supreme Plantabit",
                inputPrice: 18900,
                beforePrice: 189000,
                inputPremium: [
                  PremiumListWidget(
                    inputPremium: "광고는 없지만, 광고를 제거합니다!",
                  ),
                  PremiumListWidget(
                    inputPremium: "앱 내의 모든 화면에 무제한 접근합니다!",
                  ),
                  PremiumListWidget(
                    inputPremium: "언제나 그렇듯, 바뀌는 건 없습니다!",
                  ),
                  PremiumListWidget(
                    inputPremium: "엄청난 선택이라고 생각하게 만드는 비용!",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Text(
                  "아래에 적혀있는, 작아서 읽지도 못하는 글귀입니다. 솔직히 이 부분까지 읽어보지 않기 때문에 무슨 내용이 있는지는 잘 모르겠습니다.",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 10.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "This context is written in English for fascination",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 12.0),
              ),
              Divider(
                color: Colors.grey,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    children: [
                      Text(
                        "What Is This App?",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 12.0),
                      ),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Full of sarcasm",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 13.0, decoration: TextDecoration.underline),
                        ),
                        TextSpan(
                          text: " and ",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 13.0),
                        ),
                        TextSpan(
                          text: "Filled with satire",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 13.0, decoration: TextDecoration.underline),
                        ),
                      ])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumSelect extends StatelessWidget {
  final String inputName;
  final int inputPrice;
  final int beforePrice;
  final List<Widget> inputPremium;
  PremiumSelect(
      {required this.inputName,
      required this.inputPremium,
      required this.inputPrice,
      required this.beforePrice});

  @override
  Widget build(BuildContext context) {
    final value = new NumberFormat("#,##0", "en-US");

    return Column(
      children: [
        Container(
          child: Text(
            inputName,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontFamily: 'Pushster',
                fontWeight: FontWeight.normal,
                fontSize: 25.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Column(
          children: inputPremium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) => AddPurchaseScreen(inputPrice: inputPrice, inputName: inputName));
            },
            child: Container(
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(100.0)),
              child: Center(
                  child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "₩${value.format(inputPrice)} ",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "₩${value.format(beforePrice)}",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Color(0xFF444444),
                        fontSize: 15.0,
                        decoration: TextDecoration.lineThrough),
                  )
                ]),
              )),
            ),
          ),
        )
      ],
    );
  }
}

class PremiumListWidget extends StatelessWidget {
  final String inputPremium;
  PremiumListWidget({required this.inputPremium});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check,
            color: Colors.green,
          ),
          Text(
            " $inputPremium",
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
