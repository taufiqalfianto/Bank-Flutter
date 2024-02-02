class DataPlanFormModel {
  final int? id;
  final String? phonenumber;
  final String? pin;

  const DataPlanFormModel({
    this.id,
    this.phonenumber,
    this.pin,
  });

  Map<String, dynamic> toJson() {
    return {
      'data_plan_id': id.toString(),
      'phone_number': phonenumber,
      'pin': pin,
    };
  }
}
