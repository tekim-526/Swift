//
//  ContentView.swift
//  find image
//
//  Created by Kim TaeSoo on 2021/10/25.
//

/*
 `Day01` : Text, Image, Button + Stack

 syntax : array, struct...

 텍스트랑 이미지랑 맞추기 게임

 - 텍스트와 이미지가 서로 맞게 하기
 - **버튼**을 눌렀을때 그 결과를 알려주기
 - 그 결과는 Text()로 표현
 - 카드 사진은 자기 맘대로! 이미지이기만 하면된다 이런식~
 - (혹시 만약에 이미지 불러오는 게 다소 빡세다 → 이모지 쓰게 하기도 괜찮다고 봅니다) `0순위 : SF Symbols` 👍

 > **DAY 01 : 카드게임 - 텍스트랑 이미지 짝 맞추기**
 >
 */
import SwiftUI

struct ContentView: View {
    @State var answer: String = ""
    @State var buttonName = ["plus", "equal", "divide"]
    @State var imageName = ["plus", "equal", "divide"]
    @State var randomNum = Int.random(in: 0...2)
    @State var correctNum: Int = 0
    @State var uncorrectNum: Int = 0
    var body: some View {
        var quizImage = Image(systemName: imageName[randomNum]).resizable().frame(width: 150, height: 150).scaledToFill()
        VStack {
            Text(answer).font(.largeTitle)
            Text("correct: \(self.correctNum)  uncorrect: \(self.uncorrectNum)").font(.title2)
            Spacer()
            quizImage
            Spacer()
            Spacer()
            Spacer()
            HStack{
                Button(action: {
                    if buttonName[0] == imageName[randomNum]{
                        self.answer = "Good"
                        randomNum = Int.random(in: 0...2)
                        self.correctNum += 1
                    }
                    else if buttonName[0] != imageName[randomNum]{
                        self.answer = "Fail"
                        randomNum = Int.random(in: 0...2)
                        self.uncorrectNum += 1
                    }
                }) {
                    Text(buttonName[0])
                }
                Button(action: {
                    if buttonName[1] == imageName[randomNum]{
                        self.answer = "Good"
                        randomNum = Int.random(in: 0...2)
                        self.correctNum += 1
                    }
                    else if buttonName[1] != imageName[randomNum]{
                        self.answer = "Fail"
                        randomNum = Int.random(in: 0...2)
                        self.uncorrectNum += 1
                    }
                }) {
                    Text(buttonName[1])
                }
                Button(action: {
                    if buttonName[2] == imageName[randomNum]{
                        self.answer = "Good"
                        randomNum = Int.random(in: 0...2)
                        self.correctNum += 1
                    }
                    else if buttonName[2] != imageName[randomNum]{
                        self.answer = "Fail"
                        randomNum = Int.random(in: 0...2)
                        self.uncorrectNum += 1
                    }
                }) {
                    Text(buttonName[2])
                }
            }
            Spacer()
            Spacer()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
