//
//  ContentView.swift
//  GuessIt
//
//  Created by Borislav on 22.01.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
    var body: some View {
        
        
        
        ZStack{
            RadialGradient(stops: [
                .init(color: .blue, location: 0.9),
                .init(color: .red, location: 0.9),
            ], center: .top, startRadius: 200, endRadius: 699)
            
            VStack(spacing: 30){
                
                VStack{
                    Text("Tap the flag of...")
                        .foregroundColor(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button{
                        //Flag Tapped
                     flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule().size(width: 400, height: 100))
                            .shadow(radius: 5)
                    }
                }
                
            }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        
        }.ignoresSafeArea()
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is ???")
            }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }



//Style elements:
//Button types, Alerts, Backgrounds, Shapes, Gradients

//Variables

//@State private var showingAlert = false


//functions

/*func executeDelete()
{
    print("Deleting...")
}
*/
/*
VStack(spacing: 20){
    ZStack{
        VStack{
            
            //   Color.green
            //       .frame(width: 1000, height: 300)
            
            /*        Color.red
             .frame(minWidth: 400, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
             */
            
            //Gradient type: Simple
            /*  LinearGradient(gradient: Gradient(colors: [.green, .red]), startPoint: .top, endPoint: .bottom)
             */
            
            //Gradient type: Linear
            /*LinearGradient(gradient: Gradient(stops: [
             Gradient.Stop(color: .green, location: 0.30),
             Gradient.Stop(color: .blue, location: 0.70),
             ]), startPoint: .top, endPoint: .bottom)
             */
            //Gradient type: Radial
            /*
             RadialGradient(gradient: Gradient(colors: [.green, .black]), center: .center, startRadius: 40, endRadius: 900)
             */
            //Gradient type: Angular
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            
        }.ignoresSafeArea()
        
        VStack{
            Text("Third")
                .foregroundStyle(.secondary)
                .padding(80)
                .background(.ultraThinMaterial)
            
            //Button styles
            Button("Delete selection",role: .destructive, action: executeDelete)
                .buttonStyle(.borderedProminent)
                .tint(.secondary)
            
            Button("Delete ",role: .destructive, action: executeDelete)
                .buttonStyle(.bordered)
            //Labeled button custom format
            Button{
                print("Taped...")
            }label:
            {
                Text("Tap here!")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.green  )
            }
            // Button Images
            Button{
                print("Pressed!")
            }label: {
                Label("Edit", systemImage: "pencil")
            }
            Button("Show Alert!"){
                showingAlert = true
            }.alert("This is my message to you", isPresented: $showingAlert){
                Button("Okay!"){}
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Read this right now!")
            }
            //Modifier to show the true color of the image:
            //renderingMode(.original)
            
        }
        
    }
}*/
