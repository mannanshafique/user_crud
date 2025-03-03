extension FormValidator on String? {
  String? get validateUsername {
    if (this == null || this!.isEmpty) return 'Username is required';
    if (this!.contains(' ')) return 'No spaces allowed';
    if (this!.length < 3) return 'At least 3 characters required';
    return null;
  }

  String? get validateFullName {
    if (this == null || this!.isEmpty) return 'Full name is required';
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(this!))
      return 'Only letters and spaces allowed';
    return null;
  }

  String? get validateEmail {
    if (this == null || this!.isEmpty) return 'Email is required';
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(this!)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? get validatePhone {
    if (this == null || this!.isEmpty) return 'Phone number is required';
    return null;
  }

  String? get validateAddress {
    if (this == null || this!.isEmpty) return 'Address is required';
    if (this!.length < 5) return 'Enter at least 5 characters';
    return null;
  }

  String? get validateCompany {
    if (this == null || this!.isEmpty) return 'Company name is required';
    if (this!.length < 3) return 'Enter at least 3 characters';
    return null;
  }
}
