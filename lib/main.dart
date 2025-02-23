import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(AIAssistantApp());
}

class AIAssistantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1A1A2E),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("NURAI",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(flex: 2, child: SidebarMenu()),
          Expanded(flex: 5, child: MainContent()),
        ],
      ),
      bottomNavigationBar: ChatInput(),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF111133),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Eva",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          SizedBox(height: 20),
          FeaturesGrid(),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: ModelsList()),
        ],
      ),
    );
  }
}

class FeaturesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FeatureCard(
            title: "Code Generator",
            icon: FontAwesomeIcons.code,
            status: "Unavailable",
            isActive: false),
        FeatureCard(
            title: "Audio Recognition",
            icon: FontAwesomeIcons.headphones,
            status: "Available",
            isActive: true),
        FeatureCard(
            title: "Image Recognition",
            icon: FontAwesomeIcons.image,
            status: "On",
            isActive: true),
        FeatureCard(
            title: "Audio Generation",
            icon: FontAwesomeIcons.music,
            status: "Off",
            isActive: false),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String status;
  final bool isActive;

  FeatureCard(
      {required this.title,
      required this.icon,
      required this.status,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? Colors.purple[400] : Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            SizedBox(height: 10),
            Text(title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(status, style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}

class ModelsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ModelCard(
            name: "Llama3.3",
            description: "New state of the art 70B model",
            color: Colors.blue),
        ModelCard(
            name: "Llama3.3",
            description: "New state of the art 70B model",
            color: Colors.green),
      ],
    );
  }
}

class ModelCard extends StatelessWidget {
  final String name;
  final String description;
  final Color color;

  ModelCard(
      {required this.name, required this.description, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Color(0xFF0F0F1E),
      child: Row(
        children: [
          Icon(Icons.mic, color: Colors.purple, size: 30),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type your message...",
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1F1F2E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.send, color: Colors.purple, size: 30),
        ],
      ),
    );
  }
}
