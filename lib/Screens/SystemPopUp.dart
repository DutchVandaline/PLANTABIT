import 'dart:ui';
import 'package:flutter/material.dart';

class SystemPopUp extends StatefulWidget {
  final String inputString;
  SystemPopUp({required this.inputString});

  @override
  State<SystemPopUp> createState() => _SystemPopUpState();
}

class _SystemPopUpState extends State<SystemPopUp> {
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
                //height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(13.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      maxLines: 4,
                      textAlign: TextAlign.start,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "System > ",
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontFamily: 'NanumGothicCoding',
                                    height: 1.3,
                                    fontSize: 15.0)),
                        TextSpan(
                            text: widget.inputString,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'NanumGothicCoding',
                                    height: 1.3,
                                    fontSize: 15.0))
                      ])),
                )),
          ),
        ),
      ),
    );
  }
}
