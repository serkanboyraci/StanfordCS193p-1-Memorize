//
//  ContentView.swift
//  StanfordCS193p-1-Memorize
//
//  Created by Ali serkan Boyracı  on 28.11.2024.
//

import SwiftUI

struct ContentView: View { //1 ContentView behaves like a View
    var body: some View { //3 some = herhangi bir view = ne olursa olsun goster demek gibi.
        // 20 burda someView yazinca bizim yerimize TupleView yaziyor eger sadece some View yerine Text yazip icine text(...) biseyler yazsaydik sadece text cikardi. Eger 2 tane alt alta ya da yana yana text kullanacaksak some View kullanmak zorundayiz.
        
        HStack {
            CardView(isFaceUp: false)
            CardView() // 24 eger carview struct inda tanimlarsak burda tekrar tanimlamaya gerek yok
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
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
    @State var isFaceUp : Bool = true // burayi let yapamazsin // burda da Bool yazmana gerek yok
    var body: some View {
        ZStack { // 21 Zstack (.alignment: .top yazarak-.center merkeze alir icerigi yukariya alabilirsin. 23 center yazmana gerek yok zaetn default o sekilde. o yuzden siliyourz
            // 23 bos parantezi de eger trailing closure varsa silebilirsin.
            //22 burda alignment den sonra content vardi ama herhengi bir icerigi yoktu o yuzden bulnamsina gerek yok
            let shape = RoundedRectangle(cornerRadius: 15) // burayi let yapmak daha mantikli // burda basta type olarak yani basina : koyarak typ ini bildirmistik ancak gerek yok, zaten esittir yapinca o type inference ile kendisi anliyor.
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth :2)
                Text("🥶").font(.largeTitle)
            } else {
                shape.fill()
            }
            
                /* RoundedRectangle(cornerRadius: 15) // 25 burdaki gibi surekli ayni seyi yazmaktansa bir Roundedrectangle durumunu bir degiskene atamaliyiz.
                    .fill(.white)
                RoundedRectangle(cornerRadius: 15)// 8.wir müssen cornerradius geben.
                    .strokeBorder(lineWidth: 3)
                Text("🥶").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)// .fill yazmaya gerek yok zaten default geliyor.
                }*/
        }
        .onTapGesture(count:2) { //(count:2) eklersen 2 defa tikladiginda calisir.
            // print("Tapperrrr") great way to control the code.
            // isFaceUp = !isFaceUp // 26 yukariya var basina @State koyarak onu pointer yapiyoruz bu sekilde o degismiyor ancak burayai degistirme yetkimiz oluyor.
            isFaceUp.toggle() // 27 yukardakinin Bool icin kolay yazma yontemi
            
        }

    }
}


#Preview {
    ContentView()
}

