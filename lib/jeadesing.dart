library jeadesing;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

///TR</br>
///Karanlık tema uygulamalar için temel bir renk paleti.</br></br>
///US</br>
///Dark theme is a basic color palette for apps.
class JDDarkColor {
  static Color backgroundColor = const Color.fromARGB(255, 0, 0, 0);
  static Color brightnessColor = const Color.fromARGB(255, 26, 26, 26);
  static Color extraDarkColor = const Color.fromARGB(255, 7, 7, 7);
  static Color textColor = const Color.fromARGB(237, 255, 255, 255);
  static Color redColor = const Color.fromARGB(236, 202, 19, 19);
  static Color greenColor = const Color.fromARGB(236, 23, 184, 31);
  static Color blueColor = const Color.fromARGB(236, 40, 68, 119);
}

///TR</br>
///Açık tema uygulamalar için temel bir renk paleti.</br></br>
///US</br>
///Light theme is a basic color palette for apps.
class JDLightColor {
  static Color backgroundColor = const Color.fromARGB(255, 250, 250, 250);
  static Color brightnessColor = const Color.fromARGB(255, 255, 255, 255);
  static Color extraDarkColor = const Color.fromARGB(255, 207, 207, 207);
  static Color textColor = const Color.fromARGB(236, 17, 17, 17);
  static Color redColor = const Color.fromARGB(235, 168, 15, 15);
  static Color greenColor = const Color.fromARGB(235, 17, 141, 24);
  static Color blueColor = const Color.fromARGB(235, 17, 81, 199);
}

///TR</br>
///Materyal bir ikon butonu. Bu butonu üst menüde, ara boşluklarda ve dilediğiniz her yerde kullanabilirsiniz.</br></br>
///US</br>
///The material is an icon button. You can use this button in the top menu, in the intermediate spaces and wherever you want.
class JDButtonIcon extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double? width;
  final Color? backgroundColor;
  final Color? iconColor;
  final Gradient? gradient;
  final double? height;
  final Color? color;
  final IconData iconData;
  final String text;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final TextStyle? textStyle;
  const JDButtonIcon({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.gradient,
    required this.iconData,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.iconColor,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(2),
      child: InkWell(
        onTap: onTap ?? () {},
        onDoubleTap: onDoubleTap ?? () {},
        onLongPress: onLongPress ?? () {},
        focusColor: focusColor ?? Colors.yellow,
        hoverColor: hoverColor ?? JDDarkColor.redColor,
        splashColor: splashColor ?? const Color.fromARGB(255, 79, 22, 235),
        highlightColor:
            highlightColor ?? const Color.fromARGB(255, 95, 45, 235),
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: padding ?? const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: borderRadius ?? BorderRadius.circular(5),
            gradient: gradient,
          ),
          width: width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: iconColor ?? JDDarkColor.textColor,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                text,
                style: textStyle ??
                    GoogleFonts.caveat(
                      fontSize: 18,
                      color: JDDarkColor.textColor,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///TR</br>
///Uygulamanın arkaplanına bir görsel ekler. Şeffaflık ayarı düşürüldükçe, arkaplan rengine kaynaşır.</br></br>
///US</br>
///Adds an image to the background of the application. As the transparency setting is lowered, it blends into the background color.
class JDBackgroundPhoto extends StatelessWidget {
  final Widget child;
  final double? opacity;
  final ImageProvider<Object>? image;
  const JDBackgroundPhoto({
    super.key,
    required this.child,
    this.opacity,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Opacity(
                  opacity: opacity ?? 0.30,
                  child: Image(
                    image: image ?? const AssetImage(""),
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}

///TR</br>
///Sakin, yalnız bir buton.</br></br>
///US</br>
///Calm, a lonely button.
class JDButtonSingle extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final double? width;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double? height;
  final Color? color;

  final String? text;
  final Color? dividerColor;

  final TextStyle? textStyle;
  const JDButtonSingle({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.gradient,
    this.text,
    this.textStyle,
    this.backgroundColor,
    this.dividerColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return InkWell(
          onTap: onTap ?? () {},
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: padding ?? const EdgeInsets.all(8),
            margin: margin ?? const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: backgroundColor ?? Colors.transparent,
                gradient: gradient,
                border: const Border.symmetric(
                    horizontal: BorderSide(width: 1, color: Colors.white24))),
            width: width,
            height: height,
            child: Text(
              text ?? "NullText",
              style: textStyle ??
                  TextStyle(
                    fontSize: 14,
                    color: JDDarkColor.textColor,
                  ),
            ),
          ),
        );
      },
    );
  }
}

///TR</br>
///Materyal tasarımlarınızda kullanabileceğiniz modern bir buton.</br></br>
///US</br>
///A modern button that you can use in your material designs.
class JDButtonModern extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double? width;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double? height;
  final Color? color;
  final Widget? child;
  final String? text;
  final void Function()? onTap;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final TextStyle? textStyle;
  const JDButtonModern({
    super.key,
    this.padding,
    this.onTap,
    this.margin,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.gradient,
    this.child,
    this.text,
    this.textStyle,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      hoverColor: hoverColor ?? JDDarkColor.redColor,
      splashColor: splashColor ?? const Color.fromARGB(255, 79, 22, 235),
      highlightColor: highlightColor ?? const Color.fromARGB(255, 95, 45, 235),
      borderRadius: borderRadius ?? BorderRadius.circular(5),
      child: Container(
        padding: padding ?? const EdgeInsets.all(8),
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          gradient: gradient,
        ),
        width: width,
        height: height,
        child: child ??
            Text(
              text ?? "NullText",
              style: textStyle ??
                  TextStyle(
                      fontSize: 14,
                      color: JDDarkColor.textColor,
                      fontWeight: FontWeight.w800),
            ),
      ),
    );
  }
}

///TR</br>
///QuickAlert (https://pub.dev/packages/quickalert) paketini kullanan bir sınıf. Bu sınıf ile hızlı uyarıdan daha hızlı bir uyarı yaratın!</br></br>
///US</br>
///A class that uses the QuickAlert package (https://pub.dev/packages/quickalert). Create an alert faster than a quick alert with this class!
class JDDialog {
  static void showSuccessful(BuildContext context, BoxConstraints constraints,
      String title, String text, String confirmBtnText) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      backgroundColor: JDDarkColor.backgroundColor,
      textColor: Colors.white,
      titleColor: Colors.white,
      barrierColor: Colors.transparent,
      confirmBtnColor: JDDarkColor.backgroundColor,
      width: constraints.maxWidth / 3,
      title: title,
      text: text,
      confirmBtnText: confirmBtnText,
    );
  }

  static void error(BuildContext context, BoxConstraints constraints,
      String title, String text, String confirmBtnText) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      backgroundColor: JDDarkColor.backgroundColor,
      textColor: Colors.white,
      titleColor: Colors.white,
      confirmBtnColor: Colors.transparent,
      title: title,
      confirmBtnText: confirmBtnText,
      text: text,
    );
  }

  static void info(BuildContext context, BoxConstraints constraints,
      String title, String text, String confirmBtnText) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      backgroundColor: JDDarkColor.backgroundColor,
      textColor: Colors.white,
      titleColor: Colors.white,
      confirmBtnColor: Colors.transparent,
      title: title,
      confirmBtnText: confirmBtnText,
      text: text,
    );
  }
}

