// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class BlogContents extends JsonScheme {

  
  BlogContents(super.rawData);
   
  static Map get defaultData {
    return {"@type":"blogContents","content_id":"","content":""};
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


  
  String? get content_id {
    try {
      if (rawData["content_id"] is String == false){
        return null;
      }
      return rawData["content_id"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set content_id(String? value) {
    rawData["content_id"] = value;
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


  
  static BlogContents create({

    String special_type = "blogContents",
    String? content_id,
    String? content,
})  {
    // BlogContents blogContents = BlogContents({
Map blogContents_data_create_json = {
  
      "@type": special_type,
      "content_id": content_id,
      "content": content,


};


          blogContents_data_create_json.removeWhere((key, value) => value == null);
BlogContents blogContents_data_create = BlogContents(blogContents_data_create_json);

return blogContents_data_create;



      }
}