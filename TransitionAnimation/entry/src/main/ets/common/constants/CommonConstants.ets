/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import AnimationModel from '../../viewmodel/AnimationModel'

/**
 * Index page button animation mode.
 */

export const INDEX_ANIMATION_MODE: AnimationModel[] = [
  new AnimationModel($r('app.media.bg_bottom_anim_transition'), 'pages/BottomTransition'),
  new AnimationModel($r('app.media.bg_custom1_anim_transition'), 'pages/CustomTransition'),
  new AnimationModel($r('app.media.bg_custom2_anim_transition'), 'pages/FullCustomTransition'),
  new AnimationModel($r('app.media.bg_element_anim_transition'), 'pages/ComponentTransition'),
  new AnimationModel($r('app.media.bg_share_anim_transition'), 'pages/ShareItem')
];

/**
 * common full length.
 */
export const FULL_LENGTH = '100%';

/**
 * default layout weight.
 */
export const DEFAULT_LAYOUT_WEIGHT = 1;

/**
 * Transition animation duration.
 */
export const TRANSITION_ANIMATION_DURATION: number = 600;

/**
 * Share transition id.
 */
export const SHARE_TRANSITION_ID: string = 'shareId';

/**
 * Component transition scale.
 */
export const COMPONENT_TRANSITION_SCALE: CustomTransition = { x: 0.5, y: 0.5 };

/**
 * Component transition opacity.
 */
export const COMPONENT_TRANSITION_OPACITY = 0;

class ComponentTransitionRotate {
  x: number = 0;
  y: number = 0;
  z: number = 0;
  angle: number = 360;
}

/**
 * Component transition rotate.
 */
export const COMPONENT_TRANSITION_ROTATE: ComponentTransitionRotate = { x: 0, y: 1, z: 0, angle: 360 };

class CustomTransition {
  x: number = 0;
  y: number = 0;
}

/**
 * Custom transition scale.
 */
export const CUSTOM_TRANSITION_SCALE: CustomTransition = { x: 0, y: 0 };

/**
 * Custom transition opacity.
 */
export const CUSTOM_TRANSITION_OPACITY = 0.2;

/**
 * Custom transition translate.
 */
export const CUSTOM_TRANSITION_TRANSLATE: CustomTransition = { x: 500, y: 500 };

/**
 * Full custom transition default animation value.
 */
export const FULL_CUSTOM_TRANSITION_DEFAULT_ANIM_VALUE = 1;

/**
 * Full custom transition rotate z.
 */
export const FULL_CUSTOM_TRANSITION_ROTATE_Z = 1;

/**
 * Full custom transition angle 360.
 */
export const FULL_CUSTOM_TRANSITION_ANGLE = 360;

/**
 * Share item animation delay.
 */
export const SHARE_ITEM_ANIMATION_DELAY = 100;

/**
 * Share item animation duration.
 */
export const SHARE_ITEM_DURATION = 1000;

/**
 * Share page url.
 */
export const SHARE_PAGE_URL = 'pages/SharePage';

/**
 * Border radius of row.
 */
export const BORDER_RADIUS = 32;

/**
 * Domain of log.
 */
export const DOMAIN = 0xFF00;

/**
 * Prefix of log.
 */
export const PREFIX = '[ReadingRecorder]';

/**
 * Format of log.
 */
export const FORMAT = `%{public}s, %{public}s`;