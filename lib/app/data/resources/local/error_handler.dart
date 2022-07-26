import 'package:dio/dio.dart';

Map<String, dynamic> returnResponse(Response<dynamic>? response) {
  Map<String, dynamic> map;
  try {
      if(response!.statusCode != null){
        // print("el status code es: ${response.statusCode}");
        // print("el response es: ${response.statusMessage}");
        // print("el response es: ${response.data}");
        // print("el response es: ${response}");


      }else{
        // print(response);
      }
      switch (response.statusCode) {
      case 200:
        map = {
          "data": response.data,
          "error": null,
          "msg": null,
          "code": 200,
        };
        return map;
      case 400:
        return map = {
          "data": null,
          "error": "Solicitud No Valida:",
          "msg": response.data['msg'],
          "code": 400
        };
      //throw BadRequestException(responseJson['msg']);
      case 403:
        return map = {
          "data": null,
          "error": "No Autorizado:",
          "msg": response.data['msg'],
          "code": 403,
        };
      //throw UnauthorizedException(responseJson['msg']);
      case 404:
        return map = {
          "data": null,
          "error": "No Encontrado:",
          "msg": "No se ha encontrado el servidor",
          "code": 404,
        };
      //throw NotFoundException(responseJson['msg']);
      case 500:
        return map = {
          "data": null,
          "error": "Error De Servidor Interno: ",
          "msg": response.data['msg'],
          "code": 500,
        };
      //throw InternalServerException(responseJson['msg']);
      case 20201:
        return map = {
          "data": null,
          "error": "Oh no!: ",
          "msg": response.data['msg'],
          "code": 20201
        };
      //throw InvalidInputException(responseJson['msg']);
      default:
        return map = {
          "data": null,
          "error":
              "Se produjo un error al comunicarse con el servidor con código de estado : ",
          "msg": "Codigo: ${response.statusCode}",
          "code": 20290
        };
    }
  } catch (e) {
    map = {
      "data": null,
      "error": "Se produjo un error al comunicarse con el servidor: ",
      "msg": "Codigo: 404",
      "code": 404
    };
    return map;
  }
}
