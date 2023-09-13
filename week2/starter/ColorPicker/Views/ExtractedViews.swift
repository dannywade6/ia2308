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

struct MainColorView: View {
  var title: String
  @Binding var foregroundColor: Color
  
  var body: some View {
    VStack {
      Text("Color Picker")
        .font(.largeTitle)
        .fontWeight(.bold)
      
      RoundedRectangle(cornerRadius: 0)
        .foregroundColor(foregroundColor)
        .border(Color.brown, width: Constants.General.borderWidth)
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  var colorName: String
  
  var body: some View {
    VStack {
      Text(colorName)
        .padding(.bottom, 2)
      HStack {
        Slider(value: $sliderValue, in: 0...255)
        Text("\(Int(sliderValue.rounded()))")
      }
    }
  }
}

struct SetColorButtonView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  
  var body: some View {
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
      RoundedRectangle(cornerRadius: Constants.General.buttonCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.buttonLineWidth)
    )
    .cornerRadius(Constants.General.buttonCornerRadius)
  }
}
