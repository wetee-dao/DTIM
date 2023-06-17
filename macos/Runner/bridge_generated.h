#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
typedef struct _Dart_Handle* Dart_Handle;

typedef struct DartCObject DartCObject;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_MemberGroup {
  uint8_t scope;
  uint64_t id;
} wire_MemberGroup;

typedef struct wire_WithGovPs {
  uint8_t run_type;
  uint64_t amount;
  struct wire_MemberGroup member;
} wire_WithGovPs;

typedef struct wire_StringList {
  struct wire_uint_8_list **ptr;
  int32_t len;
} wire_StringList;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_connect_wallet(int64_t port_);

void wire_connect(int64_t port_, struct wire_uint_8_list *url);

void wire_start_client(int64_t port_, uint32_t client);

void wire_stop_client(int64_t port_, uint32_t client);

void wire_seed_generate(int64_t port_);

void wire_get_seed_phrase(int64_t port_,
                          struct wire_uint_8_list *seed_str,
                          struct wire_uint_8_list *name,
                          struct wire_uint_8_list *password);

void wire_add_keyring(int64_t port_,
                      struct wire_uint_8_list *keyring_str,
                      struct wire_uint_8_list *password);

void wire_add_seed(int64_t port_, struct wire_uint_8_list *seed);

void wire_sign_from_address(int64_t port_,
                            struct wire_uint_8_list *address,
                            struct wire_uint_8_list *ctx);

void wire_create_dao(int64_t port_,
                     uint32_t client,
                     struct wire_uint_8_list *from,
                     struct wire_uint_8_list *name,
                     struct wire_uint_8_list *purpose,
                     struct wire_uint_8_list *meta_data);

void wire_create_asset(int64_t port_,
                       uint32_t client,
                       struct wire_uint_8_list *from,
                       uint64_t dao_id,
                       struct wire_uint_8_list *name,
                       struct wire_uint_8_list *symbol,
                       uint64_t total_supply,
                       uint8_t decimals);

void wire_get_block_number(int64_t port_, uint32_t client);

void wire_native_balance(int64_t port_, uint32_t client, struct wire_uint_8_list *address);

void wire_dao_init_from_pair(int64_t port_, uint32_t client, struct wire_uint_8_list *address);

void wire_dao_balance(int64_t port_,
                      uint32_t client,
                      uint64_t dao_id,
                      struct wire_uint_8_list *address);

void wire_dao_info(int64_t port_, uint32_t client, uint64_t dao_id);

void wire_dao_total_issuance(int64_t port_, uint32_t client, uint64_t dao_id);

void wire_dao_roadmap(int64_t port_, uint32_t client, uint64_t dao_id, uint32_t year);

void wire_dao_create_roadmap_task(int64_t port_,
                                  struct wire_uint_8_list *from,
                                  uint32_t client,
                                  uint64_t dao_id,
                                  uint32_t roadmap_id,
                                  struct wire_uint_8_list *name,
                                  uint8_t priority,
                                  struct wire_uint_8_list *tags);

void wire_join_dao(int64_t port_,
                   struct wire_uint_8_list *from,
                   uint32_t client,
                   uint64_t dao_id,
                   uint32_t share_expect,
                   uint64_t value);

void wire_dao_memebers(int64_t port_, uint32_t client, uint64_t dao_id);

void wire_dao_projects(int64_t port_, uint32_t client, uint64_t dao_id);

void wire_dao_guilds(int64_t port_, uint32_t client, uint64_t dao_id);

void wire_ss58(int64_t port_, struct wire_uint_8_list *address, uint16_t *prefix);

void wire_create_project(int64_t port_,
                         struct wire_uint_8_list *from,
                         uint32_t client,
                         uint64_t dao_id,
                         struct wire_uint_8_list *name,
                         struct wire_uint_8_list *desc,
                         struct wire_WithGovPs *ext);

void wire_create_guild(int64_t port_,
                       struct wire_uint_8_list *from,
                       uint32_t client,
                       uint64_t dao_id,
                       struct wire_uint_8_list *name,
                       struct wire_uint_8_list *desc,
                       struct wire_WithGovPs *ext);

void wire_dao_gov_pending_referendum_list(int64_t port_, uint32_t client, uint64_t dao_id);

void wire_dao_gov_referendum_list(int64_t port_, uint32_t client, uint64_t dao_id);

