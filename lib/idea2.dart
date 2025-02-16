import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: PhoneScreen(),
    );
  }
}



class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  Widget _currentScreen = HomeScreen();

  void _openScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: kIsWeb ? 390 : MediaQuery.of(context).size.width,
          height: kIsWeb ? 844 : MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: kIsWeb ? BorderRadius.circular(20) : BorderRadius.zero,
            border: kIsWeb ? Border.all(color: Colors.black, width: 2) : null,
            boxShadow: kIsWeb ? [BoxShadow(color: Colors.grey, blurRadius: 10)] : null,
          ),
          child: ClipRRect(
            borderRadius: kIsWeb ? BorderRadius.circular(20) : BorderRadius.zero,
            child: _currentScreen,
          ),
        ),
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Portfolio")),
//       body: Center(child: Text("Home Screen")),
//     );
//   }
// }


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Portfolio")),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: apps.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              (context.findAncestorStateOfType<_PhoneScreenState>())?.
              _openScreen(apps[index].screen);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[200],
                  child: Icon(apps[index].icon, size: 30, color: apps[index].color),
                ),
                SizedBox(height: 10),
                Text(apps[index].name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AppModel {
  final String name;
  final IconData icon;
  final Color color;
  final Widget screen;

  AppModel({required this.name, required this.icon, required this.color, required this.screen});
}

List<AppModel> apps = [
  AppModel(name: "About", icon: Icons.person, color: Colors.blue, screen: AboutScreen()),
  AppModel(name: "Experience", icon: Icons.work, color: Colors.green, screen: ExperienceScreen()),
  AppModel(name: "Tech Stack", icon: Icons.code, color: Colors.orange, screen: TechStackScreen()),
  AppModel(name: "Projects", icon: Icons.build, color: Colors.purple, screen: ProjectsScreen()),
  AppModel(name: "GitHub", icon: Icons.code, color: Colors.black, screen: SocialScreen("GitHub")),
  AppModel(name: "Twitter", icon: Icons.chat, color: Colors.lightBlue, screen: SocialScreen("Twitter")),
  AppModel(name: "LinkedIn", icon: Icons.business, color: Colors.blueAccent, screen: SocialScreen("LinkedIn")),
  AppModel(name: "YouTube", icon: Icons.video_library, color: Colors.red, screen: SocialScreen("YouTube")),
];

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(title: "About", content: "Hi\nVishwam here,\nWork In progress\nsee you soon😁");
  }
}

class ExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(title: "Experience", content: "Your Experience Section");
  }
}

class TechStackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(title: "Tech Stack", content: "Your Tech Stack Section");
  }
}

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(title: "Projects", content: "Your Projects Section");
  }
}

class SocialScreen extends StatelessWidget {
  final String name;
  SocialScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(title: name, content: "$name Profile");
  }
}

class ScreenTemplate extends StatelessWidget {
  final String title;
  final String content;

  ScreenTemplate({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            (context.findAncestorStateOfType<_PhoneScreenState>())?._openScreen(HomeScreen());
          },
        ),
      ),
      body: Center(child: Text(content)),
    );
  }
}