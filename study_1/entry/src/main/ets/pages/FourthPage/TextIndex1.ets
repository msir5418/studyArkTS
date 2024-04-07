/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/1 15:03
 */
@Observed
class Person{
  name:string
  age:number
  girl:Person

  constructor(name:string,age:number,girl?:Person) {
    this.age = age
    this.name = name
    this.girl = girl
  }
}

@Entry
@Component
struct Parent {
  @State p:Person = new Person('jack',21,new Person('rose',21))
  build() {
    Row() {
      Child({p:this.p.girl})
        .onClick(()=>{
          this.p.girl.age++
        })
    }
  }

}
@Component
struct Child{
  @ObjectLink p:Person
  build(){
    Column(){
      Text(`${this.p.name}:${this.p.age}`)
        .fontSize(50)
    }
  }
}