import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:bank/models/user_model.dart';

class TransferResultItem extends StatelessWidget {
  final UserModel user;
  final bool isselected;

  const TransferResultItem({
    key,
    required this.user,
    this.isselected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 14,
      spacing: 14,
      children: [
        Container(
          width: 155,
          height: 200,
          padding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 22,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
            border: Border.all(
              width: 2,
              color: isselected ? blueColor : whiteColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: user.profilePicture == null
                        ? AssetImage('assets/img_profile.png')
                        : NetworkImage(user.profilePicture!) as ImageProvider,
                  ),
                ),
                child: user.verified == 1
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check_circle,
                              color: greenColor,
                            ),
                          ),
                        ),
                      )
                    : null,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                user.name.toString(),
                maxLines: 1,
                style: blackTextStyle.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                '@${user.username}',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
