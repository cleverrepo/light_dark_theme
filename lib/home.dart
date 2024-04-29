import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:light_dark_theme/state_management.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: provider.isToggle ? Colors.black87 : Colors.white,
            centerTitle: true,
            title: const Text("Light and dark theme"),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch.adaptive(
                  activeColor: Colors.white,
                  splashRadius: 20,
                  dragStartBehavior: DragStartBehavior.down,
                  inactiveThumbColor: Colors.black,
                  value: provider.isToggle,
                  onChanged: (valu) => provider.changeTheme()),
              provider.isToggle
                  ? const Text(
                      "Dark Mode Activated",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      "Light Mode is activated",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    )
            ],
          )),
        );
      },
    );
  }
}
