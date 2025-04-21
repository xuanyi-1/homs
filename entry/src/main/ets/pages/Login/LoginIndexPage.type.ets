export interface ApiResponse {
  code: number;
  data: DataResponse;
  extra?: string;
  msg: string;
  total?: number;
  path?: string;
  timestamp?: number;
}

export interface DataResponse {
  access_token: string;
  updatePassword: boolean;
  isChildrenDealer: boolean;
  permissions: string[];
  roles: Role[];
  token_prefix: string;
  menus: MenuItem[];
  user: User;
}

// 角色信息接口
export interface Role {
  searchValue?: string;
  createBy?: string;
  createTime?: string;
  updateBy?: string;
  updateTime?: string;
  remark?: string;
  params?: object;
  roleId: number;
  roleName: string;
  roleKey: string;
  roleSort: number;
  dataScope: string; // 示例："4" 表示数据范围
  menuCheckStrictly: boolean;
  deptCheckStrictly: boolean;
  status: number;
  delFlag?: boolean;
  flag?: boolean;
  menuIds?: number[]; // 数组类型菜单ID
  deptIds?: number[]; // 数组类型部门ID
  dealerVisible?: boolean;
  ignoreMenuList?: MenuItem[]; // 忽略的菜单列表
  scopeDeptIds?: number[]; // 数组类型部门范围
  admin?: boolean;
}

// 菜单项接口（递归结构）
export interface MenuItem {
  searchValue?: string;
  createBy?: string;
  createTime?: string;
  updateBy?: string;
  updateTime?: string;
  remark?: string;
  params?: object;
  menuId: number;
  menuName: string;
  parentName?: string;
  parentId: number;
  orderNum: string;
  path: string;
  component?: string;
  isFrame: number; // 0: 不跳转，1: 跳转iframe
  isCache: number; // 0: 不缓存，1: 缓存
  menuType: string; // "C": 菜单项，"M": 菜单目录
  visible: number; // 0: 隐藏，1: 显示
  status: number; // 0: 禁用，1: 启用
  perms?: string; // 权限标识符
  icon?: string; // 图标路径（#表示无图标）
  children?: MenuItem[]; // 子菜单项
}

// 用户信息接口
export interface User {
  searchValue?: string;
  createBy: string;
  createTime: string;
  updateBy?: string;
  updateTime?: string;
  remark?: string;
  params?: object;
  userId: number;
  deptId: number;
  userName: string;
  nickName: string;
  email: string;
  phonenumber: string;
  sex: number; // 0: 男，1: 女
  avatar?: string;
  password?: string;
  salt?: string;
  status: number;
  delFlag: number; // 0: 有效，1: 删除
  loginIp?: string;
  loginDate?: string;
  province?: string;
  city?: string;
  area?: string;
  dept: Dept;
  roles?: Role[]; // 用户所属角色
  postIds?: number[]; // 用户岗位ID
  roleId?: number; // 主角色ID
  majorName?: string;
  postIdList?: number[]; // 岗位列表
  dataScope: number; // 数据范围（1: 全部，2: 本部门等）
  customPermission: number; // 自定义权限
  deptIds?: number[]; // 所属部门
  ignoreMenuList?: MenuItem[]; // 忽略的菜单项
  scopeDeptIds?: number[]; // 数据范围部门
  childManager?: boolean; // 是否有子管理员
  isChange?: string; // "0"/"1" 表示是否修改
  admin?: boolean;
}

// 部门信息接口
export interface Dept {
  searchValue?: string;
  createBy?: string;
  createTime?: string;
  updateBy?: string;
  updateTime?: string;
  remark?: string;
  params?: object;
  deptId: number;
  parentId: number;
  ancestors: string; // 祖先部门ID列表（逗号分隔）
  deptName: string;
  orderNum: string;
  leader?: string; // 部门负责人
  phone?: string;
  email?: string;
  status: number;
  delFlag?: number;
  parentName?: string;
  deptAttribute: number; // 部门属性类型
  children?: Dept[]; // 子部门
  total?: number;
  referenceRate?: number;
  correctRate?: number;
  avg?: number;
  deptType?: number; // 部门类型
}

export interface LoginParams {
  /** 手机号 */
  username: string,

  /** 密码 */
  password: string
}