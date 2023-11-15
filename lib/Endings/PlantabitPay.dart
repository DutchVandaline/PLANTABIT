import 'package:PlanTodo/Screens/ErrorPopUp.dart';
import 'package:PlanTodo/Endings/PlantPayApp.dart';
import 'package:flutter/material.dart';

class PlantabitPay extends StatefulWidget {
  @override
  State<PlantabitPay> createState() => _PlantabitPayState();
}

class _PlantabitPayState extends State<PlantabitPay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).indicatorColor,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "PLANTABIT PAY",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 23.0,
                        fontFamily: 'BlackHanSans'),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) => PlantPayApp());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 60.0,
                      color: Theme.of(context).accentColor,
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.subtitle1,
                            children: [
                              TextSpan(
                                  text: "PLANTPAY ",
                                  style: TextStyle(fontFamily: 'BlackHanSans')),
                              TextSpan(
                                  text: "앱으로 결제",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Future.delayed(Duration(milliseconds: 250), () {
                        _showDialog();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 60.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Theme.of(context).primaryColorLight,
                      )),
                      child: Center(
                        child: Text(
                          "앱 없이 결제",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "결제 후, 아래 버튼을 눌러주세요.",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 60.0,
                        color: Color(0xFF555555),
                        child: Center(
                          child: Text(
                            "결제 완료",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return ErrorPopUp(
            inputString: "알 수 없는 오류가 발생했습니다.",);
        });
  }
}
