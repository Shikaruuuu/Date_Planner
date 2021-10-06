//
//  ContentView.swift
//  Date_planner
//
//  Created by 横森暉 on 2021/09/12.
//
//デートプランメモ
//映画->cinema, 遊園地->rollercoaster, 水族館->suizokukan, 動物園->zoo, ショッピング->shopping,ラブホ->hotel
import SwiftUI

struct ContentView: View {
    let plans = ["cinema", "rollercoaster", "suizokukan", "zoo", "shopping", "hotel"]
    @State private var today_plan = "empty"
    @State private var isShow = false
    var body: some View {
        VStack{
            Text("今日のデートはこれだ！")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.pink)
            Image(today_plan)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 400)
                .scaleEffect(isShow ? 1 : 0)
                .rotationEffect(isShow ? .degrees(360) : .zero)
                .animation(.easeInOut(duration: 1))
            Spacer()
            switch today_plan {
            case "cinema":
                Text("映画見よ♡")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.pink)
            case "rollercoaster":
                Text("遊園地行こ♡")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.pink)
            case "suizokukan":
                Text("水族館行こ♡")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.pink)
            case "zoo":
                Text("動物園行こ♡")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.pink)
            case "shopping":
                Text("ショッピングしよ♡")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.pink)
            case "hotel":
                Text("休憩しよ♡")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.pink)
            default:
                Text("デート先決めてよ〜")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.pink)
            }
            Spacer()
            HStack{
                Spacer()
                //ルーレットボタン
                Button(action: {
                    if !self.isShow {
                        self.isShow = true
                        self.today_plan = self.plans.randomElement()!
                    }
                }){
                    Text("デートを決める")
                        .font(.largeTitle)
                        .background(Capsule()
                                        .foregroundColor(isShow ? .gray : .yellow)
                                        .frame(width: 250, height:40)
                        )
                }
                .disabled(isShow ? true : false)
                Spacer()
                //やり直し
                Button(action: {
                    self.isShow = false
                    self.today_plan = "empty"
                }){
                    Text("却下")
                        .font(.largeTitle)
                        .background(Capsule()
                                        .foregroundColor(!isShow ? .gray : .yellow)
                                        .frame(width: 100, height:40)
                    )
                }
                .disabled(!isShow ? true : false)
                Spacer()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
