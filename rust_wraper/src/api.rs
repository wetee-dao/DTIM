use std::time::Duration;

use crate::model::{
    member_ps_trans, member_trans, AssetAccountData, DaoInfo, GovProps, GovReferendum, GovVote,
    GuildInfo, ProjectInfo, Quarter, QuarterTask, Reward, Tally, TaskInfo, WithGovPs, U8Wrap,
};
use anyhow::{self, Ok};
use asyou_rust_sdk::{
    account,
    chain::UNIT,
    hander::{
        balance::Balance,
        wetee_asset::WeteeAsset,
        wetee_dao::WeteeDAO,
        wetee_gov::{Opinion, Pledge, ReferendumStatus, WeteeGov},
        wetee_guild::WeteeGuild,
        wetee_project::{TaskStatus, WeteeProject},
    },
    model::{account::KeyringJSON, dao::WithGov},
    Client,
};
use tokio::{runtime::Runtime, time::sleep};

// use std::sync::Arc;
// pub enum Platform {
//     MacIntel,
//     MacApple,
//     MacOs(String),
// }

pub fn connect_wallet() -> anyhow::Result<String> {
    Ok("".to_string())
}

pub fn connect(url: String) -> anyhow::Result<usize> {
    // 创建连接
    let client: Client = Client::new(url.to_string())?;

    Ok(client.index)
}

pub fn start_client(client: u32) -> anyhow::Result<()> {
    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        loop {
            let mut c = Client::from_index(client)?;
            let status = c.get_status().unwrap_or(0);
            if status == 3 {
                println!("链接退出");
                break;
            }
            let _ = c.start().await;
            let status = c.get_status().unwrap_or(0);
            if status == 3 {
                println!("链接退出");
                break;
            }
            println!("链接出现错误，5秒后重链");
            sleep(Duration::from_secs(5)).await;
        }
        Ok(())
    })
}

pub fn stop_client(client: u32) -> anyhow::Result<()> {
    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let c = Client::from_index(client)?;
        c.stop().await.unwrap();
        Ok(())
    })
}

/// 获取种子
pub fn seed_generate() -> Vec<String> {
    let seed_str = account::generate();
    let seeds: Vec<&str> = seed_str.split(' ').collect();
    println!("seeds => {:?}", seeds);

    let mut seed_list: Vec<String> = vec![];
    for s in &seeds {
        seed_list.push((*s).to_string());
    }

    return seed_list.iter().map(|s| s.to_string()).collect();
}

/// 种子换取账户信息
pub fn get_seed_phrase(seed_str: String, name: String, password: String) -> anyhow::Result<String> {
    let res = account::get_seed_phrase(seed_str, name, password)?;
    let jstr = serde_json::to_string(&res)?;
    Ok(jstr)
}

pub fn add_keyring(keyring_str: String, password: String) -> anyhow::Result<bool> {
    let keyring: KeyringJSON = serde_json::from_str(&keyring_str).unwrap();
    account::add_keyring(keyring, password)?;
    Ok(true)
}

pub fn add_seed(seed: String) -> anyhow::Result<String> {
    let (address, _) = account::add_keyring_from_seed(seed)?;
    Ok(address)
}

pub fn sign_from_address(address: String, ctx: String) -> anyhow::Result<String> {
    let addr = account::sign_from_address(address, ctx)?;
    return Ok(addr);
}

pub fn create_dao(
    client: u32,
    from: String,
    name: String,
    purpose: String,
    meta_data: String,
) -> anyhow::Result<()> {
    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let c = Client::from_index(client)?;
        let mut dao = WeteeDAO::new(c);

        dao.create_dao(
            from.clone(),
            name.clone(),
            purpose.clone(),
            meta_data.clone(),
        )
        .await.unwrap();
        Ok(())
    })
}

pub fn create_asset(
    client: u32,
    from: String,
    dao_id: u64,
    name: String,
    symbol: String,
    total_supply: u64,
    decimals: u8,
) -> anyhow::Result<()> {
    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let c = Client::from_index(client)?;
        let mut asset = WeteeAsset::new(c);

        asset.create_asset(
            from.clone(),
            dao_id,
            name.clone(),
            symbol.clone(),
            total_supply.into(),
            decimals.into(),
        ).await.unwrap();
        Ok(())
    })
}


pub fn get_block_number(client: u32) -> anyhow::Result<u64> {
    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let c = Client::from_index(client)?;
        let block_number = c.get_block_number().await.unwrap();
        Ok(block_number)
    })
}

