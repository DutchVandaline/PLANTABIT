import 'dart:ui';
import 'package:flutter/material.dart';

class MessagePopUp extends StatefulWidget {
  @override
  State<MessagePopUp> createState() => _MessagePopUpState();
}

class _MessagePopUpState extends State<MessagePopUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: Theme.of(context).indicatorColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(13.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 66.0,
                        child: CircleAvatar(
                          radius: 22.0,
                          backgroundColor: Colors.grey.shade400,
                          child: Text(
                            "플",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF60c852),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Center(
                          child: Icon(
                            Icons.chat_bubble,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "플랜태빗",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                        Text(
                          "[Web발신]\n[PLANTABIT] 인증번호 [225427]를 입력해주세요.",
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
