export class Person{
  name:string
  age:number
  girl:Person

  constructor(name:string,age:number,girl?:Person) {
    this.age = age
    this.name = name
    this.girl = girl
  }
}