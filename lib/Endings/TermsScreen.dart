import 'dart:convert';
import 'package:PlanTodo/Endings/AuthenticationScreen.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:PlanTodo/Screens/HomeScreen.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../ListInput.dart';
import '../Screens/ErrorPopUp.dart';

bool _ischecked = false;

class TermsScreen extends StatefulWidget {
  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  void initState() {
    _ischecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Terms of Service",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontFamily: 'AbrilFatface', fontSize: 25.0)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Column(
                    children: [
                      TermsWidget(
                        termstitle: "a. 개인 정보",
                        termsWords:
                            "(주)PLANTABIT의 개인 정보 방침과 관련된 내용입니다. 아주 작은 글씨로, 사용자를 압도할만큼 많은 양의 글로 도배된 이 화면은 여러분의 예상대로 약관 항목입니다. 여러분은 원래 하던대로 읽지 않고 동의를 해 주시면 됩니다. 중요한 내용은 여기에 포함되어있지 않을테니까요. 이 약관은 별 내용 아닙니다. 그저 여러분의 개인정보를 합법적으로 수집하고 다양한 곳에 활용하기 위함이죠. 앱 사용을 위해서는 원칙적으로 동의하셔야합니다. 약관에 동의하지 않는다면 앱을 사용할 이유가 없죠. 가장 중요한 내용은 마지막 항목에 있습니다.",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: _ischecked,
                              onChanged: (value) {
                                setState(() {
                                  _ischecked = value!;
                                });
                              }),
                          Text(
                            "(선택) 상기 내용을 이해했으며, 약관에 동의합니다.",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontSize: 14.0),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TermsWidget(
                        termstitle: "b. 정보의 사용",
                        termsWords:
                            "수집된 개인 정보는 (주)PLANTABIT이 운영되는데 사용되며, 정보가 배포될 예정입니다. 그러나, (주)PLANTABIT이란 존재하지 않으며, 여러분의 개인정보가 저장될 저장소 또한 부재합니다. 일부러 한자어들을 사용해서 알아듣지 못하게 작성했습니다. 가장 중요한 내용은 마지막 항목에 있습니다.",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: _ischecked,
                              onChanged: (value) {
                                setState(() {
                                  _ischecked = value!;
                                });
                              }),
                          Text(
                            "(선택) 상기 내용을 이해했으며, 약관에 동의합니다.",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontSize: 14.0),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TermsWidget(
                        termstitle: "c. 마케팅 동의",
                        termsWords:
                            "마케팅 내용에 대한 약관입니다. (주)PLANTABIT은 마케팅팀이 부재하여 마케팅이 불가한 상태입니다. 애초에 (주)PLANTABIT이 존재하지 않기 떄문이죠. 이 약관은 그저 거짓에 불과합니다. 여러분은 여러분의 개인정보를 보호할 권리가 있습니다. 최근에는 계정을 만들거나 앱을 사용할 때 무조건 약관에 동의해야하는 경우가 많이 있습니다. 그러나, 선택지가 없는 선택은 강압이며, 폭력입니다. 당신의 개인정보를 보호하세요. 지금 이 앱은 당신의 개인정보를 가져가려고 합니다. 조금 더 길게 쓰기 위해 위의 내용을 복사/붙여넣기 하겠습니다. 아주 작은 글씨로, 사용자를 압도할만큼 많은 양의 글로 도배된 이 화면은 여러분의 예상대로 약관 항목입니다. 여러분은 원래 하던대로 읽지 않고 동의를 해 주시면 됩니다. 중요한 내용은 여기에 포함되어있지 않을테니까요. 이 약관은 별 내용 아닙니다. 그저 여러분의 개인정보를 합법적으로 수집하고 다양한 곳에 활용하기 위함이죠. 앱 사용을 위해서는 원칙적으로 동의하셔야합니다. 약관에 동의하지 않는다면 앱을 사용할 이유가 없죠. 이 앱에서는 (필수)에 동의하지 않아도 됩니다.",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: _ischecked,
                              onChanged: (value) {
                                setState(() {
                                  _ischecked = value!;
                                });
                              }),
                          Text(
                            "(선택) 상기 내용을 이해했으며, 약관에 동의합니다.",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontSize: 14.0),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: GestureDetector(
              onTap: () {
                if (_ischecked) {
                  setState(() {
                    trackAgreed = true;
                    showAgreement = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthenticationScreen()));
                } else {
                  _showDialog();
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(child: Text("다음으로")),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return ErrorPopUp(
            inputString: "사실 아무런 오류도 없지만 약관에 동의하게 만드는 수법입니다.",
          );
        });
  }

  void saveFightClub(BuildContext context) {
    DateTime now = DateTime.now();
    String id = memosha512(now.toString());
    String changedState = DateFormat('yyyyMMdd').format(now);
    Provider.of<TodoNotifier>(context, listen: false).addTodo(
      id,
      fightClubWhatTodo,
      0,
      100,
      100,
      0,
      0,
      changedState,
      fightClubMemo,
    );
    Navigator.pop(context);
  }

  String memosha512(String text) {
    var bytes = utf8.encode(text);
    var digest = sha512.convert(bytes);
    return digest.toString();
  }
}

class TermsWidget extends StatefulWidget {
  final String termstitle;
  final String termsWords;

  TermsWidget({
    required this.termstitle,
    required this.termsWords,
  });

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.termstitle,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).primaryColorLight)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.termsWords,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 15.0, color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
