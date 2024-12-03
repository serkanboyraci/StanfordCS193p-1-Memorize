//
//  ContentView.swift
//  StanfordCS193p-1-Memorize
//
//  Created by Ali serkan Boyracı  on 28.11.2024.
//

import SwiftUI

struct ContentView: View { //1 ContentView behaves like a View
    var body: some View { //3 some = herhangi bir view = ne olursa olsun goster demek gibi.
        
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        /* ZStack(content: { // Vstack altli ustlu olmasini sagliyor
            // Zstack ayni dikez duzlemde olmasini sagliyor
            //2  burdan padding sonuna kadar property dye gecer
            // 6. content onuce ve padding oncesine parantez ekleyerek, Vstack icerigini belirttik.
            // 5. aslinda burda 3 tane struct var birisi image digeri text sonuncusu da Vstack, Vstack() acilip icerisi degistirilebilir.
           // Image(systemName: "globe")// 4 creating image struct, //6 systemName: systemde kayitli olan bir imagei cagiriyor. imageNamed olsaydi assetlerden bakacaktik.
            
            
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white) // 9. arka plani beyaz yapmak icin gerekli ancak hem foreground hemde storl ayni anda olmuyor o yuzden bir tane daha rectangle olusutuyoruz.
            RoundedRectangle(cornerRadius: 15)// 8.wir müssen cornerradius geben.
                            .strokeBorder(lineWidth: 3) // 9.kenarik icin
            
            Text("🥶").font(.largeTitle)
                
        })*/
        .foregroundColor(Color.orange) // 7 functions to change color
        //.imageScale(.large) //7/ functions to make large
        //.foregroundStyle(.tint)
        //5 creating text struct
        .padding()
    }
}


struct CardView : View {
    var isFaceUp : Bool = false
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15)// 8.wir müssen cornerradius geben.
                    .strokeBorder(lineWidth: 3)
                Text("🥶").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)
                }
        })
    }
}


#Preview {
    ContentView()
}

