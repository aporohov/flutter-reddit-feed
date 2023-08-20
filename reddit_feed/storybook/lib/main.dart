import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_feed/widgets/components/dark_theme_button.dart';
import 'package:reddit_feed/widgets/components/empty_screen.dart';
import 'package:reddit_feed/widgets/components/post.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final _plugins = initializePlugins(
  contentsSidePanel: true,
  enableThemeMode: false,
  knobsSidePanel: true,
  initialDeviceFrameData: DeviceFrameData(
    device: Devices.android.samsungGalaxyNote20,
  ),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Storybook(
      wrapperBuilder: (context, child) => Theme(
          data: ThemeData(
            primaryColor: Colors.purple,
          ),
          child: child!),
      initialStory: 'Post',
      plugins: _plugins,
      stories: [
        Story(
          name: 'Post',
          builder: (context) => Container(
            color: Colors.grey[300],
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Post(
                        thumbnail: context.knobs.text(
                            label: 'URL кртинки',
                            initial:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9oNlnodAXSBRyn8J-AhuyOmjCIO92oJaPE07Wj14kTyTdsGpUksU-3bAzRoox5oY__tE&usqp=CAU'),
                        title: context.knobs.text(
                            label: 'Заголовок',
                            initial:
                                'Mastering Deep Linking in Flutter: A Comprehensive Guide for Android & iOS'),
                        selftext: context.knobs.text(
                            label: 'Описание',
                            initial:
                                "Hey all, I am building a Flutter app and I need to implement a voice to text feature while the speech to text library works perfectly for ios. It's not working for Android. It automatically closes the mic after 2 sec. I tried to implement an automatic closing and opening of mic but it's worsening the app. All the while it works perfectly for ios. Any other library/ different approach I can use that works for Android?   \nA working example or any github repo example are much appreciated.   \nThanks for your help in advance"),
                        thumbnail_width: context.knobs.sliderInt(
                            label: "Ширина превью",
                            initial: 355,
                            min: 300,
                            max: 600),
                        thumbnail_height: context.knobs.sliderInt(
                            label: "Высота превью",
                            initial: 189,
                            min: 150,
                            max: 250),
                        ups: context.knobs.sliderInt(
                            label: "Кол-во лайков",
                            initial: 45,
                            min: 0,
                            max: 10000),
                        downs: context.knobs.sliderInt(
                            label: "Кол-во дизлайков",
                            initial: 15,
                            min: 0,
                            max: 10000),
                        num_comments: context.knobs.sliderInt(
                            label: "Кол-во комментариев",
                            initial: 0,
                            min: 0,
                            max: 10000)),
                    const SizedBox(),
                  ],
                )),
          ),
        ),
        Story(
            name: 'Empty Screen',
            builder: (context) => Container(
                  color: Colors.white,
                  child: EmptyScreen(
                      action: () => print("Tap"),
                      type: context.knobs.options(
                          label: 'Тип заглушки',
                          initial: EmptyScreenType.empty,
                          options: [
                            const Option(
                                label: "Пусто", value: EmptyScreenType.empty),
                            const Option(
                                label: "Ошибка", value: EmptyScreenType.error)
                          ])),
                )),
        Story(
            name: 'Theme Button',
            builder: (context) => Container(
                  color: Colors.white,
                  child: Center(
                    child: const ThemeButton(),
                  ),
                ))
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
