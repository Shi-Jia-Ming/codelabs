import { ResourcesType } from '../constants/EnumConstants';

export interface ActionEventData {
  /**
   * resourceId
   */
  resourceId: string;

  /**
   * resource type of feed and article
   */
  resourceType: ResourcesType;

  /**
   * to increase or decrease the value of count
   */
  actionValue: boolean;
}