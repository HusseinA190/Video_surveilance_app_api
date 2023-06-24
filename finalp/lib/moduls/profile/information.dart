import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class MyInformationScreen extends StatelessWidget {
  final String email = 'tagreedaly0000@gmail.com';
  final String linkedinUrl = ' linkedin.com/in/taghreed-aly-gomaa-920443243';
  final String phoneNumber = '+20 01061862770';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children:[ Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About My App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Divider(height: 5,color: Colors.black87,),
              const SizedBox(height: 12),
              const Text(
                """An application for detecting abnormal actions and displaying alarms is typically designed for surveillance and security purposes in various industries, such as manufacturing, healthcare, and transportation. The goal of the application is to identify actions that deviate from normal behavior and alert security personnel or relevant stakeholders in real-time.

The application typically uses computer vision and machine learning techniques to analyze video feeds from cameras and detect anomalies in behavior. The system may use pre-trained models or train its own models on a dataset of normal and abnormal actions. The models can detect a variety of actions, such as intruders entering restricted areas, people loitering in a particular location, or individuals performing dangerous actions.

Once an abnormal action is detected, the system generates an alarm or alert. The alerts may be displayed on a dashboard, sent via email or text message, or triggered through an audio or visual alarm system. The alarms can be prioritized based on the severity of the detected action and the location of the event.""",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Divider(height: 5,color: Colors.black87,),
              const SizedBox(height: 12),
              // Text(
              //   'Email: contact@example.com',
              //   style: TextStyle(fontSize: 16),
              // ),
              // Text(
              //   'Phone: 555-1234',
              //   style: TextStyle(fontSize: 16),
              // ),
              ListTile(
                leading: const Icon(Icons.email,color: Colors.blueAccent,size: 40,),
                title: const Text('Email'),
                subtitle: Text(email),
                onTap: () => launch('mailto:$email'),
              ),
              const Divider(),
              ListTile(
                leading:  const Icon(Icons.phone,color: Colors.blueAccent,size: 40,),
                title: const Text('Phone'),
                subtitle: Text(phoneNumber),
                onTap: () => launch('tel:$phoneNumber'),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset('assets/images/linnk.jpg',width: 35,),
                  // replace with your LinkedIn icon image
                title: const Text('LinkedIn'),
                subtitle: Text(linkedinUrl),
                onTap: () => launch(linkedinUrl),
              ),


            ],
          ),
        ),],
      ),
    );
  }
}