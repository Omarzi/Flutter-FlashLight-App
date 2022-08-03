import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:torch_light/torch_light.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> torchLightOn() async {
    try {
      await TorchLight.enableTorch();
    } on EnableTorchExistentUserException catch (e) {
      // camera in use
      print("camera in use");
    } on EnableTorchNotAvailableException catch (e) {
      // torch not available
      print("torch not available");
    } on EnableTorchException catch (e) {
      // something went wrong
      print("something went wrong");
    }
  }

  Future<void> torchLightOff() async {
    try {
      await TorchLight.disableTorch();
    } on EnableTorchExistentUserException catch (e) {
      // camera in use
      print("camera in use");
    } on EnableTorchNotAvailableException catch (e) {
      // torch not available
      print("torch not available");
    } on EnableTorchException catch (e) {
      // something went wrong
      print("something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Torch App",
        ),
      ),
      body: Center(
        child: LiteRollingSwitch(
          colorOff: Colors.red,
          colorOn: Colors.greenAccent,
          iconOn: CupertinoIcons.lightbulb_fill,
          iconOff: CupertinoIcons.lightbulb_slash,
          textOff: "Torch Off",
          textOn: "Torch On",
          onChanged: (val) {
            if (val) {
              torchLightOn();
            } else {
              torchLightOff();
            }
          },
        ),
      ),
    );
  }
}
