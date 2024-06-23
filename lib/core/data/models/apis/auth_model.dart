class AuthModel {
    bool? success;
    String? message;
    UserData? data;

    AuthModel({
        this.success,
        this.message,
        this.data,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null || json["data"] is List ?  null : UserData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data":data is List ? null :  data?.toJson(),
    };
}

class UserData {
    String? id;
    String? name;
    String? countryCode;
    String? phone;
    String? email;
    String? token;
    DateTime? tokenExpiry;

    UserData({
        this.id,
        this.name,
        this.countryCode,
        this.phone,
        this.email,
        this.token,
        this.tokenExpiry,
    });

    factory UserData.copy(UserData userModel) => UserData.fromJson(userModel.toJson());

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        phone: json["phone"],
        email: json["email"],
        token: json["token"],
        tokenExpiry: json["token_expiry"] == null ? null : DateTime.parse(json["token_expiry"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "phone": phone,
        "email": email,
        "token": token,
        "token_expiry": tokenExpiry?.toIso8601String(),
    };
}
