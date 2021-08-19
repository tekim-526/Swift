import UIKit

// Collection types
// Dictionary = Keys + Values
// Keys = 특정한 값에 접근하게 하기 위해 네이밍을 하는 것
// Value = 값을 의미함

var namesOfStreet = [String : Any]() //[key의 타입 : value의 타입]
namesOfStreet["302ro"] = "1st Street"
namesOfStreet["303ro"] = "2nd Street"
namesOfStreet["304ro"] = 3

namesOfStreet["304ro"] = nil // nil을 넣으면 그냥 없어지는 것임

var namesOfStreet2 = ["a" : 1, "b" : 2, "c" : 3]
// keys, values를 따로 따로 확인하는 방법
namesOfStreet.keys
namesOfStreet.values

for dic in namesOfStreet
{
    print(dic)
}
