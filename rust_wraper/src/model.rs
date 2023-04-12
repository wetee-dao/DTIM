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
    /// 任务描述
    /// Purpose of the Task.
    pub description: String,
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
    /// creator of DAO
    /// 创建者
    pub creator: String,
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
