/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/18 16:03
 */
import RecordList from './RecordList'
import SearchHeader from './SearchHeader'
import StatsCard from './StatsCard'
@Component
export default struct RecordIndex {
  build() {
    Column() {
        SearchHeader()
        StatsCard()
        RecordList()
          .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_page_background'))
  }
}