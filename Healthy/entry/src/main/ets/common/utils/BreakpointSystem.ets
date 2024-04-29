/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/25 10:22
 */
import mediaquery from '@ohos.mediaquery'
import BreakpointConstants from '../constants/BreakpointConstants'

export default class BreakpointSystem {
  private smListener:mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_SM)
  private mdListener:mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_MD)
  private lgListener:mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_LG)
  //设置监听器的回调函数
  smListenerCall(result:mediaquery.MediaQueryResult){
    if (result.matches) {
      this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_SM)
    }
  }
  mdListenerCall(result:mediaquery.MediaQueryResult){
    if (result.matches) {
      this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_MD)
    }
  }
  lgListenerCall(result:mediaquery.MediaQueryResult){
    if (result.matches) {
      this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_LG)
    }

  }
  updateCurrentBreakpoint(breakpoint:string){
      AppStorage.SetOrCreate(BreakpointConstants.CURRENT_BREAKPOINT,breakpoint)
  }

  //注册监听器
  register(){
    this.smListener.on('change', this.smListenerCall.bind(this))
    this.mdListener.on('change', this.mdListenerCall.bind(this))
    this.lgListener.on('change', this.lgListenerCall.bind(this))
  }
  unRegister(){
    this.smListener.off('change', this.smListenerCall.bind(this))
    this.mdListener.off('change', this.mdListenerCall.bind(this))
    this.lgListener.off('change', this.lgListenerCall.bind(this))
  }
}