/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * common
 */
export { default as Logger } from './src/main/ets/logger/Logger';

export { ActionEventData } from './src/main/ets/entity/ActionEventData';

/*
 * util
 */
export { CommonUtil } from './src/main/ets/utils/CommonUtil';

export { ObservedArray } from './src/main/ets/utils/ObservedArray';

/*
 * component
 */
export { LoadingLayout } from './src/main/ets/components/LoadingLayout';

export { FailureLayout } from './src/main/ets/components/FailureLayout';

export { LoadingMoreLayout } from './src/main/ets/components/LoadingMoreLayout';

export { ActionButtonView } from './src/main/ets/components/ActionButtonView';

export { NoMoreLayout } from './src/main/ets/components/NoMoreLayout';

export { FeedSkeletonView } from './src/main/ets/components/skeleton/FeedSkeletonView';

export { ArticleSkeletonView } from './src/main/ets/components/skeleton/ArticleSkeletonView';

/*
 * constant
 */
export { splashImages } from './src/main/ets/constants/BackgroundImageConstants';

export { CommonConstants } from './src/main/ets/constants/CommonConstants';

export { LoadingStatus, ResourcesType, TagType, TopicType } from './src/main/ets/constants/EnumConstants';

/*
 * data
 */
export { FuncNetwork } from './src/main/ets/service/datasource/network/agc/FuncNetwork';

export { ResourcesRepository } from './src/main/ets/service/repository/ResourcesRepository';

export { TopicsRepository } from './src/main/ets/service/repository/TopicsRepository';

export { UserAccountRepository } from './src/main/ets/service/repository/UserAccountRepository';

export { UserResourcesRepository } from './src/main/ets/service/repository/UserResourcesRepository';

/*
 * entity
 */
export { Topic } from './src/main/ets/entity/Topic';

export { ResourceDetail } from './src/main/ets/entity/ResourceDetail';

export { LearningResource } from './src/main/ets/entity/LearningResource';

export { UserAccount } from './src/main/ets/entity/UserAccount';

export { Achieve } from './src/main/ets/entity/Achieve';

export { UserData } from './src/main/ets/entity/UserData';

/**
 * Request
 */
export { default as AgcRequest } from './src/main/ets/service/datasource/network/agc/Request';