pub fn native_balance(client: u32, address: String) -> anyhow::Result<AssetAccountData> {
    let c = Client::from_index(client)?;
    let mut balance = Balance::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let b = balance.balance(address.clone()).await.unwrap();
        Ok(AssetAccountData {
            free: b.free.try_into().unwrap(),
            frozen: b.frozen.try_into().unwrap(),
            reserved: b.reserved.try_into().unwrap(),
        })
    })
}

pub fn dao_init_from_pair(client: u32, address: String) -> anyhow::Result<()> {
    let c: Client = Client::from_index(client)?;
    let mut balance = Balance::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        balance
            .init_from_pair(address.clone(), (UNIT * 500).into())
            .await
            .unwrap();
        Ok(())
    })
}

pub fn dao_balance(client: u32, dao_id: u64, address: String) -> anyhow::Result<AssetAccountData> {
    let c = Client::from_index(client)?;
    let mut asset = WeteeAsset::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let b = asset.balance(dao_id, address.clone()).await.unwrap();
        Ok(AssetAccountData {
            free: b.free.try_into().unwrap(),
            frozen: b.frozen.try_into().unwrap(),
            reserved: b.reserved.try_into().unwrap(),
        })
    })
}

pub fn dao_info(client: u32, dao_id: u64) -> anyhow::Result<DaoInfo> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let info = dao.dao_info(dao_id).await.unwrap();
        Ok(DaoInfo {
            id: dao_id,
            creator: account::ss58_to_address(info.creator.to_string()).unwrap(),
            start_block: info.start_block,
            dao_account_id: account::ss58_to_address(info.dao_account_id.to_string()).unwrap(),
            name: String::from_utf8(info.name).unwrap(),
            purpose: String::from_utf8(info.purpose).unwrap(),
            meta_data: String::from_utf8(info.meta_data).unwrap(),
            chain_unit: UNIT,
        })
    })
}

pub fn dao_total_issuance(client: u32, dao_id: u64) -> anyhow::Result<u64> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let total_issuance = dao.total_issuance(dao_id).await.unwrap();
        Ok(total_issuance.try_into().unwrap())
    })
}

pub fn dao_roadmap(client: u32, dao_id: u64, year: u32) -> anyhow::Result<Vec<Quarter>> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let roadmap = dao.roadmap_list(dao_id, year.clone()).await.unwrap();
        let mut quarters: Vec<Quarter> = vec![];
        for r in &roadmap {
            quarters.push(Quarter {
                year: r.year,
                quarter: r.quarter,
                tasks: r
                    .clone()
                    .tasks
                    .into_iter()
                    .map(|t| QuarterTask {
                        id: t.id,
                        name: String::from_utf8(t.name).unwrap(),
                        priority: t.priority,
                        creator: account::ss58_to_address(t.creator.to_string()).unwrap(),
                        tags: t.tags.into_iter().map(|t|U8Wrap{value:t}).collect(),
                        status: t.status,
                    })
                    .collect(),
            });
        }
        Ok(quarters)
    })
}

// 创建季度任务

pub fn dao_create_roadmap_task(
    from: String,
    client: u32,
    dao_id: u64,
    roadmap_id: u32,
    name: String,
    priority: u8,
    tags: Vec<u8>,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        dao.create_task(from, dao_id, roadmap_id, name.into(), priority, Some(tags))
            .await
            .unwrap();

        Ok(true)
    })
}

// 加入DAO

pub fn join_dao(
    from: String,
    client: u32,
    dao_id: u64,
    share_expect: u32,
    value: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        dao.join(from, dao_id, share_expect, value).await.unwrap();

        Ok(true)
    })
}

pub fn dao_memebers(client: u32, dao_id: u64) -> anyhow::Result<Vec<String>> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let members = dao.member_list(dao_id).await.unwrap();
        Ok(members
            .into_iter()
            .map(|m| account::ss58_to_address(m.to_string()).unwrap())
            .collect())
    })
}

pub fn dao_projects(client: u32, dao_id: u64) -> anyhow::Result<Vec<ProjectInfo>> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let b = project.project_list(dao_id).await.unwrap();
        Ok(b.into_iter()
            .map(|p| ProjectInfo {
                id: p.id,
                name: String::from_utf8(p.name).unwrap(),
                dao_account_id: account::ss58_to_address(p.dao_account_id.to_string()).unwrap(),
                description: String::from_utf8(p.description).unwrap(),
                creator: account::ss58_to_address(p.creator.to_string()).unwrap(),
                status: p.status as u8,
            })
            .collect())
    })
}

