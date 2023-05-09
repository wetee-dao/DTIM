# generated with cargo-xcode 1.4.3

set -eu; export PATH=$PATH:~/.cargo/bin:/usr/local/bin;
if [ "${IS_MACCATALYST-NO}" = YES ]; then
    CARGO_XCODE_TARGET_TRIPLE="${CARGO_XCODE_TARGET_ARCH}-apple-ios-macabi"
else
    CARGO_XCODE_TARGET_TRIPLE="${CARGO_XCODE_TARGET_ARCH}-apple-${CARGO_XCODE_TARGET_OS}"
fi
if [ "$CARGO_XCODE_TARGET_OS" != "darwin" ]; then
    PATH="${PATH/\/Contents\/Developer\/Toolchains\/XcodeDefault.xctoolchain\/usr\/bin:/xcode-provided-ld-cant-link-lSystem-for-the-host-build-script:}"
fi
PATH="$PATH:/opt/homebrew/bin" # Rust projects often depend on extra tools like nasm, which Xcode lacks
if [ "$CARGO_XCODE_BUILD_MODE" == release ]; then
    OTHER_INPUT_FILE_FLAGS="${OTHER_INPUT_FILE_FLAGS} --release"
fi
if command -v rustup &> /dev/null; then
    if ! rustup target list --installed | egrep -q "${CARGO_XCODE_TARGET_TRIPLE}"; then
        echo "warning: this build requires rustup toolchain for $CARGO_XCODE_TARGET_TRIPLE, but it isn't installed"
        rustup target add "${CARGO_XCODE_TARGET_TRIPLE}" || echo >&2 "warning: can't install $CARGO_XCODE_TARGET_TRIPLE"
    fi
fi
if [ "$ACTION" = clean ]; then
 ( set -x; cargo clean --manifest-path="$SCRIPT_INPUT_FILE" ${OTHER_INPUT_FILE_FLAGS} --target="${CARGO_XCODE_TARGET_TRIPLE}"; );
else
 ( set -x; cargo build --manifest-path="$SCRIPT_INPUT_FILE" --features="${CARGO_XCODE_FEATURES:-}" ${OTHER_INPUT_FILE_FLAGS} --target="${CARGO_XCODE_TARGET_TRIPLE}"; );
fi
# it's too hard to explain Cargo's actual exe path to Xcode build graph, so hardlink to a known-good path instead
BUILT_SRC="${CARGO_TARGET_DIR}/${CARGO_XCODE_TARGET_TRIPLE}/${CARGO_XCODE_BUILD_MODE}/${CARGO_XCODE_CARGO_FILE_NAME}"
ln -f -- "$BUILT_SRC" "$SCRIPT_OUTPUT_FILE_0"

# xcode generates dep file, but for its own path, so append our rename to it
DEP_FILE_SRC="${CARGO_TARGET_DIR}/${CARGO_XCODE_TARGET_TRIPLE}/${CARGO_XCODE_BUILD_MODE}/${CARGO_XCODE_CARGO_DEP_FILE_NAME}"
if [ -f "$DEP_FILE_SRC" ]; then
   DEP_FILE_DST="${DERIVED_FILE_DIR}/${CARGO_XCODE_TARGET_ARCH}-${EXECUTABLE_NAME}.d"
   cp -f "$DEP_FILE_SRC" "$DEP_FILE_DST"
   echo >> "$DEP_FILE_DST" "$SCRIPT_OUTPUT_FILE_0: $BUILT_SRC"
fi

# lipo script needs to know all the platform-specific files that have been built
# archs is in the file name, so that paths don't stay around after archs change
# must match input for LipoScript
FILE_LIST="${DERIVED_FILE_DIR}/${ARCHS}-${EXECUTABLE_NAME}.xcfilelist"
touch "$FILE_LIST"
if ! egrep -q "$SCRIPT_OUTPUT_FILE_0" "$FILE_LIST" ; then
   echo >> "$FILE_LIST" "$SCRIPT_OUTPUT_FILE_0"
fi
