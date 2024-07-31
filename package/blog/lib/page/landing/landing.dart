// ignore_for_file: non_constant_identifier_names

/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:blog/page/blog/blog.dart';
import 'package:blog/scheme/scheme.dart';
import 'package:blog/widget/author.dart';
import 'package:blog/widget/footer.dart';
import 'package:blog/widget/markdown/markdown.dart';

class LandingPageBlog extends StatefulWidget {
  final BlogData blogData;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const LandingPageBlog({
    super.key,
    required this.blogData,
    required this.generalLibFlutterApp,
  });

  @override
  State<LandingPageBlog> createState() => _LandingPageBlogState();
}

class _LandingPageBlogState extends State<LandingPageBlog> {
  GlobalKey globalKey = GlobalKey();

  ScrollControllerAutoKeepStateData scroll_controller_auto_keep_state_data = ScrollControllerAutoKeepStateData(keyId: "landing_page_blog");
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });
  }

  Future<void> refresh() async {
    setState(() {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          context.width,
          450,
        ),
        child: Container(
          key: globalKey,
          decoration: BoxDecoration(
            // borderRadius: const BorderRadius.only(
            //   bottomLeft: Radius.circular(40),
            //   bottomRight: Radius.circular(40),
            // ),
            color: context.theme.dialogBackgroundColor.withOpacity(0.85),
            boxShadow: [
              BoxShadow(
                color: context.theme.shadowColor.withAlpha(110),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.mediaQueryData.padding.top,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      context.navigator().pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return LandingPageBlog(
                            blogData: widget.blogData,
                            generalLibFlutterApp: widget.generalLibFlutterApp,
                          );
                        },
                      ));
                    },
                    child: Text(
                      "${widget.blogData.title}".trim(),
                      style: TextStyle(
                        color: context.theme.indicatorColor,
                      ),
                    ),
                  ),
                  // auto change theme
                  Builder(
                    builder: (context) {
                      // theme mode
                      return IconButton(
                        onPressed: () {
                          widget.generalLibFlutterApp.autoChangeTheme(
                            onChangeBrightness: () {
                              return context.mediaQueryData.platformBrightness;
                            },
                          );
                          setState(() {});
                        },
                        icon: Icon(
                          () {
                            if (widget.generalLibFlutterApp.themeMode == ThemeMode.dark) {
                              return Icons.dark_mode;
                            }
                            if (widget.generalLibFlutterApp.themeMode == ThemeMode.light) {
                              return Icons.light_mode;
                            }

                            return Icons.auto_mode;
                          }(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: scroll_controller_auto_keep_state_data.builderWidget(
        builder: (context, pageStorageBucket) {
          return SingleChildScrollView(
            controller: scroll_controller_auto_keep_state_data.scroll_controller,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: context.height,
                minWidth: context.width,
                maxHeight: double.maxFinite,
                // maxWidth: context.width,
              ),
              child: Builder(
                builder: (context) {
                  List<Widget> children = [
                    SizedBox.fromSize(
                      size: globalKey.sizeRenderBox(),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: "${widget.blogData.logo}".trim().isNotEmpty,
                            child: Image.asset(
                              "${widget.blogData.logo}",
                            ),
                          ),
                          Text(
                            "${widget.blogData.title}".trim(),
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${widget.blogData.description}".trim(),
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          //
                          AuthorBlogWidget(
                            authorUrlSocialMedias: widget.blogData.author_url_social_medias,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: MarkdownBlogWidget(
                        alignment: Alignment.center,
                        text: () async {
                          return (widget.blogData.content ?? "").trim();
                        },
                      ),
                    ),

                    //
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Example Project Use This Library",
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            """
Berikut adalah beberapa contoh project yang menggunakan library ${widget.blogData.title}
"""
                                .trim(),
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    //
                    //

                    //
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Docs",
                            style: TextStyle(
                              color: context.theme.indicatorColor,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          List<BlogsData> blogs = widget.blogData.blogs;
                          return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5, childAspectRatio: 16 / 9),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: blogs.length,
                            padding: const EdgeInsets.all(20),
                            itemBuilder: (context, index) {
                              BlogsData blogsData = blogs[index];
                              return Column(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "${blogsData.title}",
                                      style: TextStyle(
                                        color: context.theme.indicatorColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${blogsData.description}".trim(),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: context.theme.dialogBackgroundColor.withOpacity(0.85),
                                      borderRadius: BorderRadiusDirectional.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: context.theme.shadowColor.withAlpha(110),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        context.navigator().push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return BlogPageBlog(
                                                blogsData: blogsData,
                                                authorUrlSocialMedias: widget.blogData.author_url_social_medias,
                                                blogFooterData: widget.blogData.footer,
                                                generalLibFlutterApp: widget.generalLibFlutterApp,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Read More",
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    FooterBlogWidget(
                      authorUrlSocialMedias: widget.blogData.author_url_social_medias,
                      blogFooterData: widget.blogData.footer,
                    ),
                  ];
                  children.add(
                    SizedBox(
                      height: context.mediaQueryData.padding.bottom,
                    ),
                  );
                  context.mediaQueryData.padding.bottom.printPretty();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
