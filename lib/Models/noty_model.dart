class NotificationModel {
  String? sender;
  String? reciever;
  String? title;
  String? content;
  bool? isread;
  DateTime? createdOn;

  NotificationModel({
    this.sender,
    this.reciever,
    this.title,
    this.content,
    this.isread,
    this.createdOn,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    reciever = json['reciever'];
    title = json['title'];
    content = json['content'];
    isread = json['isread'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender'] = sender;
    data['reciever'] = reciever;
    data['title'] = title;
    data['content'] = content;
    data['isread'] = isread;
    data['created_on'] = createdOn;
    return data;
  }
}
