import 'package:animated_card/animated_card.dart';
import 'package:animated_card/animated_card_direction.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final expandedNotifier = ValueNotifier<bool>(false);
  bool get expanded => expandedNotifier.value;
  set expanded(bool value) => expandedNotifier.value = value;

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;

    print(isDark);

    var pages = [
      MeusBoletosPage(
        key: UniqueKey(),
      ),
      ExtractPage(
        key: UniqueKey(),
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [AppColors.primaryLight, AppColors.primary],
              stops: [0, 1],
              center: Alignment.bottomCenter,
              focal: Alignment.bottomCenter,
              radius: 1,
            ),
          ),
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "${widget.user.name}",
                          style: TextStyles.titleBoldBackground)
                    ]),
              ),
              subtitle: Text(
                "Mantenha suas contas em dia!",
                style: TextStyles.captionShape,
              ),
              trailing: ValueListenableBuilder<bool>(
                  valueListenable: expandedNotifier,
                  builder: (_, expanded_d, __) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: 48,
                      width: expanded_d ? 96 : 48,
                      decoration: BoxDecoration(
                        color: AppColors.delete,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          expanded_d
                              ? Expanded(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.exit_to_app,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, "/login");
                                      // controller.googleLogOut(context);
                                    },
                                  ),
                                )
                              : Expanded(
                                  child: Container(),
                                ),
                          InkWell(
                            onTap: () {
                              expanded = !expanded;
                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(widget.user.photoURL!))),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.left,
              child: IconButton(
                  onPressed: () {
                    if (controller.currentPage == 0) return;

                    setState(() {
                      controller.setPage(0);
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    color: controller.currentPage == 0
                        ? AppColors.primary
                        : AppColors.body,
                  )),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              child: InkWell(
                onTap: () async {
                  await Navigator.pushNamed(context, "/barcode_scanner");
                  setState(() {});
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.right,
              child: IconButton(
                  onPressed: () {
                    if (controller.currentPage == 1) return;

                    setState(() {
                      controller.setPage(1);
                    });
                    // Navigator.pushNamed(context, "/login");
                  },
                  icon: Icon(
                    Icons.description_outlined,
                    color: controller.currentPage == 1
                        ? AppColors.primary
                        : AppColors.body,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
