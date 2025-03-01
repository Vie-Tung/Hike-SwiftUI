//
//  CardView.swift
//  Hike
//
//  Created by Tung Viet on 24/10/2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var ramdomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //  MARK: -Function
    func randomImage() {
        print("-- BUTTON WAS PRESSED --")
        print("Status: Old Image number = \(imageNumber)")
        repeat {
            ramdomNumber = Int.random(in: 1...5)
        } while ramdomNumber == imageNumber
        imageNumber = ramdomNumber
        
        print("Result: New Image Number = \(imageNumber)")
        print("-- THE END ---")
        print("\n")
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK: - HEADER
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight,
                                             .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                        )
                        Spacer()
                        
                        Button {
                            // Action: Show a sheet
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Nghiem Viet Tung Nghiem Viet Tung Nghiem Viet Tung")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                //MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.linear(duration: 2), value: imageNumber)
                }
                
                // MARK: FOOTER
                
                Button {
                    // ACTION: Generate a ramdom number
                    print("The botton was pressed")
                    randomImage()
                    
                } label: {
                Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                        LinearGradient(
                            colors: [
                                .customGreenLight,
                                .customGreenMedium
                            ], startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            } //: ZSTACK
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
