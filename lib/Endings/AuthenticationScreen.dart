import 'package:PlanTodo/Screens/HomeScreen.dart';
import 'package:PlanTodo/Screens/MessagePopUp.dart';
import 'package:flutter/material.dart';

bool systemVisible = true;
String inputAuth = "";
String inputNumber = "";

class AuthenticationScreen extends StatefulWidget {
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation =
      Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero)
          .animate(_controller);

  @override
  void initState() {
    systemVisible = true;
    inputAuth = "";
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      child: Text(
                        "전화번호를 입력하고,\n본인 인증하세요.",
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    child: Center(
                      child: Container(
                        child: Text(
                          "당신의 심리적 안정을 위해 의미없는 본인 인증을 준비했습니다. 한결 안전한 느낌이 들죠.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey.shade600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(13.0)),
                                child: TextField(
                                  onChanged: (text) {
                                    inputNumber = text;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    hintText: "-를 제외하고 전화번호를 입력하세요.",
                                  ),
                                  cursorColor: Theme.of(context).accentColor,
                                  autofocus: false,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      systemVisible = false;
                                    });
                                    if (_controller.status ==
                                        AnimationStatus.dismissed) {
                                      Future.delayed(Duration(seconds: 1), () {
                                        _controller.forward();
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(child: Text("전송")),
                                    ),
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(13.0)),
                            child: TextField(
                              onChanged: (text) {
                                inputAuth = text;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                hintText: "인증번호를 입력하세요.",
                              ),
                              cursorColor: Theme.of(context).accentColor,
                              autofocus: false,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              if (inputAuth == "225427") {
                                print('맞습니다');
                              } else {
                                print('아닙니다');
                              }
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                  (route) => false);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(child: Text("완 료")),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SlideTransition(position: _offsetAnimation, child: MessagePopUp()),
      ],
    );
  }
}