pub fn dao_guilds(client: u32, dao_id: u64) -> anyhow::Result<Vec<GuildInfo>> {
    let c = Client::from_index(client)?;
    let mut guild = WeteeGuild::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let gs = guild.guild_list(dao_id).await.unwrap();
        Ok(gs
            .into_iter()
            .map(|g| GuildInfo {
                id: g.id,
                name: String::from_utf8(g.name).unwrap(),
                desc: String::from_utf8(g.desc).unwrap(),
                dao_account_id: account::ss58_to_address(g.dao_account_id.to_string()).unwrap(),
                creator: account::ss58_to_address(g.creator.to_string()).unwrap(),
                status: g.status as u8,
                start_block: g.start_block,
                meta_data: String::from_utf8(g.meta_data).unwrap(),
            })
            .collect())
    })
}

pub fn ss58(address: String, prefix: Option<u16>) -> anyhow::Result<String> {
    match prefix {
        Some(i) => {
            return Ok(account::address_to_ss58(address, i)?);
        }
        _ => {
            return Ok(account::address_to_ss58(address, 42)?);
        }
    };
}

pub fn create_project(
    from: String,
    client: u32,
    dao_id: u64,
    name: String,
    desc: String,
    ext: Option<WithGovPs>,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .create_project(
                from,
                dao_id,
                name.into(),
                desc.into(),
                if ext.is_some() {
                    let e = ext.unwrap();
                    Some(WithGov {
                        run_type: e.run_type,
                        amount: e.amount.into(),
                        member: member_ps_trans(e.member),
                    })
                } else {
                    None
                },
            )
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn create_guild(
    from: String,
    client: u32,
    dao_id: u64,
    name: String,
    desc: String,
    ext: Option<WithGovPs>,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeGuild::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .create_guild(
                from,
                dao_id,
                name.into(),
                desc.into(),
                "{}".into(),
                if ext.is_some() {
                    let e = ext.unwrap();
                    Some(WithGov {
                        run_type: e.run_type,
                        amount: e.amount.into(),
                        member: member_ps_trans(e.member),
                    })
                } else {
                    None
                },
            )
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_gov_pending_referendum_list(client: u32, dao_id: u64) -> anyhow::Result<Vec<GovProps>> {
    let c = Client::from_index(client)?;
    let mut gov = WeteeGov::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let props = gov.pending_referendum_list(dao_id.clone()).await.unwrap();
        Ok(props
            .into_iter()
            .map(|(index, hash, call, member, account)| {
                let hash_str = "0x".to_owned() + &hex::encode(hash.as_bytes());
                let call_str = format!("{:?}", call);

                return GovProps {
                    index,
                    hash: hash_str,
                    runtime_call: call_str,
                    member_group: member_trans(member),
                    account: account::ss58_to_address(account.to_string()).unwrap(),
                };
            })
            .collect())
    })
}

pub fn dao_gov_referendum_list(client: u32, dao_id: u64) -> anyhow::Result<Vec<GovReferendum>> {
    let c = Client::from_index(client)?;
    let mut gov = WeteeGov::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let referendums = gov.referendum_list(dao_id.clone()).await.unwrap();
        Ok(referendums
            .into_iter()
            .map(|(hash, referendum)| {
                // let call_id: u32 =
                //     TryFrom::<wetee_runtime::RuntimeCall>::try_from(call).unwrap_or_default();
                let call_str = format!("{:?}", referendum.proposal);
                let status = match referendum.status {
                    ReferendumStatus::Ongoing => 0,
                    ReferendumStatus::Approved => 1,
                    ReferendumStatus::Rejected => 2,
                };
                return GovReferendum {
                    id: referendum.id,
                    hash,
                    end: referendum.end,
                    proposal: call_str,
                    delay: referendum.delay,
                    tally: Tally {
                        yes: referendum.tally.yes.try_into().unwrap(),
                        no: referendum.tally.no.try_into().unwrap(),
                    },
                    member_group: member_trans(referendum.member_data),
                    status,
                };
            })
            .collect())
    })
}

pub fn dao_gov_start_referendum(
    from: String,
    client: u32,
    dao_id: u64,
    index: u32,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut gov = WeteeGov::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        gov.start_referendum(from, dao_id, index).await.unwrap();

        Ok(true)
    })
}

