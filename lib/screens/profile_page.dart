import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileContent(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  // Function to show logout confirmation bottom sheet
  void _showLogoutConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PhaseWidget(
                        title: 'Logout ?',
                        text: 'You may check out any time you like, but you can never leave',
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 2,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PhaseWidget(
                        title: 'Reprogram the night man',
                        textColor: Colors.red,
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 2,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: PhaseWidget(
                      title: 'Go back',
                      textColor: Colors.blue,
                      centerTitle: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0), // Add padding from the bottom
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '🐱',
            style: TextStyle(fontSize: 60),
          ),
          SizedBox(height: 30),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: 250,
                  height: 100,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.green[800],
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Text(
                          'MY INTENSITY PREFERENCE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '🔥',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: 250,
                  height: 100,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.green[800],
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 56),
                        child: Text(
                          'CURRENT MOOD',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '🤘',
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '🚀',
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          Container(
            width: 180,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                _showLogoutConfirmation(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhaseWidget extends StatelessWidget {
  final String title;
  final String text;
  final Color textColor;
  final bool centerTitle;

  PhaseWidget({required this.title, this.text = '', this.textColor = Colors.black, this.centerTitle = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (centerTitle)
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                ),
              ),
            )
          else
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            ),
          if (text.isNotEmpty)
            SizedBox(height: 8),
          if (text.isNotEmpty)
            Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
        ],
      ),
    );
  }
}
