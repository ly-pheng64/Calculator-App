import 'package:calculator_app/components/calculatebuttom.dart';
import 'package:calculator_app/components/calculation_text.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  List<Widget> get row1 => [
        const Calculatebuttom(
          'c',
          textcolor: Color(0xffb94d2b),
        ),
        const Calculatebuttom(
          '+/\u2212',
          fontSize: 32,
        ),
        const Calculatebuttom('%'),
        const Calculatebuttom(
          '\u00f7',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        )
      ];
  List<Widget> get row2 => [
        for (final i in ['1', '2', '3'])
          Calculatebuttom(
            i,
            shape: Shape.circle,
          ),
        const Calculatebuttom(
          '\u00d7',
          fontSize: 52,
          fontWeight: FontWeight.normal,
        )
      ];
  List<Widget> get row3 => [
        for (final i in ['4', '5', '6'])
          Calculatebuttom(
            i,
            shape: Shape.circle,
          ),
        const Calculatebuttom(
          '\u2212',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        )
      ];
  List<Widget> get row4 => [
        for (final i in ['7', '8', '9'])
          Calculatebuttom(
            i,
            shape: Shape.circle,
          ),
        const Calculatebuttom(
          '+',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        )
      ];
  List<Widget> get row5 => [
        const Calculatebuttom(
          '0',
          width: 165,
          shape: Shape.stadium,
        ),
        const Calculatebuttom(
          '.',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        ),
        const Calculatebuttom(
          '=',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        )
      ];
  @override
  Widget build(BuildContext context) {
    final rows = [row1, row2, row3, row4, row5];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: CalculationText(),
          ),
          const Spacer(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemCount: rows.length,
            itemBuilder: (_, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: rows[index],
            ),
          ),
          const SizedBox(
            height: 56,
          )
        ],
      ),
    );
  }
}
        
    //     Align(
    //   alignment: Alignment.bottomCenter,
    //   child: Padding(
    //     padding: const EdgeInsets.only(bottom: 56),
    //     child: ListView.separated(
    //       physics: const NeverScrollableScrollPhysics(),
    //       shrinkWrap: true,
    //       separatorBuilder: (_, __) => const SizedBox(
    //         height: 20,
    //       ),
    //       itemCount: rows.length,
    //       itemBuilder: (_, index) => Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: rows[index],
    //       ),
    //     ),
    //   ),
    // ));
 
