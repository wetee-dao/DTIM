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

#[no_mangle]
pub extern "C" fn wire_dao_balance(
    port_: i64,
    client: u32,
    dao_id: u64,
    address: *mut wire_uint_8_list,
) {
    wire_dao_balance_impl(port_, client, dao_id, address)
}

#[no_mangle]
pub extern "C" fn wire_dao_roadmap(port_: i64, client: u32, dao_id: u64, year: u32) {
    wire_dao_roadmap_impl(port_, client, dao_id, year)
}

#[no_mangle]
pub extern "C" fn wire_dao_create_roadmap_task(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    roadmap_id: u32,
    name: *mut wire_uint_8_list,
    priority: u8,
    tags: *mut wire_uint_8_list,
) {
    wire_dao_create_roadmap_task_impl(
        port_, from, client, dao_id, roadmap_id, name, priority, tags,
    )
}

#[no_mangle]
pub extern "C" fn wire_join_dao(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    share_expect: u32,
    value: u64,
) {
    wire_join_dao_impl(port_, from, client, dao_id, share_expect, value)
}

#[no_mangle]
pub extern "C" fn wire_dao_memebers(port_: i64, client: u32, dao_id: u64) {
    wire_dao_memebers_impl(port_, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_projects(port_: i64, client: u32, dao_id: u64) {
    wire_dao_projects_impl(port_, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_guilds(port_: i64, client: u32, dao_id: u64) {
    wire_dao_guilds_impl(port_, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_ss58(port_: i64, address: *mut wire_uint_8_list, prefix: *mut u16) {
    wire_ss58_impl(port_, address, prefix)
}

#[no_mangle]
pub extern "C" fn wire_create_project(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    name: *mut wire_uint_8_list,
    desc: *mut wire_uint_8_list,
) {
    wire_create_project_impl(port_, from, client, dao_id, name, desc)
}

#[no_mangle]
pub extern "C" fn wire_create_guild(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    name: *mut wire_uint_8_list,
    desc: *mut wire_uint_8_list,
) {
    wire_create_guild_impl(port_, from, client, dao_id, name, desc)
}

#[no_mangle]
pub extern "C" fn wire_get_dao_gov_public_props(port_: i64, client: u32, dao_id: u64) {
    wire_get_dao_gov_public_props_impl(port_, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_gov_start_referendum(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    index: u32,
) {
    wire_dao_gov_start_referendum_impl(port_, from, client, dao_id, index)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_u16_0(value: u16) -> *mut u16 {
    support::new_leak_box_ptr(value)
}

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
impl Wire2Api<u16> for *mut u16 {
    fn wire2api(self) -> u16 {
        unsafe { *support::box_from_leak_ptr(self) }
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
