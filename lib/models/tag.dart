final tags = [Tag("DAPP", 1), Tag("TEE", 2), Tag("Pallet", 3)];

class Tag {
  final int value;
  final String label;

  Tag(this.label, this.value);
}

Tag findTag(int value) {
  return tags.firstWhere((element) => element.value == value);
}
