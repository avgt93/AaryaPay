
import 'package:flutter/material.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25,25,25,35),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 35),
            child: Text(
              "Transaction Details",
              style: Theme.of(context).textTheme.titleLarge!.merge(
                    TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w800),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Initiator",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900),
                      ),
                ),
                Text("@abhijeetpoudel",
                    style: Theme.of(context).textTheme.titleSmall!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amount",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900),
                      ),
                ),
                Text("Rs. 250", style: Theme.of(context).textTheme.titleSmall!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900),
                      ),
                ),
                Text("4/7/2023 5:45 pm",
                    style: Theme.of(context).textTheme.titleSmall!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