void wire_dao_gov_start_referendum(int64_t port_,
                                   struct wire_uint_8_list *from,
                                   uint32_t client,
                                   uint64_t dao_id,
                                   uint32_t index);

void wire_dao_gov_vote_for_referendum(int64_t port_,
                                      struct wire_uint_8_list *from,
                                      uint32_t client,
                                      uint64_t dao_id,
                                      uint32_t index,
                                      uint64_t vote,
                                      bool approve);

void wire_dao_gov_votes_of_user(int64_t port_,
                                struct wire_uint_8_list *from,
                                uint32_t client,
                                uint64_t dao_id);

void wire_dao_gov_run_proposal(int64_t port_,
                               struct wire_uint_8_list *from,
                               uint32_t client,
                               uint64_t dao_id,
                               uint32_t index);

void wire_dao_gov_unlock(int64_t port_,
                         struct wire_uint_8_list *from,
                         uint32_t client,
                         uint64_t dao_id);

void wire_dao_memeber_list(int64_t port_, uint32_t client, uint64_t dao_id);

void wire_dao_guild_memeber_list(int64_t port_,
                                 uint32_t client,
                                 uint64_t dao_id,
                                 uint64_t guild_id);

void wire_dao_project_member_list(int64_t port_,
                                  uint32_t client,
                                  uint64_t dao_id,
                                  uint64_t project_id);

void wire_dao_project_task_list(int64_t port_, uint32_t client, uint64_t project_id);

void wire_dao_project_task_info(int64_t port_,
                                uint32_t client,
                                uint64_t project_id,
                                uint64_t task_id);

void wire_dao_project_create_task(int64_t port_,
                                  struct wire_uint_8_list *from,
                                  uint32_t client,
                                  uint64_t dao_id,
                                  uint64_t project_id,
                                  struct wire_uint_8_list *name,
                                  struct wire_uint_8_list *desc,
                                  uint8_t priority,
                                  uint16_t point,
                                  struct wire_StringList *assignees,
                                  struct wire_StringList *reviewers,
                                  struct wire_uint_8_list *skills,
                                  uint8_t *max_assignee,
                                  uint64_t amount);

void wire_dao_project_start_task(int64_t port_,
                                 struct wire_uint_8_list *from,
                                 uint32_t client,
                                 uint64_t dao_id,
                                 uint64_t project_id,
                                 uint64_t task_id);

void wire_dao_project_request_review(int64_t port_,
                                     struct wire_uint_8_list *from,
                                     uint32_t client,
                                     uint64_t dao_id,
                                     uint64_t project_id,
                                     uint64_t task_id);

void wire_dao_project_task_done(int64_t port_,
                                struct wire_uint_8_list *from,
                                uint32_t client,
                                uint64_t dao_id,
                                uint64_t project_id,
                                uint64_t task_id);

void wire_dao_project_join_task(int64_t port_,
                                struct wire_uint_8_list *from,
                                uint32_t client,
                                uint64_t dao_id,
                                uint64_t project_id,
                                uint64_t task_id);

void wire_dao_project_leave_task(int64_t port_,
                                 struct wire_uint_8_list *from,
                                 uint32_t client,
                                 uint64_t dao_id,
                                 uint64_t project_id,
                                 uint64_t task_id);

void wire_dao_project_join_task_review(int64_t port_,
                                       struct wire_uint_8_list *from,
                                       uint32_t client,
                                       uint64_t dao_id,
                                       uint64_t project_id,
                                       uint64_t task_id);

void wire_dao_project_leave_task_review(int64_t port_,
                                        struct wire_uint_8_list *from,
                                        uint32_t client,
                                        uint64_t dao_id,
                                        uint64_t project_id,
                                        uint64_t task_id);

void wire_dao_project_make_review(int64_t port_,
                                  struct wire_uint_8_list *from,
                                  uint32_t client,
                                  uint64_t dao_id,
                                  uint64_t project_id,
                                  uint64_t task_id,
                                  bool approve,
                                  struct wire_uint_8_list *meta);

void wire_dao_project_join_request(int64_t port_,
                                   struct wire_uint_8_list *from,
                                   uint32_t client,
                                   uint64_t dao_id,
                                   uint64_t project_id,
                                   struct wire_WithGovPs *ext);

void wire_dao_project_join_request_with_root(int64_t port_,
                                             struct wire_uint_8_list *from,
                                             uint32_t client,
                                             uint64_t dao_id,
                                             uint64_t project_id,
                                             struct wire_uint_8_list *user);

