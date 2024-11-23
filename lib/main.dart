import 'package:emoodie_spotify_test/constants.dart';
import 'package:emoodie_spotify_test/pages/search/search_page.dart';
import 'package:emoodie_spotify_test/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await setup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Emoodie Spotify',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Consumer(
          builder: (context, ref, child) {
            final tokenState = ref.watch(tokenProvider);
            if (tokenState.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kPrimary,
                ),
              );
            }
            if (tokenState.error.isNotEmpty) {
              Center(
                child: Text(tokenState.error),
              );
            }
            return const SearchPage();
          },
        ));
  }
}
