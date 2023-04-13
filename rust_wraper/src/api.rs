use anyhow;

use crate::model::{AssetAccountData, GuildInfo, ProjectInfo, Quarter, QuarterTask};
use asyou_rust_sdk::{
    account,
    hander::{
        balance::Balance, wetee_asset::WeteeAsset, wetee_dao::WeteeDAO, wetee_guild::WeteeGuild,
        wetee_project::WeteeProject,
    },
    model::account::KeyringJSON,
    Client,
};

// use std::sync::Arc;
// pub enum Platform {
//     MacIntel,
//     MacApple,
//     MacOs(String),
// }

#[tokio::main(flavor = "current_thread")]
pub async fn connect(url: String) -> anyhow::Result<u32> {
    // 创建连接
    let client: Client = Client::new(url.to_string())?;

    Ok(client.index)
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

pub fn sign_from_address(address: String, ctx: String) -> anyhow::Result<String> {
    let addr = account::sign_from_address(address, ctx)?;
    return Ok(addr);
}

pub fn native_balance(client: u32, address: String) -> anyhow::Result<AssetAccountData> {
    let c = Client::from_index(client)?;
    let mut balance = Balance::new(c);

    let b = balance.balance(address.clone()).unwrap();
    Ok(AssetAccountData {
        free: b.free.try_into().unwrap(),
        frozen: b.frozen.try_into().unwrap(),
        reserved: b.reserved.try_into().unwrap(),
    })
}

pub fn dao_balance(client: u32, dao_id: u64, address: String) -> anyhow::Result<AssetAccountData> {
    let c = Client::from_index(client)?;
    let mut balance = WeteeAsset::new(c);

    let b = balance.balance(dao_id, address.clone()).unwrap();
    Ok(AssetAccountData {
        free: b.free.try_into().unwrap(),
        frozen: b.frozen.try_into().unwrap(),
        reserved: b.reserved.try_into().unwrap(),
    })
}

pub fn dao_roadmap(client: u32, dao_id: u64, year: u32) -> anyhow::Result<Vec<Quarter>> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let roadmap = dao.roadmap_list(dao_id, year.clone()).unwrap();
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
                    description: String::from_utf8(t.description).unwrap(),
                    priority: t.priority,
                    creator: t.creator.to_string(),
                    tags: t.tags,
                    status: t.status,
                })
                .collect(),
        });
    }
    Ok(quarters)
}

// 创建季度任务
pub fn dao_create_roadmap_task(
    from: String,
    client: u32,
    dao_id: u64,
    roadmap_id: u32,
    name: String,
    description: String,
    priority: u8,
    tags: Vec<u8>,
) -> anyhow::Result<bool> {
    let c = Client::from_index(client)?;
    let mut dao = WeteeDAO::new(c);

    let res = dao
        .create_task(
            from,
            dao_id,
            roadmap_id,
            name.into(),
            priority,
            description.into(),
            Some(tags),
        )
        .unwrap();
    Ok(true)
}

pub fn dao_projects(client: u32, dao_id: u64) -> anyhow::Result<Vec<ProjectInfo>> {
    let c = Client::from_index(client)?;
    let mut project = WeteeProject::new(c);

    let b = project.project_list(dao_id).unwrap();
    Ok(b.into_iter()
        .map(|p| ProjectInfo {
            id: p.id,
            name: String::from_utf8(p.name).unwrap(),
            description: String::from_utf8(p.description).unwrap(),
            creator: p.creator.to_string(),
            status: p.status as u8,
        })
        .collect())
}

pub fn dao_guilds(client: u32, dao_id: u64) -> anyhow::Result<Vec<GuildInfo>> {
    let c = Client::from_index(client)?;
    let mut guild = WeteeGuild::new(c);

    let gs = guild.guild_list(dao_id).unwrap();
    Ok(gs
        .into_iter()
        .map(|g| GuildInfo {
            name: String::from_utf8(g.name).unwrap(),
            desc: String::from_utf8(g.desc).unwrap(),
            creator: g.creator.to_string(),
            status: g.status as u8,
            start_block: g.start_block,
            meta_data: String::from_utf8(g.meta_data).unwrap(),
        })
        .collect())
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
