import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/presentation/widgets/movie_app.dart';

import 'di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(const MovieApp());
}




























// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: Scaffold(
//           body: Center(
//             child: TextButton(
//                 onPressed: () async {
//                   GetTrending getTrending = getIt.getItInstance<GetTrending>();
//                   final Either<AppError, List> eitherResponse =
//                       await getTrending(NoParams());
//                   eitherResponse.fold(
//                     (l) {
//                       print('error');
//                       print(l);
//                     },
//                     (r) {
//                       print('list of movies');
//                       print(r);
//                     },
//                   );
//                 },
//                 child: const Text('Click me')),
//           ),
//         ));
//   }
// }
