class Booking {
  String adminId;
  String mechanicId;
  String bookingTitle;
  String startDate;
  String endDate;
  String carCompany;
  String carModel;
  String carYear;
  String registrationPlates;
  String customerName;
  String customerPhone;
  String customerEmail;

  Booking({
    required this.adminId,
    required this.mechanicId,
    required this.bookingTitle,
    required this.startDate,
    required this.endDate,
    required this.carCompany,
    required this.carModel,
    required this.carYear,
    required this.registrationPlates,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
  });

  // Factory constructor to create a Booking object from a map
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      adminId: json['admin_id'],
      mechanicId: json['mechanicId'],
      bookingTitle: json['booking_title'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      carCompany: json['car_company'],
      carModel: json['car_model'],
      carYear: json['car_year'],
      registrationPlates: json['registration_plates'],
      customerName: json['customer_name'],
      customerPhone: json['customer_phone'],
      customerEmail: json['customer_email'],
    );
  }

  // Method to convert a Booking object to a map
  Map<String, dynamic> toJson() {
    return {
      'admin_id': adminId,
      'mechanicId': mechanicId,
      'booking_title': bookingTitle,
      'start_date': startDate,
      'end_date': endDate,
      'car_company': carCompany,
      'car_model': carModel,
      'car_year': carYear,
      'registration_plates': registrationPlates,
      'customer_name': customerName,
      'customer_phone': customerPhone,
      'customer_email': customerEmail,
    };
  }
}
