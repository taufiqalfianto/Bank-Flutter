import 'package:bank/models/transaction_model.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final HistoryTransactionModel transaction;

  const HomeLatestTransactionItem({
    key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            // child: Center(
            //   child: Image.network(
            //     transaction.transactiontype!.thumbnail!,
            //     width: 48,
            //   ),
            // ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.paymentMethods!.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  DateFormat('EEEE d HH:mm a').format(
                    transaction.createdAt! ?? DateTime.now(),
                  ),
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatcurrency(transaction.amount ?? 0,
                symbol:
                    transaction.transactiontype?.action == 'cr' ? '+ ' : '- '),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
