import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/controllers/controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JokeController>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Column(
          children: [
            const Text("Joke Categories"),
            const SizedBox(height: 8),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.jokeCategories.length,
              itemBuilder: (context, index) {
                String key = controller.jokeCategories.keys.elementAt(index);
                return CheckboxListTile(
                    title: Text(key),
                    value: controller.jokeCategories[key],
                    onChanged: (value) async {
                      controller.setJokeCategory(key, value!);
                      await controller.saveJokeCategory();
                    });
              },
            ),
            const SizedBox(height: 8),
            const Text("Blacklisted"),
            const SizedBox(height: 8),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.blackList.length,
              itemBuilder: (context, index) {
                String key = controller.blackList.keys.elementAt(index);
                return CheckboxListTile(
                    title: Text(key),
                    value: controller.blackList[key],
                    onChanged: (value) async {
                      controller.setBlackList(key, value!);
                      await controller.saveBlackList();
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final data = GetStorage();

  Map<String, dynamic> jokeCategories = {};
  Map<String, dynamic> blackList = {};

  Map<String, dynamic> defaultJokeCategories = {
    "Programming": true,
    "Miscellaneous": true,
    "Dark": true,
    "Pun": true,
    "Spooky": true,
    "Christmas": true
  };

  Map<String, dynamic> defaultBlackList = {
    "nsfw": false,
    "religious": false,
    "political": false,
    "racist": false,
    "sexist": false,
    "explicit": false
  };

  @override
  void initState() {
    jokeCategories = data.read('jokeCategories') ?? defaultJokeCategories;
    blackList = data.read('blackList') ?? defaultBlackList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        actions: [
          IconButton(onPressed: () async{
            await data.write('jokeCategories', jokeCategories);
            await data.write('blackList', blackList);
            setState(() {
              print("Saved");
            });
          }, icon: const Icon(Icons.check,color: Colors.white,))
        ],
      ),
      body: Column(
        children: [
          const Text("Joke Categories"),
          const SizedBox(height: 8),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: jokeCategories.length,
            itemBuilder: (context, index) {
              String key = jokeCategories.keys.elementAt(index);
              return CheckboxListTile(
                  title: Text(key),
                  value: jokeCategories[key],
                  onChanged: (value) {
                    setState(() {
                      jokeCategories[key] = value!;
                    });
                  });
            },
          ),
          const SizedBox(height: 8),
          const Text("Blacklisted"),
          const SizedBox(height: 8),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: blackList.length,
            itemBuilder: (context, index) {
              String key = blackList.keys.elementAt(index);
              return CheckboxListTile(
                  title: Text(key),
                  value: blackList[key],
                  onChanged: (value) {
                    setState(() {
                      blackList[key] = value!;
                    });
                  });
            },
          ),
        ],
      ),
    );
  }
}*/