pub fn dao_gov_vote_for_referendum(
    from: String,
    client: u32,
    dao_id: u64,
    index: u32,
    vote: u64,
    approve: bool,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut gov = WeteeGov::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        gov.vote_for_referendum(from, dao_id, index, vote, approve)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_gov_votes_of_user(
    from: String,
    client: u32,
    dao_id: u64,
) -> anyhow::Result<Vec<GovVote>> {
    let c = Client::from_index(client)?;
    let mut gov = WeteeGov::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let votes = gov.votes_of_user(from, dao_id).await.unwrap();
        Ok(votes
            .into_iter()
            .map(|vote| {
                let approve = match vote.opinion {
                    Opinion::YES => 1,
                    Opinion::NO => 0,
                };
                let amount = match vote.pledge {
                    Pledge::FungToken(x) => x,
                };
                return GovVote {
                    dao_id,
                    pledge: amount.try_into().unwrap(),
                    opinion: approve,
                    vote_weight: vote.vote_weight.try_into().unwrap(),
                    unlock_block: vote.unlock_block,
                    referendum_index: vote.referendum_index,
                };
            })
            .collect())
    })
}

pub fn dao_gov_run_proposal(
    from: String,
    client: u32,
    dao_id: u64,
    index: u32,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut gov = WeteeGov::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        gov.run_proposal(from, dao_id, index).await.unwrap();

        Ok(true)
    })
}

pub fn dao_gov_unlock(from: String, client: u32, dao_id: u64) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut gov = WeteeGov::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        gov.unlock(from, dao_id).await.unwrap();

        Ok(true)
    })
}

pub fn dao_memeber_list(client: u32, dao_id: u64) -> anyhow::Result<Vec<String>> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let members = dao.member_list(dao_id).await.unwrap();
        Ok(members
            .into_iter()
            .map(|account| {
                return account::ss58_to_address(account.to_string()).unwrap();
            })
            .collect())
    })
}

pub fn dao_guild_memeber_list(
    client: u32,
    dao_id: u64,
    guild_id: u64,
) -> anyhow::Result<Vec<String>> {
    let c = Client::from_index(client)?;
    let mut guild = WeteeGuild::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let members = guild.member_list(dao_id, guild_id).await.unwrap();
        Ok(members
            .into_iter()
            .map(|account| {
                return account::ss58_to_address(account.to_string()).unwrap();
            })
            .collect())
    })
}

pub fn dao_project_member_list(
    client: u32,
    dao_id: u64,
    project_id: u64,
) -> anyhow::Result<Vec<String>> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let members = project.member_list(dao_id, project_id).await.unwrap();
        Ok(members
            .into_iter()
            .map(|account| {
                return account::ss58_to_address(account.to_string()).unwrap();
            })
            .collect())
    })
}

pub fn dao_project_task_list(client: u32, project_id: u64) -> anyhow::Result<Vec<TaskInfo>> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let tasks = project.task_list(project_id).await.unwrap();
        Ok(tasks
            .into_iter()
            .map(|task| {
                return TaskInfo {
                    id: task.id,
                    name: String::from_utf8(task.name).unwrap(),
                    description: String::from_utf8(task.description).unwrap(),
                    status: match task.status {
                        TaskStatus::ToDo => 0,
                        TaskStatus::InProgress => 1,
                        TaskStatus::InReview => 2,
                        TaskStatus::Done => 3,
                    },
                    point: task.point,
                    priority: task.priority,
                    project_id,
                    creator: account::ss58_to_address(task.creator.to_string()).unwrap(),
                    rewards: task
                        .rewards
                        .into_iter()
                        .map(|(id, amount)| {
                            return Reward {
                                asset_id: id,
                                amount: amount.try_into().unwrap(),
                            };
                        })
                        .collect(),
                    max_assignee: task.max_assignee,
                    assignees: task
                        .assignees
                        .into_iter()
                        .map(|account| {
                            return account::ss58_to_address(account.to_string()).unwrap();
                        })
                        .collect(),
                    reviewers: task
                        .reviewers
                        .into_iter()
                        .map(|account| {
                            return account::ss58_to_address(account.to_string()).unwrap();
                        })
                        .collect(),
                    skills: task.skills.into_iter().map(|t|U8Wrap{value:t}).collect(),
                };
            })
            .collect())
    })
}

pub fn dao_project_task_info(
    client: u32,
    project_id: u64,
    task_id: u64,
) -> anyhow::Result<TaskInfo> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let task = project.task_info(project_id, task_id).await.unwrap();
        Ok(TaskInfo {
            id: task.id,
            name: String::from_utf8(task.name).unwrap(),
            description: String::from_utf8(task.description).unwrap(),
            status: match task.status {
                TaskStatus::ToDo => 0,
                TaskStatus::InProgress => 1,
                TaskStatus::InReview => 2,
                TaskStatus::Done => 3,
            },
            point: task.point,
            priority: task.priority,
            project_id,
            creator: account::ss58_to_address(task.creator.to_string()).unwrap(),
            rewards: task
                .rewards
                .into_iter()
                .map(|(id, amount)| {
                    return Reward {
                        asset_id: id,
                        amount: amount.try_into().unwrap(),
                    };
                })
                .collect(),
            max_assignee: task.max_assignee,
            assignees: task
                .assignees
                .into_iter()
                .map(|account| {
                    return account::ss58_to_address(account.to_string()).unwrap();
                })
                .collect(),
            reviewers: task
                .reviewers
                .into_iter()
                .map(|account| {
                    return account::ss58_to_address(account.to_string()).unwrap();
                })
                .collect(),
            skills: task.skills.into_iter().map(|t|U8Wrap{value:t}).collect(),
        })
    })
}

