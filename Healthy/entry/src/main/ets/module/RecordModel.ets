
import { ColumnInfo, ColumnType } from '../common/bean/ColumnInfo'
import RecordPO from '../common/bean/RecordPO'
import DbUtil from '../common/utils/DbUtil'
import relationalStore from '@ohos.data.relationalStore';

/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/28 15:56
 */

/**
 * 创建数据库建表语句
 */
const CREATE_TABLE_SQL:string = `CREATE TABLE IF NOT EXISTES  record(
             id  INTEGER PRIMARY KEY AUTOINCREMENT,
             type_id INTEGER NOT NULL,
             item_id INTEGER NOT NULL,
             amount DOUBLE NOT NULL,
             create_time INTEGER NOT NULL
)`
/**
 * 映射关系 -->RecordVO 和 record表
 */
const COLUMNS:ColumnInfo[]=[
  {name:'id',columnName:'id',type:ColumnType.LONG},
  {name:'typeId',columnName:'type_id',type:ColumnType.LONG},
  {name:'itemId',columnName:'item_id',type:ColumnType.LONG},
  {name:'amount',columnName:'amount',type:ColumnType.DOUBLE},
  {name:'createTime',columnName:'create_time',type:ColumnType.LONG}

]
const TABLE_NAME = 'record'
const ID_COLUMN = 'id'
const DATE_COLUMN = 'create_time'
class RecordModel{

  getCreateTableSql():string{
    return CREATE_TABLE_SQL
  }
  /**
   * 插入
   * @param record
   * @returns
   */
  insert(record:RecordPO):Promise<number>{
    //获取关系型数据库对象,insert(表名,record,映射)
    return DbUtil.insert(TABLE_NAME,record,COLUMNS)
  }

  deleteById(id:number):Promise<number>{
    let pre = new relationalStore.RdbPredicates(TABLE_NAME)
    pre.equalTo(ID_COLUMN,id)
    return DbUtil.delete(pre)
  }
  listByDate(date:number):Promise<RecordPO[]>{
    let pre = new relationalStore.RdbPredicates(TABLE_NAME)
    pre.equalTo(DATE_COLUMN,date)
    return DbUtil.queryForList(pre,COLUMNS)
  }
}
let recordModel = new RecordModel()
export default recordModel as RecordModel