void wire_dao_guild_join_request(int64_t port_,
                                 struct wire_uint_8_list *from,
                                 uint32_t client,
                                 uint64_t dao_id,
                                 uint64_t guild_id,
                                 struct wire_WithGovPs *ext);

void wire_dao_member_point(int64_t port_,
                           uint32_t client,
                           uint64_t dao_id,
                           struct wire_uint_8_list *member);

void wire_dao_apply_project_funds(int64_t port_,
                                  struct wire_uint_8_list *from,
                                  uint32_t client,
                                  uint64_t dao_id,
                                  uint64_t project_id,
                                  uint64_t amount,
                                  struct wire_WithGovPs *ext);

struct wire_StringList *new_StringList_0(int32_t len);

uint16_t *new_box_autoadd_u16_0(uint16_t value);

uint8_t *new_box_autoadd_u8_0(uint8_t value);

struct wire_WithGovPs *new_box_autoadd_with_gov_ps_0(void);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_connect_wallet);
    dummy_var ^= ((int64_t) (void*) wire_connect);
    dummy_var ^= ((int64_t) (void*) wire_start_client);
    dummy_var ^= ((int64_t) (void*) wire_stop_client);
    dummy_var ^= ((int64_t) (void*) wire_seed_generate);
    dummy_var ^= ((int64_t) (void*) wire_get_seed_phrase);
    dummy_var ^= ((int64_t) (void*) wire_add_keyring);
    dummy_var ^= ((int64_t) (void*) wire_add_seed);
    dummy_var ^= ((int64_t) (void*) wire_sign_from_address);
    dummy_var ^= ((int64_t) (void*) wire_create_dao);
    dummy_var ^= ((int64_t) (void*) wire_create_asset);
    dummy_var ^= ((int64_t) (void*) wire_get_block_number);
    dummy_var ^= ((int64_t) (void*) wire_native_balance);
    dummy_var ^= ((int64_t) (void*) wire_dao_init_from_pair);
    dummy_var ^= ((int64_t) (void*) wire_dao_balance);
    dummy_var ^= ((int64_t) (void*) wire_dao_info);
    dummy_var ^= ((int64_t) (void*) wire_dao_total_issuance);
    dummy_var ^= ((int64_t) (void*) wire_dao_roadmap);
    dummy_var ^= ((int64_t) (void*) wire_dao_create_roadmap_task);
    dummy_var ^= ((int64_t) (void*) wire_join_dao);
    dummy_var ^= ((int64_t) (void*) wire_dao_memebers);
    dummy_var ^= ((int64_t) (void*) wire_dao_projects);
    dummy_var ^= ((int64_t) (void*) wire_dao_guilds);
    dummy_var ^= ((int64_t) (void*) wire_ss58);
    dummy_var ^= ((int64_t) (void*) wire_create_project);
    dummy_var ^= ((int64_t) (void*) wire_create_guild);
    dummy_var ^= ((int64_t) (void*) wire_dao_gov_pending_referendum_list);
    dummy_var ^= ((int64_t) (void*) wire_dao_gov_referendum_list);
    dummy_var ^= ((int64_t) (void*) wire_dao_gov_start_referendum);
    dummy_var ^= ((int64_t) (void*) wire_dao_gov_vote_for_referendum);
    dummy_var ^= ((int64_t) (void*) wire_dao_gov_votes_of_user);
    dummy_var ^= ((int64_t) (void*) wire_dao_gov_run_proposal);
    dummy_var ^= ((int64_t) (void*) wire_dao_gov_unlock);
    dummy_var ^= ((int64_t) (void*) wire_dao_memeber_list);
    dummy_var ^= ((int64_t) (void*) wire_dao_guild_memeber_list);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_member_list);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_task_list);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_task_info);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_create_task);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_start_task);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_request_review);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_task_done);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_join_task);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_leave_task);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_join_task_review);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_leave_task_review);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_make_review);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_join_request);
    dummy_var ^= ((int64_t) (void*) wire_dao_project_join_request_with_root);
    dummy_var ^= ((int64_t) (void*) wire_dao_guild_join_request);
    dummy_var ^= ((int64_t) (void*) wire_dao_member_point);
    dummy_var ^= ((int64_t) (void*) wire_dao_apply_project_funds);
    dummy_var ^= ((int64_t) (void*) new_StringList_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u16_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_u8_0);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_with_gov_ps_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