pub fn dao_project_create_task(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    name: String,
    desc: String,
    priority: u8,
    point: u16,
    assignees: Option<Vec<String>>,
    reviewers: Option<Vec<String>>,
    skills: Option<Vec<u8>>,
    max_assignee: Option<u8>,
    amount: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .create_task(
                from,
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
                amount.into(),
            )
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_start_task(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .start_task(from, dao_id, project_id, task_id)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_request_review(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .request_review(from, dao_id, project_id, task_id)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_task_done(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .task_done(from, dao_id, project_id, task_id)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_join_task(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .join_task(from, dao_id, project_id, task_id)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_leave_task(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .leave_task(from, dao_id, project_id, task_id)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_join_task_review(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .join_task_review(from, dao_id, project_id, task_id)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_leave_task_review(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .leave_task_review(from, dao_id, project_id, task_id)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_make_review(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    task_id: u64,
    approve: bool,
    meta: String,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .make_review(from, dao_id, project_id, task_id, approve, meta)
            .await
            .unwrap();

        Ok(true)
    })
}

pub fn dao_project_join_request(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    ext: Option<WithGovPs>,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .project_join_request(
                from,
                dao_id,
                project_id,
                if ext.is_some() {
                    let e = ext.unwrap();
                    Some(WithGov {
                        run_type: e.run_type,
                        amount: e.amount.into(),
                        member: member_ps_trans(e.member),
                    })
                } else {
                    None
                },
            )
            .await?;

        Ok(true)
    })
}

pub fn dao_project_join_request_with_root(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    user: String,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        project
            .project_join_request_with_root(from, dao_id, project_id, user)
            .await?;

        Ok(true)
    })
}

pub fn dao_guild_join_request(
    from: String,
    client: u32,
    dao_id: u64,
    guild_id: u64,
    ext: Option<WithGovPs>,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut guild = WeteeGuild::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        guild
            .guild_join_request(
                from,
                dao_id,
                guild_id,
                if ext.is_some() {
                    let e = ext.unwrap();
                    Some(WithGov {
                        run_type: e.run_type,
                        amount: e.amount.into(),
                        member: member_ps_trans(e.member),
                    })
                } else {
                    None
                },
            )
            .await?;

        Ok(true)
    })
}

pub fn dao_member_point(client: u32, dao_id: u64, member: String) -> anyhow::Result<u32> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        let point = dao.member_point(dao_id, member).await?;

        Ok(point)
    })
}

pub fn dao_apply_project_funds(
    from: String,
    client: u32,
    dao_id: u64,
    project_id: u64,
    amount: u64,
    ext: Option<WithGovPs>,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeProject::new(c);

    let rt = Runtime::new().unwrap();
    rt.block_on(async {
        dao.apply_project_funds(
            from,
            dao_id,
            project_id,
            amount,
            if ext.is_some() {
                let e = ext.unwrap();
                Some(WithGov {
                    run_type: e.run_type,
                    amount: e.amount.into(),
                    member: member_ps_trans(e.member),
                })
            } else {
                None
            },
        )
        .await?;

        Ok(true)
    })
}

// #[derive(Clone, PartialEq, Eq, Default, Debug)]
// pub struct API {
//     // 年
//     pub year: u32,
//     // 季度
//     pub quarter: u32,
//     // 任务
//     pub tasks: Vec<QuarterTask>,
// }

// pub fn init_work() {
//     let rt = Runtime::new().unwrap();
//     rt.block_on(async {
//         println!("xxxxx");
//         let mut client = Client::new("ws://chain-ws.tc.asyou.me:80".to_owned()).unwrap();
//         client.start().await;
//     });
// }

// pub fn send(){
//     let rt = Runtime::new().unwrap();
//     rt.block_on(async {
//         println!("xxxxx22");
//         let work = Client::from_index(0).unwrap();
//         let mut dao = WeteeDAO::new(work);
//         let daoinfo = dao.dao_info(5000).await.unwrap();
//         print!("xxxxx {:?}", daoinfo.name);
//     });
// }
