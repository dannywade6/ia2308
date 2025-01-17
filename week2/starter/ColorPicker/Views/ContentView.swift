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
  @State private var redColor: Double = 250.0
  @State private var greenColor: Double = 100.0
  @State private var blueColor: Double = 50.0
  @State private var foregroundColor = Color(red: 250 / 255, green: 100 / 255, blue: 50 / 255)
  
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass
  
  var body: some View {
    
    if verticalSizeClass == .regular && horizontalSizeClass == .compact {
      PortraitView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
    } else {
      LandscapeView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
    }
  }
}

struct PortraitView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  
  var body: some View {
    VStack {
      VStack {
        MainColorView(title: "Color Picker", foregroundColor: $foregroundColor)
        SliderView(sliderValue: $redColor, colorName: "Red")
          .tint(.red)
        SliderView(sliderValue: $greenColor, colorName: "Green")
          .tint(.green)
        SliderView(sliderValue: $blueColor, colorName: "Blue")
          .tint(.blue)
        SetColorButtonView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
      }
      .padding(20)
    }
  }
}

struct LandscapeView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  
  var body: some View {
    HStack {
      VStack {
        MainColorView(title: "Color Picker", foregroundColor: $foregroundColor)
      }
      .padding()
      VStack {
        SliderView(sliderValue: $redColor, colorName: "Red")
          .tint(.red)
        SliderView(sliderValue: $greenColor, colorName: "Green")
          .tint(.green)
        SliderView(sliderValue: $blueColor, colorName: "Blue")
          .tint(.blue)
          .padding(.bottom)
        SetColorButtonView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
      }
      .padding(.horizontal)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDisplayName("Light Mode")
      ContentView()
        .preferredColorScheme(.dark)
        .previewDisplayName("Dark Mode")
    }
  }
}
