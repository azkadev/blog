// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "blog_contents.dart";

 
class BlogsData extends JsonScheme {

  
  BlogsData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"blogsData","blog_id":"","author_user_id":0,"photo_blog":"","create_date":0,"edit_date":0,"title":"","hastaghs":[""],"contents":[{"@type":"blogContents","content_id":"","content":""}]};
  }

  
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
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


  
  String? get blog_id {
    try {
      if (rawData["blog_id"] is String == false){
        return null;
      }
      return rawData["blog_id"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set blog_id(String? value) {
    rawData["blog_id"] = value;
  }


  
  num? get author_user_id {
    try {
      if (rawData["author_user_id"] is num == false){
        return null;
      }
      return rawData["author_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set author_user_id(num? value) {
    rawData["author_user_id"] = value;
  }


  
  String? get photo_blog {
    try {
      if (rawData["photo_blog"] is String == false){
        return null;
      }
      return rawData["photo_blog"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set photo_blog(String? value) {
    rawData["photo_blog"] = value;
  }


  
  num? get create_date {
    try {
      if (rawData["create_date"] is num == false){
        return null;
      }
      return rawData["create_date"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set create_date(num? value) {
    rawData["create_date"] = value;
  }


  
  num? get edit_date {
    try {
      if (rawData["edit_date"] is num == false){
        return null;
      }
      return rawData["edit_date"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set edit_date(num? value) {
    rawData["edit_date"] = value;
  }


  
  String? get title {
    try {
      if (rawData["title"] is String == false){
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


  
  List<String> get hastaghs {
    try {
      if (rawData["hastaghs"] is List == false){
        return [];
      }
      return (rawData["hastaghs"] as List).cast<String>();
    } catch (e) {
      return [];
    }
  }


  
  set hastaghs(List<String> value) {
    rawData["hastaghs"] = value;
  }

  
  List<BlogContents> get contents {
    try {
      if (rawData["contents"] is List == false){
        return [];
      }
      return (rawData["contents"] as List).map((e) => BlogContents(e as Map)).toList().cast<BlogContents>();
    } catch (e) {
      return [];
    }
  }


  
  set contents(List<BlogContents> values) {
    rawData["contents"] = values.map((value) => value.toJson()).toList();
  }



  
  static BlogsData create({

    String special_type = "blogsData",
    String? blog_id,
    num? author_user_id,
    String? photo_blog,
    num? create_date,
    num? edit_date,
    String? title,
      List<String>? hastaghs,
      List<BlogContents>? contents,
})  {
    // BlogsData blogsData = BlogsData({
Map blogsData_data_create_json = {
  
      "@type": special_type,
      "blog_id": blog_id,
      "author_user_id": author_user_id,
      "photo_blog": photo_blog,
      "create_date": create_date,
      "edit_date": edit_date,
      "title": title,
      "hastaghs": hastaghs,
      "contents": (contents != null)? contents.toJson(): null,


};


          blogsData_data_create_json.removeWhere((key, value) => value == null);
BlogsData blogsData_data_create = BlogsData(blogsData_data_create_json);

return blogsData_data_create;



      }
}