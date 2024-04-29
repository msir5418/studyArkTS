/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/25 14:22
 */
declare interface BreakpointOptions<T>{
  sm:T
  md:T
  lg:T
}
export default class BreakpointType<T> {
  options:BreakpointOptions<T>

  constructor(options:BreakpointOptions<T>) {
    this.options = options
  }
  getValue(str:string):T{
   return this.options[str]
  }
}