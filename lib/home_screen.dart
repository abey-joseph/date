import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ConfettiController _controller =
      ConfettiController(duration: Duration(seconds: 2));

  List<String> list = [
    'No',
    'Are your Sure?',
    'Really?',
    'Think Again!',
    'Please!',
    'Last Chance!!',
    'Okay Fine!',
    '💁',
    '😅',
    '💕',
    '😉',
    '😉',
    '😉',
    '😉',
  ];

  double yesBoxSize = 200;
  double noBoxSize = 200;

  int noButtonClick = 1;

  String noButtonText = 'No 🤥';

  void openNewTab() async {
    await Future.delayed(Duration(seconds: 2));
    launchUrl(Uri.parse('https://www.instagram.com/abey._joseph/'),
        webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'want to go on a lovely date this weekend? ❤️',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Row(
                spacing: 25,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    'Yes',
                    yesBoxSize,
                    Colors.green,
                    () {
                      setState(() {
                        _controller.play();
                        openNewTab();
                      });
                    },
                    false,
                  ),
                  button(
                    noButtonText,
                    noBoxSize,
                    Colors.red,
                    () {
                      setState(() {
                        noButtonText = list[noButtonClick];

                        noButtonClick =
                            (noButtonClick < 13) ? noButtonClick + 1 : 13;

                        yesBoxSize =
                            (yesBoxSize < 600) ? yesBoxSize + 20 : yesBoxSize;
                        noBoxSize = (noBoxSize > 18) ? noBoxSize - 14 : 0;
                      });
                    },
                    true,
                  )
                ],
              )
            ],
          ),
        )),
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            emissionFrequency: 0.1,
            numberOfParticles: 40,
            maxBlastForce: 100,
            minBlastForce: 10,
            confettiController: _controller,
            blastDirectionality:
                BlastDirectionality.explosive, // Random directions
            shouldLoop: false,
            colors: [Colors.red, Colors.blue, Colors.green, Colors.orange],
            gravity: 0.5,
          ),
        )
      ],
    );
  }

  AnimatedSize button(String text, double size, Color color, VoidCallback onTap,
      bool isNoButton) {
    return AnimatedSize(
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
      child: SizedBox(
        height: size,
        width: (size > 0) ? size + 70 : size,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
