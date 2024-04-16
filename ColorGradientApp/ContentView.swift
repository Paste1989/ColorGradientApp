//
//  ContentView.swift
//  testApp
//
//  Created by Saša Brezovac on 02.02.2024..
//

import SwiftUI

struct ContentView: View {
    @State private var lightNumber: LightNumber = ._1
    @State private var number: Int = 1
    @State private var sceneShowing: Bool = true
    
    let customScenes = CustomScene.allScenes
    @State private var sceneName: String = ""
    @State var sceneColors: [Color] = CustomScene.allScenes.first?.sceneColors ?? [.black]
    
    var body: some View {
        VStack(spacing: 0) {
            Text("#\(sceneName)")
                .foregroundColor(.black)
                .font(.largeTitle)
                .opacity(sceneShowing ? 1 : 0)
                .padding(.bottom, 50)
            
            LightGradient(lightNumber: $lightNumber, number: $number, sceneColors: $sceneColors, sceneShown: $sceneShowing)
                .frame(width: 200, height: 200)
                .clipShape(Rectangle())
            
            VStack(alignment: .leading,spacing: 0) {
                ForEach(customScenes, id: \.self) { scene in
                    Button {
                        sceneShowing = true
                        sceneName = scene.rawValue
                        number = scene.sceneColors.count
                        sceneColors = scene.sceneColors
                        lightNumber = LightNumber(rawValue: number) ?? ._1

                    } label: {
                        Text("\(scene.rawValue)")
                    }
                }
                
                Button {
                    sceneColors.shuffle()
                } label: {
                    Text("Shuffle color set")
                        .foregroundColor(.black)
                }
                .buttonStyle(.bordered)
                .background(.yellow)
                .padding()
            }
            
            VStack {
                Button {
                    sceneShowing = false
                    number += 1
                    print("number: \(number)")
                    
                    if number == 14 {
                        lightNumber = ._1
                        number = 1
                    } else {
                        lightNumber = LightNumber(rawValue: number) ?? ._1
                    }
                    
                } label: {
                    Text("Number of lights: \(number)")
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}


enum LightNumber: Int {
    case _1 = 1
    case _2 = 2
    case _3 = 3
    case _4 = 4
    case _5 = 5
    case _6 = 6
    case _7 = 7
    case _8 = 8
    case _9 = 9
    case _10 = 10
    case _11 = 11
    case _12 = 12
    case _13 = 13
}

enum CustomScene: String {
    case romanitcDinner = "romanitc dinner"
    case auroraNight = "aurora night"
    case limonchelloBrunch = "limonchello brunch"
    case standby = "standby"
    case welcomeHome = "welcome home"
    case productiveWork = "productive work"
    case energeticBrakfast = "energetic brakfast"
    case terraceParty = "terrace party"
    case berlinVibes = "berlin vibes"
    case munichLounge = "munich lounge"
    case milkyWay = "milky way"
    case vinoRosso = "vino rosso"
    
    static var allScenes: [CustomScene] {
        return [.romanitcDinner, .auroraNight, .limonchelloBrunch, .standby, .welcomeHome, .productiveWork, .energeticBrakfast, .terraceParty, .berlinVibes, .munichLounge, .milkyWay, .vinoRosso]
    }
    
    var sceneColors: [Color] {
        switch self {
        case .romanitcDinner:
            return [SceneColors.romanticDinner1, SceneColors.romanticDinner2, SceneColors.romanticDinner3, SceneColors.romanticDinner4, SceneColors.romanticDinner5]
            
        case .auroraNight:
            return [SceneColors.auroraNight1, SceneColors.auroraNight2, SceneColors.auroraNight3, SceneColors.auroraNight4, SceneColors.auroraNight5]
            
        case .limonchelloBrunch:
            return [SceneColors.limonchelloBrunch1, SceneColors.limonchelloBrunch2, SceneColors.limonchelloBrunch3, SceneColors.limonchelloBrunch4]
            
        case .standby:
            return [SceneColors.standby1, SceneColors.standby2, SceneColors.standby3]
            
        case .welcomeHome:
            return [SceneColors.welcomeHome1, SceneColors.welcomeHome2]
            
        case .productiveWork:
            return [SceneColors.productiveWork1, SceneColors.productiveWork2]
            
        case .energeticBrakfast:
            return [SceneColors.energeticBrakfast1, SceneColors.energeticBrakfast2]
            
        case .terraceParty:
            return [SceneColors.terraceParty1, SceneColors.terraceParty2, SceneColors.terraceParty3, SceneColors.terraceParty4]
            
        case .berlinVibes:
            return [SceneColors.berlinVibes1, SceneColors.berlinVibes2, SceneColors.berlinVibes3]
            
        case .munichLounge:
            return [SceneColors.munichLounge1, SceneColors.munichLounge2, SceneColors.munichLounge3, SceneColors.munichLounge4]
            
        case .milkyWay:
            return [SceneColors.milkyWay1, SceneColors.milkyWay2, SceneColors.milkyWay3, SceneColors.milkyWay4]
            
        case .vinoRosso:
            return [SceneColors.vinoRosso1, SceneColors.vinoRosso2, SceneColors.vinoRosso3]
        }
    }
}

struct SceneColors {
    //romanitc dinner
    static let romanticDinner1: Color = Color(hex: "FFDE37")
    static let romanticDinner2: Color = Color(hex: "FF9B06")
    static let romanticDinner3: Color = Color(hex: "F20530")
    static let romanticDinner4: Color = Color(hex: "FF6D63")
    static let romanticDinner5: Color = Color(hex: "EE946D")
    //aurora night
    static let auroraNight1: Color = Color(hex: "00E980")
    static let auroraNight2: Color = Color(hex: "00AE7B")
    static let auroraNight3: Color = Color(hex: "33B3F2")
    static let auroraNight4: Color = Color(hex: "42FFF7")
    static let auroraNight5: Color = Color(hex: "9E2CD4")
    //limoncello brunch
    static let limonchelloBrunch1: Color = Color(hex: "FFF4BA")
    static let limonchelloBrunch2: Color = Color(hex: "FFE76E")
    static let limonchelloBrunch3: Color = Color(hex: "FFD401")
    static let limonchelloBrunch4: Color = Color(hex: "FFB801")
    //standby
    static let standby1: Color = Color(hex: "B15500")
    static let standby2: Color = Color(hex: "FFD47B")
    static let standby3: Color = Color(hex: "AA6600")
//    static let black4: Color = Color.black
    //welcome home
    static let welcomeHome1: Color = Color(hex: "FFA861")
    static let welcomeHome2: Color = Color(hex: "FFC366")
    //productive work
    static let productiveWork1: Color = Color(hex: "FFF8CC")
    static let productiveWork2: Color = Color(hex: "FFF2DD")
    //energetic brakfast
    static let energeticBrakfast1: Color = Color(hex: "F4FDFF")
    static let energeticBrakfast2: Color = Color(hex: "FFFFFF")
    //terrace party
    static let terraceParty1: Color = Color(hex: "B899C1")
    static let terraceParty2: Color = Color(hex: "80AADC")
    static let terraceParty3: Color = Color(hex: "F4C49C")
    static let terraceParty4: Color = Color(hex: "FCE1AC")
    //berlin vibes
    static let berlinVibes1: Color = Color(hex: "FA03FF")
    static let berlinVibes2: Color = Color(hex: "2C41FF")
    static let berlinVibes3: Color = Color(hex: "D600FF")
    //munich lounge
    static let munichLounge1: Color = Color(hex: "FF0000")
    static let munichLounge2: Color = Color(hex: "EB9D33")
    static let munichLounge3: Color = Color(hex: "F7D7B9")
    static let munichLounge4: Color = Color(hex: "E01414")
    //milky way
    static let milkyWay1: Color = Color(hex: "0D9FEB")
    static let milkyWay2: Color = Color(hex: "6DF4FF")
    static let milkyWay3: Color = Color(hex: "6DF4FF")
    static let milkyWay4: Color = Color(hex: "A3A5FF")
    //vino rosso
    static let vinoRosso1: Color = Color(hex: "9F0012")
    static let vinoRosso2: Color = Color(hex: "D61310")
    static let vinoRosso3: Color = Color(hex: "FF489F")
    
}


extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}



struct LightGradient: View {
    @Binding var lightNumber: LightNumber
    @Binding var number: Int
    @State private var blurAmount = 0.0
    
    @Binding var sceneColors: [Color]
    @Binding var sceneShown: Bool
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {

               
                ZStack {
                    if !sceneShown {
                        //MARK: - top
                        //top leading
                        if lightNumber != ._1 && lightNumber != ._3 {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50, y: geo.size.height/50)
                                .opacity(lightNumber != ._1 && lightNumber != ._3 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //top leadig 2
                        if lightNumber == ._11 || lightNumber == ._12 {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/3, y: geo.size.height/50)
                                .opacity(lightNumber == ._11 || lightNumber == ._12 || lightNumber == ._13 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //top middle
                        if lightNumber == ._6 || lightNumber == ._7 || lightNumber == ._8 || lightNumber == ._9 || lightNumber == ._10 {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/2, y: geo.size.height/50)
                                .opacity(lightNumber == ._6 || lightNumber == ._7 || lightNumber == ._8 || lightNumber == ._9 || lightNumber == ._10 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //top trailing 2
                        if lightNumber == ._11 || lightNumber == ._12  {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/1.5, y: geo.size.height/50)
                                .opacity(lightNumber == ._11 || lightNumber == ._12 || lightNumber == ._13 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //top trailing
                        if lightNumber != ._1 && lightNumber != ._2 {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height/50)
                                .opacity(lightNumber != ._1 && lightNumber != ._2 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        
                        //MARK: - middle
                        //middle trailing
                        if lightNumber == ._9 || lightNumber == ._10 || lightNumber == ._11 || lightNumber == ._12 {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height/2)
                                .opacity(lightNumber == ._9 || lightNumber == ._10 || lightNumber == ._11 || lightNumber == ._12 || lightNumber == ._13 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //middle trailing 2
                        if lightNumber == ._8 || lightNumber == ._10 || lightNumber == ._12 {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/1.5, y: geo.size.height/2)
                                .opacity(lightNumber == ._8 || lightNumber == ._10 || lightNumber == ._12 || lightNumber == ._13 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //middle
                        if lightNumber == ._1 || lightNumber == ._5 || lightNumber == ._7 || lightNumber == ._9 || lightNumber == ._11 {
                            RadialGradient(colors: [.red], center: .center, startRadius: 10, endRadius: 500)
                                .frame(width: 200, height: 230)
                                .position(x: geo.size.width/2, y: geo.size.height/2)
                                .opacity(lightNumber == ._1 || lightNumber == ._5 || lightNumber == ._7 || lightNumber == ._9 || lightNumber == ._11 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //middle leading 1
                        if lightNumber == ._8 || lightNumber == ._10 || lightNumber == ._12 {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/3, y: geo.size.height/2)
                                .opacity(lightNumber == ._8 || lightNumber == ._10 || lightNumber == ._12 || lightNumber == ._13 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //middle leading
                        if lightNumber == ._3 || lightNumber == ._9 || lightNumber == ._10 || lightNumber == ._11 || lightNumber == ._12 {
                            RadialGradient(colors: [.red, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50, y: geo.size.height/2)
                                .opacity(lightNumber == ._3 || lightNumber == ._9 || lightNumber == ._10 || lightNumber == ._11 || lightNumber == ._12 || lightNumber == ._13 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        
                        //MARK: - bottom
                        //bottom trailing
                        if lightNumber != ._1  {
                            RadialGradient(colors: [.blue, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height)
                                .opacity(lightNumber != ._1 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //bottom trailing 2
                        if lightNumber == ._11 || lightNumber == ._12 {
                            RadialGradient(colors: [.yellow, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/1.5, y: geo.size.height)
                                .opacity(lightNumber == ._11 || lightNumber == ._12 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //bottom middle
                        if lightNumber == ._6 || lightNumber == ._7 || lightNumber == ._8 || lightNumber == ._9 || lightNumber == ._10 {
                            RadialGradient(colors: [.green.opacity(0.5), .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/2, y: geo.size.height)
                                .opacity(lightNumber == ._6 || lightNumber == ._7 || lightNumber == ._8 || lightNumber == ._9 || lightNumber == ._10 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //bottom leading 2
                        if lightNumber == ._11 || lightNumber == ._12 {
                            RadialGradient(colors: [.teal, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/3, y: geo.size.height)
                                .opacity(lightNumber == ._11 || lightNumber == ._12 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        //bottom leading
                        if lightNumber != ._1 && lightNumber != ._2 && lightNumber != ._3 {
                            RadialGradient(colors: [.indigo, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50, y: geo.size.height)
                                .opacity(lightNumber != ._1 && lightNumber != ._2 && lightNumber != ._3 ? 1 : 0)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        
                        ///
                        
                        if lightNumber != ._1 && lightNumber != ._2 && lightNumber != ._3 && lightNumber != ._4 && lightNumber != ._5 && lightNumber != ._6 && lightNumber != ._7 && lightNumber != ._8 && lightNumber != ._9 && lightNumber != ._10 && lightNumber != ._11 && lightNumber != ._12 {
                            RadialGradient(colors: [.teal, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/3, y: geo.size.height)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            RadialGradient(colors: [.mint, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/6, y: geo.size.height/3.5)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            
                            RadialGradient(colors: [.blue, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/2, y: geo.size.height/3.5)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            RadialGradient(colors: [.yellow, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/1.25, y: geo.size.height/3.5)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            ///
                            
                            RadialGradient(colors: [.pink, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/6, y: geo.size.height/1.3)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            RadialGradient(colors: [.green, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/2, y: geo.size.height/1.3)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            RadialGradient(colors: [.orange, .clear], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/1.25, y: geo.size.height/1.3)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                    }
                    else {
                        
                        if lightNumber == ._2 {
                            //top leading
                            RadialGradient(colors: [sceneColors[0]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50, y: geo.size.height/50)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //bottom trailing
                            RadialGradient(colors: [sceneColors[1]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //top trailing
                            RadialGradient(colors: [sceneColors[0]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height/50)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //bottom leading
                            RadialGradient(colors: [sceneColors[1]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50, y: geo.size.height)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        else if lightNumber == ._3 {
                            //middle leading
                            RadialGradient(colors: [sceneColors[0]], center: .center, startRadius: 10, endRadius: 500)
                                .frame(width: 200, height: 230)
                                .position(x: geo.size.width/2, y: geo.size.height/2)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //top trailing
                            RadialGradient(colors: [sceneColors[1]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height/50)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //bottom trailing
                            RadialGradient(colors: [sceneColors[2]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        if lightNumber == ._4 {
                            //top leading
//                            RadialGradient(colors: [sceneColors[0]], center: .center, startRadius: 10, endRadius: 300)
//                                .position(x: geo.size.width/50, y: geo.size.height/50)
//                                .blendMode(.multiply)
//                                .blur(radius: 3)
//                            
//                            //bottom trailing
//                            RadialGradient(colors: [sceneColors[1]], center: .center, startRadius: 10, endRadius: 300)
//                                .position(x: geo.size.width, y: geo.size.height)
//                                .blendMode(.multiply)
//                                .blur(radius: 3)
//                            
//                            //top trailing
//                            RadialGradient(colors: [sceneColors[2]], center: .center, startRadius: 10, endRadius: 300)
//                                .position(x: geo.size.width, y: geo.size.height/50)
//                                .blendMode(.multiply)
//                                .blur(radius: 3)
//                            
//                            //bottom leading
//                            RadialGradient(colors: [sceneColors[3]], center: .center, startRadius: 10, endRadius: 300)
//                                .position(x: geo.size.width/50, y: geo.size.height)
//                                .blendMode(.multiply)
//                                .blur(radius: 3)
                            
                            
                            RadialGradient(colors: [sceneColors[0]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50 - 25, y: geo.size.height/50 + 25)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //bottom trailing
                            RadialGradient(colors: [sceneColors[1]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width + 15, y: geo.size.height + 15)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //top trailing
                            RadialGradient(colors: [sceneColors[2]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width - 25, y: geo.size.height/50 - 15)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //bottom leading
                            RadialGradient(colors: [sceneColors[3]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50 - 15, y: geo.size.height - 15)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                        }
                        else if lightNumber == ._5 {
                            //top leading
                            RadialGradient(colors: [sceneColors[0]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50, y: geo.size.height/50)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //bottom trailing
                            RadialGradient(colors: [sceneColors[1]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //top trailing
                            RadialGradient(colors: [sceneColors[2]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width, y: geo.size.height/50)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //bottom leading
                            RadialGradient(colors: [sceneColors[3]], center: .center, startRadius: 10, endRadius: 300)
                                .position(x: geo.size.width/50, y: geo.size.height)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                            
                            //middle
                            RadialGradient(colors: [sceneColors[4]], center: .center, startRadius: 10, endRadius: 300)
                                .frame(width: 150, height: 150)
                                .position(x: geo.size.width/2, y: geo.size.height/2)
                                .blendMode(.multiply)
                                .blur(radius: 3)
                                
                        }
                    }
                }
            }
        }
        .onChange(of: lightNumber) { light in
            blurAmount = light == ._1 ? 0 : 30
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .blur(radius: blurAmount)
        .ignoresSafeArea()
        .padding(.bottom)
    }
}
