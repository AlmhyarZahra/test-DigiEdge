class PassordModel {
    bool? success;
    String? message;
    List<Datum>? data;

    PassordModel({
        this.success,
        this.message,
        this.data,
    });

    factory PassordModel.fromJson(Map<String, dynamic> json) => PassordModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? password;

    Datum({
        this.password,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "password": password,
    };
}
