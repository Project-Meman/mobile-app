import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meman/core/utils/res/app_colors.dart';
import 'package:meman/core/utils/res/app_text_styles.dart';
import 'package:meman/gen/assets.gen.dart';
import 'package:meman/presentation/widget/borderless_dropdown_widget.dart';
import 'package:meman/presentation/widget/icon_text.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends HookWidget {
  static const id = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.light)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Explore",
                      style: AppTextStyles.bodyTwo.copyWith(
                        color: AppColors.muted,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: BorderlessDropdownWidget(
                            selectedValue: "Ghana",
                            items: const ["Ghana"],
                            onChanged: (val) {},
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 45,
                          icon: CircleAvatar(
                            backgroundColor: AppColors.light,
                            foregroundColor: AppColors.primaryDark,
                            radius: 45,
                            child: Icon(
                              PhosphorIcons.magnifyingGlassBold,
                              color: AppColors.primaryDark,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.light,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onPressed: () {},
                          icon: Icon(
                            PhosphorIcons.fadersHorizontalBold,
                            color: AppColors.primaryDark,
                            size: 18,
                          ),
                          label: Text(
                            "All filters",
                            style: AppTextStyles.bodyTwo.copyWith(
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(color: AppColors.muted, thickness: 1.2),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 20,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Duration",
                                    style: AppTextStyles.bodyTwo.copyWith(
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Date",
                                    style: AppTextStyles.bodyTwo
                                        .copyWith(color: AppColors.secondary),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Region",
                                    style: AppTextStyles.bodyTwo
                                        .copyWith(color: AppColors.secondary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, idx) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: size.width,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: Assets.images.tmpMap.provider(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Assets.images.introBg.image(
                                      width: 80,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Kakum National Park: Ankasa forest, Cape coast",
                            style: AppTextStyles.headingFour.copyWith(
                              color: AppColors.primaryDark,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: const [
                              IconText(
                                label: "Central Region",
                                icon: PhosphorIcons.mapPinLineBold,
                              ),
                              SizedBox(width: 10),
                              IconText(
                                label: "205.8 km",
                                icon: PhosphorIcons.navigationArrowBold,
                              ),
                              SizedBox(width: 10),
                              IconText(
                                label: "12 hrs",
                                icon: PhosphorIcons.timerBold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
