export interface UserIdParams {
  userId: string;
}

export interface EditTopicsParams extends UserIdParams {
  followTopics: string;
}

export interface LoginParams {
  username: string;
  password: string;
}

export interface GetResourceDetailParams extends UserIdParams {
  resourceId: string;
}

export interface ToggleActionParams extends UserIdParams {
  resourceId: string;
  operation: number;
}

export interface GetMoreResourcesParams extends UserIdParams {
  type: string;
  pageNum: number;
  pageSize: number;
}

