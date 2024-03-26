export  interface Rectangle{
  a:number;
  calcArea():number;
  calcCir():number;
}
export class Square implements Rectangle{
  a: number;
  constructor(a: number) {
    this.a = a
  }
  calcArea():number{
    return this.a*this.a;
    throw new Error('Method not implemented.');
  }
  calcCir():number {
    return this.a*4;
    throw new Error('Method not implemented.');
  }
}
export class Oblong implements Rectangle {
  a: number;
  b: number;
  constructor(a: number, b: number) {
    this.a = a
    this.b = b
  }
  calcArea(): number {
    return this.a * this.b
    throw new Error('Method not implemented.');
  }

  calcCir(): number {
    return (this.a + this.b) * 2
    throw new Error('Method not implemented.');
  }
}