import 'package:blog/scheme/blog_contents.dart';
import 'package:blog/scheme/blogs_data.dart';
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:intl/intl.dart';

class BlogContainerWidget extends StatefulWidget {
  final BlogsData blogsData;
  final void Function()? onTap;

  const BlogContainerWidget({super.key, required this.blogsData, required this.onTap});

  @override
  State<BlogContainerWidget> createState() => _BlogContainerWidgetState();
}

class _BlogContainerWidgetState extends State<BlogContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final List<BlogContents> contents = widget.blogsData.contents;
    final BlogContents blogContents = contents.firstOrNull ?? BlogContents({});
    final List<String> hastaghs = widget.blogsData.hastaghs;
    final DateTime createDateTime = DateTime.fromMillisecondsSinceEpoch((widget.blogsData.create_date ?? 0).toInt());
    String pathImage = widget.blogsData.photo_blog ?? "";
    DecorationImage? image;
    if (pathImage.isNotEmpty) {
      image = DecorationImage(
        fit: BoxFit.cover,
        image: () {
          if (RegExp(r"^(http(s)?)").hasMatch(pathImage)) {
            return Image.network(
              pathImage,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
            ).image;
          }

          return Image.asset(
            pathImage,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          ).image;
        }(),
        // image: AssetImage(pathImage),
        onError: (errDetails, error) {},
      );
    }
    return InkWell(
      onTap: widget.onTap,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(2),
        // onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: context.height / 2,
              width: context.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: image,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          5,
                        ),
                        child: Text(
                          "unknown - ${DateFormat("dd MMM yyyy").format(createDateTime)}",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: context.theme.indicatorColor,
                            fontSize: 10,
                            shadows: [
                              BoxShadow(
                                color: context.theme.shadowColor.withAlpha(110),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          5,
                        ),
                        child: Text(
                          "${widget.blogsData.title}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: context.theme.indicatorColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                color: context.theme.shadowColor.withAlpha(110),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          5,
                        ),
                        child: Text(
                          () {
                            String content = blogContents.content ?? "";
                            return content.substring(0, (content.length > 160) ? 160 : null);
                          }()
                              .trim(),
                          // selectionHeightStyle: BoxHeightStyle.max,
                          // selectionWidthStyle: BoxWidthStyle.max,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 10,
                            shadows: [
                              BoxShadow(
                                color: context.theme.shadowColor.withAlpha(110),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      removeLeft: true,
                      removeRight: true,
                      removeTop: true,
                      child: Wrap(
                        children: hastaghs.map((e) {
                          return Container(
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
                            margin: const EdgeInsets.all(5),
                            child: MaterialButton(
                              onPressed: () async { 
                              },
                              child: Text(
                                e.trim(),
                                style: TextStyle(
                                  shadows: [
                                    BoxShadow(
                                      color: context.theme.shadowColor.withAlpha(110),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
