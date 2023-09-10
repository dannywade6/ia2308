/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  
  // My work
  @State private var colorSelection = ColorSelection()

  var body: some View {

    VStack {
      Text("Color Picker")
        .font(.largeTitle)
        .fontWeight(.bold)

      RoundedRectangle(cornerRadius: 0)
        .foregroundColor(foregroundColor)
        .border(Color.brown, width: 6)
      VStack {
        Text("Red")
        HStack {
          Slider(value: $redColor, in: 0...255)
            .tint(Color.red)
          Text("\(Int(redColor.rounded()))")
        }
      }
      VStack {
        Text("Green")
        HStack {
          Slider(value: $greenColor, in: 0...255)
            .tint(Color.green)
          Text("\(Int(greenColor.rounded()))")
        }
      }
      VStack {
        Text("Blue")
        HStack {
          Slider(value: $blueColor, in: 0...255)
            .tint(Color.blue)
          Text("\(Int(blueColor.rounded()))")
        }
      }
      Button {
        foregroundColor = Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
      } label: {
        Text("Set Color")
          .padding()
          .foregroundColor(.white)
      }
      .background(
        ZStack {
          Color.blue
          LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        }
      )
      .overlay(
          RoundedRectangle(cornerRadius: 21)
            .strokeBorder(Color.white, lineWidth: 2)
          )
      .cornerRadius(21)
    }
    .padding(20)

  }
}

//struct SliderView: View {
//  @Binding var
//  var body: some View {
//    VStack {
//      Text("Red")
//      HStack {
//        Slider(value: $redColor, in: 0...255)
//          .tint(Color.red)
//        Text("\(Int(redColor.rounded()))")
//      }
//    }
//  }
//}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDisplayName("Light Mode")
      ContentView()
        .preferredColorScheme(.dark)
        .previewDisplayName("Dark Mode")
//    SliderView()
    }
  }
}