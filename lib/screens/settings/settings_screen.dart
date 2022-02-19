import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/screens/settings/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          actions: [
            IconButton(
                onPressed: () async {
                  await controller.saveJokeCategory();
                  await controller.saveBlackList();
                  print("Saved");
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ))
          ],
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
                    onChanged: (value) {
                      controller.setJokeCategory(key, value!);
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
                    onChanged: (value) {
                      controller.setBlackList(key, value!);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
