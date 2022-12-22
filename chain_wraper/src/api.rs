use asyou_rust_sdk::{
  // hander::ContractTraceSource, 
  // model::contract_trace_source::*,
  // model::account::*, 
  // Client,
  account
};
use anyhow;

// use std::sync::Arc;
// pub enum Platform {
//     MacIntel,
//     MacApple,
//     MacOs(String),
// }

#[tokio::main(flavor = "current_thread")]
pub async fn returning_structs_with_boxed_fields() -> anyhow::Result<BoxedPoint> {
  // 创建连接
  // let client: Client = Client::new(
  //   "wss://chain.asyou.me/".to_string(),
  //   "annual field bless scrap surround uncle history cargo iron hollow deposit desert".to_string(),
  // );

  // let mut contract = ContractTraceSource::new(client);
  // contract
  //   .trace_init(
  //     "rust_constract_id0",
  //     CTST {
  //       id: String::from("0"),
  //       hash: String::from("sss"),
  //       brand_id: String::from("xxx"),
  //       sku_id: String::from(""),
  //       mark: None,
  //       first_mark_addr: None,
  //       first_mark_time: None,
  //       created_at: 0,
  //       updated_at: 0,
  //     },
  //     CTSTRecord {
  //       id: 0,
  //       token_id: String::from("0"),
  //       hash: String::from("xxxxxx"),
  //       meta: String::from("{}"),
  //       created_at: 0,
  //       updated_at: 0,
  //     },
  //   )
  //   .await;

    Ok(BoxedPoint {
        point: Box::new(Point { x: 0.0, y: 0.0 }),
    })
}

pub fn seed_generate() -> Vec<String> {
  let seed_str =  account::generate();
  let seeds:Vec<&str> = seed_str.split(' ').collect();
  println!("seeds => {:?}", seeds);

  let mut seed_list:Vec<String> = vec![];
  for s in &seeds {
    seed_list.push((*s).to_string());
  }

  return seed_list.iter().map(|s| s.to_string()).collect();
}

pub fn get_seed_phrase(seed_str:String,name:String,password:String) -> anyhow::Result<String> {
  let res = account::get_seed_phrase(seed_str,name,password)?;
  let jstr = serde_json::to_string(&res)?;
  Ok(jstr)
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
