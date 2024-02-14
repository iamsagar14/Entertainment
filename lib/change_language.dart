import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({
    super.key,
  });

  @override
  State<ChangeLanguage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChangeLanguage> {
  void _changeLanguage() {
    setState(() {
      var loacale = const Locale('np', 'NP');
      Get.updateLocale(loacale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'welcome'.tr,
            ),
            ElevatedButton(
                onPressed: _changeLanguage,
                child: const Text('Change Language'))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
