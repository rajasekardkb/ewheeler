class LoginResponse {
  List<DATA> dATA;
  int cOUNT;
  String eRRORCODE;
  String mESSAGE;
  bool sTATUS;

  LoginResponse(
      {this.dATA, this.cOUNT, this.eRRORCODE, this.mESSAGE, this.sTATUS});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json['DATA'] != null) {
      dATA = new List<DATA>();
      json['DATA'].forEach((v) {
        dATA.add(new DATA.fromJson(v));
      });
    }
    cOUNT = json['COUNT'];
    eRRORCODE = json['ERRORCODE'];
    mESSAGE = json['MESSAGE'];
    sTATUS = json['STATUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dATA != null) {
      data['DATA'] = this.dATA.map((v) => v.toJson()).toList();
    }
    data['COUNT'] = this.cOUNT;
    data['ERRORCODE'] = this.eRRORCODE;
    data['MESSAGE'] = this.mESSAGE;
    data['STATUS'] = this.sTATUS;
    return data;
  }
}

class DATA {
  String UD_ID;
  String UD_NAME;
  String UD_EMAIL;
  String UD_MOBILE;
  String UD_OTP;

  DATA({this.UD_ID, this.UD_NAME, this.UD_EMAIL, this.UD_MOBILE, this.UD_OTP});

  DATA.fromJson(Map<String, dynamic> json) {
    UD_ID = json['UD_ID'];
    UD_NAME = json['UD_NAME'];
    UD_EMAIL = json['UD_EMAIL'];
    UD_MOBILE = json['UD_MOBILE'];
    UD_OTP = json['UD_OTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UD_ID'] = this.UD_ID;
    data['UD_NAME'] = this.UD_NAME;
    data['UD_EMAIL'] = this.UD_EMAIL;
    data['UD_OTP'] = this.UD_OTP;
    return data;
  }
}
