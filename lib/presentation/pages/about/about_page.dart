import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App logo
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.5,
              //   height: MediaQuery.of(context).size.width * 0.5,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     image: DecorationImage(
              //       image: AssetImage('assets/img_face.png'),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              SizedBox(height: 15),

              // App name
              Text(
                'App Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 5),

              // App description
              Text(
                'This is a brief description of the app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 25),

              // Divider
              Divider(
                color: Colors.black,
                thickness: 1,
                indent: MediaQuery.of(context).size.width * 0.2,
                endIndent: MediaQuery.of(context).size.width * 0.2,
              ),
              SizedBox(height: 25),

              // Developer label
              Text(
                'Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),

              // Developer name
              Text(
                'John Doe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),

              // Developer social media icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.code),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.linked_camera),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.question_answer),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 35),

              // Organization logo
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/img_hand.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 35),

              // Organization description
              Text(
                'This is a brief description of the organization.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 25),

              // Divider
              Divider(
                color: Colors.black,
                thickness: 1,
                indent: MediaQuery.of(context).size.width * 0.2,
                endIndent: MediaQuery.of(context).size.width * 0.2,
              ),
              SizedBox(height: 25),

              // Organization label
              Text(
                'Organization',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),

              // Organization name
              Text(
                'Tech Solutions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),

              // Organization social media icons
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                children: [
                  IconButton(
                    icon: Icon(Icons.web),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.code),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.camera),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.linked_camera),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.question_answer),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.phone_android),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 25),

              // Credits label
              Text(
                'Credits',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),

              // Credits text
              Text(
                'Special thanks to all contributors.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 25),

              // App version
              Text(
                'Version 1.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}