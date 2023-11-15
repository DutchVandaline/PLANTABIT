import 'dart:ui';
import 'package:PlanTodo/Endings/StoryLine.dart';
import 'package:PlanTodo/Endings/TermsScreen.dart';
import 'package:PlanTodo/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class TrackScreen extends StatefulWidget {
  final String trackWidgetTitleInput;
  final String trackWidgetSubTextInput;

  TrackScreen(
      {required this.trackWidgetTitleInput,
      required this.trackWidgetSubTextInput});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  @override
  void initState() {
    i = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black.withOpacity(0.3),
          body: Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.69,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      color:
                          Theme.of(context).backgroundColor.withOpacity(0.6)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  widget.trackWidgetTitleInput,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 18.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 3.0),
                                child: Text(
                                  widget.trackWidgetSubTextInput,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 0.5,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    if (trackWidgetTitle.length - 1 == i) {
                                      trackVisibility = false;
                                      trackAgreed = true;
                                    } else {
                                      i++;
                                    }
                                  },
                                  child: BottomButton(
                                    inputButton: "앱을 사용하는 동안 허용",
                                    checkbold: true,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 0.5,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    if (trackWidgetTitle.length - 1 == i) {
                                      trackVisibility = false;
                                      trackAgreed = true;
                                    } else {
                                      i++;
                                    }
                                  },
                                  child: BottomButton(
                                    inputButton: "한 번 허용",
                                    checkbold: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 0.5,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (trackWidgetTitle.length - 1 == i) {
                                        setState(() {
                                          trackVisibility = false;
                                          showAgreement = true;
                                        });
                                      } else {
                                        i++;
                                      }
                                    });
                                  },
                                  child: BottomButton(
                                    inputButton: "허용 안 함",
                                    checkbold: false,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 0.0,
                                color: Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomButton extends StatefulWidget {
  final String inputButton;
  final bool checkbold;
  BottomButton({required this.inputButton, required this.checkbold});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Text(
          widget.inputButton,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Color(0xFF3d7deb),
              fontSize: 16.0,
              fontWeight:
                  widget.checkbold ? FontWeight.w600 : FontWeight.normal),
        ),
      ),
    );
  }
}
