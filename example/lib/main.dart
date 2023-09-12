import 'package:flutter/material.dart';
import 'package:jeadesing/jeadesing.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String backgroundPhoto =
      "https://images.pexels.com/photos/546819/pexels-photo-546819.jpeg?auto=compress&cs=tinysrgb&w=600";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeaDesing Example App',
      home: Scaffold(
        backgroundColor: JDDarkColor.backgroundColor,
        body: JDBackgroundPhoto(
          image: NetworkImage(backgroundPhoto),
          child: JDBody(
            scrollable: true,
            children: [
              JDTopBar(
                leftIcon: Icons.menu,
                leftIconColor: JDDarkColor.textColor,
                leftIconSize: 28,
                rightIcon: Icons.support_agent,
                rightIconColor: JDDarkColor.textColor,
                rightIconSize: 28,
                leftIconOnTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JDSideMenu(
                        page: MyApp(),
                        children: [],
                      ),
                    ),
                  );
                },
                widgetLogo: const JDLogo(),
                children: [
                  JDButtonIcon(
                    iconData: Icons.link,
                    text: "JeaDesing Github",
                    onTap: () async {
                      if (!await launchUrl(
                          Uri.parse("https://github.com/JeaFrid/JeaDesing"))) {
                        throw Exception('Error!');
                      }
                    },
                  ),
                ],
              ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Wrap(
                    children: [
                      JDTButtonitleAndSubtitle(
                        title: "Diyalog Testleri / Dialogue Tests",
                        subtitle: "Başarılı bir tıklama! / A successful click!",
                        width: 200,
                        onTap: () {
                          JDDialog.showSuccessful(
                              context,
                              constraints,
                              "Tebrikler! / Congratulations!",
                              "Başarılı bir tıklama! / A successful click!",
                              "Ok / Tamam");
                        },
                      ),
                      JDTButtonitleAndSubtitle(
                        title: "Diyalog Testleri / Dialogue Tests",
                        subtitle: "Başarısız bir tıklama! / A failed click!",
                        width: 200,
                        onTap: () {
                          JDDialog.error(
                              context,
                              constraints,
                              "Tebrikler! / Congratulations!",
                              "Başarısız bir tıklama! / A failed click!",
                              "Ok / Tamam");
                        },
                      ),
                      JDTButtonitleAndSubtitle(
                        title: "Diyalog Testleri / Dialogue Tests",
                        subtitle: "Bilgili bir tıklama! / An informed click!",
                        width: 200,
                        onTap: () {
                          JDDialog.info(
                              context,
                              constraints,
                              "Tebrikler! / Congratulations!",
                              "Bilgili bir tıklama! / An informed click!",
                              "Ok / Tamam");
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
