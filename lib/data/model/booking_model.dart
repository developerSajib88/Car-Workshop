class BookingModel {
  int? bookingId;
  int? adminId;
  int? mechanicId;
  String? mechanicImage;
  String? mechanicPhone;
  String? mechanicName;
  String? mechanicEmail;
  String? bookingTitle;
  String? startDate;
  String? endDate;
  String? carCompany;
  String? carModel;
  String? carYear;
  String? registrationPlates;
  String? customerName;
  String? customerPhone;
  String? customerEmail;

  BookingModel({
    this.bookingId,
    this.adminId,
    this.mechanicId,
    this.mechanicImage,
    this.mechanicPhone,
    this.mechanicName,
    this.mechanicEmail,
    this.bookingTitle,
    this.startDate,
    this.endDate,
    this.carCompany,
    this.carModel,
    this.carYear,
    this.registrationPlates,
    this.customerName,
    this.customerPhone,
    this.customerEmail,
  });

  // Factory constructor to create a Booking object from a JSON map
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bookingId: json['booking_id'],
      adminId: json['admin_id'],
      mechanicImage: json['profile'],
      mechanicPhone: json['mechanic_phone'],
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
      'profile' : mechanicImage,
      'mechanic_phone' : mechanicPhone,
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
