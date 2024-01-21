class UpdateEmployeeParam {
  String? start_work;
  String? end_work;
  int? employer_id;

  UpdateEmployeeParam({this.end_work, this.start_work, this.employer_id});

  Map<String, dynamic> toJson() => {
        "start_work": start_work,
        "end_work": end_work,
        "employer_id": employer_id,
      };
}
