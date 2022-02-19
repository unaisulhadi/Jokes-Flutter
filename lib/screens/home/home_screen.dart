import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/widgets/joke_widget.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    controller.getJoke();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/settings');
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
        ),
        body: controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : controller.joke != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.joke.value?.type == "twopart"
                            ? twoPartJoke(controller.joke.value!)
                            : singlePartJoke(controller.joke.value!)
                      ],
                    ),
                  )
                : const Center(child: Text("Something went wrong!")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.getJoke();
          },
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
