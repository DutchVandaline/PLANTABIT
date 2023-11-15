import 'package:PlanTodo/Endings/AnalysisScreen.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("성격 유형 검사"),
      ),
      body: ListView(
        children: [
          ListViewCard(
            inputQuestion: "당신은 사람들을 만나는 걸 선호하나요?",
            inputAnswer1: "선호한다",
            inputAnswer2: "선호하지 않는다",
          ),
          ListViewCard(
            inputQuestion: "많은 사람들과 있을 때, 주로 어디에 위치하나요?",
            inputAnswer1: "사람들이 둘러싸고 있는 중간",
            inputAnswer2: "사람들과 떨어진 모서리",
          ),
          ListViewCard(
            inputQuestion: "계획을 세우나요?",
            inputAnswer1: "계획을 잘 세워요!",
            inputAnswer2: "계획을 세우지 않아요!",
          ),
          ListViewCard(
            inputQuestion: "세운 계획을 잘 이행하나요?",
            inputAnswer1: "계획을 잘 이행해요!",
            inputAnswer2: "아니요, 이행하지 않아요.",
          ),
          ListViewCard(
            inputQuestion: "감정적인 편인가요?",
            inputAnswer1: "네, 감수성이 풍부해요.",
            inputAnswer2: "아니요, 이성적이에요.",
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AnalysisScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(child: Text("분석하기")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

bool _pressedState1 = false;
bool _pressedState2 = false;

class ListViewCard extends StatefulWidget {
  final String inputQuestion;
  final String inputAnswer1;
  final String inputAnswer2;

  ListViewCard(
      {required this.inputQuestion,
      required this.inputAnswer1,
      required this.inputAnswer2});

  @override
  State<ListViewCard> createState() => _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
  @override
  void initState() {
    _pressedState2 = false;
    _pressedState1 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(widget.inputQuestion),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!_pressedState1) {
                        _pressedState1 = true;
                        _pressedState2 = false;
                      } else {
                        _pressedState1 = false;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: _pressedState1
                          ? Theme.of(context).accentColor
                          : Theme.of(context).cardColor,
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 3.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    duration: Duration.zero,
                    child: Center(child: Text(widget.inputAnswer1)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!_pressedState2) {
                        _pressedState2 = true;
                        _pressedState1 = false;
                      } else {
                        _pressedState2 = false;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: _pressedState2
                          ? Theme.of(context).accentColor
                          : Theme.of(context).cardColor,
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 3.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    duration: Duration.zero,
                    child: Center(child: Text(widget.inputAnswer2)),
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
