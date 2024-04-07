/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/1 18:03
 */
@Observed
class Car{
  name:string
  price:number

  constructor(name:string, price:number) {
    this.name=name
    this.price=price
  }
}
@Entry
@Component
struct Demo41{
  @State cars:Array<Car> =[
    {name:'小米su7',price:900000},
    {name:'红米su7',price:800000}
  ]
  build() {
    Column() {
      ForEach(this.cars,(car:Car,index)=>{
        Show_Car({c:car})
          .onClick(()=>{
            this.cars[index] = new Car(car.name,car.price+1000)
          })
      })
    }
  }
}
@Component
struct Show_Car{
  @ObjectLink c:Car
  build(){
    Row(){
      Text(`${this.c.name}:${this.c.price}`)
        .fontSize(50)

    }
  }
}
