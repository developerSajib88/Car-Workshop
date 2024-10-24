class BookingModel {
  String bookingId;
  String adminId;
  String mechanicId;
  String mechanicName;
  String mechanicEmail;
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

  BookingModel({
    required this.bookingId,
    required this.adminId,
    required this.mechanicId,
    required this.mechanicName,
    required this.mechanicEmail,
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

  // Factory constructor to create a Booking object from a JSON map
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bookingId: json['booking_id'],
      adminId: json['admin_id'],
      mechanicId: json['mechanic_id'],
      mechanicName: json['mechanic_name'],
      mechanicEmail: json['mechanic_email'],
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

  // Method to convert a Booking object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'admin_id': adminId,
      'mechanic_id': mechanicId,
      'mechanic_name': mechanicName,
      'mechanic_email': mechanicEmail,
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
