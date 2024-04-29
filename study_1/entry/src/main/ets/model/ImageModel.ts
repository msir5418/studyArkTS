import relationalStore from '@ohos.data.relationalStore'
class  ImageModel{
  private rdbStore: relationalStore.RdbStore
  private tableName: string = 'IMAGE'
  initImageDB(context){
    // 1.rdb配置
    const config = {
      name: 'MyApplication.db',
      securityLevel: relationalStore.SecurityLevel.S1
    }
    // 2.初始化SQL语句
    const sql = `CREATE TABLE IF NOT EXISTS IMAGE (
                  ID INTEGER PRIMARY KEY AUTOINCREMENT,
                  SRC TEXT NOT NULL
                 )`
    // 3.获取rdb
    relationalStore.getRdbStore(context, config, (err, rdbStore) => {
      if(err){
        console.log('motherTag', '获取rdbStore失败！')
        return
      }
      // 执行Sql
      rdbStore.executeSql(sql)
      console.log('motherTag', '创建image表成功！')
      // 保存rdbStore
      this.rdbStore = rdbStore
    })
  }
  async getImage(){
    let imageBits:string[] = []
    let predicates = new relationalStore.RdbPredicates(this.tableName)
    // predicates.equalTo('ID',0)
    console.log('motherTag', '查询条件：', JSON.stringify(predicates))
    let result = await this.rdbStore.query(predicates, ['ID', 'SRC'])
    console.log('motherTag', '返回结果：', JSON.stringify(result))
    let imageBit = ''
    while(!result.isAtLastRow){
      result.goToNextRow()
      imageBit = result.getString(result.getColumnIndex('SRC'))
      imageBits.push(imageBit)
    }
    console.log('motherTag', '查询到数据：', JSON.stringify(imageBits))
    return imageBit
  }
  /**
   * 添加一个新的任务
   * @param name 任务名称
   * @returns 任务id
   */
  addImage(imageBit): Promise<number>{
    console.log('motherTag', '添加到数据：', JSON.stringify(imageBit))
    return this.rdbStore.insert(this.tableName, {imageBit})
  }

}

let imageModel = new ImageModel();

export default imageModel as ImageModel;