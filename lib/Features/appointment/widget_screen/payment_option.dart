import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  String? credit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Payment Option",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.purpleColor),),
        Row(
          children: [
            Radio<String>(
              value: "Credit Card",
              groupValue: credit,
              activeColor: AppColors.blueColor,
              onChanged: (value) {
                setState(() {
                  credit = value;
                });
              },
            ),
            const SizedBox(width: 5),
            const Text("Credit Card",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: "Fawry",
              groupValue: credit,
              activeColor: AppColors.blueColor,
              onChanged: (value) {
                setState(() {
                  credit = value;

                });
              },
            ),
            const SizedBox(width: 5),
            const Text("Fawry",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          ],
        ),
      ],
    );
  }
}
