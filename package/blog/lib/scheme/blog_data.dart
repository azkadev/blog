// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "blogs_data.dart";
import "blog_footer_data.dart";

class BlogData extends JsonScheme {
  BlogData(super.rawData);

  static Map get defaultData {
    return {
      "@type": "blogData",
      "logo": "",
      "title": "",
      "description": "",
      "content": "",
      "author_url_social_medias": ["url"],
      "blogs": [
        {
          "@type": "blogsData",
          "blog_id": "",
          "title": "",
          "description": "",
          "content": ""
        }
      ],
      "footer": {
        "@type": "blogFooterData",
        "footers": [
          {
            "@type": "footersData",
            "title": "",
            "footer": [
              {"@type": "footerData", "text": "", "url": ""}
            ]
          }
        ]
      }
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  set special_type(String? value) {
    rawData["@type"] = value;
  }

  String? get logo {
    try {
      if (rawData["logo"] is String == false) {
        return null;
      }
      return rawData["logo"] as String;
    } catch (e) {
      return null;
    }
  }

  set logo(String? value) {
    rawData["logo"] = value;
  }

  String? get title {
    try {
      if (rawData["title"] is String == false) {
        return null;
      }
      return rawData["title"] as String;
    } catch (e) {
      return null;
    }
  }

  set title(String? value) {
    rawData["title"] = value;
  }

  String? get description {
    try {
      if (rawData["description"] is String == false) {
        return null;
      }
      return rawData["description"] as String;
    } catch (e) {
      return null;
    }
  }

  set description(String? value) {
    rawData["description"] = value;
  }

  String? get content {
    try {
      if (rawData["content"] is String == false) {
        return null;
      }
      return rawData["content"] as String;
    } catch (e) {
      return null;
    }
  }

  set content(String? value) {
    rawData["content"] = value;
  }

  List<String> get author_url_social_medias {
    try {
      if (rawData["author_url_social_medias"] is List == false) {
        return [];
      }
      return (rawData["author_url_social_medias"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }

  set author_url_social_medias(List<String> value) {
    rawData["author_url_social_medias"] = value;
  }

  List<BlogsData> get blogs {
    try {
      if (rawData["blogs"] is List == false) {
        return [];
      }
      return (rawData["blogs"] as List)
          .map((e) => BlogsData(e as Map))
          .toList()
          .cast<BlogsData>();
    } catch (e) {
      return [];
    }
  }

  set blogs(List<BlogsData> values) {
    rawData["blogs"] = values.map((value) => value.toJson()).toList();
  }

  BlogFooterData get footer {
    try {
      if (rawData["footer"] is Map == false) {
        return BlogFooterData({});
      }
      return BlogFooterData(rawData["footer"] as Map);
    } catch (e) {
      return BlogFooterData({});
    }
  }

  set footer(BlogFooterData value) {
    rawData["footer"] = value.toJson();
  }

  static BlogData create({
    String special_type = "blogData",
    String? logo,
    String? title,
    String? description,
    String? content,
    List<String>? author_url_social_medias,
    List<BlogsData>? blogs,
    BlogFooterData? footer,
  }) {
    // BlogData blogData = BlogData({
    Map blogData_data_create_json = {
      "@type": special_type,
      "logo": logo,
      "title": title,
      "description": description,
      "content": content,
      "author_url_social_medias": author_url_social_medias,
      "blogs": (blogs != null) ? blogs.toJson() : null,
      "footer": (footer != null) ? footer.toJson() : null,
    };

    blogData_data_create_json.removeWhere((key, value) => value == null);
    BlogData blogData_data_create = BlogData(blogData_data_create_json);

    return blogData_data_create;
  }
}
