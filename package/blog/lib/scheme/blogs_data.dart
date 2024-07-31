// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class BlogsData extends JsonScheme {

  
  BlogsData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"blogsData","blog_id":"","title":"","description":"","content":""};
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


  
  String? get description {
    try {
      if (rawData["description"] is String == false){
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
      if (rawData["content"] is String == false){
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


  
  static BlogsData create({

    String special_type = "blogsData",
    String? blog_id,
    String? title,
    String? description,
    String? content,
})  {
    // BlogsData blogsData = BlogsData({
Map blogsData_data_create_json = {
  
      "@type": special_type,
      "blog_id": blog_id,
      "title": title,
      "description": description,
      "content": content,


};


          blogsData_data_create_json.removeWhere((key, value) => value == null);
BlogsData blogsData_data_create = BlogsData(blogsData_data_create_json);

return blogsData_data_create;



      }
}