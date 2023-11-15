import 'package:PlanTodo/Endings/BuyBottomSheet.dart';
import 'package:PlanTodo/Screens/ErrorPopUp.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).indicatorColor,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sign-Up",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 25.0, fontFamily: 'AbrilFatface'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/monstera.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(child: Text("회원가입을 위해서는 PLANT 통합앱 설치가 필요합니다."))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) => BuyBottomSheet(
                              inputName: "플랜태빗 하이퍼", inputPrice: 8140));
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "",
                              style: TextStyle(
                                  fontSize: 60.0, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(fontSize: 17.0),
                                    children: [
                                  TextSpan(text: "Download at the\n"),
                                  TextSpan(
                                      text: "App Store",
                                      style: TextStyle(
                                          fontSize: 30.0, height: 0.9)),
                                ]))
                          ],
                        )),
                  )),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
