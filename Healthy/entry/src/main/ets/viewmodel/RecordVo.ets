/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/28 15:48
 */
import RecordItem from './RecordItem'
export default class RecordVo {
  /**
   * 记录id
   */
  id:number
  /**
   * 类型id
   */
  typeId:number
  /**
   * 卡路里总数
   */
  calorie:number
  /**
   * 记录中食物或者运动信息
   */
  recordItem:RecordItem
  /**
   * 食物数量
   */
  amount:number = 0


}