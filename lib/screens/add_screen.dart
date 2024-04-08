import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    _controller.text = "0";
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    // final Color bgcolor = themeState.getDarkTheme ?
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    final Color color = themeState.getDarkTheme
        ? AppColor.textDarkThemeColor
        : AppColor.textLightThemeColor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: InkWell(
              onTap: () {},
              child: TextWidget(
                text: "Huy",
                fontSize: 16,
                color: color,
                isTitle: true,
              ),
            ),
          ),
          title: TextWidget(
            text: "Them giao dich",
            fontSize: 18,
            color: color,
            isTitle: true,
          ),
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, double.minPositive),
              child: Divider(
                color: color,
                thickness: 0.5,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).hoverColor.withOpacity(0.05),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(CupertinoIcons.money_dollar),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _controller,
                              focusNode: _focusNode,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.]'),
                                ),
                              ],
                              //maxLength: 10,
                              maxLines: 1,
                              //textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                hintText: " Input money",
                              ),
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  _controller.text = "";
                                }
                              },
                              onTapOutside: (event) {
                                _focusNode.unfocus();
                              },
                            ),
                          ),
                        ],
                      ),
                      buildListTile(
                        title: "Group",
                        color: color,
                        icon: IconlyBold.show,
                        fct: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0),
                        child: Divider(
                          color: color,
                          thickness: 0.4,
                        ),
                      ),
                      buildListTile(
                        title: "Note",
                        color: color,
                        icon: IconlyBold.activity,
                        fct: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0),
                        child: Divider(
                          color: color,
                          thickness: 0.4,
                        ),
                      ),
                      buildListTile(
                        title: "Date",
                        color: color,
                        icon: IconlyBold.calendar,
                        fct: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0),
                        child: Divider(
                          color: color,
                          thickness: 0.4,
                        ),
                      ),
                      buildListTile(
                        title: "Type money",
                        color: color,
                        icon: IconlyBold.wallet,
                        fct: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).hoverColor.withOpacity(0.05),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildListTile(
                    title: "With",
                    color: color,
                    icon: IconlyBold.profile,
                    fct: () {},
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).hoverColor.withOpacity(0.05),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildListTile(
                        title: "Location",
                        color: color,
                        icon: IconlyBold.location,
                        fct: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0),
                        child: Divider(
                          color: color,
                          thickness: 0.4,
                        ),
                      ),
                      buildListTile(
                        title: "Choose event",
                        color: color,
                        icon: IconlyBold.work,
                        fct: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0),
                        child: Divider(
                          color: color,
                          thickness: 0.4,
                        ),
                      ),
                      buildListTile(
                        title: "Warning",
                        color: color,
                        icon: IconlyBold.shieldFail,
                        fct: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).hoverColor.withOpacity(0.05),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildListTile(
                    title: "Add images",
                    color: Colors.green,
                    icon: IconlyBold.image2,
                    fct: () {},
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.green.withAlpha(180),
                  onPressed: () {},
                  icon: const Icon(IconlyBold.send),
                  label: TextWidget(text: "Save", fontSize: 18, color: color),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required Color color,
    required IconData icon,
    required Function fct,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        fontSize: 16,
        color: color,
        isTitle: true,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyBold.arrowRightCircle),
      enabled: true,
      onLongPress: () {},
      onTap: fct(),
    );
  }
}
