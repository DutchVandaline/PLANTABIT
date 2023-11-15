import 'package:PlanTodo/Endings/PlantabitPay.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPurchaseScreen extends StatelessWidget {
  final int inputPrice;
  final String inputName;

  AddPurchaseScreen({required this.inputName, required this.inputPrice});

  @override
  Widget build(BuildContext context) {
    final value = new NumberFormat("#,##0", "en-US");

    return Container(
      color: Theme.of(context).indicatorColor,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(inputName,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Plantabit 2022",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade400)),
                      ),
                      PayWidget(
                        inputName: "총 결제 금액",
                        inputPrice: "₩${value.format(inputPrice)}",
                        inputStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("PLANTABIT PAY"),
                                  Text(
                                    "🪙 0P",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          PayWidget(
                              inputName: "할인 전 금액",
                              inputPrice: "₩7,400",
                              inputStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 15.0,
                                      color: Colors.grey.shade500)),
                          PayWidget(
                              inputName: "부가가치세",
                              inputPrice: "₩740 ",
                              inputStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 15.0,
                                      color: Colors.grey.shade500)),
                          PayWidget(
                              inputName: "할인액",
                              inputPrice: "-₩0 ",
                              inputStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 15.0,
                                      color: Colors.grey.shade500)),
                          Divider(
                            color: Colors.grey,
                          ),
                          PayWidget(
                            inputName: "총 결제 금액",
                            inputPrice: "₩${value.format(inputPrice)}",
                            inputStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20.0),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "아래에 적혀있는, 작아서 읽지도 못하는 글귀입니다. 솔직히 이 부분까지 읽어보지 않기 때문에 무슨 내용이 있는지는 잘 모르죠. 참고로 이 화면은 가짜입니다.\n아무거나 누르세요. 결재 안됩니다.",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 10.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) => PlantabitPay());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              "PLANTABIT PAY로 결제하기",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "What Is This App?",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontSize: 13.0),
                          ),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: "Full of sarcasm",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      fontSize: 13.0,
                                      decoration: TextDecoration.underline),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      fontSize: 13.0,
                                      decoration: TextDecoration.underline),
                            ),
                          ])),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PayWidget extends StatelessWidget {
  final String inputName;
  final String inputPrice;
  final TextStyle inputStyle;

  PayWidget(
      {required this.inputName,
      required this.inputPrice,
      required this.inputStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            inputName,
            style: inputStyle,
          ),
          Text(
            inputPrice,
            style: inputStyle,
          ),
        ],
      ),
    );
  }
}
