use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_connect_wallet(port_: i64) {
    wire_connect_wallet_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_connect(port_: i64, url: *mut wire_uint_8_list) {
    wire_connect_impl(port_, url)
}

#[no_mangle]
pub extern "C" fn wire_start_client(port_: i64, client: u32) {
    wire_start_client_impl(port_, client)
}

#[no_mangle]
pub extern "C" fn wire_stop_client(port_: i64, client: u32) {
    wire_stop_client_impl(port_, client)
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
pub extern "C" fn wire_add_seed(port_: i64, seed: *mut wire_uint_8_list) {
    wire_add_seed_impl(port_, seed)
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
pub extern "C" fn wire_create_dao(
    port_: i64,
    client: u32,
    from: *mut wire_uint_8_list,
    name: *mut wire_uint_8_list,
    purpose: *mut wire_uint_8_list,
    meta_data: *mut wire_uint_8_list,
    desc: *mut wire_uint_8_list,
    im_api: *mut wire_uint_8_list,
    bg: *mut wire_uint_8_list,
    logo: *mut wire_uint_8_list,
    img: *mut wire_uint_8_list,
    home_url: *mut wire_uint_8_list,
) {
    wire_create_dao_impl(
        port_, client, from, name, purpose, meta_data, desc, im_api, bg, logo, img, home_url,
    )
}

#[no_mangle]
pub extern "C" fn wire_orgs(port_: i64, client: u32) {
    wire_orgs_impl(port_, client)
}

#[no_mangle]
pub extern "C" fn wire_create_app(
    port_: i64,
    client: u32,
    from: *mut wire_uint_8_list,
    name: *mut wire_uint_8_list,
    desc: *mut wire_uint_8_list,
    icon: *mut wire_uint_8_list,
    url: *mut wire_uint_8_list,
) {
    wire_create_app_impl(port_, client, from, name, desc, icon, url)
}

#[no_mangle]
pub extern "C" fn wire_update_app_status(
    port_: i64,
    client: u32,
    from: *mut wire_uint_8_list,
    app_id: u64,
    status: u8,
) {
    wire_update_app_status_impl(port_, client, from, app_id, status)
}

#[no_mangle]
pub extern "C" fn wire_org_integrate_app(
    port_: i64,
    client: u32,
    from: *mut wire_uint_8_list,
    org_id: u64,
    app_id: u64,
    ext: *mut wire_WithGovPs,
) {
    wire_org_integrate_app_impl(port_, client, from, org_id, app_id, ext)
}

#[no_mangle]
pub extern "C" fn wire_app_hubs(port_: i64, client: u32) {
    wire_app_hubs_impl(port_, client)
}

#[no_mangle]
pub extern "C" fn wire_org_apps(port_: i64, client: u32, org_id: u64) {
    wire_org_apps_impl(port_, client, org_id)
}

#[no_mangle]
pub extern "C" fn wire_update_org_app_status(
    port_: i64,
    client: u32,
    from: *mut wire_uint_8_list,
    org_id: u64,
    app_id: u64,
    status: u8,
    ext: *mut wire_WithGovPs,
) {
    wire_update_org_app_status_impl(port_, client, from, org_id, app_id, status, ext)
}

#[no_mangle]
pub extern "C" fn wire_create_asset(
    port_: i64,
    client: u32,
    from: *mut wire_uint_8_list,
    dao_id: u64,
    name: *mut wire_uint_8_list,
    symbol: *mut wire_uint_8_list,
    total_supply: u64,
    decimals: u8,
) {
    wire_create_asset_impl(
        port_,
        client,
        from,
        dao_id,
        name,
        symbol,
        total_supply,
        decimals,
    )
}

#[no_mangle]
pub extern "C" fn wire_get_block_number(port_: i64, client: u32) {
    wire_get_block_number_impl(port_, client)
}

#[no_mangle]
pub extern "C" fn wire_native_balance(port_: i64, client: u32, address: *mut wire_uint_8_list) {
    wire_native_balance_impl(port_, client, address)
}

#[no_mangle]
pub extern "C" fn wire_dao_init_from_pair(port_: i64, client: u32, address: *mut wire_uint_8_list) {
    wire_dao_init_from_pair_impl(port_, client, address)
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
pub extern "C" fn wire_dao_info(port_: i64, client: u32, dao_id: u64) {
    wire_dao_info_impl(port_, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_total_issuance(port_: i64, client: u32, dao_id: u64) {
    wire_dao_total_issuance_impl(port_, client, dao_id)
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
    ext: *mut wire_WithGovPs,
) {
    wire_create_project_impl(port_, from, client, dao_id, name, desc, ext)
}

#[no_mangle]
pub extern "C" fn wire_create_guild(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    name: *mut wire_uint_8_list,
    desc: *mut wire_uint_8_list,
    ext: *mut wire_WithGovPs,
) {
    wire_create_guild_impl(port_, from, client, dao_id, name, desc, ext)
}

#[no_mangle]
pub extern "C" fn wire_dao_gov_pending_referendum_list(port_: i64, client: u32, dao_id: u64) {
    wire_dao_gov_pending_referendum_list_impl(port_, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_gov_referendum_list(port_: i64, client: u32, dao_id: u64) {
    wire_dao_gov_referendum_list_impl(port_, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_gov_start_referendum(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    index: u32,
    deposit: u64,
) {
    wire_dao_gov_start_referendum_impl(port_, from, client, dao_id, index, deposit)
}

#[no_mangle]
pub extern "C" fn wire_dao_gov_vote_for_referendum(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    index: u32,
    vote: u64,
    approve: bool,
) {
    wire_dao_gov_vote_for_referendum_impl(port_, from, client, dao_id, index, vote, approve)
}

#[no_mangle]
pub extern "C" fn wire_dao_gov_votes_of_user(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
) {
    wire_dao_gov_votes_of_user_impl(port_, from, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_gov_run_proposal(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    index: u32,
) {
    wire_dao_gov_run_proposal_impl(port_, from, client, dao_id, index)
}

#[no_mangle]
pub extern "C" fn wire_dao_gov_unlock(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
) {
    wire_dao_gov_unlock_impl(port_, from, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_memeber_list(port_: i64, client: u32, dao_id: u64) {
    wire_dao_memeber_list_impl(port_, client, dao_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_guild_memeber_list(port_: i64, client: u32, dao_id: u64, guild_id: u64) {
    wire_dao_guild_memeber_list_impl(port_, client, dao_id, guild_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_member_list(
    port_: i64,
    client: u32,
    dao_id: u64,
    project_id: u64,
) {
    wire_dao_project_member_list_impl(port_, client, dao_id, project_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_task_list(port_: i64, client: u32, project_id: u64) {
    wire_dao_project_task_list_impl(port_, client, project_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_task_info(
    port_: i64,
    client: u32,
    project_id: u64,
    task_id: u64,
) {
    wire_dao_project_task_info_impl(port_, client, project_id, task_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_create_task(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    name: *mut wire_uint_8_list,
    desc: *mut wire_uint_8_list,
    priority: u8,
    point: u16,
    assignees: *mut wire_StringList,
    reviewers: *mut wire_StringList,
    skills: *mut wire_uint_8_list,
    max_assignee: *mut u8,
    amount: u64,
) {
    wire_dao_project_create_task_impl(
        port_,
        from,
        client,
        dao_id,
        project_id,
        name,
        desc,
        priority,
        point,
        assignees,
        reviewers,
        skills,
        max_assignee,
        amount,
    )
}

#[no_mangle]
pub extern "C" fn wire_dao_project_start_task(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) {
    wire_dao_project_start_task_impl(port_, from, client, dao_id, project_id, task_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_request_review(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) {
    wire_dao_project_request_review_impl(port_, from, client, dao_id, project_id, task_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_task_done(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) {
    wire_dao_project_task_done_impl(port_, from, client, dao_id, project_id, task_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_join_task(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) {
    wire_dao_project_join_task_impl(port_, from, client, dao_id, project_id, task_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_leave_task(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) {
    wire_dao_project_leave_task_impl(port_, from, client, dao_id, project_id, task_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_join_task_review(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) {
    wire_dao_project_join_task_review_impl(port_, from, client, dao_id, project_id, task_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_leave_task_review(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) {
    wire_dao_project_leave_task_review_impl(port_, from, client, dao_id, project_id, task_id)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_make_review(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
    approve: bool,
    meta: *mut wire_uint_8_list,
) {
    wire_dao_project_make_review_impl(
        port_, from, client, dao_id, project_id, task_id, approve, meta,
    )
}

#[no_mangle]
pub extern "C" fn wire_dao_project_join_request(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    ext: *mut wire_WithGovPs,
) {
    wire_dao_project_join_request_impl(port_, from, client, dao_id, project_id, ext)
}

#[no_mangle]
pub extern "C" fn wire_dao_project_join_request_with_root(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    user: *mut wire_uint_8_list,
) {
    wire_dao_project_join_request_with_root_impl(port_, from, client, dao_id, project_id, user)
}

#[no_mangle]
pub extern "C" fn wire_dao_guild_join_request(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    guild_id: u64,
    ext: *mut wire_WithGovPs,
) {
    wire_dao_guild_join_request_impl(port_, from, client, dao_id, guild_id, ext)
}

#[no_mangle]
pub extern "C" fn wire_dao_member_point(
    port_: i64,
    client: u32,
    dao_id: u64,
    member: *mut wire_uint_8_list,
) {
    wire_dao_member_point_impl(port_, client, dao_id, member)
}

#[no_mangle]
pub extern "C" fn wire_dao_apply_project_funds(
    port_: i64,
    from: *mut wire_uint_8_list,
    client: u32,
    dao_id: u64,
    project_id: u64,
    amount: u64,
    ext: *mut wire_WithGovPs,
) {
    wire_dao_apply_project_funds_impl(port_, from, client, dao_id, project_id, amount, ext)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_StringList_0(len: i32) -> *mut wire_StringList {
    let wrap = wire_StringList {
        ptr: support::new_leak_vec_ptr(<*mut wire_uint_8_list>::new_with_null_ptr(), len),
        len,
    };
    support::new_leak_box_ptr(wrap)
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_u16_0(value: u16) -> *mut u16 {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_u8_0(value: u8) -> *mut u8 {
    support::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_with_gov_ps_0() -> *mut wire_WithGovPs {
    support::new_leak_box_ptr(wire_WithGovPs::new_with_null_ptr())
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
impl Wire2Api<Vec<String>> for *mut wire_StringList {
    fn wire2api(self) -> Vec<String> {
        let vec = unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        };
        vec.into_iter().map(Wire2Api::wire2api).collect()
    }
}

impl Wire2Api<u16> for *mut u16 {
    fn wire2api(self) -> u16 {
        unsafe { *support::box_from_leak_ptr(self) }
    }
}
impl Wire2Api<u8> for *mut u8 {
    fn wire2api(self) -> u8 {
        unsafe { *support::box_from_leak_ptr(self) }
    }
}
impl Wire2Api<WithGovPs> for *mut wire_WithGovPs {
    fn wire2api(self) -> WithGovPs {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<WithGovPs>::wire2api(*wrap).into()
    }
}
impl Wire2Api<MemberGroup> for wire_MemberGroup {
    fn wire2api(self) -> MemberGroup {
        MemberGroup {
            scope: self.scope.wire2api(),
            id: self.id.wire2api(),
        }
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
impl Wire2Api<WithGovPs> for wire_WithGovPs {
    fn wire2api(self) -> WithGovPs {
        WithGovPs {
            run_type: self.run_type.wire2api(),
            amount: self.amount.wire2api(),
            member: self.member.wire2api(),
            period_index: self.period_index.wire2api(),
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_StringList {
    ptr: *mut *mut wire_uint_8_list,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_MemberGroup {
    scope: u8,
    id: u64,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_WithGovPs {
    run_type: u8,
    amount: u64,
    member: wire_MemberGroup,
    period_index: u32,
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

impl NewWithNullPtr for wire_MemberGroup {
    fn new_with_null_ptr() -> Self {
        Self {
            scope: Default::default(),
            id: Default::default(),
        }
    }
}

impl Default for wire_MemberGroup {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_WithGovPs {
    fn new_with_null_ptr() -> Self {
        Self {
            run_type: Default::default(),
            amount: Default::default(),
            member: Default::default(),
            period_index: Default::default(),
        }
    }
}

impl Default for wire_WithGovPs {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
