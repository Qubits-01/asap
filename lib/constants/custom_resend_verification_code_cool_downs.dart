class CustomResendVerificationCodeCoolDowns {
  const CustomResendVerificationCodeCoolDowns._();

  static const List<int> durationsInSeconds = [
    // 1 minute.
    60,

    // 5 minutes.
    300,

    // 15 minutes.
    900,

    // 1 hour.
    3600,

    // 3 hours.
    10800,

    // 9 hours.
    32400,

    // 1 day.
    86400,
  ];
}
