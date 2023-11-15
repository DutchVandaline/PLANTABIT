import 'package:PlanTodo/Endings/StoryLine.dart';
import 'package:PlanTodo/Endings/TermsScreen.dart';
import 'package:PlanTodo/Endings/TestScreen.dart';
import 'package:PlanTodo/Endings/TrackScreen.dart';
import 'package:PlanTodo/Modules/PlantNotifier.dart';
import 'package:PlanTodo/Screens/PlantHistoryScreen.dart';
import 'package:PlanTodo/Widgets/TodoListTile.dart';
import 'package:flutter/material.dart';
import 'package:PlanTodo/Widgets/PlantWidget.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:provider/provider.dart';
import 'AddTodoScreen.dart';

bool trackVisibility = true;
bool trackAgreed = false;
bool showAgreement = false;
int i = 0;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0.0,
            shadowColor: Colors.transparent,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          inputPage: PlantHistoryScreen(),
                          outputPage: this.widget));
                },
                icon: Icon(
                  Icons.attach_file,
                  color: Theme.of(context).primaryColorLight,
                  size: 30,
                )),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddTodoScreen()));
                  },
                  icon: Icon(
                    Icons.add_outlined,
                    color: Theme.of(context).primaryColorLight,
                    size: 30,
                  )),
            ],
          ),
          body: Container(
            height: screenHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: trackAgreed,
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: Provider.of<PlantNotifier>(context).getPlant(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return Consumer<PlantNotifier>(
                              builder: (context, currentplant, child) {
                            if (currentplant.growingplant.length == 0) {
                              return PlantDummyWidget();
                            } else {
                              return PlantWidgetSub(
                                currentPlant: currentplant.growingplant.last,
                                fromNewScreen: false,
                              );
                            }
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.12,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "지금 클릭해서 인공지능이 분석하는\n",
                                        style: TextStyle(fontSize: 15.0)),
                                    TextSpan(
                                        text: "무료 성격 검사 받기!",
                                        style: TextStyle(
                                            fontFamily: 'BlackHanSans',
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.normal)),
                                    TextSpan(
                                        text:
                                            "\n인공지능은 이 앱에 없습니다. 뭐, 요즘 난리인게 인공지능이니\n인공지능이 분석해준다고 하면 클릭하겠죠?",
                                        style: TextStyle(
                                            fontSize: 8.0,
                                            color: Colors.grey.shade300)),
                                  ])),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: trackAgreed,
                  child: Expanded(
                    child: FutureBuilder(
                        future:
                            Provider.of<TodoNotifier>(context, listen: false)
                                .getTodo(),
                        builder: (context, AsyncSnapshot snapshot) {
                          return Scaffold(
                            body: Consumer<TodoNotifier>(
                              builder: (context, todoData, child) {
                                return todoData.whatTodoes.length <= 0
                                    ? Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '할일이 없습니다',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 20.0,
                                                  fontWeight:
                                                      FontWeight.normal),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: todoData.whatTodoes.length,
                                        itemBuilder: (context, index) {
                                          final i = index;
                                          final todoitem =
                                              todoData.whatTodoes[i];
                                          return TodoListTile(
                                            whatTodo: todoitem,
                                            fromNewScreen: false,
                                          );
                                        });
                              },
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: trackVisibility,
          child: Align(
            alignment: Alignment.center,
            child: TrackScreen(
              trackWidgetSubTextInput: trackWidgetSubText[i],
              trackWidgetTitleInput: trackWidgetTitle[i],
            ),
          ),
        ),
        Visibility(
            visible: showAgreement,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "동의가 없으면 사용 가능한 기능이 없습니다.\n모든 앱들이 그렇듯 말이죠.",
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsScreen()));
                      },
                      child: Container(
                        width: 200.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                            child: Text(
                          "동의하러 가기",
                          style: Theme.of(context).textTheme.subtitle1,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget inputPage;
  final Widget outputPage;

  CustomPageRoute({required this.outputPage, required this.inputPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              inputPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(1.0, 0.0),
                ).animate(animation),
                child: outputPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: inputPage,
              )
            ],
          ),
        );
}

class CustomPageRightRoute extends PageRouteBuilder {
  final Widget inputPage;
  final Widget outputPage;

  CustomPageRightRoute({required this.outputPage, required this.inputPage})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              inputPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: outputPage,
              ),
              SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: inputPage,
              )
            ],
          ),
        );
}
