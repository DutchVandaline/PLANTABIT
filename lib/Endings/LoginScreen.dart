import 'package:PlanTodo/Endings/AuthenticationScreen.dart';
import 'package:PlanTodo/Endings/SignupScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).indicatorColor,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(13.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "LOG IN",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 25.0, fontFamily: 'AbrilFatface'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Email",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 20.0,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        onChanged: (text) {},
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          hintText: "가입한 이메일을 입력하세요.",
                        ),
                        cursorColor: Theme.of(context).accentColor,
                        autofocus: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Password",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 20.0,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          hintText: "비밀번호를 입력하세요.",
                        ),
                        cursorColor: Theme.of(context).accentColor,
                        autofocus: false,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            "LOGIN",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) => SignUpScreen());
                        },
                        child: Text(
                          "Plantabit 통합 계정이 없으신가요?",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
