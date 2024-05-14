import "package:firebase_auth/firebase_auth.dart";
import "package:fitness_clup/components/UIHelper.dart";
import "package:fitness_clup/components/styles.dart";
import "package:fitness_clup/functions/accountFuncs/accountFuncs.dart";
import "package:fitness_clup/pages/registerAndLogin/page.dart";
import "package:fitness_clup/variables/colors.dart";
import "package:fitness_clup/variables/routes.dart";
import "package:fitness_clup/widgets/mainpage_widgets/bottomNavBar.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int page = 0;
  late Future<Map<String, dynamic>> _userInfoFuture;

  @override
  void initState() {
    _userInfoFuture = getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // if (didPop) return;
        _showDialog();
      },
      child: Scaffold(
        backgroundColor: background_color,
        body: FutureBuilder(
          future: _userInfoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Future henüz tamamlanmadıysa, yüklenme göstergesi döndür
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Future hata ile tamamlandıysa, hata mesajını göster
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Future başarıyla tamamlandıysa, veriyi kullanarak arayüzü oluştur
              final userInformation = snapshot.data;
              print(userInformation);
              return UIHelper.PageChanger(page, userInformation);
            }
          },
        ),
        bottomNavigationBar: BottomNavBar(
          page: page,
          onPressed: (value) {
            setState(() {
              page = value;
            });
          },
        ),
      ),
    );
  }

// UIHelper.PageChanger(page, userInformation),
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit"),
        content: const Text(
          "Do you want to sign out ?",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: background_color,
        titleTextStyle: TextStyles.IntroTitleText(),
        contentTextStyle: TextStyles.WorkoutSubtitleTextStyle(),
        actions: [
          TextButton(
            onPressed: () {
              userSignOut();
              Navigator.popUntil(
                  context, ModalRoute.withName(registerAndLoginRoute));
            },
            child: Text(
              "Sign Out",
              style: TextStyle(color: high_green),
            ),
          ),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: high_green),
              ))
        ],
      ),
    );
  }
}
