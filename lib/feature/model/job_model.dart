class Job {
  Job({
    this.companyName,
    this.location,
    this.experience,
    this.workHours,
    this.workName,
    this.whenShare,
    this.salary,
    this.phone,
    this.name,
    this.vacancies,
    this.responsibilities,
    this.requirements,
  });

  Job.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    location = json['location'];
    experience = json['experience'];
    workHours = json['workHours'];
    workName = json['workName'];
    whenShare = json['whenShare'];

    salary = json['salary'];
    phone = json['phone'];
    name = json['name'];
    vacancies = json['vacancies'];
    responsibilities = json['responsibilities'];
    requirements = json['requirements'];
  }
  String? companyName;
  String? location;
  String? experience;
  String? workHours;
  String? workName;
  String? whenShare;

  String? salary;
  String? phone;
  String? name;
  int? vacancies;
  String? responsibilities;
  String? requirements;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['companyName'] = companyName;
    data['location'] = location;
    data['experience'] = experience;
    data['workHours'] = workHours;
    data['workName'] = workName;
    data['whenShare'] = whenShare;
    data['salary'] = salary;
    data['phone'] = phone;
    data['name'] = name;
    data['vacancies'] = vacancies;
    data['responsibilities'] = responsibilities;
    data['requirements'] = requirements;
    return data;
  }
}
