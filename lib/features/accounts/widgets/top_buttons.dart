import 'package:amazonclone/features/accounts/services/account_services.dart';
import 'package:amazonclone/features/accounts/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  final AccountServices accountServices=AccountServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "Your Order",
              onTap: () {},
            ),
            AccountButton(
              text: "Turn Seller",
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(
              text: "Log Out",
              onTap: () =>accountServices.logOut(context),
            ),
            AccountButton(
              text: "Your Wish List",
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 20,),

      ],
    );
  }
}