///TR</br>
///Kendi üst logonuzu oluşturabileceğiniz bir sınıf.</br></br>
///US</br>
///A class where you can create your own top logo.
class JDLogo extends StatelessWidget {
  final Function()? onTap;
  final String? topText;
  final String? bottomText;
  final double? topTextsize;
  final double? bottomTextSize;
  final TextStyle? topStyle;
  final TextStyle? bottomStyle;
  const JDLogo({
    super.key,
    this.topText,
    this.topTextsize,
    this.onTap,
    this.bottomTextSize,
    this.topStyle,
    this.bottomStyle,
    this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            topText ?? "JeaDesing",
            textAlign: TextAlign.center,
            style: topStyle ??
                GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: topTextsize ?? 34,
                ),
          ),
          Text(
            bottomText ?? "powered by JeaFriday",
            textAlign: TextAlign.center,
            style: bottomStyle ??
                GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: bottomTextSize ?? 10,
                ),
          ),
        ],
      ),
    );
  }
}

///TR</br>
///Hızlı ve zahmetsiz bir yan menü oluşturmak hiç bu kadar kolay olmamıştı! El yapımı, hızlı ve verimli bir yan menü oluşturun.</br></br>
///US</br>
///Creating a side menu quickly and effortlessly has never been easier! Create a handcrafted side menu quickly and efficiently.
class JDSideMenu extends StatelessWidget {
  final Widget page;
  final List<Widget> children;
  const JDSideMenu({
    super.key,
    required this.page,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JDDarkColor.backgroundColor,
      body: Stack(
        children: [
          page,
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: Colors.black.withOpacity(0.3),
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width * 0.6,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 10, 10, 10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Gölge rengi
                      spreadRadius: 10, // Gölgenin yayılma miktarı
                      blurRadius: 7, // Gölge bulanıklığı
                      offset: const Offset(
                          4, 0), // Gölgenin yönü (sağ tarafa doğru)
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return JeaVerticalScrollView(
                      child: const SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width * 0.4,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding buttonMethod(BuildContext context, BoxConstraints constraints,
      void Function()? onTap, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        hoverColor: JDDarkColor.textColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: Container(
          width: constraints.maxWidth * 0.9,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSerifDisplay(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

///TR</br>
///Duyarlı bir üst menü oluşturun, hem üstte hem de altta kullanın!</br></br>
///US</br>
///Create a responsive top menu, use both top and bottom!
class JDTopBar extends StatelessWidget {
  final Image? logo;
  final Widget? widgetLogo;
  final IconData? leftIcon;
  final Color? leftIconColor;
  final double? leftIconSize;
  final List<Widget>? children;
  final void Function()? leftIconOnTap;
  final IconData? rightIcon;
  final Color? rightIconColor;
  final double? rightIconSize;
  final void Function()? rightIconOnTap;
  const JDTopBar({
    super.key,
    this.logo,
    this.children,
    this.widgetLogo,
    this.leftIcon,
    this.leftIconColor,
    this.leftIconSize,
    this.leftIconOnTap,
    this.rightIcon,
    this.rightIconColor,
    this.rightIconSize,
    this.rightIconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 800 ? mobil(context) : pc();
  }

  Widget mobil(context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: leftIconOnTap ?? () {},
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                leftIcon ?? Icons.menu,
                color: leftIconColor ?? JDDarkColor.textColor,
                size: leftIconSize ?? 28,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 240,
              child: logo ?? widgetLogo ?? const SizedBox(),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: rightIconOnTap ?? () {},
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                rightIcon ?? Icons.support_agent,
                color: rightIconColor ?? JDDarkColor.textColor,
                size: rightIconSize ?? 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding pc() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: Row(
                children: [
                  Row(
                    children: [
                      logo ?? widgetLogo ?? const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children ?? [],
          ),
        ],
      ),
    );
  }
}

///TR</br>
///Kaydırılabilir bir [Scaffold] vücudu. Bu widget'ı yalnızca [Scaffold]'un body özelliğinde kullanın.</br></br>
///US</br>
///A slideable [Scaffold] body. Only use this widget in the body property of [Scaffold].
class JDBody extends StatelessWidget {
  final bool scrollable;
  final ScrollController? controller;
  final List<Widget>? children;
  final ScrollPhysics? physics;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  const JDBody({
    super.key,
    required this.scrollable,
    this.children,
    this.controller,
    this.physics,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return scrollable == false ? nonscroll() : scroll();
  }

  Widget nonscroll() {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: children ?? <Widget>[],
    );
  }

  Widget scroll() {
    return JeaVerticalScrollView(
      child: SingleChildScrollView(
        controller: controller,
        physics: physics,
        child: Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          children: children ?? <Widget>[],
        ),
      ),
    );
  }
}

///TR</br>
///Başlık ve yazıdan oluşan, büyük bir buton.</br></br>
///US</br>
///A large button consisting of title and text.
class JDTButtonitleAndSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final double width;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? backgroundColor;
  final void Function()? onTap;
  final BorderRadius? borderRadius;
  const JDTButtonitleAndSubtitle(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.width,
      this.onTap,
      this.titleStyle,
      this.subtitleStyle,
      this.backgroundColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: backgroundColor ??
                  JDDarkColor.brightnessColor.withOpacity(0.3),
              borderRadius: borderRadius ?? BorderRadius.circular(10)),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: titleStyle ??
                    GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.left,
                style: subtitleStyle ??
                    GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Utils / Malzemeler
class JeaVerticalScrollView extends StatelessWidget {
  final Widget child;
  final bool? reverse = false;
  final EdgeInsetsGeometry? padding;
  final bool? primary;

  final ScrollPhysics? physics;
  final ScrollController? controller;
  final Clip clipBehavior = Clip.hardEdge;
  final String? restorationId;

  JeaVerticalScrollView({
    super.key,
    required this.child,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.restorationId,
  });
  final localeController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return vertical();
  }

  GestureDetector vertical() {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        localeController.jumpTo(localeController.offset - details.delta.dy);
      },
      child: SingleChildScrollView(
        controller: controller ?? localeController,
        clipBehavior: clipBehavior,
        padding: padding,
        physics: physics,
        primary: primary,
        restorationId: restorationId,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 10),
            child,
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
