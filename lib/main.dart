import 'package:flutter/material.dart';

import 'idea2.dart';

void main() {
  runApp( MyApp());
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isDarkMode = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: HomeScreen(toggleTheme: () {
//         setState(() {
//           isDarkMode = !isDarkMode;
//         });
//       }),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomeScreen({super.key, required this.toggleTheme});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Home'),
            Tab(text: 'Projects'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePageContent(),
          ProjectsPage(),
        ],
      ),
      bottomNavigationBar: SocialMediaLinks(),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Vishwam Zadafiya', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('I am a passionate developer with experience in Mobile Development in Kotlin and Flutter \nLoves to build app that can contribute in someone\'s life and having Impact in real world'),
          const SizedBox(height: 20),
          const Text('Work Experience', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('Vasukam - Ownsfare', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          const Text('Work Experience', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ExperienceEntry('Jun 2024 - July 2024', 'Vasukam - Ownsfare', 'Android Intern', [
            'Enhanced the Ownsfare application by integrating Google Maps SDK for seamless navigation and live tracking.',
            'Implemented features such as street view, hybrid maps, and permission management.',
            'Enhanced the AI trip planner by adding features to display nearby famous spots (restaurants, caf´es, photo spots,shopping) below each suggested place.',
          ]),
          // ExperienceEntry('Dec 2021 - May 2022', 'Bytefum', 'Trainee Web Developer', [
          //   'Learned about web technologies such as PHP and Laravel.',
          //   'Built an app-based inventory system for internal use.',
          // ]),
          // ProjectsPage(),
          const SizedBox(height: 20),
          const Text('Contact Me', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text('Email Me')),
        ],
      ),
    );
  }
}

class ExperienceEntry extends StatelessWidget {
  final String duration;
  final String company;
  final String position;
  final List<String> details;

  const ExperienceEntry(this.duration, this.company, this.position, this.details, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(duration, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(company, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
          Text(position, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          for (var detail in details) Text('◦ $detail'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Project Title', style: TextStyle(fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: const Text('GitHub Link'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SocialMediaLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(icon: Icon(Icons.link), onPressed: () {}),
          IconButton(icon: Icon(Icons.email), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
    );
  }
}

/*
const Text('Vishwam Zadafiya', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('I am a passionate developer with experience in Mobile Development in Kotlin and Flutter \n Loves to build app that can contribute in someone\'s life and having Impact in real world'),
            const SizedBox(height: 20),
            const Text('Work Experience', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
 */