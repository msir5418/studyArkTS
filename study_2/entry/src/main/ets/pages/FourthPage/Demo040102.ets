/**
 * @author mxd
 * @version 1.0
 * @since 2024/4/1 18:03
 */
@Observed
class Car{
  name:string
  price:number
  sCar:Car
  constructor(name:string, price:number,sCar?:Car) {
    this.name=name
    this.price=price
    this.sCar=sCar
  }
}
@Entry
@Component
struct Demo402{
  //验证@State不支持数组中对象属性的改变
  @State cars:Array<Car> =[
    new Car('小米su7',19000),
    new Car('小米su8',16000)
  ]
  @State nestingCar:Car = new Car('小米',19000,new Car('红米',1800))
  build() {
    Column() {
      ForEach(this.cars,(car:Car,index)=>{
        Text(`验证@State数组${car.name}:pirce${car.price}`)
          .fontColor(Color.Green)
          .onClick(()=>{
            this.cars[index].price+=1000
          })

      })
      Text(`验证@State嵌套${this.nestingCar.sCar.name}:pirce${this.nestingCar.sCar.price}`)
        .fontColor(Color.Green)
        .onClick(()=>{
          this.nestingCar.sCar.price+=1000
        })
      miSon({
        cars:$cars,
        nestingCar:$nestingCar
      })

    }
  }
}

@Component
struct miSon {
  @Link cars:Array<Car>
  @Link nestingCar:Car
  build() {
    Column(){
      ForEach(this.cars,(car:Car,index)=>{
        Text(`验证@Link数组${car.name}:pirce${car.price}`)
          .fontColor(Color.Red)
          .onClick(()=>{
            this.cars[index].price+=1000
          })

      })
      Text(`验证@Link嵌套${this.nestingCar.sCar.name}:pirce${this.nestingCar.sCar.price}`)
        .fontColor(Color.Red)
        .onClick(()=>{
          this.nestingCar.sCar.price+=1000
        })
    }

  }
}