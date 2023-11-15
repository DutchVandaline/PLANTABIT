import 'package:PlanTodo/Endings/StoryLine.dart';
import 'package:PlanTodo/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        messageText.add(
          "이 앱은 당신이 원하지 않는 \'동의\' 없이도 사용 가능합니다. 이게 당신이 원하는 앱의 모습인가요?",
        );
      });
    })
        .then((value) => Future.delayed(Duration(seconds: 4), () {
              setState(() {
                messageText.add(
                  "그저 돈을 내고 타인과 대화를 나누는 가장 기초적이고 재미없는 앱이?",
                );
              });
            }))
        .then((value) => Future.delayed(Duration(seconds: 4), () {
              setState(() {
                messageText.add(
                  "개인 정보 활용에 동의하시면, 더욱 많은 서비스를 제공합니다. 자, 이제 돌아가서 다시 그 빨간 버튼을 누르고 허용을 선택하세요.",
                );
              });
            }))
        .then((value) => Future.delayed(Duration(seconds: 4), () {
              setState(() {
                messageText.add(
                  "그러면 제가 준비한 선물이 나올 겁니다. 재시작 하려면 상단의 시스템 아이콘을 누르세요.",
                );
              });
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        backgroundColor: Theme.of(context).hoverColor,
        elevation: 1.0,
        toolbarHeight: 90.0,
        leading: Icon(
          Icons.arrow_back_ios,
          size: 30.0,
          color: Color(0xFF3b82ed),
        ),
        title: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false);
              },
              child: Icon(
                Icons.account_circle,
                size: 60.0,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                "SYSTEM >",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 11.0),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
            itemCount: messageText.length,
            itemBuilder: (BuildContext context, int index) {
              if (index < 0) {
                return SizedBox(
                  height: 0.0,
                );
              } else {
                if (index == 0 || index == 1) {
                  return Center(
                      child: Text(
                    messageText[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 13.0),
                  ));
                } else {
                  return MessageBubble(
                    inputindex: index,
                  );
                }
              }
            }),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        color: Theme.of(context).dividerColor,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColorDark,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    child: Icon(
                      Icons.camera_alt,
                      color: Color(0xFF555555),
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    child: Icon(
                      Icons.insert_link,
                      color: Color(0xFF555555),
                      size: 44.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Text Message",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: Colors.grey),
                                ),
                                CircleAvatar(
                                  child: Icon(
                                    Icons.arrow_upward,
                                    size: 20.0,
                                  ),
                                  backgroundColor: Colors.green,
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final int inputindex;
  MessageBubble({required this.inputindex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 3.0, left: 15.0, bottom: 3.0, right: 100.0),
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(messageText[inputindex]),
          )),
    );
  }
}
