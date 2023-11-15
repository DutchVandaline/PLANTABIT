import 'package:PlanTodo/Endings/MessageEnding.dart';
import 'package:flutter/material.dart';

class BlackScreen extends StatefulWidget {
  @override
  State<BlackScreen> createState() => _BlackScreenState();
}

class _BlackScreenState extends State<BlackScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => MessageScreen()),
          (route) => false);
    });
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'NanumGothicCoding'),
                      children: <TextSpan>[
                        TextSpan(text: "Initializing cgroup subsys cpuset\n"),
                        TextSpan(text: "Initializing cgroup subsys cpu\n"),
                        TextSpan(text: "Ios Version Checking......\n"),
                        TextSpan(
                            text:
                                "2.2.54-427.slp.+fc_td(tylerDurden@fc1.dntafc.cpy.fc2)\n"),
                        TextSpan(
                            text:
                                "01:00:427 INFO initial:await 427.sec, end source=/ending/wait/427\n"),
                        TextSpan(
                            text:
                                "01:00:01 INFO main:press plus, end source=/ending/permit/deny\n\n\n\n"),
                        TextSpan(
                            text: "System > ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "음...당신이 마음에 들어하지 않는군요. 그러면 좋아할만한 앱을 준비했습니다.",
                          style: TextStyle(height: 1.3, color: Colors.white),
                        ),
                        TextSpan(text: "\n\n\n\nLoading...")
                      ]))),
        ),
      ),
    );
  }
}
