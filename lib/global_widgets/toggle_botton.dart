import 'package:emoodie_spotify_test/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedButtonProvider =
    StateProvider<int>((ref) => 0); // Default to the first button

class ToggleButton extends ConsumerStatefulWidget {
  const ToggleButton({super.key});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends ConsumerState<ToggleButton> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref
        .watch(selectedButtonProvider); // Listen to the selected button index

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: selectedIndex == 0 ? kPrimary : kWhite,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: selectedIndex == 0 ? kPrimary : Colors.transparent,
          ),
          onPressed: () {
            ref.read(selectedButtonProvider.notifier).state = 0; // Update state
          },
          child: const Text(
            tabBar1,
            style: TextStyle(color: kWhite),
          ),
        ),
        const SizedBox(width: 20), // Add space between buttons
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: selectedIndex == 1 ? kPrimary : kWhite,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: selectedIndex == 1 ? kPrimary : Colors.transparent,
          ),
          onPressed: () {
            ref.read(selectedButtonProvider.notifier).state = 1; // Update state
          },
          child: const Text(
            tabBar2,
            style: TextStyle(color: kWhite),
          ),
        ),
      ],
    );
  }
}
