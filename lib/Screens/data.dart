import 'package:buzz/models/story_model.dart';
import 'package:buzz/models/user_model.dart';

final User user = User(
  name: 'Camilla',
  profileImageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeIMNq82geLWxUoQ53wu9WemcDKOQOdX1oYg&usqp=CAU',
);
final List<Story> stories = [
  Story(
    url:
        'https://i.pinimg.com/564x/f8/05/7f/f8057ff0ce3f70b7f7398edea4e13f8e.jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 10),
    user: user,
  ),
  Story(
    url:
        'https://i.pinimg.com/564x/d7/7a/aa/d77aaa09f292b87e2e5fdd1c03beece4.jpg',
    media: MediaType.image,
    user: User(
      name: 'Camilla',
      profileImageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeIMNq82geLWxUoQ53wu9WemcDKOQOdX1oYg&usqp=CAU',
    ),
    duration: const Duration(seconds: 7),
  ),
  Story(
    url:
        'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    url:
        'https://i.pinimg.com/564x/c1/24/f0/c124f0535c5844b36e6132c675ad6585.jpg',
    media: MediaType.image,
    duration: const Duration(seconds: 5),
    user: user,
  ),
  Story(
    url:
        'https://i.pinimg.com/236x/92/63/a3/9263a34965c770a6acd2159f3738f3ec.jpg',
    media: MediaType.video,
    duration: const Duration(seconds: 0),
    user: user,
  ),
  Story(
    url: 'https://media2.giphy.com/media/M8PxVICV5KlezP1pGE/giphy.gif',
    media: MediaType.image,
    duration: const Duration(seconds: 8),
    user: user,
  ),
];
