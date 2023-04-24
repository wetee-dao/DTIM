/// roadmap 季度
#[derive(Clone, PartialEq, Eq, Default, Debug)]
pub struct Quarter {
    // 年
    pub year: u32,
    // 季度
    pub quarter: u32,
    // 任务
    pub tasks: Vec<QuarterTask>,
}

/// roadmap 任务
#[derive(Clone, PartialEq, Eq, Default, Debug)]
pub struct QuarterTask {
    pub id: u64,
    /// 任务名称
    /// name of the Task.
    pub name: String,
    /// priority
    /// 优先程度
    pub priority: u8,
    /// creator of Task
    /// 创建者
    pub creator: String,
    /// tag info
    /// 数据标签
    pub tags: Vec<u8>,
    /// State of the Task
    /// DAO状态
    /// ToDo = 0,
    /// InProgress = 1,
    /// InReview = 2,
    /// Done = 3,
    pub status: u8,
}

/// Project specific information
/// 项目信息
#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct ProjectInfo {
    /// boardID
    /// 看板ID
    pub id: u64,
    /// 项目名
    pub name: String,
    /// DAO account id.
    /// DAO 链上账户ID
    pub dao_account_id: String,
    /// 项目介绍
    pub description: String,
    /// creator of WETEE
    /// 创建者
    pub creator: String,
    /// State of the WETEE
    /// WETEE状态
    pub status: u8,
}

#[derive(Debug, Clone)]
pub struct AssetAccountData {
    // 可用余额
    pub free: u64,
    // 锁定余额
    pub reserved: u64,
    // 冻结余额
    pub frozen: u64,
}

/// Guild information
/// 组织内公会信息
#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct GuildInfo {
    /// boardID
    /// 看板ID
    pub id: u64,
    /// creator of DAO
    /// 创建者
    pub creator: String,
    /// DAO account id.
    /// DAO 链上账户ID
    pub dao_account_id: String,
    /// The block that creates the DAO
    /// DAO创建的区块
    pub start_block: u64,
    /// Purpose of the DAO.
    /// DAO 目标宗旨
    pub name: String,
    /// Purpose of the DAO.
    /// DAO 目标宗旨
    pub desc: String,
    //// meta data
    /// DAO 元数据 图片等内容
    pub meta_data: String,
    /// State of the DAO
    /// DAO状态
    pub status: u8,
}

/// Waiting to start voting information
/// 待开始投票信息
#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct GovProps {
    pub index: u32,
    /// The hash of referendum.
    pub hash: String,
    /// The hash of the proposal being voted on.
    /// 投票后执行内容
    pub runtime_call: String,
    pub member_group: String,
    pub account: String,
}

#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct GovReferendum {
    pub id: u32,
    /// The hash of referendum.
    pub hash: String,
    /// When voting on this referendum will end.
    /// 投票结束事件
    pub end: u64,
    /// The hash of the proposal being voted on.
    /// 投票后执行内容
    pub proposal: String,
    /// The delay (in blocks) to wait after a successful referendum before deploying.
    /// 投票完成后多久被允许执行
    pub delay: u64,
    /// The current tally of votes in this referendum.
    /// 投票统计
    pub tally: Tally,

    pub member_group: String,

    pub status: u8,
}

#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct Tally {
    /// The number of yes votes
    /// 同意的数量
    pub yes: u64,
    /// The number of no votes
    /// 不同意的数量
    pub no: u64,
}

#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct GovVote {
    /// The id of the Dao where the vote is located.
    /// 投票所在组织
    pub dao_id: u64,
    /// The specific thing that the vote pledged.
    /// 抵押
    pub pledge: u64,
    /// Object or agree.
    /// 是否同意
    pub opinion: u8,
    /// voting weight.
    /// 投票权重
    pub vote_weight: u64,
    /// Block height that can be unlocked.
    /// 投票解锁阶段
    pub unlock_block: u64,
    /// The referendum id corresponding to the vote.
    /// 投票的全民公投
    pub referendum_index: u32,
}

/// task specific information
/// 任务信息
#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct TaskInfo {
    pub id: u64,
    pub name: String,
    pub description: String,
    /// task point
    /// 任务价值点
    pub point: u16,
    /// priority
    /// 优先程度
    pub priority: u8,
    /// projectID
    /// 看板ID
    pub project_id: u64,
    /// creator of WETEE
    /// 创建者
    pub creator: String,
    /// rewards
    /// 奖金
    pub rewards: Vec<Reward>,
    // 最大协作数量
    pub max_assignee: u8,
    /// assignes info
    /// 受托人
    pub assignees: Vec<String>,
    /// reviewer
    /// 审查人
    pub reviewers: Vec<String>,
    /// skill info
    /// 技能
    pub skills: Vec<u8>,
    /// State of the WETEE
    /// WETEE状态
    pub status: u8,
}

// reward
#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct Reward {
    pub asset_id: u64,
    pub amount: u64,
}

/// DAO specific information
/// 组织信息
#[derive(PartialEq, Eq, Clone, Debug, Default)]
pub struct DaoInfo {
    pub id: u64,
    /// creator of DAO
    /// 创建者
    pub creator: String,
    /// The block that creates the DAO
    /// DAO创建的区块
    pub start_block: u64,
    /// DAO account id.
    /// DAO 链上账户ID
    pub dao_account_id: String,
    /// name of the DAO.
    /// DAO 名字
    pub name: String,
    /// Purpose of the DAO.
    /// DAO 目标宗旨
    pub purpose: String,
    //// meta data
    /// DAO 元数据 图片等内容
    pub meta_data: String,
}
