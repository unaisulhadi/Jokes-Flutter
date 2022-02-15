import 'package:flutter/cupertino.dart';
import 'package:jokes_app/models/joke_model.dart';
import 'package:jokes_app/widgets/tag_widget.dart';

Widget twoPartJoke(JokeModel jokeModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(jokeModel.setup),
      const SizedBox(height: 8),
      Text(jokeModel.delivery),
      Row(
        children: [
          jokeModel.flags.explicit ? tag("Explicit") : Container(),
          jokeModel.flags.nsfw ? tag("NSFW") : Container(),
          jokeModel.flags.political ? tag("Political") : Container(),
          jokeModel.flags.racist ? tag("Racist") : Container(),
          jokeModel.flags.religious ? tag("Religious") : Container(),
          jokeModel.flags.sexist ? tag("Sexist") : Container(),
        ],
      ),
    ],
  );
}

Widget singlePartJoke(JokeModel jokeModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(jokeModel.joke),
    ],
  );
}
