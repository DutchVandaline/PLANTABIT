import 'package:PlanTodo/Modules/PlantNotifier.dart';
import 'package:PlanTodo/Screens/PlantHistoryScreen.dart';
import 'package:PlanTodo/Widgets/TodoListTile.dart';
import 'package:flutter/material.dart';
import 'package:PlanTodo/Widgets/PlantWidget.dart';
import 'package:PlanTodo/Modules/TodoNotifier.dart';
import 'package:provider/provider.dart';
import 'AddTodoScreen.dart';

bool trackVisibility = true;
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
                Column(
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
                  ],
                ),
                Expanded(
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
              ],
            ),
          ),
        ),
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
