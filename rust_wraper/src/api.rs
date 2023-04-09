use anyhow;
use asyou_rust_sdk::hander::balance::Balance;
use asyou_rust_sdk::{account, model::account::KeyringJSON, Client};

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

#[tokio::main(flavor = "current_thread")]
pub async fn r_client(client: u32) -> anyhow::Result<u32> {
    let mut c = Client::from_index(client)?;
    let (address, ss58address) = account::add_keyring_from_seed(
        "gloom album notable jewel divorce never trouble lesson month neck sign harbor".to_string(),
    )
    .unwrap();

    println!("address {:?}", ss58address);

    let (block_number, _) = c.get_block_number().await.unwrap();
    assert!(block_number > 0);

    println!("block_number {:?}", block_number);

    let mut balance = Balance::new(c);
    let (free, _, _, _) = balance.amount(ss58address.clone()).await.unwrap();
    Ok(0)
}

#[derive(Debug, Clone)]
pub struct BoxedPoint {
    pub point: Box<Point>,
}

#[derive(Debug, Clone)]
pub struct Point {
    pub x: f64,
    pub y: f64,
}
