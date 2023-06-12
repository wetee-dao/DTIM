import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/domain/utils/functions.dart';

void main() {
  test("test getUserShortId", () {
    expect(getUserShortId("0x1234567890:org1"), "0x1234567890");
    expect(getUserShortId("0x1234567890:org2"), "0x1234567890");
    expect(getUserShortId("0x1234567890:org3"), "0x1234567890");
  });

  test("test getUserOrg", () {
    expect(getUserOrg("0x1234567890:org1"), "org1");
    expect(getUserOrg("0x1234567890:org2"), "org2");
    expect(getUserOrg("0x1234567890:org3"), "org3");
  });

  test("test getUserShortName", () {
    expect(getUserShortName("0x1234567890123456789012345678901234567890:org1"), "0x123456789...01234567890");
  });

  test("test fisrtUpperCase", () {
    expect(fisrtUpperCase("abc"), "Abc");
    expect(fisrtUpperCase("Abc"), "Abc");
    expect(fisrtUpperCase("ABC"), "ABC");
  });
}

fisrtUpperCase(String s) {
  return s.fisrtUpperCase();
}
