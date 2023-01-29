class Check {
  var name, email, mob, address, password;
  Check(this.name, this.email, this.mob, this.address, this.password);

  Map<String, dynamic> toJson() {
    return {
      'Name': this.name,
      'Email': this.email,
      'Mobile': this.mob,
      'Address': this.address,
      'Password': this.password,
    };
  }
}
