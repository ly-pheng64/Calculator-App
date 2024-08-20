import 'package:calculator_app/provider/calculation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculationText extends ConsumerWidget {
  const CalculationText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculationNotifier = ref.watch(calculationProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            calculationNotifier.predata,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            calculationNotifier.data,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
