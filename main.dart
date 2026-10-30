import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyCVApp());
}

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My CV App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D47A1),
          foregroundColor: Colors.white,
        ),
      ),
      home: const CVScreen(),
    );
  }
}

class CVScreen extends StatelessWidget {
  const CVScreen({super.key});

  Future<void> launchLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luyanda Mlangeni CV App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Center(
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      backgroundColor: Color(0xFF0D47A1),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Mlangeni Luyanda',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'BScIT Student',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'BScIT student at Limkokwing University Eswatini, passionate about networking, mobile development, and software operations optimization.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //contact information
              const Text('Contact Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('luyandamlangeni257@@gmail.com'),
                      onTap: () => launchLink(
                        'mailto:luyandamlangeni257@.com',
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('+268 76856930'),
                      onTap: () =>
                          launchLink('tel:+26876856930'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.link),
                      title: const Text('LinkedIn'),
                      onTap: () => launchLink(
                        'https://www.linkedin.com/in/luyanda-mlangeni-513a37442',
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.code),
                      title: const Text('GitHub'),
                      onTap: () => launchLink(
                        'https://github.com',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //skills
              const Text(
                'Skills',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          Chip(label: Text('Flutter')),
                          Chip(label: Text('Dart')),
                          Chip(label: Text('Networking')),
                          Chip(label: Text('Figma')),
                          Chip(label: Text('Teamwork')),
                        ],
                      ),
                      const SizedBox(height: 15),

                      const Text('Flutter'),
                      const SizedBox(height: 4),
                      const LinearProgressIndicator(
                        value: 0.80,
                      ),

                      const SizedBox(height: 12),

                      const Text('Networking'),
                      const SizedBox(height: 4),
                      const LinearProgressIndicator(
                        value: 0.75,
                      ),

                      const SizedBox(height: 12),

                      const Text('Communication'),
                      const SizedBox(height: 4),
                      const LinearProgressIndicator(
                        value: 0.90,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //work Experience
              const Text(
                'Work Experience',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Card(
                child: ListTile(
                  title: Text(
                    'IT Intern - Inyatsi Construction',
                  ),
                  subtitle: Text(
                    '2024 - Present\nAssisting with networking and IT support.',
                  ),
                ),
              ),

              const Card(
                child: ListTile(
                  title: Text('Freelance Developer'),
                  subtitle: Text(
                    '2023 - Present\nBuilding Flutter applications and student projects.',
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Education
              const Text(
                'Education & Certifications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Card(
                child: ListTile(
                  title: Text('Bachelor of Information Technology'),
                  subtitle: Text(
                    'Limkokwing University Eswatini\n2023 - 2027',
                  ),
                ),
              ),

              const Card(
                child: ListTile(
                  title: Text('CCNA Introduction to Networks'),
                  subtitle: Text(
                    'Cisco Networking Academy - 2024',
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}