use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_connect(port_: i64, url: *mut wire_uint_8_list) {
    wire_connect_impl(port_, url)
}

#[no_mangle]
pub extern "C" fn wire_seed_generate(port_: i64) {
    wire_seed_generate_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_get_seed_phrase(
    port_: i64,
    seed_str: *mut wire_uint_8_list,
    name: *mut wire_uint_8_list,
    password: *mut wire_uint_8_list,
) {
    wire_get_seed_phrase_impl(port_, seed_str, name, password)
}

#[no_mangle]
pub extern "C" fn wire_add_keyring(
    port_: i64,
    keyring_str: *mut wire_uint_8_list,
    password: *mut wire_uint_8_list,
) {
    wire_add_keyring_impl(port_, keyring_str, password)
}

#[no_mangle]
pub extern "C" fn wire_sign_from_address(
    port_: i64,
    address: *mut wire_uint_8_list,
    ctx: *mut wire_uint_8_list,
) {
    wire_sign_from_address_impl(port_, address, ctx)
}

#[no_mangle]
pub extern "C" fn wire_native_balance(port_: i64, client: u32, address: *mut wire_uint_8_list) {
    wire_native_balance_impl(port_, client, address)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
