import 'package:flutter_test/flutter_test.dart';

import 'package:dtim/domain/utils/time.dart';

void main() {
  test("test getTime", () {
    expect(getTime(DateTime(2021, 1, 1, 1, 1)), "01:01");
    expect(getTime(DateTime(2021, 1, 1, 12, 12)), "12:12");
    expect(getTime(DateTime(2021, 1, 1, 23, 59)), "23:59");
  });

  test("test getDay", () {
    expect(getDay(DateTime(2021, 1, 1, 1, 1)), "2021-01-01");
  });
}
