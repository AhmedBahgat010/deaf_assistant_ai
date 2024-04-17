import 'package:animate_do/animate_do.dart';
import 'package:deaf_assistant_ai/Core/Network/Local/Shared_preferences.dart';
import 'package:deaf_assistant_ai/Core/Utils/App%20Colors.dart';
import 'package:deaf_assistant_ai/Core/Utils/Shared%20Methods.dart';
import 'package:deaf_assistant_ai/Features/auth/presentation/view/login_screen.dart';
import 'package:deaf_assistant_ai/Features/select_language/presentation/widgets/user_type_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../Core/Ui/primary_button.dart';

class SelectUserType extends StatefulWidget {
  const SelectUserType({
    super.key,
  });

  @override
  State<SelectUserType> createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  int? indexVal;

  List<UserData> usersData = [
    UserData("Deaf User",
        "https://static.vecteezy.com/system/resources/previews/014/316/336/original/deaf-person-icon-cartoon-worker-listen-vector.jpg"),
    UserData("Natural User",
        "https://static.vecteezy.com/system/resources/previews/004/607/791/non_2x/man-face-emotive-icon-smiling-male-character-in-blue-shirt-flat-illustration-isolated-on-white-happy-human-psychological-portrait-positive-emotions-user-avatar-for-app-web-design-vector.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: const Text("Select User Type",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.03,
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 400),
              from: 50,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Choose Your User Type to Personalize Your Experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
                children: List.generate(usersData.length, (index) {
                  return FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    delay: const Duration(milliseconds: 400),
                    from: 50,
                    child: UserTypeWidget(
                      onTap: () {
                        setState(() {
                          indexVal = index;
                        });
                      },
                      name: usersData[index].title.toString(),
                      index: index,
                      photo: usersData[index].photo,
                      indexVal: indexVal,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1000),
                delay: const Duration(milliseconds: 400),
                from: 50,
                child: PrimaryButton(
                  label: 'Continue',
                  onPressed: indexVal != null
                      ? () {
                          CacheHelper.saveData("UserType", usersData[indexVal!].title)
                              ?.then((value) {
                            navigateTo(context, const LoginScreen());
                          }).catchError((error) {
                            if (kDebugMode) {
                              print(error);
                            }
                          });
                        }
                      : null,
                  backgroundColor: indexVal == null
                      ? AppColors.grey
                      : AppColors.primaryColor,
                  foregroundColor: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}

class UserData {
  String title;
  String photo;

  UserData(this.title, this.photo);
}
