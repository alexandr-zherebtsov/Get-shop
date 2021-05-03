String formatMaskedPhone(String phoneNumber) {
  return phoneNumber.substring(0, 3) +
      ' (' +
      phoneNumber.substring(3, 6) +
      ') ' +
      phoneNumber.substring(6, 9) +
      '-' +
      phoneNumber.substring(9, 11) +
      '-' +
      phoneNumber.substring(11, phoneNumber.length);
}