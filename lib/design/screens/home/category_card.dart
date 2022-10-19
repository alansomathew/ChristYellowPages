import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/image.dart';
import '../../../database/controllers/category_contact/category_controller.dart';
import '../../../database/models/category_model.dart';
import '../../configs/themes/custom_text_style.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/app_icon_text.dart';

class CategoryCard extends GetView<CategoryController> {
  const CategoryCard({Key? key, required this.model}) : super(key: key);
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    const double _padding = 8.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: (() {
        //  controller.navigateToContacts(category: model);
        }),
        child: Padding(
          padding: const EdgeInsets.only(
            left: _padding,
            right: .8 * _padding,
            bottom: _padding,
            top: 2 * _padding,
          ),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: Colors.white,
                      child: SizedBox(
                        width: Get.width * 0.20,
                        height: Get.width * 0.20,
                        child: Padding(
                          padding: const EdgeInsets.all(_padding),
                          child: CachedNetworkImage(
                            imageUrl: model.imgUrl,
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset(logo),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          model.title,
                          style: cardTitle(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            model.description,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        AppIconText(
                          icon: Icon(
                            Icons.email,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                          ),
                          text: Expanded(
                            child: InkWell(
                              onTap: () {
                                final Uri emailLaunchUri =
                                    Uri(path: model.email, scheme: 'mailto');

                                Future<void> _launch(String url) async {
                                  if (!await launch(url)) {
                                    throw 'count not launch $url';
                                  }
                                }

                                _launch(emailLaunchUri.toString());
                              },
                              child: Text(
                                model.email,
                                style: detailText.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: _padding,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Icon(
                      Icons.people,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cardBorderRadius),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
