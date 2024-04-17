import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Textstyle.dart';
import 'package:deaf_assistant_ai/Core/Utils/Assets%20Manager.dart';
import 'package:deaf_assistant_ai/Core/Utils/Core%20Components.dart';
import 'package:deaf_assistant_ai/Features/home/presentation/manger/home_cubit.dart';
import 'package:deaf_assistant_ai/Features/settings/presentation/widgets/ListTileItem.dart';
import 'package:deaf_assistant_ai/Features/settings/presentation/widgets/ListTilelend.dart';
import 'package:deaf_assistant_ai/Features/settings/presentation/widgets/ListTileprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Settings",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    ListTileprofile(
                      endWidget: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor
                                .withOpacity(0.01),
                            borderRadius:
                            BorderRadius.circular(30)),
                        child: Text(
                          "Profile Details",
                          style: AppTextStyles.w800.copyWith(
                              fontSize: 12,
                              color: AppColors.primaryColor),
                        ),
                      ),
                      // inContainer: const Icon(Icons.person),
                      inContainer: Image.asset(
                        AssetsManager.person,
                        fit: BoxFit.fill,
                      ),
                      gmail: cubit.userModel?.email,
                      label: cubit.userModel!.name.toString(),
                      onTap: () {},
                    ),
                    const SizedBox(height: 4),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            // shadow
                            spreadRadius: .1,
                            offset: Offset(
                              0.0,
                              0.0,
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 15,),
                          ListTileItem(
                            endWidget: CupertinoSwitch(
                              value: false,
                              activeColor:
                              AppColors.greenYellow,
                              onChanged: (bool value) {},
                            ),
                            inContainer: const Icon(
                              Iconsax.notification,
                              color:
                              AppColors.primaryColorYellow,
                            ),
                            label: 'Notifications',
                            onTap: () {},

                          ),
                          Divider(
                            height: 20,
                            color: AppColors.darkGrey
                                .withOpacity(0.15),
                          ),
                          ListTileItem(
                            endWidget: const Icon(
                                Icons.chevron_right_sharp),
                            inContainer: const Icon(
                              Iconsax.language_square,
                              color: AppColors.primaryColor,
                            ),
                            label: 'Language',
                            onTap: () {},
                          ),
                          const SizedBox(height: 22,)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    EmdListTile(
                      title: "Contact Us",
                      ontap: () {},
                    ),
                    Divider(
                      height: 20,
                      color:
                      AppColors.darkGrey.withOpacity(0.15),
                    ),
                    EmdListTile(
                      title: "About Us",
                      ontap: () {},
                    ),
                    ButtonTemplate(
                      color: AppColors.white,
                      colorText: AppColors.red,
                      isLoading: false,
                      text1: "LOG OUT",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
